/****** Object:  Database [CricDB]    Script Date: 16/08/2018 14:47:42 ******/
CREATE DATABASE [CricDB]
 CONTAINMENT = NONE
GO
ALTER DATABASE [CricDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
ALTER DATABASE [CricDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CricDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CricDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CricDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CricDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CricDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CricDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CricDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CricDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CricDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CricDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CricDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CricDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CricDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CricDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CricDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CricDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CricDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CricDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CricDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CricDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CricDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CricDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CricDB] SET  MULTI_USER 
GO
ALTER DATABASE [CricDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CricDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CricDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CricDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CricDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CricDB', N'ON'
GO
ALTER DATABASE [CricDB] SET QUERY_STORE = OFF
GO
USE [CricDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CricDB]
GO
/****** Object:  Table [dbo].[Ball]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ball](
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[BatsmanId] [uniqueidentifier] NOT NULL,
	[BowlerId] [uniqueidentifier] NOT NULL,
	[Runs] [int] NOT NULL,
	[ExtraRuns] [int] NOT NULL,
	[ShotId] [int] NULL,
	[FieldY] [int] NULL,
	[FieldX] [int] NULL,
	[PitchLineId] [int] NULL,
	[PitchLengthId] [int] NULL,
	[Timestamp] [datetime] NOT NULL,
	[MatchId] [uniqueidentifier] NULL,
	[IsVideoUploaded] [bit] NULL,
	[LastModified] [datetime] NULL,
	[VideoId] [int] NULL,
	[VideoStartTime] [float] NULL,
	[VideoEndTime] [float] NULL,
	[ArrivalX] [float] NULL,
	[ArrivalY] [float] NULL,
	[IsKeyMoment] [bit] NOT NULL,
	[KeyMomentDescription] [nvarchar](160) NULL,
	[IsVideoDirty] [bit] NOT NULL,
	[ExtraValue] [int] NULL,
 CONSTRAINT [PK_Ball_1] PRIMARY KEY CLUSTERED 
(
	[BallNo] ASC,
	[OverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BallDerived]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BallDerived](
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[BattingTeamId] [uniqueidentifier] NOT NULL,
	[InningsNo] [tinyint] NOT NULL,
	[OverNo] [smallint] NOT NULL,
	[ActualBallNo] [tinyint] NOT NULL,
	[Runs] [tinyint] NOT NULL,
	[InningsTotal] [smallint] NOT NULL,
	[InningsWickets] [tinyint] NOT NULL,
	[PartnershipTotal] [smallint] NOT NULL,
	[BatsmanName] [nvarchar](100) NOT NULL,
	[BowlerName] [nvarchar](100) NOT NULL,
	[ComparisonTotal] [smallint] NULL,
	[ComparisonWickets] [tinyint] NULL,
	[IsMilestone] [bit] NOT NULL,
	[MilestoneText] [nvarchar](500) NULL,
	[TeamMilestone] [smallint] NULL,
	[PartnershipMilestone] [smallint] NULL,
	[BatsmanMilestone] [smallint] NULL,
	[BowlerMilestone] [tinyint] NULL,
	[IsWicket] [bit] NOT NULL,
	[WicketText] [nvarchar](255) NULL,
	[IsBoundary] [bit] NOT NULL,
	[IsKeyMoment] [bit] NOT NULL,
	[KeyMomentDescription] [nvarchar](160) NULL,
	[VideoDuration] [float] NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_BallDerived] PRIMARY KEY CLUSTERED 
(
	[OverId] ASC,
	[BallNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BallEvent]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BallEvent](
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[CricketEventId] [int] NOT NULL,
	[MatchId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_BallEvent_1] PRIMARY KEY CLUSTERED 
(
	[BallNo] ASC,
	[CricketEventId] ASC,
	[OverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BallUserEvent]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BallUserEvent](
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[UserEventId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BallUserEvent] PRIMARY KEY CLUSTERED 
(
	[OverId] ASC,
	[BallNo] ASC,
	[UserEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BallVideo]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BallVideo](
	[MatchId] [uniqueidentifier] NOT NULL,
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
 CONSTRAINT [PK_BallVideo] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC,
	[OverId] ASC,
	[BallNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BowlingType]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BowlingType](
	[BowlingTypeId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ExtendedDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_BowlingType] PRIMARY KEY CLUSTERED 
(
	[BowlingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Break]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Break](
	[BreakId] [uniqueidentifier] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NULL,
	[OverId] [uniqueidentifier] NULL,
	[BallNo] [int] NULL,
	[BreakTypeId] [int] NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateInspectionOrExpectedEnd] [datetime] NULL,
	[DateEnded] [datetime] NULL,
	[IsDateInspection] [bit] NULL,
 CONSTRAINT [PK_Break] PRIMARY KEY CLUSTERED 
(
	[BreakId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BreakType]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BreakType](
	[BreakTypeId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[EndSession] [bit] NOT NULL,
	[Ordinal] [int] NOT NULL,
	[StopTimer] [bit] NOT NULL,
 CONSTRAINT [PK_BreakType] PRIMARY KEY CLUSTERED 
(
	[BreakTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryLog]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryLog](
	[CategoryLogID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[LogID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CategoryLog] PRIMARY KEY CLUSTERED 
(
	[CategoryLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Competition]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competition](
	[CompetitionSeasonId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShowInNavigation] [bit] NULL,
	[MatchTypeId] [uniqueidentifier] NOT NULL,
	[CompetitionTypeId] [int] NOT NULL,
	[ActualEntityId] [uniqueidentifier] NULL,
	[AdminClubId] [uniqueidentifier] NULL,
	[CompetitionId] [uniqueidentifier] NOT NULL,
	[SeasonId] [uniqueidentifier] NOT NULL,
	[ParentCompetitionId] [uniqueidentifier] NULL,
	[SourceSystemType] [int] NULL,
	[SourceSystemId] [nvarchar](50) NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[LastModifiedUserId] [int] NULL,
	[EntityStatus] [int] NOT NULL,
 CONSTRAINT [PK_Competition] PRIMARY KEY CLUSTERED 
(
	[CompetitionSeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetitionMatch]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionMatch](
	[CompetitionId] [uniqueidentifier] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompetitionMatch] PRIMARY KEY CLUSTERED 
(
	[CompetitionId] ASC,
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetitionMatchType]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionMatchType](
	[CompetitionId] [uniqueidentifier] NOT NULL,
	[MatchTypeId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompetitionMatchType] PRIMARY KEY CLUSTERED 
(
	[CompetitionId] ASC,
	[MatchTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetitionTeam]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionTeam](
	[CompetitionId] [uniqueidentifier] NOT NULL,
	[TeamId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompetitionTeam] PRIMARY KEY CLUSTERED 
(
	[CompetitionId] ASC,
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetitionType]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionType](
	[CompetitionTypeId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CompetitionType] PRIMARY KEY CLUSTERED 
(
	[CompetitionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration](
	[VideoDevice] [nvarchar](100) NULL,
	[AudioDevice] [nvarchar](100) NULL,
	[VideoProfile] [nvarchar](100) NULL,
	[VideoBitrate] [int] NULL,
	[ResizeStretch] [bit] NULL,
	[ConfigurationId] [int] NOT NULL,
	[Complexity] [int] NULL,
	[Key] [nvarchar](100) NULL,
	[User] [nvarchar](100) NULL,
	[Config1] [nvarchar](100) NULL,
	[Config2] [nvarchar](100) NULL,
	[Config3] [nvarchar](100) NULL,
	[Config4] [bit] NULL,
	[Config5] [bit] NULL,
	[Config6] [bit] NULL,
	[Config7] [int] NULL,
	[Config8] [int] NULL,
	[Config9] [int] NULL,
	[AllowConnections] [bit] NULL,
	[MacAddress] [nvarchar](20) NULL,
	[CaptureAudio] [bit] NULL,
	[SiteId] [int] NULL,
	[SiteName] [nvarchar](100) NULL,
	[IsBMDVideoCapture] [bit] NULL,
	[BMDBitrate] [int] NULL,
	[GridMainControlsHeight] [int] NULL,
	[GridPitchWidth] [int] NULL,
	[GridWagonWheelWidth] [int] NULL,
	[GridButtonsWidth] [int] NULL,
	[IsRealtimeUpload] [bit] NULL,
	[IsContinuousCapture] [bit] NOT NULL,
	[IsShowBallArrival] [bit] NOT NULL,
	[IsCaptureWeather] [bit] NOT NULL,
	[UserId] [int] NULL,
	[TwitterAccessSecret] [nvarchar](100) NULL,
	[TwitterAccessToken] [nvarchar](100) NULL,
	[GridWagonWheelHeight] [int] NULL,
	[ContinuousVideoScaleSize] [float] NULL,
	[IsGenerateSportscodeXml] [bit] NOT NULL,
	[UserLastLogin] [datetime] NULL,
	[ReaderConnectionsPort] [int] NULL,
	[PitchsideServicesPort] [int] NULL,
	[PitchsideDiscoveryPort] [int] NULL,
	[PitchsideFieldingPort] [int] NULL,
	[PitchsideFieldingPin] [nvarchar](4) NULL,
	[PitchsideFieldingPinExpiry] [datetime] NULL,
	[RootFolderPath] [nvarchar](800) NULL,
	[PitchsideFieldingPinMatchId] [uniqueidentifier] NULL,
	[WatermarkFilePath] [nvarchar](800) NULL,
	[WatermarkLocationType] [tinyint] NULL,
	[IsAutoStartBall] [bit] NOT NULL,
	[IsAutoEndBall] [bit] NOT NULL,
	[IsAutoEndOver] [bit] NOT NULL,
	[IsOneClickScoring] [bit] NOT NULL,
	[VersionNumber] [bigint] NULL,
	[IsAutoScorecardExpandCurrentPlayers] [bit] NOT NULL,
	[IsCompactScoreSummary] [bit] NOT NULL,
	[LastServerSyncUtc] [datetime] NULL,
	[IsUserNVPlay] [bit] NULL,
	[LastOpenedMatchId] [uniqueidentifier] NULL,
	[LastOpenedAsLiveScorer] [bit] NULL,
	[LiveUploadType] [tinyint] NOT NULL,
	[LiveUploadMinutes] [int] NOT NULL,
	[WagonWheelRotation] [float] NULL,
	[IsAutoScorebookCurrentPlayers] [bit] NOT NULL,
	[LastUsedLayout] [nvarchar](255) NULL,
	[LiveTweetType] [tinyint] NOT NULL,
	[LiveTweetMinutes] [int] NOT NULL,
	[LiveTweetEvents] [int] NOT NULL,
	[AreTweetsTiedToLiveUpload] [bit] NOT NULL,
	[UseTwitterPlayerNames] [bit] NOT NULL,
	[IsModernSymbols] [bit] NOT NULL,
	[UseColourInScorebook] [bit] NOT NULL,
	[SyncExternalPossibleClubData] [bit] NOT NULL,
	[IsAutoBackup] [bit] NOT NULL,
	[TwitterAppendContent] [nvarchar](100) NULL,
 CONSTRAINT [PK__Configuration__000000000000062F] PRIMARY KEY CLUSTERED 
(
	[ConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CricketEvent]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CricketEvent](
	[CricketEventId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CauseWicket] [bit] NOT NULL,
	[ShowOnScorePanel] [bit] NOT NULL,
	[Ordinal] [int] NOT NULL,
	[IsKPI] [bit] NOT NULL,
 CONSTRAINT [PK_CricketEvent] PRIMARY KEY CLUSTERED 
(
	[CricketEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DecisionReview]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DecisionReview](
	[MatchId] [uniqueidentifier] NOT NULL,
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[IsBattingTeam] [bit] NOT NULL,
	[IsUpheld] [bit] NOT NULL,
	[IsLossOfReview] [bit] NOT NULL,
 CONSTRAINT [PK_DecisionReview] PRIMARY KEY CLUSTERED 
(
	[OverId] ASC,
	[BallNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalSystemIdentifierMap]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalSystemIdentifierMap](
	[FeedbackId] [uniqueidentifier] NOT NULL,
	[FeedbackIdType] [int] NOT NULL,
	[ExternalSystemType] [int] NOT NULL,
	[ExternalSystemId] [nvarchar](50) NULL,
 CONSTRAINT [PK_ExternalSystemIdentifierMap] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalSystemMatchSetup]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalSystemMatchSetup](
	[ExternalSystemType] [int] NOT NULL,
	[MatchId] [nvarchar](50) NOT NULL,
	[HomeTeamId] [nvarchar](50) NOT NULL,
	[AwayTeamId] [nvarchar](50) NOT NULL,
	[DateStart] [datetime] NULL,
	[FriendlyName] [nvarchar](500) NULL,
 CONSTRAINT [PK_ExternalSystemMatchSetup] PRIMARY KEY CLUSTERED 
(
	[ExternalSystemType] ASC,
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalSystemMetadata]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalSystemMetadata](
	[ExternalSystemType] [int] NOT NULL,
	[ExternalSystemId] [nvarchar](50) NOT NULL,
	[ExternalKey] [nvarchar](255) NOT NULL,
	[ExternalValue] [nvarchar](255) NULL,
 CONSTRAINT [PK_ExternalSystemMetadata] PRIMARY KEY CLUSTERED 
(
	[ExternalSystemType] ASC,
	[ExternalSystemId] ASC,
	[ExternalKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fielding]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fielding](
	[FieldingId] [uniqueidentifier] NOT NULL,
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[PlayerId] [uniqueidentifier] NOT NULL,
	[CricketEventId] [int] NOT NULL,
	[MatchId] [uniqueidentifier] NULL,
	[FieldingPositionId] [int] NULL,
	[FieldX] [numeric](9, 5) NULL,
	[FieldY] [numeric](9, 5) NULL,
 CONSTRAINT [PK_Fielding_1] PRIMARY KEY CLUSTERED 
(
	[FieldingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldingLocation]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldingLocation](
	[FieldingLocationId] [uniqueidentifier] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[PlayerId] [uniqueidentifier] NULL,
	[FieldingPositionId] [int] NULL,
	[FieldX] [numeric](9, 5) NOT NULL,
	[FieldY] [numeric](9, 5) NOT NULL,
 CONSTRAINT [PK_FieldingLocation_1] PRIMARY KEY CLUSTERED 
(
	[FieldingLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldingPosition]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldingPosition](
	[FieldingPositionId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Ordinal] [int] NOT NULL,
	[CentreX] [numeric](9, 5) NULL,
	[CentreY] [numeric](9, 5) NULL,
	[CentreRadius] [numeric](9, 5) NULL,
 CONSTRAINT [PK_FieldingPosition] PRIMARY KEY CLUSTERED 
(
	[FieldingPositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HawkEye]    Script Date: 16/08/2018 14:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HawkEye](
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[PitchX] [numeric](4, 2) NULL,
	[PitchY] [numeric](4, 2) NULL,
	[PastY] [numeric](4, 2) NULL,
	[PastZ] [numeric](4, 2) NULL,
	[MatchId] [uniqueidentifier] NULL,
	[Speed] [numeric](5, 2) NULL,
 CONSTRAINT [PK_HawkEye] PRIMARY KEY CLUSTERED 
(
	[OverId] ASC,
	[BallNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Innings]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Innings](
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NOT NULL,
	[InningsEndTypeId] [int] NULL,
	[BattingTeamId] [uniqueidentifier] NOT NULL,
	[Over1End] [nvarchar](100) NULL,
	[Over2End] [nvarchar](100) NULL,
	[LastModified] [datetime] NULL,
	[DateStarted] [datetime] NULL,
	[CutOffTime] [datetime] NULL,
	[WaspOverride] [decimal](5, 2) NULL,
	[DateEnded] [datetime] NULL,
	[OverrideDrsBatting] [int] NULL,
	[OverrideDrsBowling] [int] NULL,
	[OverrideOverRateValue] [numeric](5, 2) NULL,
	[OverRateTarget] [int] NULL,
	[OverrideMaxOvers] [int] NULL,
 CONSTRAINT [PK_Innings_1] PRIMARY KEY CLUSTERED 
(
	[InningsNo] ASC,
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InningsBattingCard]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InningsBattingCard](
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NOT NULL,
	[BattingPosition] [int] NOT NULL,
	[PlayerId] [uniqueidentifier] NOT NULL,
	[PlayerName] [nvarchar](100) NOT NULL,
	[HowOut] [nvarchar](250) NULL,
	[Runs] [nvarchar](4) NULL,
	[Balls] [nvarchar](4) NULL,
	[Fours] [nvarchar](4) NULL,
	[Sixes] [nvarchar](4) NULL,
	[IsCaptain] [bit] NULL,
	[IsWicketkeeper] [bit] NULL,
 CONSTRAINT [PK_InningsBattingCard] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC,
	[InningsNo] ASC,
	[BattingPosition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InningsBattingOrder]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InningsBattingOrder](
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NOT NULL,
	[PlayerId] [uniqueidentifier] NOT NULL,
	[BattingPosition] [int] NOT NULL,
	[OverrideTime] [bigint] NULL,
	[OverrideOverId] [uniqueidentifier] NULL,
	[OverrideBallNo] [int] NULL,
	[PreInningsWicketTypeId] [int] NULL,
 CONSTRAINT [PK_InningsBattingOrder_1] PRIMARY KEY CLUSTERED 
(
	[InningsNo] ASC,
	[MatchId] ASC,
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InningsDerived]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InningsDerived](
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [tinyint] NOT NULL,
	[BattingTeamId] [uniqueidentifier] NOT NULL,
	[InningsTotal] [smallint] NOT NULL,
	[InningsWickets] [tinyint] NOT NULL,
	[BestBatsmanId] [uniqueidentifier] NULL,
	[BestBatsmanName] [nvarchar](100) NULL,
	[BestBatsmanScore] [nvarchar](10) NULL,
	[BestBowlerId] [uniqueidentifier] NULL,
	[BestBowlerName] [nvarchar](100) NULL,
	[BestBowlerScore] [nvarchar](10) NULL,
	[InningsScore] [nvarchar](20) NULL,
 CONSTRAINT [PK_InningsDerived] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC,
	[InningsNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InningsEndType]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InningsEndType](
	[InningsEndTypeId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InningsEndType] PRIMARY KEY CLUSTERED 
(
	[InningsEndTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Length]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Length](
	[LengthId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Length] PRIMARY KEY CLUSTERED 
(
	[LengthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Line]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Line](
	[LineId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Line] PRIMARY KEY CLUSTERED 
(
	[LineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[EventID] [int] NULL,
	[Priority] [int] NOT NULL,
	[Severity] [nvarchar](32) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[MachineName] [nvarchar](32) NOT NULL,
	[AppDomainName] [nvarchar](512) NOT NULL,
	[ProcessID] [nvarchar](256) NOT NULL,
	[ProcessName] [nvarchar](512) NOT NULL,
	[ThreadName] [nvarchar](512) NULL,
	[Win32ThreadId] [nvarchar](128) NULL,
	[Message] [nvarchar](1500) NULL,
	[FormattedMessage] [ntext] NULL,
	[LogID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Log__00000000000005F7] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[MatchId] [uniqueidentifier] NOT NULL,
	[MatchTypeId] [uniqueidentifier] NOT NULL,
	[VenueId] [uniqueidentifier] NULL,
	[DateStart] [datetime] NOT NULL,
	[FollowOn] [bit] NOT NULL,
	[NoBallValue] [int] NOT NULL,
	[WideValue] [int] NOT NULL,
	[MatchCompleted] [bit] NOT NULL,
	[CaptureVideo] [bit] NOT NULL,
	[TeamId1] [uniqueidentifier] NOT NULL,
	[TeamId2] [uniqueidentifier] NOT NULL,
	[TossTeamId] [uniqueidentifier] NULL,
	[UmpireId1] [uniqueidentifier] NULL,
	[UmpireId2] [uniqueidentifier] NULL,
	[FolderPath] [nvarchar](300) NULL,
	[IsECricketImport] [bit] NOT NULL,
	[IsDownloadedFromServer] [bit] NOT NULL,
	[IsHidden] [bit] NULL,
	[VideoWidth] [int] NULL,
	[VideoHeight] [int] NULL,
	[VideoFileExtension] [nvarchar](3) NULL,
	[UploadedByLoginName] [nvarchar](50) NULL,
	[UploadedDateTime] [datetime] NULL,
	[IsFixture] [bit] NOT NULL,
	[IsServer] [bit] NOT NULL,
	[ServerDescription] [nvarchar](50) NULL,
	[CompetitionId] [uniqueidentifier] NULL,
	[UmpireId3] [uniqueidentifier] NULL,
	[UmpireId4] [uniqueidentifier] NULL,
	[MatchRefereeId] [uniqueidentifier] NULL,
	[ScorerId1] [uniqueidentifier] NULL,
	[ScorerId2] [uniqueidentifier] NULL,
	[AnalystId] [uniqueidentifier] NULL,
	[IsTossUncontested] [bit] NOT NULL,
	[NoPlayState] [nvarchar](100) NULL,
	[WaspPar] [smallint] NULL,
	[MatchTitle] [nvarchar](50) NULL,
	[MatchResultTypeId] [int] NULL,
	[MatchResultAmount] [int] NULL,
	[MatchResultText] [nvarchar](100) NULL,
	[WinningTeamId] [uniqueidentifier] NULL,
	[ManOfMatchId] [uniqueidentifier] NULL,
	[ManOfSeriesText] [nvarchar](100) NULL,
	[MatchPointsText] [nvarchar](100) NULL,
	[SeriesStatusText] [nvarchar](100) NULL,
	[DlsG50] [numeric](4, 1) NULL,
	[AdjustedTargetMethodId] [int] NULL,
	[OverrideParScore] [int] NULL,
	[OverrideTarget] [int] NULL,
	[OverrideFollowOnTarget] [int] NULL,
	[IsDayNight] [bit] NOT NULL,
	[MatchBattingPointsTeam1] [int] NULL,
	[MatchBowlingPointsTeam1] [int] NULL,
	[MatchTotalPointsTeam1] [int] NULL,
	[MatchBattingPointsTeam2] [int] NULL,
	[MatchBowlingPointsTeam2] [int] NULL,
	[MatchTotalPointsTeam2] [int] NULL,
	[SourceSystemType] [int] NULL,
	[SourceSystemId] [nvarchar](50) NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[LastModifiedUserId] [int] NULL,
	[LockedDeviceNumber] [nvarchar](100) NULL,
	[LockedUserId] [int] NULL,
	[PrimaryFixtureId] [uniqueidentifier] NULL,
	[LockedUserName] [nvarchar](100) NULL,
	[SourceSystemPossibleMatchPlayers] [nvarchar](max) NULL,
	[SourceSystemPossibleResults] [nvarchar](max) NULL,
	[SourceSystemPlayerRegistrationRequired] [bit] NULL,
	[SourceSystemSelectedResult] [nvarchar](30) NULL,
	[SourceSystemPointsRules] [nvarchar](max) NULL,
	[ScoringVersionNumber] [int] NULL,
	[MatchPenaltyPointsTeam1] [int] NULL,
	[MatchPenaltyPointsTeam2] [int] NULL,
	[NoBallValueLastOver] [int] NOT NULL,
	[WideValueLastOver] [int] NOT NULL,
	[SourceSystemPossibleMatchOfficials] [nvarchar](max) NULL,
	[IsDlsBallByBall] [bit] NOT NULL,
	[OverrideScorecardUrl] [nvarchar](512) NULL,
	[TwitterHashTag] [nvarchar](50) NULL,
 CONSTRAINT [PK_Match_1] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchDay]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchDay](
	[MatchId] [uniqueidentifier] NOT NULL,
	[DayNo] [int] NOT NULL,
	[OverrideOversInDay] [int] NULL,
	[WeatherTypeId] [uniqueidentifier] NULL,
	[PitchTypeId] [uniqueidentifier] NULL,
	[DayDateTime] [datetime] NULL,
 CONSTRAINT [PK_MatchDay] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC,
	[DayNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchDetail]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchDetail](
	[MatchId] [uniqueidentifier] NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[Teams] [nvarchar](203) NOT NULL,
	[MatchType] [nvarchar](50) NOT NULL,
	[Venue] [nvarchar](152) NULL,
	[IsHidden] [bit] NULL,
 CONSTRAINT [PK_MatchDetail] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchResultType]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchResultType](
	[MatchResultTypeId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MatchResultType] PRIMARY KEY CLUSTERED 
(
	[MatchResultTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchTeamPlayer]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchTeamPlayer](
	[MatchId] [uniqueidentifier] NOT NULL,
	[TeamId] [uniqueidentifier] NOT NULL,
	[PlayerId] [uniqueidentifier] NOT NULL,
	[BattingPosition] [int] NOT NULL,
	[IsCaptain] [bit] NULL,
	[IsWicketkeeper] [bit] NULL,
	[IsTwelfthMan] [bit] NULL,
	[ShirtNumber] [int] NULL,
	[ScoreboardName] [nvarchar](30) NULL,
 CONSTRAINT [PK_MatchTeamPlayer] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC,
	[PlayerId] ASC,
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchType]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchType](
	[MatchTypeId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[MatchDays] [int] NOT NULL,
	[MatchSessions] [int] NOT NULL,
	[MatchInnings] [int] NOT NULL,
	[MatchOvers] [int] NOT NULL,
	[NumberOfBatsman] [int] NOT NULL,
	[NoBallValue] [int] NOT NULL,
	[WideValue] [int] NOT NULL,
	[PowerPlay] [bit] NOT NULL,
	[FreeHit] [bit] NOT NULL,
	[HasBattingPowerPlay] [bit] NULL,
	[IsDisability] [bit] NOT NULL,
	[NumberOfPlayers] [int] NOT NULL,
	[DisplayDescription] [nvarchar](50) NULL,
	[OversPerDay] [int] NULL,
	[OversLastHour] [int] NULL,
	[OversNewBall] [int] NULL,
	[IsPairs] [bit] NOT NULL,
	[IsLastManStands] [bit] NOT NULL,
	[DismissalPenalty] [int] NULL,
	[StartingRuns] [int] NULL,
	[BallsPerOver] [int] NOT NULL,
	[MaxExtraBallsPerOver] [int] NULL,
	[MaxExtraAdditionalRuns] [int] NULL,
	[MaxExtraIsUnlimitedLast] [bit] NOT NULL,
	[IsDoubleBoundariesLastBall] [bit] NOT NULL,
	[NoBallValueLastOver] [int] NOT NULL,
	[WideValueLastOver] [int] NOT NULL,
	[NoBallIsExtraBall] [bit] NOT NULL,
	[NoBallIsExtraBallLastOver] [bit] NOT NULL,
	[WideIsExtraBall] [bit] NOT NULL,
	[WideIsExtraBallLastOver] [bit] NOT NULL,
	[SuperOvers] [int] NULL,
	[SuperOversBatsman] [int] NULL,
	[MatchOversIsPerMatch] [bit] NOT NULL,
	[BowlerOvers] [int] NULL,
	[BowlerOversIsPerMatch] [bit] NOT NULL,
	[MinimumOvers] [int] NULL,
	[SourceSystemType] [int] NULL,
	[SourceSystemId] [nvarchar](50) NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[LastModifiedUserId] [int] NULL,
	[EntityStatus] [int] NOT NULL,
	[ActualEntityId] [uniqueidentifier] NULL,
	[AdminClubId] [uniqueidentifier] NULL,
	[AdjustedTargetMethodId] [int] NULL,
	[DlsG50] [numeric](4, 1) NULL,
	[IsDlsBallByBall] [bit] NOT NULL,
 CONSTRAINT [PK_MatchType] PRIMARY KEY CLUSTERED 
(
	[MatchTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchTypeDuplicate]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchTypeDuplicate](
	[ActualMatchTypeId] [uniqueidentifier] NOT NULL,
	[DuplicateMatchTypeId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MatchTypeDuplicate] PRIMARY KEY CLUSTERED 
(
	[ActualMatchTypeId] ASC,
	[DuplicateMatchTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchVideo]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchVideo](
	[MatchId] [uniqueidentifier] NOT NULL,
	[VideoId] [int] NOT NULL,
	[VideoFilename] [nvarchar](255) NOT NULL,
	[StartDateTime] [datetime] NULL,
	[InningsNo] [int] NULL,
	[VideoName] [nvarchar](255) NULL,
 CONSTRAINT [PK_MatchVideo] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC,
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organisation]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organisation](
	[OrganisationId] [uniqueidentifier] NOT NULL,
	[ActualEntityId] [uniqueidentifier] NULL,
	[AffiliatedOrganisationId] [uniqueidentifier] NULL,
	[IsClub] [bit] NOT NULL,
	[OrganisationTypeId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[WebsiteUrl] [nvarchar](255) NULL,
	[TwitterName] [nvarchar](50) NULL,
	[SourceSystemType] [int] NULL,
	[SourceSystemId] [nvarchar](50) NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[LastModifiedUserId] [int] NULL,
	[EntityStatus] [int] NOT NULL,
 CONSTRAINT [PK_Organisation] PRIMARY KEY CLUSTERED 
(
	[OrganisationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganisationType]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganisationType](
	[OrganisationTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrganiationType] PRIMARY KEY CLUSTERED 
(
	[OrganisationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Over]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Over](
	[OverId] [uniqueidentifier] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NOT NULL,
	[OverNo] [int] NOT NULL,
	[UmpireId] [uniqueidentifier] NULL,
	[IsOverComplete] [bit] NULL,
	[Temperature] [numeric](3, 1) NULL,
	[Pressure] [int] NULL,
	[Humidity] [int] NULL,
	[AnalystLoginName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Over_1] PRIMARY KEY CLUSTERED 
(
	[OverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partnership]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partnership](
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NOT NULL,
	[PartnershipNo] [int] NOT NULL,
	[FirstBatsmanId] [uniqueidentifier] NOT NULL,
	[SecondBatsmanId] [uniqueidentifier] NULL,
	[OverrideDateStarted] [datetime] NULL,
	[OverrideDateEnded] [datetime] NULL,
	[OverrideTime] [bigint] NULL,
	[OverrideOverId] [uniqueidentifier] NULL,
	[OverrideBallNo] [int] NULL,
 CONSTRAINT [PK_Partnership] PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC,
	[InningsNo] ASC,
	[PartnershipNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penalty]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penalty](
	[PenaltyId] [uniqueidentifier] NOT NULL,
	[OverId] [uniqueidentifier] NULL,
	[BallNo] [int] NULL,
	[PenaltyTypeId] [int] NOT NULL,
	[Runs] [int] NOT NULL,
	[TeamId] [uniqueidentifier] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NOT NULL,
 CONSTRAINT [PK_PenaltyRun_1] PRIMARY KEY CLUSTERED 
(
	[PenaltyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PenaltyType]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PenaltyType](
	[PenaltyTypeId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[PenaltyTypeFormatted] [nvarchar](200) NOT NULL,
	[IllegalBall] [bit] NOT NULL,
	[AwardToBattingTeam] [bit] NOT NULL,
	[InningsPenalty] [bit] NOT NULL,
	[RunsAwarded] [int] NOT NULL,
 CONSTRAINT [PK_PenaltyRunType] PRIMARY KEY CLUSTERED 
(
	[PenaltyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PitchType]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PitchType](
	[PitchTypeId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PitchType] PRIMARY KEY CLUSTERED 
(
	[PitchTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[PlayerId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LeftHandedBatsman] [bit] NOT NULL,
	[BowlingTypeId] [int] NULL,
	[TeamId] [uniqueidentifier] NULL,
	[IsRetired] [bit] NULL,
	[DateOfBirth] [datetime] NULL,
	[ProfileImageName] [nvarchar](60) NULL,
	[ScoreboardName] [nvarchar](30) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleNames] [nvarchar](100) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[TwitterName] [nvarchar](50) NULL,
	[IsMale] [bit] NULL,
	[ShirtNumber] [int] NULL,
	[KnownAsName] [nvarchar](50) NULL,
	[AdminClubId] [uniqueidentifier] NULL,
	[IsKeeper] [bit] NOT NULL,
	[SourceSystemType] [int] NULL,
	[SourceSystemId] [nvarchar](50) NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[LastModifiedUserId] [int] NULL,
	[EntityStatus] [int] NOT NULL,
	[ActualEntityId] [uniqueidentifier] NULL,
	[IsPersonalDataApproved] [bit] NOT NULL,
	[PersonalDataApprovedByUserId] [int] NULL,
	[PersonalDataApprovedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Player_1] PRIMARY KEY CLUSTERED 
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerDuplicate]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerDuplicate](
	[ActualPlayerId] [uniqueidentifier] NOT NULL,
	[DuplicatePlayerId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__PlayerDuplicate__00000000000004D1] PRIMARY KEY CLUSTERED 
(
	[ActualPlayerId] ASC,
	[DuplicatePlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[PlaylistId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistItem]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistItem](
	[PlaylistItemId] [int] NOT NULL,
	[PlaylistId] [int] NOT NULL,
	[VideoFile] [nvarchar](1000) NOT NULL,
	[Ordinal] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_PlaylistItem] PRIMARY KEY CLUSTERED 
(
	[PlaylistItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointsTableSystem]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointsTableSystem](
	[PointsTableSystemId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[IsOneInningsRules] [bit] NOT NULL,
	[WinPoints] [int] NOT NULL,
	[NoResultPoints] [int] NOT NULL,
	[AbandonedPoints] [int] NOT NULL,
	[TiePoints] [int] NOT NULL,
	[DrawPoints] [int] NOT NULL,
	[NetRunRateBonusPointRatio] [decimal](18, 3) NOT NULL,
	[NetRunRateBonusPoints] [int] NOT NULL,
	[AbandonedToOneInningsMatchPoints] [int] NOT NULL,
	[OneInningsMatchWinPoints] [int] NOT NULL,
	[OneInningsMatchTiePoints] [int] NOT NULL,
	[OneInningsMatchIsOneDay] [bit] NOT NULL,
	[FirstInningsWinPoints] [int] NOT NULL,
	[FirstInningsTiePoints] [int] NOT NULL,
	[FirstInningsBonusOverLevel] [int] NOT NULL,
	[FirstInningsBonusBattingTotal1] [int] NOT NULL,
	[FirstInningsBonusBattingTotal2] [int] NOT NULL,
	[FirstInningsBonusBattingTotal3] [int] NOT NULL,
	[FirstInningsBonusBattingTotal4] [int] NOT NULL,
	[FirstInningsBonusBowlingWickets1] [int] NOT NULL,
	[FirstInningsBonusBowlingWickets2] [int] NOT NULL,
	[FirstInningsBonusBowlingWickets3] [int] NOT NULL,
	[FirstInningsBonusBowlingWickets4] [int] NOT NULL,
	[UseNetRunsPerWicket] [bit] NOT NULL,
 CONSTRAINT [PK_PointsTableSystem] PRIMARY KEY CLUSTERED 
(
	[PointsTableSystemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerPlay]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerPlay](
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NOT NULL,
	[PowerPlay1EndBallNo] [int] NULL,
	[PowerPlay1StartOverNo] [int] NULL,
	[BowlStartOverNo] [int] NULL,
	[BowlEndOverNo] [int] NULL,
	[BowlEndBallNo] [int] NULL,
	[BatStartOverNo] [int] NULL,
	[BatEndOverNo] [int] NULL,
	[BatEndBallNo] [int] NULL,
	[PowerPlay1EndOverNo] [int] NULL,
	[PowerPlay1StartBallNo] [int] NULL,
	[BatStartBallNo] [int] NULL,
	[BowlStartBallNo] [int] NULL,
 CONSTRAINT [PK_PowerPlay_1] PRIMARY KEY CLUSTERED 
(
	[InningsNo] ASC,
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Replay]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Replay](
	[OverId] [uniqueidentifier] NULL,
	[BallNo] [int] NULL,
	[Timestamp] [datetime] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NOT NULL,
	[ReplayId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Replay__0000000000000647] PRIMARY KEY CLUSTERED 
(
	[ReplayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportTemplate]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportTemplate](
	[ReportTemplateId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Template] [ntext] NOT NULL,
 CONSTRAINT [PK__ReportTemplate__000000000000058E] PRIMARY KEY CLUSTERED 
(
	[ReportTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScorecardNote]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScorecardNote](
	[ScorecardNoteId] [uniqueidentifier] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[UniqueOrder] [bigint] NOT NULL,
	[Timestamp] [datetime] NULL,
	[ScorecardNoteType] [int] NOT NULL,
	[InningsNo] [int] NULL,
	[OverId] [uniqueidentifier] NULL,
	[BallNo] [int] NULL,
	[Milestone] [int] NULL,
	[PlayerId1] [uniqueidentifier] NULL,
	[PlayerId2] [uniqueidentifier] NULL,
	[DefaultNote] [nvarchar](512) NOT NULL,
	[OverrideNote] [nvarchar](512) NULL,
	[IsHidden] [bit] NOT NULL,
 CONSTRAINT [PK__ScorecardNote] PRIMARY KEY CLUSTERED 
(
	[ScorecardNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[SeasonId] [uniqueidentifier] NOT NULL,
	[SeasonName] [nvarchar](100) NOT NULL,
	[SeasonIsArchived] [bit] NOT NULL,
	[SeasonStartDate] [datetime] NULL,
	[SeasonEndDate] [datetime] NULL,
	[IsCurrentIntSeason] [bit] NOT NULL,
	[IsCurrentDomesticSeason] [bit] NOT NULL,
	[ActualSeasonId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblNzc_Season] PRIMARY KEY CLUSTERED 
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShortenedMatch]    Script Date: 16/08/2018 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShortenedMatch](
	[ShortenedMatchId] [uniqueidentifier] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[InningsNo] [int] NULL,
	[OverId] [uniqueidentifier] NULL,
	[BallNo] [int] NULL,
	[Innings1MaximumOvers] [int] NULL,
	[RevisedTarget] [int] NULL,
	[RevisedOvers] [numeric](4, 1) NULL,
	[TimeAdded] [datetime] NULL,
 CONSTRAINT [PK_ShortenedMatch_1] PRIMARY KEY CLUSTERED 
(
	[ShortenedMatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shot]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shot](
	[ShotId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Ordinal] [int] NOT NULL,
	[ShowOnScorePanel] [bit] NOT NULL,
	[Ordinal2] [int] NOT NULL,
 CONSTRAINT [PK_Shot_1] PRIMARY KEY CLUSTERED 
(
	[ShotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[SiteId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteMatch]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteMatch](
	[SiteId] [int] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__SiteMatch__0000000000000631] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC,
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubFielder]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubFielder](
	[SubFielderId] [uniqueidentifier] NOT NULL,
	[MatchId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TeamId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SubFielder] PRIMARY KEY CLUSTERED 
(
	[SubFielderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubFielding]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubFielding](
	[SubFieldingId] [uniqueidentifier] NOT NULL,
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[CricketEventId] [int] NOT NULL,
	[SubFielderId] [uniqueidentifier] NOT NULL,
	[FieldingPositionId] [int] NULL,
	[FieldX] [numeric](9, 5) NULL,
	[FieldY] [numeric](9, 5) NULL,
 CONSTRAINT [PK_SubFielding_1] PRIMARY KEY CLUSTERED 
(
	[SubFieldingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ShortName] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[ClubId] [uniqueidentifier] NULL,
	[Region] [nvarchar](50) NULL,
	[InClubName] [nvarchar](100) NULL,
	[SourceSystemType] [int] NULL,
	[SourceSystemId] [nvarchar](50) NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[LastModifiedUserId] [int] NULL,
	[EntityStatus] [int] NOT NULL,
	[ScoreboardName] [nvarchar](30) NULL,
	[ActualEntityId] [uniqueidentifier] NULL,
	[ProfileImageName] [nvarchar](60) NULL,
	[TwitterName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Team_1] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamDuplicate]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamDuplicate](
	[ActualTeamId] [uniqueidentifier] NOT NULL,
	[DuplicateTeamId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TeamDuplicate] PRIMARY KEY CLUSTERED 
(
	[ActualTeamId] ASC,
	[DuplicateTeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamPlayer]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamPlayer](
	[TeamId] [uniqueidentifier] NOT NULL,
	[PlayerId] [uniqueidentifier] NOT NULL,
	[ShirtNumber] [int] NULL,
 CONSTRAINT [PK_PlayerTeam] PRIMARY KEY CLUSTERED 
(
	[PlayerId] ASC,
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracking]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracking](
	[MatchId] [uniqueidentifier] NOT NULL,
	[PlayerId] [uniqueidentifier] NOT NULL,
	[Milliseconds] [int] NULL,
	[Longitude] [numeric](10, 7) NOT NULL,
	[Latitude] [numeric](10, 7) NOT NULL,
	[HeartRate] [int] NULL,
	[Speed] [numeric](5, 3) NULL,
	[Time] [datetime] NOT NULL,
	[InningsNo] [int] NOT NULL,
	[TrackingId] [int] NOT NULL,
 CONSTRAINT [PK__Tracking__000000000000046D] PRIMARY KEY CLUSTERED 
(
	[TrackingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Umpire]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Umpire](
	[UmpireId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsUmpire] [bit] NOT NULL,
	[IsReferee] [bit] NOT NULL,
	[IsScorer] [bit] NOT NULL,
	[IsAnalyst] [bit] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleNames] [nvarchar](100) NULL,
	[LastName] [nvarchar](50) NULL,
	[KnownAsName] [nvarchar](50) NULL,
	[ScoreboardName] [nvarchar](30) NULL,
	[AdminClubId] [uniqueidentifier] NULL,
	[SourceSystemType] [int] NULL,
	[SourceSystemId] [nvarchar](50) NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[LastModifiedUserId] [int] NULL,
	[EntityStatus] [int] NOT NULL,
	[ActualEntityId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Umpire] PRIMARY KEY CLUSTERED 
(
	[UmpireId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UmpireDuplicate]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UmpireDuplicate](
	[ActualUmpireId] [uniqueidentifier] NOT NULL,
	[DuplicateUmpireId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UmpireDuplicate] PRIMARY KEY CLUSTERED 
(
	[ActualUmpireId] ASC,
	[DuplicateUmpireId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserConfiguration]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserConfiguration](
	[UserConfiguratonId] [int] NOT NULL,
	[UserLogin] [nvarchar](50) NULL,
	[UserSettingsData] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserConfiguration] PRIMARY KEY CLUSTERED 
(
	[UserConfiguratonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserEvent]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEvent](
	[UserEventId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ShowOnScorePanel] [bit] NOT NULL,
 CONSTRAINT [PK_UserEvent] PRIMARY KEY CLUSTERED 
(
	[UserEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWindow]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWindow](
	[UserWindowId] [uniqueidentifier] NULL,
	[UserLogin] [nvarchar](50) NULL,
	[WindowName] [nvarchar](100) NOT NULL,
	[LastUsedDateTime] [datetime] NULL,
	[IsAutoSaveBasedOn] [uniqueidentifier] NULL,
	[SerialisedWindowData] [nvarchar](max) NULL,
	[PerWindowConfigurationData] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[VenueId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NOT NULL,
	[End1] [nvarchar](100) NULL,
	[End2] [nvarchar](100) NULL,
	[AdminClubId] [uniqueidentifier] NULL,
	[SourceSystemType] [int] NULL,
	[SourceSystemId] [nvarchar](50) NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[LastModifiedUserId] [int] NULL,
	[EntityStatus] [int] NOT NULL,
	[ActualEntityId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Venue] PRIMARY KEY CLUSTERED 
(
	[VenueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VenueDuplicate]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VenueDuplicate](
	[ActualVenueId] [uniqueidentifier] NOT NULL,
	[DuplicateVenueId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_VenueDuplicate] PRIMARY KEY CLUSTERED 
(
	[ActualVenueId] ASC,
	[DuplicateVenueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeatherType]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeatherType](
	[WeatherTypeId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WeatherType] PRIMARY KEY CLUSTERED 
(
	[WeatherTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wicket]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wicket](
	[OverId] [uniqueidentifier] NOT NULL,
	[BallNo] [int] NOT NULL,
	[PlayerId] [uniqueidentifier] NOT NULL,
	[WicketTypeId] [int] NOT NULL,
	[ReturnedOverId] [uniqueidentifier] NULL,
	[ReturnedBallNo] [int] NULL,
 CONSTRAINT [PK_Wicket] PRIMARY KEY CLUSTERED 
(
	[BallNo] ASC,
	[OverId] ASC,
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WicketType]    Script Date: 16/08/2018 14:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WicketType](
	[WicketTypeId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[HasFielders] [bit] NOT NULL,
	[ScorecardText] [nvarchar](25) NOT NULL,
	[IsBowlerCredited] [bit] NOT NULL,
	[FieldingEventId] [int] NULL,
	[Ordinal] [int] NULL,
 CONSTRAINT [PK_WicketType] PRIMARY KEY CLUSTERED 
(
	[WicketTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (1, N'RF', N'Right-Arm Fast')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (2, N'RFM', N'Right-Arm Fast-Medium')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (3, N'RM', N'Right-Arm Medium')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (4, N'ROB', N'Right-Arm Off Break')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (5, N'RLB', N'Right-Arm Leg Break')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (6, N'LF', N'Left-Arm Fast')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (7, N'LFM', N'Left-Arm Fast-Medium')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (8, N'LM', N'Left-Arm Medium')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (9, N'SLA', N'Left-Arm Orthodox')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (10, N'LC', N'Left-Arm Chinaman')
INSERT [dbo].[BowlingType] ([BowlingTypeId], [Description], [ExtendedDescription]) VALUES (11, N'WK', NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'3b992cdf-7cba-41b2-b805-058bee200956', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 4, CAST(N'2017-12-20T16:37:32.013' AS DateTime), NULL, CAST(N'2017-12-20T16:38:10.987' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'3c81dcbd-d82a-4b91-9e96-07a090534070', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-21T22:44:58.923' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'fe0f0bd5-119f-4b33-91bb-0a08c477da7c', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-21T18:24:33.787' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'1ba68775-8516-4b64-a501-0c003aa28410', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-21T13:49:19.820' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'f47a239e-795d-429d-8b57-14921473a402', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 25, CAST(N'2017-12-21T22:00:42.703' AS DateTime), NULL, CAST(N'2017-12-21T22:01:11.447' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'9ba4e8da-7867-49e6-a252-1f151c08bb4a', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-18T22:50:11.457' AS DateTime), NULL, CAST(N'2017-12-18T22:52:20.663' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'b61ecb23-b736-46f0-98f2-1f178f6da9f9', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-21T19:51:40.437' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'e78d790e-834d-4670-a175-1f8ce307d859', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-21T18:23:50.103' AS DateTime), NULL, CAST(N'2017-12-21T18:24:33.760' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'ec34684f-8a9e-4912-ba77-28835bbca3c1', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 22, CAST(N'2017-12-21T13:16:13.857' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'c2bdb451-d67f-4828-a5ad-2fde04a79fa8', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 5, CAST(N'2017-12-21T22:42:35.957' AS DateTime), NULL, CAST(N'2017-12-21T22:44:58.870' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'ae7366e4-25b5-40a3-aa7c-2fe1fd64ee3e', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 5, CAST(N'2017-12-21T22:01:18.110' AS DateTime), NULL, CAST(N'2017-12-21T22:42:07.383' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'0689c506-5121-4a1f-b58e-31feefb4e521', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 2, CAST(N'2017-12-19T12:24:49.350' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'73da91ae-45cb-4d81-b213-361c6b347b61', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 9, CAST(N'2017-12-20T18:02:26.490' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'6f1bc1f9-d05f-42cf-bc3d-3aa0a3e5600f', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-20T18:09:00.653' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'3dc396d5-31dc-4c5c-82b4-3ad9dcc05837', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-18T22:47:30.380' AS DateTime), NULL, CAST(N'2017-12-18T22:50:11.440' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'9e7dbae8-4eea-49b0-b858-45227024c4f0', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-21T21:36:16.730' AS DateTime), NULL, CAST(N'2017-12-21T22:00:42.703' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'213315b2-f480-498e-baa0-47ff5776c451', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-20T16:37:24.047' AS DateTime), NULL, CAST(N'2017-12-20T16:37:31.980' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'06911c2f-b13d-4ac4-ab20-4d6036576711', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-20T21:33:16.667' AS DateTime), NULL, CAST(N'2017-12-20T21:33:19.223' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'093841bd-761f-41ce-8a04-4dfa69d7438c', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-20T14:05:02.850' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'45d5e3df-77b9-447b-8636-4e7d951abdd3', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-21T22:42:07.400' AS DateTime), NULL, CAST(N'2017-12-21T22:42:35.957' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'd95708de-a87a-44ec-8c26-578f4de5e0ad', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-20T21:32:48.667' AS DateTime), NULL, CAST(N'2017-12-20T21:33:02.960' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'10267bc4-06d5-4fa9-97a7-5b7f910e00a4', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 2, CAST(N'2017-12-19T13:05:18.453' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'8fc7a8ff-6007-4761-a9f4-5ba03e697af0', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-18T22:47:15.990' AS DateTime), NULL, CAST(N'2017-12-18T22:47:30.367' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'8055ba45-90f6-4347-8604-643262791b1e', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 4, CAST(N'2017-12-21T02:42:46.093' AS DateTime), NULL, CAST(N'2017-12-21T02:50:59.140' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'1ba40876-bb2c-488d-b51c-643649b8d266', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-18T23:05:40.653' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'ac436f61-f92a-453f-be10-69233121f331', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 5, CAST(N'2017-12-19T13:13:26.207' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'2e6e9afb-34af-43c8-bfbd-6c191d1b93a0', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-21T21:34:59.510' AS DateTime), NULL, CAST(N'2017-12-21T21:36:16.717' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'9c67b8d9-eb06-4151-902a-6e9c397409f8', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-21T22:42:07.400' AS DateTime), NULL, CAST(N'2017-12-21T22:42:35.957' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'dc919868-d64a-4e3f-9527-7ae537ed5f11', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 25, CAST(N'2017-12-21T22:00:42.703' AS DateTime), NULL, CAST(N'2017-12-21T22:01:11.447' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'ffa0582d-5660-4d24-9d34-7b23ccdba513', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 22, CAST(N'2017-12-21T13:49:07.913' AS DateTime), NULL, CAST(N'2017-12-21T13:49:19.787' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'87669f47-bdf6-47fd-99a8-7c1c6c8a062e', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-20T14:22:43.617' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'0962c4e3-b9e7-4386-ae28-8513acc114da', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 9, CAST(N'2017-12-20T21:33:19.233' AS DateTime), NULL, CAST(N'2017-12-20T21:33:26.537' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'6c630757-4a17-41d5-bde1-89beddee6e03', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-20T21:33:02.973' AS DateTime), NULL, CAST(N'2017-12-20T21:33:08.587' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'23e71cfc-9289-46ad-a75b-8f3ee80491f8', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 3, CAST(N'2017-12-19T13:13:13.533' AS DateTime), NULL, CAST(N'2017-12-19T13:13:26.190' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'19893b57-3820-41e9-9510-91211c52d11a', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 22, CAST(N'2017-12-20T21:28:23.360' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'70162df4-dbb7-453b-8b6c-916fae8eb55d', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-21T21:34:59.510' AS DateTime), NULL, CAST(N'2017-12-21T21:36:16.730' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'1677d6ad-65f3-40e7-a8b5-9744a09f9aa7', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-21T13:49:19.800' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'901c1e5d-10f7-4267-b3ff-9d52832a0178', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-21T22:01:11.447' AS DateTime), NULL, CAST(N'2017-12-21T22:01:18.097' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'4da41205-7440-498c-b693-a11ef8235fb4', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 5, CAST(N'2017-12-21T22:42:35.957' AS DateTime), NULL, CAST(N'2017-12-21T22:44:58.907' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'553b33df-2472-4d3f-95a4-a476821b977c', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-21T22:01:11.447' AS DateTime), NULL, CAST(N'2017-12-21T22:01:18.110' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'9fc8cc66-3a80-490f-9cec-a4781e15030d', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 6, CAST(N'2017-12-20T21:33:08.613' AS DateTime), NULL, CAST(N'2017-12-20T21:33:16.657' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'89dd264d-b75f-473b-9100-bbff47f4f1a6', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-22T13:00:39.060' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'758ad050-6409-45ef-9874-c2740fe04dfa', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-20T23:48:56.710' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'7f51ff9c-5be9-42a4-b91f-c4b566e22041', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-20T16:38:11.003' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'b9fccc1d-7632-46ba-bcd6-cbc55e160831', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-21T21:36:16.730' AS DateTime), NULL, CAST(N'2017-12-21T22:00:42.703' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'5ab6d6b2-df16-4417-9b9e-d0505e5e3f77', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 17, CAST(N'2017-12-21T22:44:58.870' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'2b65b6be-0588-4c82-9890-d3a5db9be79d', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 22, CAST(N'2017-12-21T13:49:07.933' AS DateTime), NULL, CAST(N'2017-12-21T13:49:19.810' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'7ac3bd60-d399-45ea-a14c-d691d7ff1e47', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-20T21:33:26.547' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'cdf8ec35-6e5f-4598-b0f3-d6a574ddbf61', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 5, CAST(N'2017-12-21T02:50:59.140' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'af476f1b-3045-43c1-94bf-e12a2427545e', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-20T21:09:24.400' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'7b6f169f-6bf4-4b94-8426-e2a364af0f9a', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 8, CAST(N'2017-12-18T22:52:20.677' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'693349ab-72ef-41fa-8bbf-eb48dc765faa', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 2, CAST(N'2017-12-19T12:32:59.797' AS DateTime), NULL, CAST(N'2017-12-19T12:35:58.590' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'17d037fc-1418-4114-93d1-efc31c456dd8', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 2, CAST(N'2017-12-19T12:35:58.603' AS DateTime), NULL, CAST(N'2017-12-19T12:36:21.027' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'ef1e77bb-aae3-4427-8121-f2a8556f623a', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 25, CAST(N'2017-12-19T12:36:21.047' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'b1742ae4-39c9-45ac-8c7d-f4a5c736db93', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 5, CAST(N'2017-12-21T22:01:18.110' AS DateTime), NULL, CAST(N'2017-12-21T22:42:07.400' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'e948fe67-bcb8-4218-89da-f948ecab49fd', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 22, CAST(N'2017-12-18T22:46:56.673' AS DateTime), NULL, CAST(N'2017-12-18T22:47:15.947' AS DateTime), NULL)
INSERT [dbo].[Break] ([BreakId], [MatchId], [InningsNo], [OverId], [BallNo], [BreakTypeId], [DateCreated], [DateInspectionOrExpectedEnd], [DateEnded], [IsDateInspection]) VALUES (N'bcbb8308-4973-41b7-bcd5-fa0b5396c471', N'00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, 4, CAST(N'2017-12-21T19:51:31.427' AS DateTime), NULL, CAST(N'2017-12-21T19:51:40.420' AS DateTime), NULL)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (2, N'Drinks', 0, 1, 0)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (3, N'Crowd Interruption', 0, 5, 0)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (4, N'Ground Delay', 0, 6, 1)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (5, N'Lunch', 1, 3, 1)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (6, N'Tea', 1, 5, 1)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (7, N'End of Day', 1, 7, 1)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (8, N'Rain', 0, 2, 1)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (9, N'Bad Light', 0, 4, 1)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (17, N'Innings Break', 0, 10, 1)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (19, N'Dinner', 1, 6, 1)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (22, N'Ball Change', 0, 8, 0)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (24, N'Break in Play', 0, 7, 0)
INSERT [dbo].[BreakType] ([BreakTypeId], [Description], [EndSession], [Ordinal], [StopTimer]) VALUES (25, N'Injury', 0, 9, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'General')
INSERT [dbo].[CompetitionType] ([CompetitionTypeId], [Description]) VALUES (1, N'Tournament')
INSERT [dbo].[CompetitionType] ([CompetitionTypeId], [Description]) VALUES (2, N'Division')
INSERT [dbo].[CompetitionType] ([CompetitionTypeId], [Description]) VALUES (3, N'Cup')
INSERT [dbo].[CompetitionType] ([CompetitionTypeId], [Description]) VALUES (4, N'Friendly')
INSERT [dbo].[CompetitionType] ([CompetitionTypeId], [Description]) VALUES (5, N'Warm-Up')
INSERT [dbo].[CompetitionType] ([CompetitionTypeId], [Description]) VALUES (6, N'Tour')
INSERT [dbo].[CompetitionType] ([CompetitionTypeId], [Description]) VALUES (7, N'Series')
INSERT [dbo].[Configuration] ([VideoDevice], [AudioDevice], [VideoProfile], [VideoBitrate], [ResizeStretch], [ConfigurationId], [Complexity], [Key], [User], [Config1], [Config2], [Config3], [Config4], [Config5], [Config6], [Config7], [Config8], [Config9], [AllowConnections], [MacAddress], [CaptureAudio], [SiteId], [SiteName], [IsBMDVideoCapture], [BMDBitrate], [GridMainControlsHeight], [GridPitchWidth], [GridWagonWheelWidth], [GridButtonsWidth], [IsRealtimeUpload], [IsContinuousCapture], [IsShowBallArrival], [IsCaptureWeather], [UserId], [TwitterAccessSecret], [TwitterAccessToken], [GridWagonWheelHeight], [ContinuousVideoScaleSize], [IsGenerateSportscodeXml], [UserLastLogin], [ReaderConnectionsPort], [PitchsideServicesPort], [PitchsideDiscoveryPort], [PitchsideFieldingPort], [PitchsideFieldingPin], [PitchsideFieldingPinExpiry], [RootFolderPath], [PitchsideFieldingPinMatchId], [WatermarkFilePath], [WatermarkLocationType], [IsAutoStartBall], [IsAutoEndBall], [IsAutoEndOver], [IsOneClickScoring], [VersionNumber], [IsAutoScorecardExpandCurrentPlayers], [IsCompactScoreSummary], [LastServerSyncUtc], [IsUserNVPlay], [LastOpenedMatchId], [LastOpenedAsLiveScorer], [LiveUploadType], [LiveUploadMinutes], [WagonWheelRotation], [IsAutoScorebookCurrentPlayers], [LastUsedLayout], [LiveTweetType], [LiveTweetMinutes], [LiveTweetEvents], [AreTweetsTiedToLiveUpload], [UseTwitterPlayerNames], [IsModernSymbols], [UseColourInScorebook], [SyncExternalPossibleClubData], [IsAutoBackup], [TwitterAppendContent]) VALUES (N'AV/C Tape Recorder/Player', NULL, N'Standard Resolution', 1400, NULL, 1, 3, NULL, N'vivian@vivianlobo.com', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 354, NULL, 0, 0, 1, 1, 3056, N'', N'', 354, NULL, 0, CAST(N'2018-08-16T12:50:19.627' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'C:\Users\lobvi02\Documents\Cricket Matches', NULL, NULL, NULL, 1, 1, 0, 1, 1010006, 1, 0, NULL, 0, N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', NULL, 0, 1, NULL, 1, N'Scoring - Default.lcf', 3, 1, 1, 0, 0, 1, 1, 0, 1, NULL)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (1, N'Wicket', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (11, N'Offensive P&M', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (12, N'Defensive P&M', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (13, N'Poor Defensive Selection', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (14, N'Poor Defensive Execution', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (15, N'Poor Offensive Selection', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (16, N'Poor Offensive Execution', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (17, N'In Air', 0, 1, 3, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (18, N'Slower Ball', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (19, N'Used Feet', 0, 1, 4, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (20, N'Appeal', 0, 1, 5, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (21, N'Poor Fielding', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (22, N'Throw at Stumps - Hit', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (23, N'Dive Miss', 0, 0, 11, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (24, N'Run Out Chance', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (25, N'No Ball', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (26, N'Wide', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (27, N'Leg Bye', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (28, N'Bye', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (29, N'Boundary', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (30, N'Dive Stop', 0, 0, 10, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (31, N'Catch Chance', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (32, N'Throw at Stumps - Miss', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (33, N'Penalty Five', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (34, N'NB LB', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (35, N'NB Bye', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (36, N'Clean Field', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (37, N'Fumble', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (38, N'Poor Return Throw', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (39, N'Stumping Chance', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (40, N'Catch', 1, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (41, N'Run Out', 1, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (42, N'Stumping', 1, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (43, N'Poor Shot Execution', 0, 1, 2, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (44, N'User1', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (45, N'User2', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (46, N'User3', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (47, N'User4', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (48, N'Around the Wicket', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (50, N'New Ball Taken', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (59, N'Keeper Up', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (60, N'Catch - Easy', 0, 0, 1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (61, N'Catch - Medium', 0, 0, 2, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (62, N'Catch - Hard', 0, 0, 3, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (63, N'Catch - Very Hard', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (64, N'Drop Catch - Easy', 0, 0, 5, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (65, N'Drop Catch - Medium', 0, 0, 6, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (66, N'Drop Catch - Hard', 0, 0, 7, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (67, N'Drop Catch - Very Hard', 0, 0, -1, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (68, N'Ground Field ', 0, 0, 9, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (69, N'Ground Field - Hard', 0, 0, 10, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (70, N'Ground Field Error', 0, 0, 11, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (71, N'Ground Field Error - Hard', 0, 0, 12, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (74, N'Throw Not Required', 0, 0, 15, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (75, N'Umpire Error', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (76, N'Decision Review', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (77, N'In Air - Controlled', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (78, N'In Air - Uncontrolled', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (79, N'Reverse Swing', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (80, N'Seam Movement', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (81, N'Swing', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (82, N'Googly', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (83, N'Spin Variation', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (84, N'Arm Ball', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (85, N'Yorker Success', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (86, N'Yorker Fail', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (87, N'Bouncer Success', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (88, N'Bouncer Fail', 0, 0, -1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (89, N'Play and Miss', 0, 1, 1, 1)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (90, N'Support', 0, 0, 12, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (91, N'Keeper Error', 0, 0, 13, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (96, N'Illegal Ball', 0, 0, 17, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (97, N'Batsman Crossed', 0, 0, 15, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (98, N'Run Short', 0, 0, 16, 0)
INSERT [dbo].[CricketEvent] ([CricketEventId], [Description], [CauseWicket], [ShowOnScorePanel], [Ordinal], [IsKPI]) VALUES (99, N'Start of Last Hour', 0, 0, 14, 0)
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (1, N'First Slip', 1, CAST(174.00000 AS Numeric(9, 5)), CAST(110.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (2, N'Second Slip', 2, CAST(164.00000 AS Numeric(9, 5)), CAST(113.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (3, N'Third Slip', 3, CAST(154.00000 AS Numeric(9, 5)), CAST(116.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (4, N'Fourth Slip', 4, CAST(144.00000 AS Numeric(9, 5)), CAST(119.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (5, N'Fifth Slip', 5, CAST(134.00000 AS Numeric(9, 5)), CAST(122.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (6, N'Fly Slip', 6, CAST(126.00000 AS Numeric(9, 5)), CAST(61.00000 AS Numeric(9, 5)), CAST(15.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (7, N'Short Third Man', 7, CAST(140.00000 AS Numeric(9, 5)), CAST(86.00000 AS Numeric(9, 5)), CAST(15.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (8, N'Third Man', 8, CAST(110.00000 AS Numeric(9, 5)), CAST(34.00000 AS Numeric(9, 5)), CAST(30.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (9, N'Gully', 9, CAST(132.00000 AS Numeric(9, 5)), CAST(136.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (10, N'Backward Point', 10, CAST(115.00000 AS Numeric(9, 5)), CAST(144.00000 AS Numeric(9, 5)), CAST(10.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (11, N'Deep Backward Point', 11, CAST(40.00000 AS Numeric(9, 5)), CAST(110.00000 AS Numeric(9, 5)), CAST(30.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (12, N'Silly Point', 12, CAST(155.00000 AS Numeric(9, 5)), CAST(160.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (13, N'Point', 13, CAST(110.00000 AS Numeric(9, 5)), CAST(160.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (14, N'Deep Point', 14, CAST(20.00000 AS Numeric(9, 5)), CAST(160.00000 AS Numeric(9, 5)), CAST(30.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (15, N'Short Cover', 15, CAST(144.00000 AS Numeric(9, 5)), CAST(171.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (16, N'Cover', 16, CAST(113.00000 AS Numeric(9, 5)), CAST(194.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (17, N'Deep Cover', 17, CAST(27.00000 AS Numeric(9, 5)), CAST(223.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (18, N'Extra Cover', 18, CAST(127.00000 AS Numeric(9, 5)), CAST(216.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (19, N'Deep Extra Cover', 19, CAST(54.00000 AS Numeric(9, 5)), CAST(270.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (20, N'Silly Mid Off', 20, CAST(160.00000 AS Numeric(9, 5)), CAST(173.00000 AS Numeric(9, 5)), CAST(10.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (21, N'Mid Off', 21, CAST(150.00000 AS Numeric(9, 5)), CAST(240.00000 AS Numeric(9, 5)), CAST(10.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (22, N'Long Off', 22, CAST(125.00000 AS Numeric(9, 5)), CAST(325.00000 AS Numeric(9, 5)), CAST(10.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (23, N'Straight Hit', 23, CAST(175.00000 AS Numeric(9, 5)), CAST(332.00000 AS Numeric(9, 5)), CAST(10.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (24, N'Silly Mid On', 24, CAST(190.00000 AS Numeric(9, 5)), CAST(173.00000 AS Numeric(9, 5)), CAST(10.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (25, N'Mid On', 25, CAST(200.00000 AS Numeric(9, 5)), CAST(240.00000 AS Numeric(9, 5)), CAST(10.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (26, N'Long On', 26, CAST(225.00000 AS Numeric(9, 5)), CAST(325.00000 AS Numeric(9, 5)), CAST(10.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (27, N'Cow Corner', 27, CAST(296.00000 AS Numeric(9, 5)), CAST(270.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (28, N'Mid Wicket', 28, CAST(237.00000 AS Numeric(9, 5)), CAST(194.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (29, N'Deep Midwicket', 29, CAST(323.00000 AS Numeric(9, 5)), CAST(223.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (30, N'Short Leg', 30, CAST(195.00000 AS Numeric(9, 5)), CAST(160.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (31, N'Square Leg', 31, CAST(240.00000 AS Numeric(9, 5)), CAST(160.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (32, N'Deep Square Leg', 32, CAST(330.00000 AS Numeric(9, 5)), CAST(160.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (33, N'Leg Gully', 33, CAST(222.00000 AS Numeric(9, 5)), CAST(132.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (34, N'Backward Square Leg', 34, CAST(210.00000 AS Numeric(9, 5)), CAST(110.00000 AS Numeric(9, 5)), CAST(30.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (35, N'Long Leg', 35, CAST(280.00000 AS Numeric(9, 5)), CAST(62.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (36, N'Leg Slip', 36, CAST(193.00000 AS Numeric(9, 5)), CAST(107.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (37, N'Short Fine leg', 37, CAST(210.00000 AS Numeric(9, 5)), CAST(86.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (38, N'Deep Fine Leg', 38, CAST(240.00000 AS Numeric(9, 5)), CAST(34.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (39, N'Cover Point', 39, CAST(109.00000 AS Numeric(9, 5)), CAST(175.00000 AS Numeric(9, 5)), CAST(20.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (40, N'Bowler', 40, CAST(175.00000 AS Numeric(9, 5)), CAST(190.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[FieldingPosition] ([FieldingPositionId], [Description], [Ordinal], [CentreX], [CentreY], [CentreRadius]) VALUES (41, N'Wicketkeeper', 41, CAST(175.00000 AS Numeric(9, 5)), CAST(120.00000 AS Numeric(9, 5)), CAST(5.00000 AS Numeric(9, 5)))
INSERT [dbo].[InningsEndType] ([InningsEndTypeId], [Description]) VALUES (3, N'All Out')
INSERT [dbo].[InningsEndType] ([InningsEndTypeId], [Description]) VALUES (2, N'Declaration')
INSERT [dbo].[InningsEndType] ([InningsEndTypeId], [Description]) VALUES (5, N'End of Overs')
INSERT [dbo].[InningsEndType] ([InningsEndTypeId], [Description]) VALUES (6, N'Forfeit')
INSERT [dbo].[InningsEndType] ([InningsEndTypeId], [Description]) VALUES (7, N'Play Called Off')
INSERT [dbo].[InningsEndType] ([InningsEndTypeId], [Description]) VALUES (4, N'Target Reached ')
INSERT [dbo].[Length] ([LengthId], [Description]) VALUES (7, N'Back of a Length')
INSERT [dbo].[Length] ([LengthId], [Description]) VALUES (6, N'Bouncer')
INSERT [dbo].[Length] ([LengthId], [Description]) VALUES (3, N'Full')
INSERT [dbo].[Length] ([LengthId], [Description]) VALUES (2, N'Full Toss')
INSERT [dbo].[Length] ([LengthId], [Description]) VALUES (4, N'Length')
INSERT [dbo].[Length] ([LengthId], [Description]) VALUES (5, N'Short')
INSERT [dbo].[Length] ([LengthId], [Description]) VALUES (1, N'Yorker')
INSERT [dbo].[Line] ([LineId], [Description]) VALUES (4, N'Leg')
INSERT [dbo].[Line] ([LineId], [Description]) VALUES (5, N'Leg Wide')
INSERT [dbo].[Line] ([LineId], [Description]) VALUES (3, N'Line')
INSERT [dbo].[Line] ([LineId], [Description]) VALUES (2, N'Off')
INSERT [dbo].[Line] ([LineId], [Description]) VALUES (1, N'Yorker')
INSERT [dbo].[Match] ([MatchId], [MatchTypeId], [VenueId], [DateStart], [FollowOn], [NoBallValue], [WideValue], [MatchCompleted], [CaptureVideo], [TeamId1], [TeamId2], [TossTeamId], [UmpireId1], [UmpireId2], [FolderPath], [IsECricketImport], [IsDownloadedFromServer], [IsHidden], [VideoWidth], [VideoHeight], [VideoFileExtension], [UploadedByLoginName], [UploadedDateTime], [IsFixture], [IsServer], [ServerDescription], [CompetitionId], [UmpireId3], [UmpireId4], [MatchRefereeId], [ScorerId1], [ScorerId2], [AnalystId], [IsTossUncontested], [NoPlayState], [WaspPar], [MatchTitle], [MatchResultTypeId], [MatchResultAmount], [MatchResultText], [WinningTeamId], [ManOfMatchId], [ManOfSeriesText], [MatchPointsText], [SeriesStatusText], [DlsG50], [AdjustedTargetMethodId], [OverrideParScore], [OverrideTarget], [OverrideFollowOnTarget], [IsDayNight], [MatchBattingPointsTeam1], [MatchBowlingPointsTeam1], [MatchTotalPointsTeam1], [MatchBattingPointsTeam2], [MatchBowlingPointsTeam2], [MatchTotalPointsTeam2], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [LockedDeviceNumber], [LockedUserId], [PrimaryFixtureId], [LockedUserName], [SourceSystemPossibleMatchPlayers], [SourceSystemPossibleResults], [SourceSystemPlayerRegistrationRequired], [SourceSystemSelectedResult], [SourceSystemPointsRules], [ScoringVersionNumber], [MatchPenaltyPointsTeam1], [MatchPenaltyPointsTeam2], [NoBallValueLastOver], [WideValueLastOver], [SourceSystemPossibleMatchOfficials], [IsDlsBallByBall], [OverrideScorecardUrl], [TwitterHashTag]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'631dee0f-7d21-4101-b6f9-e39a4c1b9fcc', N'518a0ea5-7d88-4522-b5cf-f6a7100a93df', CAST(N'2018-03-19T00:00:00.000' AS DateTime), 0, 1, 1, 0, 0, N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'b3de94ab-df00-4784-932c-62b38c74f7f3', NULL, N'f9e603d9-20d8-4db3-906a-8a2b9fdac601', N'7f65522b-f1f1-4ad3-886a-d24150d5b79e', N'\\Mac\Home\Documents\Cricket Matches', 0, 0, NULL, NULL, NULL, N'wmv', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-03-13T11:12:50.703' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (1, N'Abandoned')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (2, N'No Result')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (3, N'Draw')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (4, N'Tie')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (5, N'WinWickets')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (6, N'WinRuns')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (7, N'WinRunsDls')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (8, N'WinRunsDs')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (9, N'WinRunsAndInnings')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (10, N'WinSuperOverRuns')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (11, N'WinSuperOverWickets')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (12, N'WinRunsCountback')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (13, N'WinBoundariesCountback')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (14, N'WinWicketsBowlOff')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (15, N'WinWicketsDls')
INSERT [dbo].[MatchResultType] ([MatchResultTypeId], [Description]) VALUES (16, N'WinWicketsDl')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'd5a8410f-873b-4fc8-b4d6-011b4c6d554a', 4, 0, 0, 0, 4, N'D Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'd6d25acb-cb97-4f2d-8f65-073105b04458', 3, 0, 0, 0, 9, N'N Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'1d63e052-0afa-4d30-8e37-13be0b7b0849', 7, 0, 0, 0, 7, N'G Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'64d76a29-349d-440f-899c-22e0b6ff0ddb', 11, 0, 0, 0, 11, N'K Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'8b479d8d-ccd3-43e1-a299-27608f1f84e0', 9, 0, 0, 0, 9, N'I Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'e4cb33fe-b5c3-4f74-b006-2a4212c59a2d', 7, 0, 0, 0, 5, N'R Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'5deeba9b-59f3-4239-9aa0-36ab7381c380', 6, 0, 0, 0, 6, N'Q Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'00e75c38-2672-40e1-a3e9-38936ddb2749', 10, 0, 0, 0, 2, N'U Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'3f1f1cd4-91f2-4545-aba9-4ba6e6f44cbe', 1, 1, 0, 0, 1, N'A Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'ab5a2de8-b6f6-4ef2-88fa-512284e0d045', 2, 0, 1, 0, 2, N'B Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'48bb76d9-2398-4753-a32b-539831b9edd7', 9, 0, 0, 0, 3, N'T Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'1799bc93-4709-40c8-bd6f-5c9f4f88f297', 11, 0, 0, 0, 1, N'V Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'cdd42352-2940-4ae0-8fc4-644609477e3d', 8, 0, 0, 0, 4, N'S Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'65404c20-b3e3-41ae-af24-7238d82d5565', 2, 0, 0, 0, 10, N'M Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'affed5f4-1834-4406-9299-9c572b28c717', 8, 0, 0, 0, 8, N'H Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'25bac190-c50a-46ef-9d0c-9edd750d5fea', 1, 1, 1, 0, 11, N'L Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'22fa3e2d-d5e1-4f44-b852-a42425284b05', 4, 0, 0, 0, 8, N'O Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'090f8b2c-0e22-4cb4-a309-adb90fa70d18', 5, 0, 0, 0, 5, N'E Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'e68b7cc4-d189-486d-97a1-af21a29f7bd4', 3, 0, 0, 0, 3, N'C Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'0d240df9-1804-46dc-b186-b237473e0221', 6, 0, 0, 0, 6, N'F Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'ab38927c-94e3-4f74-9127-c6637e7b0002', 10, 0, 0, 0, 10, N'J Player')
INSERT [dbo].[MatchTeamPlayer] ([MatchId], [TeamId], [PlayerId], [BattingPosition], [IsCaptain], [IsWicketkeeper], [IsTwelfthMan], [ShirtNumber], [ScoreboardName]) VALUES (N'a8a4d32c-f586-470c-bd57-fbaa6a7824e0', N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'462bacf8-3dd8-4cba-a3f4-e976dee6361c', 5, 0, 0, 0, 7, N'P Player')
INSERT [dbo].[MatchType] ([MatchTypeId], [Description], [MatchDays], [MatchSessions], [MatchInnings], [MatchOvers], [NumberOfBatsman], [NoBallValue], [WideValue], [PowerPlay], [FreeHit], [HasBattingPowerPlay], [IsDisability], [NumberOfPlayers], [DisplayDescription], [OversPerDay], [OversLastHour], [OversNewBall], [IsPairs], [IsLastManStands], [DismissalPenalty], [StartingRuns], [BallsPerOver], [MaxExtraBallsPerOver], [MaxExtraAdditionalRuns], [MaxExtraIsUnlimitedLast], [IsDoubleBoundariesLastBall], [NoBallValueLastOver], [WideValueLastOver], [NoBallIsExtraBall], [NoBallIsExtraBallLastOver], [WideIsExtraBall], [WideIsExtraBallLastOver], [SuperOvers], [SuperOversBatsman], [MatchOversIsPerMatch], [BowlerOvers], [BowlerOversIsPerMatch], [MinimumOvers], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [AdminClubId], [AdjustedTargetMethodId], [DlsG50], [IsDlsBallByBall]) VALUES (N'2ea9d00f-6509-4448-9105-07b316d5fe18', N'Test Match', 5, 3, 4, -1, 11, 1, 1, 0, 0, NULL, 0, 11, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 6, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, CAST(N'2018-03-05T22:44:50.663' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchType] ([MatchTypeId], [Description], [MatchDays], [MatchSessions], [MatchInnings], [MatchOvers], [NumberOfBatsman], [NoBallValue], [WideValue], [PowerPlay], [FreeHit], [HasBattingPowerPlay], [IsDisability], [NumberOfPlayers], [DisplayDescription], [OversPerDay], [OversLastHour], [OversNewBall], [IsPairs], [IsLastManStands], [DismissalPenalty], [StartingRuns], [BallsPerOver], [MaxExtraBallsPerOver], [MaxExtraAdditionalRuns], [MaxExtraIsUnlimitedLast], [IsDoubleBoundariesLastBall], [NoBallValueLastOver], [WideValueLastOver], [NoBallIsExtraBall], [NoBallIsExtraBallLastOver], [WideIsExtraBall], [WideIsExtraBallLastOver], [SuperOvers], [SuperOversBatsman], [MatchOversIsPerMatch], [BowlerOvers], [BowlerOversIsPerMatch], [MinimumOvers], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [AdminClubId], [AdjustedTargetMethodId], [DlsG50], [IsDlsBallByBall]) VALUES (N'fecb6dec-58b5-490d-97b0-852ad53adbff', N'Twenty20', 1, 1, 2, 20, 11, 1, 1, 1, 1, NULL, 0, 11, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 6, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, CAST(N'2018-03-05T22:44:50.663' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[MatchType] ([MatchTypeId], [Description], [MatchDays], [MatchSessions], [MatchInnings], [MatchOvers], [NumberOfBatsman], [NoBallValue], [WideValue], [PowerPlay], [FreeHit], [HasBattingPowerPlay], [IsDisability], [NumberOfPlayers], [DisplayDescription], [OversPerDay], [OversLastHour], [OversNewBall], [IsPairs], [IsLastManStands], [DismissalPenalty], [StartingRuns], [BallsPerOver], [MaxExtraBallsPerOver], [MaxExtraAdditionalRuns], [MaxExtraIsUnlimitedLast], [IsDoubleBoundariesLastBall], [NoBallValueLastOver], [WideValueLastOver], [NoBallIsExtraBall], [NoBallIsExtraBallLastOver], [WideIsExtraBall], [WideIsExtraBallLastOver], [SuperOvers], [SuperOversBatsman], [MatchOversIsPerMatch], [BowlerOvers], [BowlerOversIsPerMatch], [MinimumOvers], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [AdminClubId], [AdjustedTargetMethodId], [DlsG50], [IsDlsBallByBall]) VALUES (N'631dee0f-7d21-4101-b6f9-e39a4c1b9fcc', N'One Day International', 1, 1, 2, 50, 11, 1, 1, 1, 1, NULL, 0, 11, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 6, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, CAST(N'2018-03-05T22:44:50.663' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Organisation] ([OrganisationId], [ActualEntityId], [AffiliatedOrganisationId], [IsClub], [OrganisationTypeId], [Name], [Country], [Region], [WebsiteUrl], [TwitterName], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus]) VALUES (N'c48934e9-3831-43cf-b2b0-680330d7fbb4', NULL, NULL, 0, 1, N'Witney Mills Cricket Club', N'England', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-05-03T11:17:54.830' AS DateTime), 3056, 1)
INSERT [dbo].[OrganisationType] ([OrganisationTypeId], [Name]) VALUES (1, N'Club')
INSERT [dbo].[OrganisationType] ([OrganisationTypeId], [Name]) VALUES (2, N'School')
INSERT [dbo].[OrganisationType] ([OrganisationTypeId], [Name]) VALUES (3, N'International Governing Body')
INSERT [dbo].[OrganisationType] ([OrganisationTypeId], [Name]) VALUES (4, N'National Body')
INSERT [dbo].[OrganisationType] ([OrganisationTypeId], [Name]) VALUES (5, N'Major Association')
INSERT [dbo].[OrganisationType] ([OrganisationTypeId], [Name]) VALUES (6, N'District Association')
INSERT [dbo].[OrganisationType] ([OrganisationTypeId], [Name]) VALUES (7, N'Cricket Board')
INSERT [dbo].[OrganisationType] ([OrganisationTypeId], [Name]) VALUES (8, N'League')
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (1, N'Law 28.2 - Illegal fielding of the ball', N'Penalty: {ball} - Illegal fielding of the ball', 1, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (2, N'Law 28.3 - Ball striking fielding side helmet', N'Penalty: {ball} - Ball striking fielding side helmet', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (3, N'Law 41.3 - Unfairly changing condition of the ball', N'Penalty: {ball} - Unfairly changing the condition of the ball', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (4, N'Law 41.4 - Deliberate attempt to distract striker', N'Penalty: {ball} - Deliberate attempt to distract striker', 1, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (5, N'Law 41.5 - Deliberate deception by fielding side', N'Penalty: {ball} - Deliberate distraction, deception or obstruction by the fielding side', 1, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (6, N'Law 41.9 - Time wasting by fielding side', N'Penalty: {ball} - Deliberate time wasting by fielding side', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (7, N'Law 41.10 - Batsman wasting time', N'Penalty awarded to Fielding side: {innings}; {ball} - Deliberate time wasting by batsmen', 0, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (8, N'Law 41.12 - Fielder damaging the pitch', N'Penalty: {ball} - Fielder damaging the pitch', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (9, N'Law 41.14 - Batsman damaging the pitch', N'Penalty awarded to Fielding side: {ball}; {innings} - Batsman damaging the pitch', 0, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (10, N'Law 41.17 - Batsman stealing a run', N'Penalty awarded to Fielding side: {ball}; {innings} - Batsman unfairly stealing a run', 0, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (11, N'Law 24.4 - Player returning without permission', N'Penalty: {ball} - Player entering the field without permission of the Umpire and coming into contact with the ball', 1, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (12, N'Law 18.5 - Deliberate short runs', N'Penalty awarded to Fielding side: {ball}; {innings} - Batsmen deliberately running short', 0, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (13, N'Slow over rate', N'Penalty: {runs} runs awarded for not bowling required number of overs in stipulated time', 0, 1, 1, 0)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (14, N'Other penalty - awarded to batting side', N'Miscellaneous Penalties: {runs} Runs', 0, 1, 1, 0)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (15, N'Other penalty - awarded to bowling side', N'Miscellaneous Penalties awarded to Fielding side: {runs} Runs', 0, 0, 1, 0)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (16, N'Law 26.4 - Fielder practiced on the field', N'Penalty: {ball} - Fielder practiced on the field', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (17, N'Law 26.4 - Batsman practiced on the field', N'Penalty awarded to Fielding side: {ball}; {innings} - Batsman practiced on the field', 0, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (18, N'Law 41.15 - Striker in the protected area', N'Penalty awarded to Fielding side: {ball}; {innings} - Striker in the protected area', 1, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (19, N'Law 42.2 - Level 1 offence by the fielding side', N'Penalty: {ball} - Level 1 offence commited', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (20, N'Law 42.2 - Level 1 offence by the batting side', N'Penalty awarded to Fielding side: {ball}; {innings} - Level 1 offence committed', 0, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (21, N'Law 42.2 - Level 2 offence by the fielding side', N'Penalty: {ball} - Level 2 offence commited', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (22, N'Law 42.2 - Level 2 offence by the batting side', N'Penalty awarded to Fielding side: {ball}; {innings} - Level 2 offence committed', 0, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (23, N'Law 42.2 - Level 3 offence by the fielding side', N'Penalty: {ball} - Level 3 offence commited', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (24, N'Law 42.2 - Level 3 offence by the batting side', N'Penalty awarded to Fielding side: {ball}; {innings} - Level 3 offence committed', 0, 0, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (25, N'Law 42.2 - Level 4 offence by the fielding side', N'Penalty: {ball} - Level 4 offence commited', 0, 1, 0, 5)
INSERT [dbo].[PenaltyType] ([PenaltyTypeId], [Description], [PenaltyTypeFormatted], [IllegalBall], [AwardToBattingTeam], [InningsPenalty], [RunsAwarded]) VALUES (26, N'Law 42.2 - Level 4 offence by the batting side', N'Penalty awarded to Fielding side: {ball}; {innings} - Level 4 offence committed', 0, 0, 0, 5)
INSERT [dbo].[PitchType] ([PitchTypeId], [Description]) VALUES (N'3cd3f1e6-2303-4fdb-aa12-3631df2edf2d', N'Patchy')
INSERT [dbo].[PitchType] ([PitchTypeId], [Description]) VALUES (N'4cbfcb65-5d94-4679-acb9-39156c19e8a5', N'Green')
INSERT [dbo].[PitchType] ([PitchTypeId], [Description]) VALUES (N'a4ca2591-7555-4a36-a910-74d6f62b2c43', N'Wet')
INSERT [dbo].[PitchType] ([PitchTypeId], [Description]) VALUES (N'd36f3b87-5ace-4947-b1b0-adfbb3fb2757', N'Dry')
INSERT [dbo].[PitchType] ([PitchTypeId], [Description]) VALUES (N'95926c32-0c9c-4247-b96d-dbd92f5ffc7d', N'Hard')
INSERT [dbo].[PitchType] ([PitchTypeId], [Description]) VALUES (N'0b694f90-8f4a-4ad5-acb9-e402a2b249cc', N'Damp')
INSERT [dbo].[PitchType] ([PitchTypeId], [Description]) VALUES (N'be2b5e21-2ea3-4cef-a656-f98d4a3ec6fd', N'Cracked')
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'd5a8410f-873b-4fc8-b4d6-011b4c6d554a', N'D Player', 1, NULL, NULL, NULL, NULL, NULL, N'D Player', N'D', NULL, N'Player', NULL, NULL, NULL, 1, 4, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:50:38.123' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'd6d25acb-cb97-4f2d-8f65-073105b04458', N'N Player', 1, NULL, NULL, NULL, NULL, NULL, N'N Player', N'N', NULL, N'Player', NULL, NULL, NULL, 0, 9, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:55:45.807' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'1d63e052-0afa-4d30-8e37-13be0b7b0849', N'G Player', 0, NULL, NULL, NULL, NULL, NULL, N'G Player', N'G', NULL, N'Player', NULL, NULL, NULL, 1, 7, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:53:03.357' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'64d76a29-349d-440f-899c-22e0b6ff0ddb', N'K Player', 0, NULL, NULL, NULL, NULL, NULL, N'K Player', N'K', NULL, N'Player', NULL, NULL, NULL, 1, 11, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:53:26.757' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'8b479d8d-ccd3-43e1-a299-27608f1f84e0', N'I Player', 0, NULL, NULL, NULL, NULL, NULL, N'I Player', N'I', NULL, N'Player', NULL, NULL, NULL, 1, 9, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:53:10.840' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'e4cb33fe-b5c3-4f74-b006-2a4212c59a2d', N'R Player', 0, NULL, NULL, NULL, NULL, NULL, N'R Player', N'R', NULL, N'Player', NULL, NULL, NULL, 1, 5, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T11:01:15.443' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'5deeba9b-59f3-4239-9aa0-36ab7381c380', N'Q Player', 0, NULL, NULL, NULL, NULL, NULL, N'Q Player', N'Q', NULL, N'Player', NULL, NULL, NULL, 1, 6, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:56:51.943' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'00e75c38-2672-40e1-a3e9-38936ddb2749', N'U Player', 0, NULL, NULL, NULL, NULL, NULL, N'U Player', N'U', NULL, N'Player', NULL, NULL, NULL, 0, 2, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T11:01:26.023' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'3f1f1cd4-91f2-4545-aba9-4ba6e6f44cbe', N'A Player', 0, NULL, NULL, NULL, NULL, NULL, N'A Player', N'A', NULL, N'Player', NULL, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:42:58.657' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'ab5a2de8-b6f6-4ef2-88fa-512284e0d045', N'B Player', 1, 11, NULL, NULL, NULL, NULL, N'B Player', N'B', NULL, N'Player', NULL, NULL, NULL, 0, 2, NULL, NULL, 1, NULL, NULL, CAST(N'2018-03-13T10:50:31.363' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'48bb76d9-2398-4753-a32b-539831b9edd7', N'T Player', 0, NULL, NULL, NULL, NULL, NULL, N'T Player', N'T', NULL, N'Player', NULL, NULL, NULL, 1, 3, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T11:01:22.483' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'1799bc93-4709-40c8-bd6f-5c9f4f88f297', N'V Player', 1, NULL, NULL, NULL, NULL, NULL, N'V Player', N'V', NULL, N'Player', NULL, NULL, NULL, 1, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T11:01:43.077' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'cdd42352-2940-4ae0-8fc4-644609477e3d', N'S Player', 0, NULL, NULL, NULL, NULL, NULL, N'S Player', N'S', NULL, N'Player', NULL, NULL, NULL, 0, 4, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T11:01:18.640' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'65404c20-b3e3-41ae-af24-7238d82d5565', N'M Player', 0, NULL, NULL, NULL, NULL, NULL, N'M Player', N'M', NULL, N'Player', NULL, NULL, NULL, 1, 10, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:55:11.217' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'affed5f4-1834-4406-9299-9c572b28c717', N'H Player', 1, NULL, NULL, NULL, NULL, NULL, N'H Player', N'H', NULL, N'Player', NULL, NULL, NULL, 0, 8, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:53:07.110' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'25bac190-c50a-46ef-9d0c-9edd750d5fea', N'L Player', 0, 11, NULL, NULL, NULL, NULL, N'L Player', N'L', NULL, N'Player', NULL, NULL, NULL, 1, 11, NULL, NULL, 1, NULL, NULL, CAST(N'2018-03-13T10:55:15.010' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'22fa3e2d-d5e1-4f44-b852-a42425284b05', N'O Player', 0, NULL, NULL, NULL, NULL, NULL, N'O Player', N'O', NULL, N'Player', NULL, NULL, NULL, 1, 8, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:55:59.000' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'090f8b2c-0e22-4cb4-a309-adb90fa70d18', N'E Player', 0, NULL, NULL, NULL, NULL, NULL, N'E Player', N'E', NULL, N'Player', NULL, NULL, NULL, 1, 5, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:52:55.827' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'e68b7cc4-d189-486d-97a1-af21a29f7bd4', N'C Player', 0, NULL, NULL, NULL, NULL, NULL, N'C Player', N'C', NULL, N'Player', NULL, NULL, NULL, 1, 3, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:50:34.743' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'0d240df9-1804-46dc-b186-b237473e0221', N'F Player', 0, NULL, NULL, NULL, NULL, NULL, N'F Player', N'F', NULL, N'Player', NULL, NULL, NULL, 1, 6, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:52:59.650' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'ab38927c-94e3-4f74-9127-c6637e7b0002', N'J Player', 0, NULL, NULL, NULL, NULL, NULL, N'J Player', N'J', NULL, N'Player', NULL, NULL, NULL, 1, 10, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:53:14.910' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Player] ([PlayerId], [Name], [LeftHandedBatsman], [BowlingTypeId], [TeamId], [IsRetired], [DateOfBirth], [ProfileImageName], [ScoreboardName], [FirstName], [MiddleNames], [LastName], [EmailAddress], [MobileNumber], [TwitterName], [IsMale], [ShirtNumber], [KnownAsName], [AdminClubId], [IsKeeper], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId], [IsPersonalDataApproved], [PersonalDataApprovedByUserId], [PersonalDataApprovedDateTime]) VALUES (N'462bacf8-3dd8-4cba-a3f4-e976dee6361c', N'P Player', 0, NULL, NULL, NULL, NULL, NULL, N'P Player', N'P', NULL, N'Player', NULL, NULL, NULL, 1, 7, NULL, NULL, 0, NULL, NULL, CAST(N'2018-03-13T10:56:13.247' AS DateTime), NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Season] ([SeasonId], [SeasonName], [SeasonIsArchived], [SeasonStartDate], [SeasonEndDate], [IsCurrentIntSeason], [IsCurrentDomesticSeason], [ActualSeasonId]) VALUES (N'fa8ed703-ecab-4551-bd2e-777373dc7e7b', N'2017', 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), CAST(N'2017-09-30T00:00:00.000' AS DateTime), 0, 0, NULL)
INSERT [dbo].[Season] ([SeasonId], [SeasonName], [SeasonIsArchived], [SeasonStartDate], [SeasonEndDate], [IsCurrentIntSeason], [IsCurrentDomesticSeason], [ActualSeasonId]) VALUES (N'fffed703-ecab-4551-bd2e-777373dc7e7b', N'2016', 0, CAST(N'2016-04-01T00:00:00.000' AS DateTime), CAST(N'2016-09-30T00:00:00.000' AS DateTime), 0, 0, NULL)
INSERT [dbo].[Season] ([SeasonId], [SeasonName], [SeasonIsArchived], [SeasonStartDate], [SeasonEndDate], [IsCurrentIntSeason], [IsCurrentDomesticSeason], [ActualSeasonId]) VALUES (N'fffed715-ecab-4551-bd2e-777373dc7e7b', N'2015', 0, CAST(N'2015-04-01T00:00:00.000' AS DateTime), CAST(N'2015-09-30T00:00:00.000' AS DateTime), 0, 0, NULL)
INSERT [dbo].[Season] ([SeasonId], [SeasonName], [SeasonIsArchived], [SeasonStartDate], [SeasonEndDate], [IsCurrentIntSeason], [IsCurrentDomesticSeason], [ActualSeasonId]) VALUES (N'dddabb15-bc29-4f74-8472-d3b539052b70', N'2015-16', 0, CAST(N'2015-10-01T00:00:00.000' AS DateTime), CAST(N'2016-03-31T00:00:00.000' AS DateTime), 0, 0, NULL)
INSERT [dbo].[Season] ([SeasonId], [SeasonName], [SeasonIsArchived], [SeasonStartDate], [SeasonEndDate], [IsCurrentIntSeason], [IsCurrentDomesticSeason], [ActualSeasonId]) VALUES (N'ab6abbe4-bc29-4f74-8472-d3b539052b70', N'2017-18', 0, CAST(N'2017-10-01T00:00:00.000' AS DateTime), CAST(N'2018-03-31T00:00:00.000' AS DateTime), 0, 0, NULL)
INSERT [dbo].[Season] ([SeasonId], [SeasonName], [SeasonIsArchived], [SeasonStartDate], [SeasonEndDate], [IsCurrentIntSeason], [IsCurrentDomesticSeason], [ActualSeasonId]) VALUES (N'dddabbe4-bc29-4f74-8472-d3b539052b70', N'2016-17', 0, CAST(N'2016-10-01T00:00:00.000' AS DateTime), CAST(N'2017-03-31T00:00:00.000' AS DateTime), 0, 0, NULL)
INSERT [dbo].[Season] ([SeasonId], [SeasonName], [SeasonIsArchived], [SeasonStartDate], [SeasonEndDate], [IsCurrentIntSeason], [IsCurrentDomesticSeason], [ActualSeasonId]) VALUES (N'00e587d2-70f9-462d-9084-dc0854f99382', N'2018', 0, CAST(N'2018-04-01T00:00:00.000' AS DateTime), CAST(N'2018-09-30T00:00:00.000' AS DateTime), 0, 0, NULL)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (1, N'Forward Defence', 6, 1, 2)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (2, N'Back Defence', 11, 1, 3)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (3, N'Vertical Forward Attack', -1, 0, 18)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (4, N'Vertical Back Attack', -1, 0, 19)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (5, N'Horizontal Forward Attack', -1, 0, 20)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (6, N'Horizontal Back Attack', -1, 0, 21)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (7, N'No Shot', 1, 1, 1)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (8, N'Off Drive - Front', 2, 1, 4)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (9, N'Off Drive - Back', 7, 1, 5)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (10, N'On Drive - Front', 3, 1, 6)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (11, N'On Drive - Back', 8, 1, 7)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (12, N'Cut - Front', 4, 1, 8)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (13, N'Cut - Back', 9, 1, 9)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (14, N'Pull/Hook - Front', 5, 1, 10)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (15, N'Pull/Hook - Back', 10, 1, 11)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (16, N'Sweep', 13, 1, 13)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (17, N'Reverse Sweep', 14, 1, 14)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (18, N'Leg Glance', 12, 1, 12)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (19, N'Padded Away', 15, 1, 15)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (20, N'Push Shot', -1, 0, 16)
INSERT [dbo].[Shot] ([ShotId], [Description], [Ordinal], [ShowOnScorePanel], [Ordinal2]) VALUES (21, N'Drop and Run', -1, 0, 17)
INSERT [dbo].[Team] ([TeamId], [Name], [ShortName], [Country], [ClubId], [Region], [InClubName], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ScoreboardName], [ActualEntityId], [ProfileImageName], [TwitterName]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'Team 2', N'T2', NULL, N'c48934e9-3831-43cf-b2b0-680330d7fbb4', NULL, N'Team 2', NULL, NULL, CAST(N'2018-05-03T11:19:05.713' AS DateTime), 3056, 1, N'Team 2', NULL, NULL, NULL)
INSERT [dbo].[Team] ([TeamId], [Name], [ShortName], [Country], [ClubId], [Region], [InClubName], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ScoreboardName], [ActualEntityId], [ProfileImageName], [TwitterName]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'Team 1', N'T1', NULL, N'c48934e9-3831-43cf-b2b0-680330d7fbb4', NULL, N'Team 1', NULL, NULL, CAST(N'2018-05-03T11:19:11.623' AS DateTime), 3056, 1, N'Team 1', NULL, NULL, NULL)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'd5a8410f-873b-4fc8-b4d6-011b4c6d554a', 4)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'd6d25acb-cb97-4f2d-8f65-073105b04458', 9)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'1d63e052-0afa-4d30-8e37-13be0b7b0849', 7)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'64d76a29-349d-440f-899c-22e0b6ff0ddb', 11)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'8b479d8d-ccd3-43e1-a299-27608f1f84e0', 9)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'e4cb33fe-b5c3-4f74-b006-2a4212c59a2d', 5)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'5deeba9b-59f3-4239-9aa0-36ab7381c380', 6)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'00e75c38-2672-40e1-a3e9-38936ddb2749', 2)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'3f1f1cd4-91f2-4545-aba9-4ba6e6f44cbe', 1)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'ab5a2de8-b6f6-4ef2-88fa-512284e0d045', 2)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'48bb76d9-2398-4753-a32b-539831b9edd7', 3)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'1799bc93-4709-40c8-bd6f-5c9f4f88f297', 1)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'cdd42352-2940-4ae0-8fc4-644609477e3d', 4)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'65404c20-b3e3-41ae-af24-7238d82d5565', 10)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'affed5f4-1834-4406-9299-9c572b28c717', 8)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'25bac190-c50a-46ef-9d0c-9edd750d5fea', 11)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'22fa3e2d-d5e1-4f44-b852-a42425284b05', 8)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'090f8b2c-0e22-4cb4-a309-adb90fa70d18', 5)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'e68b7cc4-d189-486d-97a1-af21a29f7bd4', 3)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'0d240df9-1804-46dc-b186-b237473e0221', 6)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'fcac67d7-ef3f-4570-b309-ed551d9bc131', N'ab38927c-94e3-4f74-9127-c6637e7b0002', 10)
INSERT [dbo].[TeamPlayer] ([TeamId], [PlayerId], [ShirtNumber]) VALUES (N'b3de94ab-df00-4784-932c-62b38c74f7f3', N'462bacf8-3dd8-4cba-a3f4-e976dee6361c', 7)
INSERT [dbo].[Umpire] ([UmpireId], [Name], [IsUmpire], [IsReferee], [IsScorer], [IsAnalyst], [FirstName], [MiddleNames], [LastName], [KnownAsName], [ScoreboardName], [AdminClubId], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId]) VALUES (N'f9e603d9-20d8-4db3-906a-8a2b9fdac601', N'A Umpire', 1, 0, 0, 0, N'A', NULL, N'Umpire', NULL, N'Umpire', NULL, NULL, NULL, CAST(N'2018-03-13T10:44:50.337' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[Umpire] ([UmpireId], [Name], [IsUmpire], [IsReferee], [IsScorer], [IsAnalyst], [FirstName], [MiddleNames], [LastName], [KnownAsName], [ScoreboardName], [AdminClubId], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId]) VALUES (N'7f65522b-f1f1-4ad3-886a-d24150d5b79e', N'B Umpire', 1, 0, 0, 0, N'B', NULL, N'Umpire', NULL, N'Umpire', NULL, NULL, NULL, CAST(N'2018-03-13T10:45:00.227' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'021c6f73-6b3e-4d61-89b0-199e8f5af484', N'Scoring Opportunity', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'17e46025-1c52-40ed-b887-2b56f7451e47', N'Missed Bumper', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'1e01cd83-2257-4805-96af-57a5b3d0ef52', N'Variation', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'c107f00b-ca2c-46a7-bcda-6942b81036c4', N'False Shot', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'b543f332-e6f0-4ac4-b99d-820130cd295e', N'Free Hit', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'871bc3bb-1fa7-4424-a27f-a21b350ad979', N'Edge', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'389f3201-b487-41bb-b02f-c8a28bff1e77', N'Innovative Shot', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'fa56e9d6-6f91-4325-9e64-db4025743950', N'Overthrows', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'e8e89771-31a8-4390-8528-e99fe1686e50', N'Swing', 1)
INSERT [dbo].[UserEvent] ([UserEventId], [Description], [ShowOnScorePanel]) VALUES (N'd850992b-380c-45c3-ae91-eebef749dc91', N'Milestone', 1)
INSERT [dbo].[Venue] ([VenueId], [Name], [City], [Country], [End1], [End2], [AdminClubId], [SourceSystemType], [SourceSystemId], [LastModifiedDateTime], [LastModifiedUserId], [EntityStatus], [ActualEntityId]) VALUES (N'518a0ea5-7d88-4522-b5cf-f6a7100a93df', N'NV Play Outground', N'Christchurch', N'New Zealand', N'North', N'South', N'c48934e9-3831-43cf-b2b0-680330d7fbb4', NULL, NULL, CAST(N'2018-03-13T10:39:35.100' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'89b2bdf3-6dfc-402e-8d76-09ca4f7c47bb', N'Misty')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'2a751de3-3be8-4fd2-9cdd-3c9fd20759e3', N'Drizzle')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'87b3fb98-17ee-4b18-9148-4abd138fa56a', N'Wet')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'16b25428-a4b9-4d26-9bcb-53df45c47147', N'Windy')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'ab7fbefe-d8e1-4e62-b06c-6ec49f2cbb56', N'Cloudy')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'3842c57a-7f1e-476c-adcd-74a601f45cc1', N'Humid')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'1a9bcaf4-cf21-4732-853c-793857693e8a', N'Showers')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'14518896-a53d-4f90-9dc6-991dc470b21f', N'Sunny')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'84fc2a97-bddd-421a-95f8-ca3970867d02', N'Hot')
INSERT [dbo].[WeatherType] ([WeatherTypeId], [Description]) VALUES (N'25e4273f-fa76-40f5-81d5-f4cab7e50441', N'Rain')
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (1, N'Caught', 1, N'c {0} b {1}', 1, 40, 2)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (2, N'Bowled', 0, N'b {0}', 1, NULL, 3)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (3, N'Run Out', 1, N'run out ({0})', 0, 41, 5)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (4, N'LBW', 0, N'lbw b {0}', 1, NULL, 4)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (5, N'Stumped', 1, N'st {0} b {1}', 1, 42, 6)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (6, N'Hit Wicket', 0, N'hit wicket b {0}', 1, NULL, 7)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (7, N'Obstruction', 0, N'obstructing the field', 0, NULL, 9)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (8, N'Timed Out', 0, N'timed out', 0, NULL, 11)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (9, N'Retired Hurt', 0, N'retired hurt', 0, NULL, NULL)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (10, N'Hit Twice', 0, N'hit the ball twice', 0, NULL, 10)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (11, N'Retired - Out', 0, N'retired out', 0, NULL, NULL)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (12, N'Handled Ball', 0, N'handled the ball', 0, NULL, 8)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (13, N'Not Out', 0, N'not out', 0, NULL, 1)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (14, N'Retired - Not Out', 0, N'retired not out', 0, NULL, NULL)
INSERT [dbo].[WicketType] ([WicketTypeId], [Description], [HasFielders], [ScorecardText], [IsBowlerCredited], [FieldingEventId], [Ordinal]) VALUES (15, N'Absent', 0, N'absent', 0, NULL, 12)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BowlingType]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BowlingType] ON [dbo].[BowlingType]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BreakType]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BreakType] ON [dbo].[BreakType]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Configuration__000000000000062A]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Configuration__000000000000062A] ON [dbo].[Configuration]
(
	[ConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CricketEvent]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CricketEvent] ON [dbo].[CricketEvent]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_InningsEndType]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_InningsEndType] ON [dbo].[InningsEndType]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Length]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Length] ON [dbo].[Length]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Line]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Line] ON [dbo].[Line]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Log__00000000000005EF]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Log__00000000000005EF] ON [dbo].[Log]
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PenaltyRunType]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PenaltyRunType] ON [dbo].[PenaltyType]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Shot]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Shot] ON [dbo].[Shot]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Site__00000000000005F7]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Site__00000000000005F7] ON [dbo].[Site]
(
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Tracking__0000000000000468]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Tracking__0000000000000468] ON [dbo].[Tracking]
(
	[TrackingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__UserEvent__0000000000000498]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__UserEvent__0000000000000498] ON [dbo].[UserEvent]
(
	[UserEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [nci_wi_Wicket_076828A17EE7F8646F61D3143B37370F]    Script Date: 16/08/2018 14:47:45 ******/
CREATE NONCLUSTERED INDEX [nci_wi_Wicket_076828A17EE7F8646F61D3143B37370F] ON [dbo].[Wicket]
(
	[OverId] ASC
)
INCLUDE ( 	[ReturnedBallNo],
	[ReturnedOverId],
	[WicketTypeId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WicketType]    Script Date: 16/08/2018 14:47:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_WicketType] ON [dbo].[WicketType]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ball] ADD  DEFAULT ((0)) FOR [Runs]
GO
ALTER TABLE [dbo].[Ball] ADD  DEFAULT ((0)) FOR [ExtraRuns]
GO
ALTER TABLE [dbo].[Ball] ADD  DEFAULT ((0)) FOR [IsKeyMoment]
GO
ALTER TABLE [dbo].[Ball] ADD  DEFAULT ((0)) FOR [IsVideoDirty]
GO
ALTER TABLE [dbo].[BallDerived] ADD  DEFAULT ((0)) FOR [Runs]
GO
ALTER TABLE [dbo].[BallDerived] ADD  DEFAULT ((0)) FOR [IsMilestone]
GO
ALTER TABLE [dbo].[BallDerived] ADD  DEFAULT ((0)) FOR [IsWicket]
GO
ALTER TABLE [dbo].[BallDerived] ADD  DEFAULT ((0)) FOR [IsBoundary]
GO
ALTER TABLE [dbo].[BallDerived] ADD  DEFAULT ((0)) FOR [IsKeyMoment]
GO
ALTER TABLE [dbo].[BreakType] ADD  CONSTRAINT [DF_BreakType_StopTimer]  DEFAULT ((1)) FOR [StopTimer]
GO
ALTER TABLE [dbo].[Competition] ADD  DEFAULT (newid()) FOR [CompetitionId]
GO
ALTER TABLE [dbo].[Competition] ADD  DEFAULT ('AB6ABBE4-BC29-4F74-8472-D3B539052B70') FOR [SeasonId]
GO
ALTER TABLE [dbo].[Competition] ADD  DEFAULT (getdate()) FOR [LastModifiedDateTime]
GO
ALTER TABLE [dbo].[Competition] ADD  DEFAULT ((1)) FOR [EntityStatus]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [IsContinuousCapture]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [IsShowBallArrival]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((1)) FOR [IsCaptureWeather]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [IsGenerateSportscodeXml]
GO
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_IsAutoStartBall]  DEFAULT ((1)) FOR [IsAutoStartBall]
GO
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_IsAutoEndBall]  DEFAULT ((1)) FOR [IsAutoEndBall]
GO
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_IsAutoEndOver]  DEFAULT ((0)) FOR [IsAutoEndOver]
GO
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_IsOneClickScoring]  DEFAULT ((0)) FOR [IsOneClickScoring]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [IsAutoScorecardExpandCurrentPlayers]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [IsCompactScoreSummary]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [LiveUploadType]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((1)) FOR [LiveUploadMinutes]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((1)) FOR [IsAutoScorebookCurrentPlayers]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((3)) FOR [LiveTweetType]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((1)) FOR [LiveTweetMinutes]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((1)) FOR [LiveTweetEvents]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [AreTweetsTiedToLiveUpload]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [UseTwitterPlayerNames]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((1)) FOR [IsModernSymbols]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((1)) FOR [UseColourInScorebook]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((0)) FOR [SyncExternalPossibleClubData]
GO
ALTER TABLE [dbo].[Configuration] ADD  DEFAULT ((1)) FOR [IsAutoBackup]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [FollowOn]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [NoBallValue]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [WideValue]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [MatchCompleted]
GO
ALTER TABLE [dbo].[Match] ADD  CONSTRAINT [DF_Match_IsFixture]  DEFAULT ((0)) FOR [IsFixture]
GO
ALTER TABLE [dbo].[Match] ADD  CONSTRAINT [DF_Match_IsServer]  DEFAULT ((0)) FOR [IsServer]
GO
ALTER TABLE [dbo].[Match] ADD  CONSTRAINT [DF_Match_TossDecisionType]  DEFAULT ((0)) FOR [IsTossUncontested]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((1)) FOR [AdjustedTargetMethodId]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [IsDayNight]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT (getdate()) FOR [LastModifiedDateTime]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [NoBallValueLastOver]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [WideValueLastOver]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [IsDlsBallByBall]
GO
ALTER TABLE [dbo].[MatchTeamPlayer] ADD  DEFAULT ((0)) FOR [BattingPosition]
GO
ALTER TABLE [dbo].[MatchTeamPlayer] ADD  CONSTRAINT [DF_MatchTeamPlayer_IsTwelfthMan]  DEFAULT ((0)) FOR [IsTwelfthMan]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [MatchSessions]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [MatchOvers]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [NumberOfBatsman]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [WideValue]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [PowerPlay]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [FreeHit]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [IsDisability]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((11)) FOR [NumberOfPlayers]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [IsPairs]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [IsLastManStands]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((6)) FOR [BallsPerOver]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [MaxExtraIsUnlimitedLast]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [IsDoubleBoundariesLastBall]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((1)) FOR [NoBallValueLastOver]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((1)) FOR [WideValueLastOver]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((1)) FOR [NoBallIsExtraBall]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((1)) FOR [NoBallIsExtraBallLastOver]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((1)) FOR [WideIsExtraBall]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((1)) FOR [WideIsExtraBallLastOver]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [MatchOversIsPerMatch]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [BowlerOversIsPerMatch]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT (getdate()) FOR [LastModifiedDateTime]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((1)) FOR [EntityStatus]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [IsDlsBallByBall]
GO
ALTER TABLE [dbo].[Organisation] ADD  CONSTRAINT [DF_Organisation_IsClub]  DEFAULT ((1)) FOR [IsClub]
GO
ALTER TABLE [dbo].[Organisation] ADD  DEFAULT (getdate()) FOR [LastModifiedDateTime]
GO
ALTER TABLE [dbo].[Organisation] ADD  DEFAULT ((1)) FOR [EntityStatus]
GO
ALTER TABLE [dbo].[Over] ADD  DEFAULT ((0)) FOR [InningsNo]
GO
ALTER TABLE [dbo].[Over] ADD  DEFAULT ((0)) FOR [OverNo]
GO
ALTER TABLE [dbo].[Penalty] ADD  DEFAULT ((0)) FOR [PenaltyTypeId]
GO
ALTER TABLE [dbo].[Penalty] ADD  DEFAULT ((0)) FOR [Runs]
GO
ALTER TABLE [dbo].[PenaltyType] ADD  DEFAULT ((0)) FOR [PenaltyTypeId]
GO
ALTER TABLE [dbo].[PenaltyType] ADD  DEFAULT ((0)) FOR [IllegalBall]
GO
ALTER TABLE [dbo].[PenaltyType] ADD  DEFAULT ((0)) FOR [AwardToBattingTeam]
GO
ALTER TABLE [dbo].[PenaltyType] ADD  DEFAULT ((0)) FOR [InningsPenalty]
GO
ALTER TABLE [dbo].[PenaltyType] ADD  DEFAULT ((0)) FOR [RunsAwarded]
GO
ALTER TABLE [dbo].[Player] ADD  DEFAULT ((0)) FOR [LeftHandedBatsman]
GO
ALTER TABLE [dbo].[Player] ADD  DEFAULT ((0)) FOR [BowlingTypeId]
GO
ALTER TABLE [dbo].[Player] ADD  DEFAULT ((0)) FOR [IsKeeper]
GO
ALTER TABLE [dbo].[Player] ADD  DEFAULT (getdate()) FOR [LastModifiedDateTime]
GO
ALTER TABLE [dbo].[Player] ADD  DEFAULT ((1)) FOR [EntityStatus]
GO
ALTER TABLE [dbo].[Player] ADD  DEFAULT ((0)) FOR [IsPersonalDataApproved]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystemFormatRules_IsOneInningsRule]  DEFAULT ((0)) FOR [IsOneInningsRules]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_NoResultPoints]  DEFAULT ((0)) FOR [NoResultPoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_AbandonedPoints]  DEFAULT ((0)) FOR [AbandonedPoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_TiePoints]  DEFAULT ((0)) FOR [TiePoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_DrawPoints]  DEFAULT ((0)) FOR [DrawPoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_NetRunRateBonusPoints]  DEFAULT ((0)) FOR [NetRunRateBonusPoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_AbandonedToOneInningsMatchPoints]  DEFAULT ((0)) FOR [AbandonedToOneInningsMatchPoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_OneInningsMatchWinPoints]  DEFAULT ((0)) FOR [OneInningsMatchWinPoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_OneInningsMatchTiePoints]  DEFAULT ((0)) FOR [OneInningsMatchTiePoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_OneInningsMatchIsOneDay]  DEFAULT ((0)) FOR [OneInningsMatchIsOneDay]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsWinPoints]  DEFAULT ((0)) FOR [FirstInningsWinPoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsTiePoints]  DEFAULT ((0)) FOR [FirstInningsTiePoints]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusOverLevel]  DEFAULT ((0)) FOR [FirstInningsBonusOverLevel]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusBattingTotal1]  DEFAULT ((0)) FOR [FirstInningsBonusBattingTotal1]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusBattingTotal2]  DEFAULT ((0)) FOR [FirstInningsBonusBattingTotal2]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusBattingTotal3]  DEFAULT ((0)) FOR [FirstInningsBonusBattingTotal3]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusBattingTotal4]  DEFAULT ((0)) FOR [FirstInningsBonusBattingTotal4]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusBowlingWickets1]  DEFAULT ((0)) FOR [FirstInningsBonusBowlingWickets1]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusBowlingWickets2]  DEFAULT ((0)) FOR [FirstInningsBonusBowlingWickets2]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusBowlingWickets3]  DEFAULT ((0)) FOR [FirstInningsBonusBowlingWickets3]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_FirstInningsBonusBowlingWickets4]  DEFAULT ((0)) FOR [FirstInningsBonusBowlingWickets4]
GO
ALTER TABLE [dbo].[PointsTableSystem] ADD  CONSTRAINT [DF_PointsTableSystem_UseNetRunsPerWicket]  DEFAULT ((0)) FOR [UseNetRunsPerWicket]
GO
ALTER TABLE [dbo].[PowerPlay] ADD  DEFAULT ((0)) FOR [InningsNo]
GO
ALTER TABLE [dbo].[ScorecardNote] ADD  CONSTRAINT [DF__Scorecard__IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [dbo].[Season] ADD  CONSTRAINT [DF_tblNzc_Season_IsCurrentIntSeason]  DEFAULT ((0)) FOR [IsCurrentIntSeason]
GO
ALTER TABLE [dbo].[Season] ADD  CONSTRAINT [DF_tblNzc_Season_IsCurrentDomesticSeason]  DEFAULT ((0)) FOR [IsCurrentDomesticSeason]
GO
ALTER TABLE [dbo].[ShortenedMatch] ADD  CONSTRAINT [DF__Shortened__BallN__6EC0713C]  DEFAULT ((0)) FOR [BallNo]
GO
ALTER TABLE [dbo].[ShortenedMatch] ADD  CONSTRAINT [DF__Shortened__Innin__6FB49575]  DEFAULT ((0)) FOR [Innings1MaximumOvers]
GO
ALTER TABLE [dbo].[ShortenedMatch] ADD  CONSTRAINT [DF__Shortened__Revis__70A8B9AE]  DEFAULT ((0)) FOR [RevisedTarget]
GO
ALTER TABLE [dbo].[Team] ADD  DEFAULT (getdate()) FOR [LastModifiedDateTime]
GO
ALTER TABLE [dbo].[Team] ADD  DEFAULT ((1)) FOR [EntityStatus]
GO
ALTER TABLE [dbo].[Umpire] ADD  CONSTRAINT [DF__Umpire__IsUmpire__2CBDA3B5]  DEFAULT ((1)) FOR [IsUmpire]
GO
ALTER TABLE [dbo].[Umpire] ADD  CONSTRAINT [DF__Umpire__IsRefere__2DB1C7EE]  DEFAULT ((0)) FOR [IsReferee]
GO
ALTER TABLE [dbo].[Umpire] ADD  CONSTRAINT [DF__Umpire__IsScorer__2EA5EC27]  DEFAULT ((0)) FOR [IsScorer]
GO
ALTER TABLE [dbo].[Umpire] ADD  CONSTRAINT [DF_Umpire_IsAnalyst]  DEFAULT ((0)) FOR [IsAnalyst]
GO
ALTER TABLE [dbo].[Umpire] ADD  DEFAULT (getdate()) FOR [LastModifiedDateTime]
GO
ALTER TABLE [dbo].[Umpire] ADD  DEFAULT ((1)) FOR [EntityStatus]
GO
ALTER TABLE [dbo].[Venue] ADD  DEFAULT (getdate()) FOR [LastModifiedDateTime]
GO
ALTER TABLE [dbo].[Venue] ADD  DEFAULT ((1)) FOR [EntityStatus]
GO
ALTER TABLE [dbo].[Wicket] ADD  DEFAULT ((0)) FOR [BallNo]
GO
ALTER TABLE [dbo].[Wicket] ADD  DEFAULT ((0)) FOR [WicketTypeId]
GO
ALTER TABLE [dbo].[Ball]  WITH CHECK ADD FOREIGN KEY([MatchId], [VideoId])
REFERENCES [dbo].[MatchVideo] ([MatchId], [VideoId])
GO
ALTER TABLE [dbo].[Ball]  WITH CHECK ADD FOREIGN KEY([BatsmanId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[Ball]  WITH CHECK ADD FOREIGN KEY([BowlerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[Ball]  WITH CHECK ADD FOREIGN KEY([OverId])
REFERENCES [dbo].[Over] ([OverId])
GO
ALTER TABLE [dbo].[Ball]  WITH CHECK ADD FOREIGN KEY([PitchLengthId])
REFERENCES [dbo].[Length] ([LengthId])
GO
ALTER TABLE [dbo].[Ball]  WITH CHECK ADD FOREIGN KEY([PitchLineId])
REFERENCES [dbo].[Line] ([LineId])
GO
ALTER TABLE [dbo].[Ball]  WITH CHECK ADD FOREIGN KEY([ShotId])
REFERENCES [dbo].[Shot] ([ShotId])
GO
ALTER TABLE [dbo].[BallEvent]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BallEvent]  WITH CHECK ADD FOREIGN KEY([CricketEventId])
REFERENCES [dbo].[CricketEvent] ([CricketEventId])
GO
ALTER TABLE [dbo].[BallUserEvent]  WITH CHECK ADD FOREIGN KEY([UserEventId])
REFERENCES [dbo].[UserEvent] ([UserEventId])
GO
ALTER TABLE [dbo].[BallUserEvent]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[Break]  WITH CHECK ADD  CONSTRAINT [FK__Break__12FDD1B2] FOREIGN KEY([InningsNo], [MatchId])
REFERENCES [dbo].[Innings] ([InningsNo], [MatchId])
GO
ALTER TABLE [dbo].[Break] CHECK CONSTRAINT [FK__Break__12FDD1B2]
GO
ALTER TABLE [dbo].[Break]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[Break]  WITH CHECK ADD FOREIGN KEY([BreakTypeId])
REFERENCES [dbo].[BreakType] ([BreakTypeId])
GO
ALTER TABLE [dbo].[CategoryLog]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[CategoryLog]  WITH CHECK ADD FOREIGN KEY([LogID])
REFERENCES [dbo].[Log] ([LogID])
GO
ALTER TABLE [dbo].[Competition]  WITH NOCHECK ADD  CONSTRAINT [FK_Club_Competition] FOREIGN KEY([AdminClubId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Competition] CHECK CONSTRAINT [FK_Club_Competition]
GO
ALTER TABLE [dbo].[Competition]  WITH NOCHECK ADD  CONSTRAINT [FK_Competition_CompetitionType] FOREIGN KEY([CompetitionTypeId])
REFERENCES [dbo].[CompetitionType] ([CompetitionTypeId])
GO
ALTER TABLE [dbo].[Competition] CHECK CONSTRAINT [FK_Competition_CompetitionType]
GO
ALTER TABLE [dbo].[Competition]  WITH NOCHECK ADD  CONSTRAINT [FK_Competition_ParentCompetition] FOREIGN KEY([ParentCompetitionId])
REFERENCES [dbo].[Competition] ([CompetitionSeasonId])
GO
ALTER TABLE [dbo].[Competition] CHECK CONSTRAINT [FK_Competition_ParentCompetition]
GO
ALTER TABLE [dbo].[Competition]  WITH NOCHECK ADD  CONSTRAINT [FK_Competition_Season] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([SeasonId])
GO
ALTER TABLE [dbo].[Competition] CHECK CONSTRAINT [FK_Competition_Season]
GO
ALTER TABLE [dbo].[CompetitionMatch]  WITH CHECK ADD  CONSTRAINT [FK_CompetitionMatch_Competition] FOREIGN KEY([CompetitionId])
REFERENCES [dbo].[Competition] ([CompetitionSeasonId])
GO
ALTER TABLE [dbo].[CompetitionMatch] CHECK CONSTRAINT [FK_CompetitionMatch_Competition]
GO
ALTER TABLE [dbo].[CompetitionMatch]  WITH CHECK ADD  CONSTRAINT [FK_CompetitionMatch_Match] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[CompetitionMatch] CHECK CONSTRAINT [FK_CompetitionMatch_Match]
GO
ALTER TABLE [dbo].[CompetitionMatchType]  WITH CHECK ADD  CONSTRAINT [FK_CompetitionMatchType_Competition] FOREIGN KEY([CompetitionId])
REFERENCES [dbo].[Competition] ([CompetitionSeasonId])
GO
ALTER TABLE [dbo].[CompetitionMatchType] CHECK CONSTRAINT [FK_CompetitionMatchType_Competition]
GO
ALTER TABLE [dbo].[CompetitionMatchType]  WITH CHECK ADD  CONSTRAINT [FK_CompetitionMatchType_MatchType] FOREIGN KEY([MatchTypeId])
REFERENCES [dbo].[MatchType] ([MatchTypeId])
GO
ALTER TABLE [dbo].[CompetitionMatchType] CHECK CONSTRAINT [FK_CompetitionMatchType_MatchType]
GO
ALTER TABLE [dbo].[CompetitionTeam]  WITH CHECK ADD  CONSTRAINT [FK_CompetitionTeam_Competition] FOREIGN KEY([CompetitionId])
REFERENCES [dbo].[Competition] ([CompetitionSeasonId])
GO
ALTER TABLE [dbo].[CompetitionTeam] CHECK CONSTRAINT [FK_CompetitionTeam_Competition]
GO
ALTER TABLE [dbo].[CompetitionTeam]  WITH CHECK ADD  CONSTRAINT [FK_CompetitionTeam_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[CompetitionTeam] CHECK CONSTRAINT [FK_CompetitionTeam_Team]
GO
ALTER TABLE [dbo].[DecisionReview]  WITH CHECK ADD  CONSTRAINT [FK_DecisionReview_Ball] FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[DecisionReview] CHECK CONSTRAINT [FK_DecisionReview_Ball]
GO
ALTER TABLE [dbo].[DecisionReview]  WITH CHECK ADD  CONSTRAINT [FK_DecisionReview_Match] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[DecisionReview] CHECK CONSTRAINT [FK_DecisionReview_Match]
GO
ALTER TABLE [dbo].[Fielding]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[Fielding]  WITH CHECK ADD FOREIGN KEY([CricketEventId])
REFERENCES [dbo].[CricketEvent] ([CricketEventId])
GO
ALTER TABLE [dbo].[Fielding]  WITH CHECK ADD FOREIGN KEY([FieldingPositionId])
REFERENCES [dbo].[FieldingPosition] ([FieldingPositionId])
GO
ALTER TABLE [dbo].[Fielding]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[FieldingLocation]  WITH CHECK ADD FOREIGN KEY([FieldingPositionId])
REFERENCES [dbo].[FieldingPosition] ([FieldingPositionId])
GO
ALTER TABLE [dbo].[FieldingLocation]  WITH CHECK ADD FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[FieldingLocation]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[FieldingLocation]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[HawkEye]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[Innings]  WITH CHECK ADD FOREIGN KEY([BattingTeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[Innings]  WITH CHECK ADD FOREIGN KEY([InningsEndTypeId])
REFERENCES [dbo].[InningsEndType] ([InningsEndTypeId])
GO
ALTER TABLE [dbo].[Innings]  WITH CHECK ADD FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[InningsBattingOrder]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[InningsBattingOrder]  WITH CHECK ADD FOREIGN KEY([InningsNo], [MatchId])
REFERENCES [dbo].[Innings] ([InningsNo], [MatchId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([MatchTypeId])
REFERENCES [dbo].[MatchType] ([MatchTypeId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([TeamId1])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([TeamId2])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([TossTeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([UmpireId1])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([UmpireId2])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([VenueId])
REFERENCES [dbo].[Venue] ([VenueId])
GO
ALTER TABLE [dbo].[Match]  WITH NOCHECK ADD  CONSTRAINT [FK_Match_Competition] FOREIGN KEY([CompetitionId])
REFERENCES [dbo].[Competition] ([CompetitionSeasonId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Competition]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_MatchResultType] FOREIGN KEY([MatchResultTypeId])
REFERENCES [dbo].[MatchResultType] ([MatchResultTypeId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_MatchResultType]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Player] FOREIGN KEY([ManOfMatchId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Player]
GO
ALTER TABLE [dbo].[Match]  WITH NOCHECK ADD  CONSTRAINT [FK_Match_PrimaryMatch] FOREIGN KEY([PrimaryFixtureId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_PrimaryMatch]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Umpire] FOREIGN KEY([UmpireId3])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Umpire]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Umpire1] FOREIGN KEY([UmpireId4])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Umpire1]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Umpire2] FOREIGN KEY([MatchRefereeId])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Umpire2]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Umpire3] FOREIGN KEY([AnalystId])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Umpire3]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Umpire4] FOREIGN KEY([ScorerId1])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Umpire4]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Umpire5] FOREIGN KEY([ScorerId2])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Umpire5]
GO
ALTER TABLE [dbo].[MatchDay]  WITH NOCHECK ADD  CONSTRAINT [FK_MatchDay_Match] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[MatchDay] CHECK CONSTRAINT [FK_MatchDay_Match]
GO
ALTER TABLE [dbo].[MatchTeamPlayer]  WITH CHECK ADD FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[MatchTeamPlayer]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[MatchTeamPlayer]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[MatchType]  WITH NOCHECK ADD  CONSTRAINT [FK_Club_MatchType] FOREIGN KEY([AdminClubId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[MatchType] CHECK CONSTRAINT [FK_Club_MatchType]
GO
ALTER TABLE [dbo].[MatchTypeDuplicate]  WITH CHECK ADD FOREIGN KEY([ActualMatchTypeId])
REFERENCES [dbo].[MatchType] ([MatchTypeId])
GO
ALTER TABLE [dbo].[MatchTypeDuplicate]  WITH CHECK ADD FOREIGN KEY([DuplicateMatchTypeId])
REFERENCES [dbo].[MatchType] ([MatchTypeId])
GO
ALTER TABLE [dbo].[MatchVideo]  WITH CHECK ADD FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[Organisation]  WITH CHECK ADD  CONSTRAINT [FK_Organisation_Organisation] FOREIGN KEY([AffiliatedOrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Organisation] CHECK CONSTRAINT [FK_Organisation_Organisation]
GO
ALTER TABLE [dbo].[Organisation]  WITH CHECK ADD  CONSTRAINT [FK_Organisation_OrganisationType] FOREIGN KEY([OrganisationTypeId])
REFERENCES [dbo].[OrganisationType] ([OrganisationTypeId])
GO
ALTER TABLE [dbo].[Organisation] CHECK CONSTRAINT [FK_Organisation_OrganisationType]
GO
ALTER TABLE [dbo].[Over]  WITH CHECK ADD FOREIGN KEY([InningsNo], [MatchId])
REFERENCES [dbo].[Innings] ([InningsNo], [MatchId])
GO
ALTER TABLE [dbo].[Over]  WITH CHECK ADD FOREIGN KEY([UmpireId])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Partnership]  WITH NOCHECK ADD  CONSTRAINT [FK_Partnership_Innings] FOREIGN KEY([InningsNo], [MatchId])
REFERENCES [dbo].[Innings] ([InningsNo], [MatchId])
GO
ALTER TABLE [dbo].[Partnership] CHECK CONSTRAINT [FK_Partnership_Innings]
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD FOREIGN KEY([InningsNo], [MatchId])
REFERENCES [dbo].[Innings] ([InningsNo], [MatchId])
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD FOREIGN KEY([PenaltyTypeId])
REFERENCES [dbo].[PenaltyType] ([PenaltyTypeId])
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD FOREIGN KEY([BowlingTypeId])
REFERENCES [dbo].[BowlingType] ([BowlingTypeId])
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[Player]  WITH NOCHECK ADD  CONSTRAINT [FK_Club_Player] FOREIGN KEY([AdminClubId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Club_Player]
GO
ALTER TABLE [dbo].[PlayerDuplicate]  WITH CHECK ADD FOREIGN KEY([ActualPlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[PlayerDuplicate]  WITH CHECK ADD FOREIGN KEY([DuplicatePlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[PlaylistItem]  WITH CHECK ADD FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlist] ([PlaylistId])
GO
ALTER TABLE [dbo].[PowerPlay]  WITH CHECK ADD FOREIGN KEY([InningsNo], [MatchId])
REFERENCES [dbo].[Innings] ([InningsNo], [MatchId])
GO
ALTER TABLE [dbo].[Replay]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[Replay]  WITH CHECK ADD FOREIGN KEY([InningsNo], [MatchId])
REFERENCES [dbo].[Innings] ([InningsNo], [MatchId])
GO
ALTER TABLE [dbo].[ScorecardNote]  WITH NOCHECK ADD  CONSTRAINT [FK_ScorecardNote_Match] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[ScorecardNote] CHECK CONSTRAINT [FK_ScorecardNote_Match]
GO
ALTER TABLE [dbo].[Season]  WITH CHECK ADD  CONSTRAINT [FK_Season_Season] FOREIGN KEY([ActualSeasonId])
REFERENCES [dbo].[Season] ([SeasonId])
GO
ALTER TABLE [dbo].[Season] CHECK CONSTRAINT [FK_Season_Season]
GO
ALTER TABLE [dbo].[ShortenedMatch]  WITH CHECK ADD  CONSTRAINT [FK__Shortened__OverI__74794A92] FOREIGN KEY([OverId])
REFERENCES [dbo].[Over] ([OverId])
GO
ALTER TABLE [dbo].[ShortenedMatch] CHECK CONSTRAINT [FK__Shortened__OverI__74794A92]
GO
ALTER TABLE [dbo].[ShortenedMatch]  WITH CHECK ADD  CONSTRAINT [FK__ShortenedMatch__72910220] FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[ShortenedMatch] CHECK CONSTRAINT [FK__ShortenedMatch__72910220]
GO
ALTER TABLE [dbo].[ShortenedMatch]  WITH NOCHECK ADD  CONSTRAINT [FK_ShortenedMatch_Match] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[ShortenedMatch] CHECK CONSTRAINT [FK_ShortenedMatch_Match]
GO
ALTER TABLE [dbo].[SiteMatch]  WITH CHECK ADD FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[SubFielder]  WITH CHECK ADD FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[SubFielder]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[SubFielding]  WITH CHECK ADD FOREIGN KEY([CricketEventId])
REFERENCES [dbo].[CricketEvent] ([CricketEventId])
GO
ALTER TABLE [dbo].[SubFielding]  WITH CHECK ADD FOREIGN KEY([FieldingPositionId])
REFERENCES [dbo].[FieldingPosition] ([FieldingPositionId])
GO
ALTER TABLE [dbo].[SubFielding]  WITH CHECK ADD FOREIGN KEY([SubFielderId])
REFERENCES [dbo].[SubFielder] ([SubFielderId])
GO
ALTER TABLE [dbo].[SubFielding]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Organisation] FOREIGN KEY([ClubId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Organisation]
GO
ALTER TABLE [dbo].[TeamDuplicate]  WITH CHECK ADD FOREIGN KEY([ActualTeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[TeamDuplicate]  WITH CHECK ADD FOREIGN KEY([DuplicateTeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[TeamPlayer]  WITH CHECK ADD  CONSTRAINT [FK_PlayerTeam_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[TeamPlayer] CHECK CONSTRAINT [FK_PlayerTeam_Player]
GO
ALTER TABLE [dbo].[TeamPlayer]  WITH CHECK ADD  CONSTRAINT [FK_PlayerTeam_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([TeamId])
GO
ALTER TABLE [dbo].[TeamPlayer] CHECK CONSTRAINT [FK_PlayerTeam_Team]
GO
ALTER TABLE [dbo].[Tracking]  WITH CHECK ADD FOREIGN KEY([InningsNo], [MatchId])
REFERENCES [dbo].[Innings] ([InningsNo], [MatchId])
GO
ALTER TABLE [dbo].[Tracking]  WITH CHECK ADD FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([MatchId])
GO
ALTER TABLE [dbo].[Tracking]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[Umpire]  WITH NOCHECK ADD  CONSTRAINT [FK_Umpire_Competition] FOREIGN KEY([AdminClubId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Umpire] CHECK CONSTRAINT [FK_Umpire_Competition]
GO
ALTER TABLE [dbo].[UmpireDuplicate]  WITH CHECK ADD FOREIGN KEY([ActualUmpireId])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[UmpireDuplicate]  WITH CHECK ADD FOREIGN KEY([DuplicateUmpireId])
REFERENCES [dbo].[Umpire] ([UmpireId])
GO
ALTER TABLE [dbo].[Venue]  WITH NOCHECK ADD  CONSTRAINT [FK_Venue_Competition] FOREIGN KEY([AdminClubId])
REFERENCES [dbo].[Organisation] ([OrganisationId])
GO
ALTER TABLE [dbo].[Venue] CHECK CONSTRAINT [FK_Venue_Competition]
GO
ALTER TABLE [dbo].[VenueDuplicate]  WITH CHECK ADD FOREIGN KEY([ActualVenueId])
REFERENCES [dbo].[Venue] ([VenueId])
GO
ALTER TABLE [dbo].[VenueDuplicate]  WITH CHECK ADD FOREIGN KEY([DuplicateVenueId])
REFERENCES [dbo].[Venue] ([VenueId])
GO
ALTER TABLE [dbo].[Wicket]  WITH CHECK ADD FOREIGN KEY([BallNo], [OverId])
REFERENCES [dbo].[Ball] ([BallNo], [OverId])
GO
ALTER TABLE [dbo].[Wicket]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([PlayerId])
GO
ALTER TABLE [dbo].[Wicket]  WITH CHECK ADD FOREIGN KEY([WicketTypeId])
REFERENCES [dbo].[WicketType] ([WicketTypeId])
GO
ALTER TABLE [dbo].[WicketType]  WITH CHECK ADD FOREIGN KEY([FieldingEventId])
REFERENCES [dbo].[CricketEvent] ([CricketEventId])
GO
USE [master]
GO
ALTER DATABASE [CricDB] SET  READ_WRITE 
GO
