CREATE DATABASE TurboAz
use TurboAz

CREATE TABLE Customers(
CustomerId int identity primary key,
Name nvarchar(50) not null,
Surname nvarchar(100) not null,
Phone nvarchar(50) unique not null,
Email  nvarchar(100) unique
)

CREATE TABLE Brands(
BrandId int identity primary key,
BrandName nvarchar(50) not null
)

CREATE TABLE Models(
ModelId int identity primary key,
ModelName nvarchar(50) not null,
ModelPrice decimal not null,
BrandId int FOREIGN KEY REFERENCES Brands(BrandId)
)

CREATE TABLE Dealers(
DealerId int identity primary key,
DealerName nvarchar(50) not null,
DealerAddress nvarchar(100)
)

CREATE TABLE Dealer_Brand(
DealerId int FOREIGN KEY REFERENCES Dealers(DealerId),
BrandId int FOREIGN KEY REFERENCES Brands(BrandId),
)

CREATE TABLE ManufacturePlant(
ManId int identity primary key,
PlantName nvarchar(50) not null,
PlantType nvarchar(50),
PlantLocation nvarchar(100),
)

CREATE TABLE CarParts(
PartId int identity primary key,
PartName nvarchar(50) not null,
ManufactureStartDate datetime not null,
ManufactureEndDate datetime,
ManId int FOREIGN KEY REFERENCES ManufacturePlant(ManId)
)

CREATE TABLE CarOptions(
OptionId int identity primary key,
Color nvarchar(20) not null,
ModelId int FOREIGN KEY REFERENCES Models(ModelId),
EngineId int FOREIGN KEY REFERENCES CarParts(PartId),
TransmissionId int FOREIGN KEY REFERENCES CarParts(PartId),
ChassisId int FOREIGN KEY REFERENCES CarParts(PartId)
)
