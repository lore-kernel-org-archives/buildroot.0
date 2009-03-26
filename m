From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 19:37:39 +0000 (UTC)
Subject: [Buildroot] svn commit: [25833] trunk/buildroot/package/mtd
Message-ID: <20090326193739.5CB1C772DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-26 19:37:38 +0000 (Thu, 26 Mar 2009)
New Revision: 25833

Log:
package/mtd: don't enable rarely used commands by default

Most people don't need them, so don't enable mkfsjffs + doc tools by default.

Modified:
   trunk/buildroot/package/mtd/Config.in


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2009-03-26 19:37:34 UTC (rev 25832)
+++ trunk/buildroot/package/mtd/Config.in	2009-03-26 19:37:38 UTC (rev 25833)
@@ -39,11 +39,9 @@
 
 config BR2_PACKAGE_MTD_DOCFDISK
 	bool "docfdisk"
-	default y
 
 config BR2_PACKAGE_MTD_DOC_LOADBIOS
 	bool "doc_loadbios"
-	default y
 
 config BR2_PACKAGE_MTD_ERASE
 	bool "erase"
@@ -97,7 +95,6 @@
 
 config BR2_PACKAGE_MTD_MKFSJFFS
 	bool "mkfs.jffs"
-	default y
 	depends on BR2_PACKAGE_MTD_20050122 || BR2_PACKAGE_MTD_20061007 || BR2_PACKAGE_MTD_UTILS
 
 config BR2_PACKAGE_MTD_MTD_DEBUG
@@ -119,11 +116,9 @@
 
 config BR2_PACKAGE_MTD_NFTL_FORMAT
 	bool "nftl_format"
-	default y
 
 config BR2_PACKAGE_MTD_NFTLDUMP
 	bool "nftldump"
-	default y
 
 config BR2_PACKAGE_MTD_SUMTOOL
 	bool "sumtool"
