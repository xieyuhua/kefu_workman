-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: kefu2020
-- ------------------------------------------------------
-- Server version	5.7.33-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ws_admins`
--

DROP TABLE IF EXISTS `ws_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码',
  `last_login_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_admins`
--

LOCK TABLES `ws_admins` WRITE;
/*!40000 ALTER TABLE `ws_admins` DISABLE KEYS */;
INSERT INTO `ws_admins` VALUES (1,'admin','25223254e8e05e5bbbebb35d407be478','222.180.210.250',1653113853,1),(2,'小白','f6a3266ead53c628db1b126064854c85','',0,1);
/*!40000 ALTER TABLE `ws_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_chat_log`
--

DROP TABLE IF EXISTS `ws_chat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_chat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(55) NOT NULL COMMENT '网页用户随机编号(仅为记录参考记录)',
  `from_name` varchar(255) NOT NULL COMMENT '发送者名称',
  `from_avatar` varchar(255) NOT NULL COMMENT '发送者头像',
  `to_id` varchar(55) NOT NULL COMMENT '接收方',
  `to_name` varchar(255) NOT NULL COMMENT '接受者名称',
  `content` text NOT NULL COMMENT '发送的内容',
  `time_line` int(10) NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `fromid` (`from_id`(4)) USING BTREE,
  KEY `toid` (`to_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ws_config`
--

DROP TABLE IF EXISTS `ws_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_config` (
  `id` int(11) NOT NULL,
  `max_service` int(11) NOT NULL COMMENT '每个客服最大服务的客户数',
  `change_status` tinyint(1) NOT NULL COMMENT '是否启用转接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_config`
--

LOCK TABLES `ws_config` WRITE;
/*!40000 ALTER TABLE `ws_config` DISABLE KEYS */;
INSERT INTO `ws_config` VALUES (1,5,1);
/*!40000 ALTER TABLE `ws_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_groups`
--

DROP TABLE IF EXISTS `ws_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `name` varchar(255) NOT NULL COMMENT '分组名称',
  `status` tinyint(1) NOT NULL COMMENT '分组状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_groups`
--

LOCK TABLES `ws_groups` WRITE;
/*!40000 ALTER TABLE `ws_groups` DISABLE KEYS */;
INSERT INTO `ws_groups` VALUES (1,'售前组',1),(2,'售后组',1);
/*!40000 ALTER TABLE `ws_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_now_data`
--

DROP TABLE IF EXISTS `ws_now_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_now_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_talking` int(5) NOT NULL DEFAULT '0' COMMENT '正在咨询的人数',
  `in_queue` int(5) NOT NULL DEFAULT '0' COMMENT '排队等待的人数',
  `online_kf` int(5) NOT NULL COMMENT '在线客服数',
  `success_in` int(5) NOT NULL COMMENT '成功接入用户',
  `total_in` int(5) NOT NULL COMMENT '今日累积接入的用户',
  `now_date` varchar(10) NOT NULL COMMENT '当前日期',
  PRIMARY KEY (`id`),
  KEY `now_date` (`now_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_now_data`
--

LOCK TABLES `ws_now_data` WRITE;
/*!40000 ALTER TABLE `ws_now_data` DISABLE KEYS */;
INSERT INTO `ws_now_data` VALUES (1,0,1,1,0,1,'2022-05-21');
/*!40000 ALTER TABLE `ws_now_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_reply`
--

DROP TABLE IF EXISTS `ws_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL COMMENT '自动回复的内容',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否自动回复',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_reply`
--

LOCK TABLES `ws_reply` WRITE;
/*!40000 ALTER TABLE `ws_reply` DISABLE KEYS */;
INSERT INTO `ws_reply` VALUES (1,'欢迎使用laykefu',2);
/*!40000 ALTER TABLE `ws_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_service_data`
--

DROP TABLE IF EXISTS `ws_service_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_service_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_talking` int(5) NOT NULL DEFAULT '0' COMMENT '正在咨询的人数',
  `in_queue` int(5) NOT NULL DEFAULT '0' COMMENT '排队等待的人数',
  `online_kf` int(5) NOT NULL COMMENT '在线客服数',
  `success_in` int(5) NOT NULL COMMENT '成功接入用户',
  `total_in` int(5) NOT NULL COMMENT '今日累积接入的用户',
  `add_date` varchar(10) NOT NULL COMMENT '写入的日期',
  `add_hour` varchar(2) NOT NULL COMMENT '写入的小时数',
  `add_minute` varchar(2) NOT NULL COMMENT '写入的分钟数',
  PRIMARY KEY (`id`),
  KEY `add_date,add_hour` (`add_date`,`add_hour`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_service_data`
--

LOCK TABLES `ws_service_data` WRITE;
/*!40000 ALTER TABLE `ws_service_data` DISABLE KEYS */;
INSERT INTO `ws_service_data` VALUES (1,2,1,1,2,4,'2018-03-15','09','10'),(2,0,0,0,3,4,'2018-03-15','10','15'),(3,3,4,1,4,6,'2018-03-15','11','20'),(4,0,0,0,0,2,'2018-03-15','12','25'),(5,0,0,0,0,2,'2018-03-15','13','30'),(6,0,1,0,0,3,'2018-03-15','14','35'),(7,0,0,0,0,4,'2018-03-15','15','40'),(8,0,0,0,0,4,'2018-03-15','16','45'),(9,0,0,0,0,4,'2018-03-15','17','50'),(10,0,0,0,0,4,'2018-03-15','18','55'),(11,0,0,0,1,4,'2018-03-15','08','05'),(12,0,0,1,99,100,'2018-03-16','11','35'),(13,0,0,1,102,103,'2018-03-16','12','15'),(14,0,0,1,102,103,'2018-03-16','12','55'),(15,0,0,1,1,1,'2018-03-16','14','37'),(16,0,0,1,1,1,'2018-03-16','15','17'),(17,0,0,1,1,1,'2018-03-16','15','57'),(18,1,0,1,3,3,'2018-03-16','17','31'),(19,2,0,1,14,14,'2018-03-16','18','11'),(20,2,0,1,1,1,'2019-04-11','17','25'),(21,1,0,1,1,1,'2019-04-12','13','32'),(22,0,0,1,1,1,'2019-04-12','14','12'),(23,1,0,1,1,1,'2019-04-12','14','52'),(24,0,0,1,1,1,'2019-04-12','15','32'),(25,0,0,1,1,1,'2019-04-12','16','12'),(26,0,0,1,1,1,'2019-04-12','16','52'),(27,0,0,1,1,1,'2019-04-12','17','32'),(28,0,0,0,0,1,'2019-04-15','10','06'),(29,0,0,0,0,1,'2019-04-15','10','46'),(30,0,0,0,0,1,'2019-04-15','11','26'),(31,0,0,1,0,1,'2019-04-15','12','06'),(32,1,0,1,1,1,'2019-04-15','12','46'),(33,1,0,1,1,1,'2019-04-15','13','26'),(34,0,0,1,1,1,'2019-04-15','14','06'),(35,1,0,1,1,1,'2019-04-15','15','26'),(36,1,0,1,1,1,'2019-04-15','16','06'),(37,1,0,1,1,1,'2019-04-15','16','46'),(38,1,0,1,1,1,'2019-04-15','17','26'),(39,1,0,1,1,1,'2019-04-15','18','06'),(40,1,0,1,0,0,'2019-04-16','09','18'),(41,1,0,1,1,1,'2019-04-16','10','05'),(42,1,0,1,1,1,'2019-04-16','10','45'),(43,0,0,1,1,1,'2019-04-16','11','25'),(44,0,0,1,1,1,'2019-04-16','12','05'),(45,0,0,1,1,1,'2019-04-16','12','45'),(46,0,0,1,1,1,'2019-04-16','13','25'),(47,0,0,1,1,1,'2019-04-16','14','05'),(48,1,0,1,1,1,'2019-04-16','14','45'),(49,1,0,1,1,1,'2019-04-16','15','18'),(50,1,0,1,1,1,'2019-04-16','15','25'),(51,0,0,1,1,1,'2019-04-16','15','58'),(52,1,0,1,1,1,'2019-04-16','16','05'),(53,1,0,1,1,1,'2019-04-16','16','38'),(54,1,0,1,1,1,'2019-04-16','16','45'),(55,1,0,1,0,0,'2019-04-17','09','01'),(56,1,0,1,0,0,'2019-04-17','09','41'),(57,1,0,1,0,0,'2019-04-17','10','21'),(58,1,0,1,0,0,'2019-04-17','11','01'),(59,0,0,1,1,1,'2019-04-17','11','41'),(60,1,0,1,1,1,'2019-04-17','12','21'),(61,1,0,1,1,1,'2019-04-17','13','01'),(62,1,0,1,1,1,'2019-04-17','13','41'),(63,1,0,1,1,1,'2019-04-17','14','21'),(64,1,0,1,1,1,'2019-04-17','15','01'),(65,1,0,1,1,1,'2019-04-17','15','41'),(66,1,0,1,1,1,'2019-04-17','16','21'),(67,1,0,1,1,1,'2019-04-17','17','01'),(68,1,0,1,1,1,'2019-04-17','17','41'),(69,1,0,1,1,1,'2019-04-17','18','21'),(70,1,0,1,0,0,'2019-04-18','09','07'),(71,1,0,1,1,1,'2019-04-18','09','47'),(72,0,0,1,1,1,'2019-04-18','10','27'),(73,1,0,1,1,1,'2019-04-18','11','07'),(74,1,0,1,1,1,'2019-04-18','11','47'),(75,1,0,1,1,1,'2019-04-18','12','27'),(76,1,0,1,1,1,'2019-04-18','13','07'),(77,1,0,1,1,1,'2019-04-18','13','47'),(78,1,0,1,1,1,'2019-04-18','14','27'),(79,1,0,1,1,1,'2019-04-18','15','07'),(80,1,0,1,1,1,'2019-04-18','16','19'),(81,0,0,0,0,0,'2019-04-19','10','14'),(82,0,0,0,0,1,'2019-04-19','11','40'),(83,1,0,1,1,1,'2019-04-19','12','24'),(84,1,0,1,1,1,'2019-04-19','13','04'),(85,1,0,1,1,1,'2019-04-19','13','44'),(86,1,0,1,1,1,'2019-04-19','14','24'),(87,1,0,1,1,1,'2019-04-22','11','21'),(88,0,1,1,0,1,'2019-04-22','13','13'),(89,1,0,1,1,1,'2019-04-22','13','53'),(90,1,0,1,1,1,'2019-04-22','14','33'),(91,1,0,1,1,1,'2019-04-22','15','13'),(92,0,1,1,0,1,'2019-04-22','17','49'),(93,1,0,1,1,1,'2019-04-24','10','16'),(94,1,0,1,1,1,'2019-04-24','10','56'),(95,1,0,1,1,1,'2019-04-24','11','36'),(96,1,0,1,1,1,'2019-04-24','12','16'),(97,1,0,1,1,1,'2019-04-24','15','54'),(98,1,0,1,1,1,'2019-04-24','16','34');
/*!40000 ALTER TABLE `ws_service_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_service_log`
--

DROP TABLE IF EXISTS `ws_service_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_service_log` (
  `user_id` varchar(55) NOT NULL COMMENT '会员的id',
  `client_id` varchar(20) NOT NULL COMMENT '会员的客户端标识',
  `user_name` varchar(255) DEFAULT NULL COMMENT '会员名称',
  `user_avatar` varchar(155) NOT NULL COMMENT '会员头像',
  `user_ip` varchar(15) NOT NULL COMMENT '会员的ip',
  `kf_id` varchar(55) NOT NULL COMMENT '服务的客服id',
  `start_time` int(10) NOT NULL COMMENT '开始服务时间',
  `end_time` int(10) DEFAULT '0' COMMENT '结束服务时间',
  `group_id` int(11) NOT NULL COMMENT '服务的客服的分组id',
  KEY `user_id,client_id` (`user_id`,`client_id`) USING BTREE,
  KEY `ws_id,start_time,end_time` (`kf_id`,`start_time`,`end_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ws_users`
--

DROP TABLE IF EXISTS `ws_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服id',
  `user_name` varchar(255) NOT NULL COMMENT '客服名称',
  `user_pwd` varchar(32) NOT NULL COMMENT '客服登录密码',
  `user_avatar` varchar(255) NOT NULL COMMENT '客服头像',
  `status` tinyint(1) NOT NULL COMMENT '用户状态',
  `online` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否在线',
  `group_id` int(11) DEFAULT '0' COMMENT '所属分组id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_users`
--

LOCK TABLES `ws_users` WRITE;
/*!40000 ALTER TABLE `ws_users` DISABLE KEYS */;
INSERT INTO `ws_users` VALUES (1,'客服小丽','25223254e8e05e5bbbebb35d407be478','/uploads/20190419/84666a987327fe8a5d37ed4809a529cb.jpg',1,2,2),(2,'客服小美','25223254e8e05e5bbbebb35d407be478','/uploads/20190419/4eb84234138339f27018e1e3625afd15.jpg',1,2,1);
/*!40000 ALTER TABLE `ws_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_words`
--

DROP TABLE IF EXISTS `ws_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '常用语内容',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_words`
--

LOCK TABLES `ws_words` WRITE;
/*!40000 ALTER TABLE `ws_words` DISABLE KEYS */;
INSERT INTO `ws_words` VALUES (1,'欢迎来到laykefu v1.0.1','2019-10-25 12:51:09',1),(3,'有什么可以帮您的吗','2019-04-11 17:00:09',1);
/*!40000 ALTER TABLE `ws_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kefu2020'
--

--
-- Dumping routines for database 'kefu2020'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-21 15:04:16
