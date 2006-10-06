From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Oct 2006 06:00:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/mtd target/jffs2
Message-ID: <20061006130057.9002148568@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-06 06:00:57 -0700 (Fri, 06 Oct 2006)
New Revision: 16318

Log:
- jffs2 requires the mtd package for the mtd-host tools.


Modified:
   trunk/buildroot/package/mtd/Config.in
   trunk/buildroot/target/jffs2/Config.in


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2006-10-06 12:59:33 UTC (rev 16317)
+++ trunk/buildroot/package/mtd/Config.in	2006-10-06 13:00:57 UTC (rev 16318)
@@ -17,6 +17,7 @@
 config BR2_PACKAGE_MTD_ORIG
 	bool "Default source"
 	depends on BR2_PACKAGE_MTD
+	default y
 	help
 	  Use the stable release.
 

Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2006-10-06 12:59:33 UTC (rev 16317)
+++ trunk/buildroot/target/jffs2/Config.in	2006-10-06 13:00:57 UTC (rev 16318)
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_JFFS2
 	bool "jffs2 root filesystem"
 	default n
+	select BR2_PACKAGE_MTD
 	help
 	  Build a jffs2 root filesystem
 
