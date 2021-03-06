USE [master]
GO
/****** Object:  Database [ProyectoFinal]    Script Date: 19/4/2022 3:54:14 p.m. ******/
CREATE DATABASE [ProyectoFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProyectoFinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProyectoFinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProyectoFinal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoFinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoFinal] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoFinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoFinal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProyectoFinal] SET QUERY_STORE = OFF
GO
USE [ProyectoFinal]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 19/4/2022 3:54:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[Id_cliente] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 19/4/2022 3:54:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[Id_factura] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[Total] [varchar](50) NULL,
	[Id_producto] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[Id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 19/4/2022 3:54:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[Id_inventario] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Cantidad_Producto] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[Precio] [varchar](50) NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[Id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 19/4/2022 3:54:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id_producto] [int] NOT NULL,
	[Id_inventario] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Precio] [varchar](50) NULL,
	[Id_factura] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 19/4/2022 3:54:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id_venta] [int] NULL,
	[Producto] [varchar](50) NULL,
	[Cliente] [varchar](50) NULL,
	[Total] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (1, N'Carlos', N'8295874189', N'Haina')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (2, N'Manuel', N'8296985242', N'Av independencia')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (3, N'Carla', N'8296871489', N'Sto Dom')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (4, N'Felix', N'8295876985', N'Nigua')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (5, N'Victoria', N'8295281498', N'Haina')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (6, N'Angela', N'8095896322', N'Piedra blanca')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (7, N'Anlleli', N'8496358974', N'Los minas')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (8, N'Maria', N'8098745896', N'DN')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (9, N'Josefa', N'8496358796', N'El carrir')
INSERT [dbo].[cliente] ([Id_cliente], [Nombre], [Telefono], [Direccion]) VALUES (10, N'Jose', N'8095874122', N'Quita sueño')
GO
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (1, N'Angela', CAST(N'2022-04-09' AS Date), N'1500', N'1         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (2, N'Luis', CAST(N'2022-04-09' AS Date), N'1500', N'2         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (3, N'Pedro', CAST(N'2022-02-03' AS Date), N'850', N'3         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (4, N'Juana', CAST(N'2022-03-02' AS Date), N'650', N'4         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (5, N'Luisa', CAST(N'2022-03-26' AS Date), N'500', N'5         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (6, N'Maciel', CAST(N'2022-04-02' AS Date), N'420', N'6         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (7, N'Maria', CAST(N'2022-02-05' AS Date), N'550', N'7         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (8, N'Carmen', CAST(N'2022-03-05' AS Date), N'480', N'8         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (9, N'Victoria', CAST(N'2022-03-08' AS Date), N'450', N'9         ')
INSERT [dbo].[Factura] ([Id_factura], [Nombre], [Fecha], [Total], [Id_producto]) VALUES (10, N'Anlleli', CAST(N'2022-04-25' AS Date), N'350', N'10        ')
GO
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (1, 1, N'36', CAST(N'2022-03-30' AS Date), N'1200')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (2, 2, N'24', CAST(N'2022-03-30' AS Date), N'600')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (3, 3, N'12', CAST(N'2022-03-30' AS Date), N'500')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (4, 4, N'6', CAST(N'2022-03-30' AS Date), N'800')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (5, 5, N'12', CAST(N'2022-03-30' AS Date), N'500')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (6, 6, N'8', CAST(N'2022-03-30' AS Date), N'400')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (7, 7, N'10', CAST(N'2022-03-30' AS Date), N'425')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (8, 8, N'5', CAST(N'2022-03-30' AS Date), N'586')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (9, 9, N'36', CAST(N'2022-03-30' AS Date), N'200')
INSERT [dbo].[Inventario] ([Id_inventario], [Id_producto], [Cantidad_Producto], [Fecha], [Precio]) VALUES (10, 10, N'24', CAST(N'2022-03-30' AS Date), N'1000')
GO
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (1, 1, N'Kakata Ramen', N'800', N'1')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (10, 10, N'Yasai Ramen', N'650', N'10')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (2, 2, N'Kioto Ramen', N'1500', N'2')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (3, 3, N'Tokio Ramen', N'200', N'3')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (4, 4, N'Muroran Ramen', N'2500', N'4')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (5, 5, N'Sapporo Ramen', N'600', N'5')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (6, 6, N'Tsukemen Ramen', N'500', N'6')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (7, 7, N'Shio Ramen', N'450', N'7')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (8, 8, N'Shoyu Ramen', N'350', N'8')
INSERT [dbo].[Producto] ([Id_producto], [Id_inventario], [Nombre], [Precio], [Id_factura]) VALUES (9, 9, N'Tonkutsu Ramen', N'450', N'9')
GO
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (1, N'Kakata Ramen', N'Angela', N'480')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (2, N'Kioto Ramen', N'Luis', N'150')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (3, N'Tokio Ramen', N'Pedro', N'580')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (4, N'Muroran Ramen', N'Belkis', N'600')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (5, N'Sapporo Ramen', N'Fabian', N'400')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (6, N'Tsukemen Ramen', N'Lucia', N'300')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (7, N'Shio Ramen', N'Paulo', N'250')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (8, N'Shoyu Ramen', N'Charli', N'800')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (9, N'Tonkutsu Ramen', N'Camila', N'700')
INSERT [dbo].[Venta] ([Id_venta], [Producto], [Cliente], [Total]) VALUES (10, N'Yasai Ramen', N'Yissel', N'580')
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Factura] FOREIGN KEY([Id_inventario])
REFERENCES [dbo].[Factura] ([Id_factura])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Factura]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Inventario] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Inventario] ([Id_producto])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Inventario]
GO
USE [master]
GO
ALTER DATABASE [ProyectoFinal] SET  READ_WRITE 
GO
