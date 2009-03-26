From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 19:37:35 +0000 (UTC)
Subject: [Buildroot] svn commit: [25832] trunk/buildroot/package/mtd
Message-ID: <20090326193735.5D880772DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-26 19:37:34 +0000 (Thu, 26 Mar 2009)
New Revision: 25832

Log:
package/mtd: default to mtd-utils release, mark 20061007 snapshot as deprecated

Modified:
   trunk/buildroot/package/mtd/Config.in


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2009-03-26 19:37:31 UTC (rev 25831)
+++ trunk/buildroot/package/mtd/Config.in	2009-03-26 19:37:34 UTC (rev 25832)
@@ -7,7 +7,7 @@
 if BR2_PACKAGE_MTD
 choice
 	prompt "Source package selection"
-	default BR2_PACKAGE_MTD20061007
+	default BR2_PACKAGE_MTD_UTILS
 
 config BR2_PACKAGE_MTD_UTILS
 	bool "Use MTD-utils release"
@@ -17,6 +17,7 @@
 
 config BR2_PACKAGE_MTD_20061007
 	bool "Use MTD snapshot from 20061007"
+	depends on BR2_DEPRECATED || BR2_RECENT
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
