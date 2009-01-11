From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 21:50:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
Message-ID: <20090111215008.2754F76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 21:50:07 +0000 (Sun, 11 Jan 2009)
New Revision: 24773

Log:
Make xfsprogs downloadable, Why have it, when we do not support XFS file system?

Modified:
   trunk/buildroot/package/xfsprogs/Config.in
   trunk/buildroot/package/xfsprogs/xfsprogs.mk


Changeset:
Modified: trunk/buildroot/package/xfsprogs/Config.in
===================================================================
--- trunk/buildroot/package/xfsprogs/Config.in	2009-01-11 21:44:14 UTC (rev 24772)
+++ trunk/buildroot/package/xfsprogs/Config.in	2009-01-11 21:50:07 UTC (rev 24773)
@@ -1,3 +1,7 @@
+
+comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED enabled"
+	depends on BR2_PACKAGE_XFSPROGS
+
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	help
@@ -4,3 +8,4 @@
 	  The XFS file system utilities and libraries
 
 	  http://oss.sgi.com/projects/xfs/
+

Modified: trunk/buildroot/package/xfsprogs/xfsprogs.mk
===================================================================
--- trunk/buildroot/package/xfsprogs/xfsprogs.mk	2009-01-11 21:44:14 UTC (rev 24772)
+++ trunk/buildroot/package/xfsprogs/xfsprogs.mk	2009-01-11 21:50:07 UTC (rev 24773)
@@ -5,8 +5,8 @@
 #############################################################
 XFSPROGS_VERSION:=2.10.2
 XFSPROGS_SOURCE=xfsprogs_$(XFSPROGS_VERSION)-1.tar.gz
-#XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
-XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/
+XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
+#XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/
 XFSPROGS_DIR=$(BUILD_DIR)/xfsprogs-$(XFSPROGS_VERSION)
 XFSPROGS_CAT:=$(ZCAT)
 XFSPROGS_BINARY:=mkfs/mkfs.xfs
