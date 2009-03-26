From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 19:37:26 +0000 (UTC)
Subject: [Buildroot] svn commit: [25830] trunk/buildroot/package/mtd
Message-ID: <20090326193726.D5142772DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-26 19:37:26 +0000 (Thu, 26 Mar 2009)
New Revision: 25830

Log:
package/mtd: remove unneeded 'depends on BR2_PACKAGE_MTD'

The entire mtd handling is within an if BR2_PACKAGE_MTD conditional

Modified:
   trunk/buildroot/package/mtd/Config.in


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2009-03-26 19:21:02 UTC (rev 25829)
+++ trunk/buildroot/package/mtd/Config.in	2009-03-26 19:37:26 UTC (rev 25830)
@@ -7,19 +7,16 @@
 if BR2_PACKAGE_MTD
 choice
 	prompt "Source package selection"
-	depends on BR2_PACKAGE_MTD
 	default BR2_PACKAGE_MTD20061007
 
 config BR2_PACKAGE_MTD_UTILS
 	bool "Use MTD-utils release"
-	depends on BR2_PACKAGE_MTD
 	select BR2_PACKAGE_LZO
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
 config BR2_PACKAGE_MTD_20061007
 	bool "Use MTD snapshot from 20061007"
-	depends on BR2_PACKAGE_MTD
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
@@ -38,17 +35,14 @@
 endchoice
 
 comment "MTD tools selection"
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_DOCFDISK
 	bool "docfdisk"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_DOC_LOADBIOS
 	bool "doc_loadbios"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_ERASE
 	bool "erase"
@@ -58,47 +52,38 @@
 config BR2_PACKAGE_MTD_FLASHCP
 	bool "flashcp"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_FLASH_ERASE
 	bool "flash_erase"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_FLASH_ERASEALL
 	bool "flash_eraseall"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_FLASH_INFO
 	bool "flash_info"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_FLASH_LOCK
 	bool "flash_lock"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_FLASH_UNLOCK
 	bool "flash_unlock"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_FTL_CHECK
 	bool "ftl_check"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_FTL_FORMAT
 	bool "ftl_format"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_JFFS2DUMP
 	bool "jffs2dump"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_JFFS3DUMP
 	bool "jffs3dump"
@@ -108,7 +93,6 @@
 config BR2_PACKAGE_MTD_MKFSJFFS2
 	bool "mkfs.jffs2"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_MKFSJFFS
 	bool "mkfs.jffs"
@@ -118,12 +102,10 @@
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_NANDDUMP
 	bool "nanddump"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_NANDTEST
 	bool "nandtest"
@@ -133,22 +115,18 @@
 config BR2_PACKAGE_MTD_NANDWRITE
 	bool "nandwrite"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_NFTL_FORMAT
 	bool "nftl_format"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_NFTLDUMP
 	bool "nftldump"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_SUMTOOL
 	bool "sumtool"
 	default y
-	depends on BR2_PACKAGE_MTD
 
 config BR2_PACKAGE_MTD_UBIATTACH
 	bool "ubiattach"
