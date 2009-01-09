From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  9 Jan 2009 06:30:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090109063009.8E640768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-09 06:30:08 +0000 (Fri, 09 Jan 2009)
New Revision: 24729

Log:
Make sure U-boot is built, if we do make uImage

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-08 23:01:50 UTC (rev 24728)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-09 06:30:08 UTC (rev 24729)
@@ -464,6 +464,7 @@
 config BR2_LINUX_BIN_UIMAGE
 	bool "uImage"
 	depends on BR2_PACKAGE_LINUX
+	select BR2_TARGET_UBOOT
 	help
 	  Build uImage binary
 
