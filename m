From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 14:18:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
Message-ID: <20061122221853.8FD7A485D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 14:18:52 -0800 (Wed, 22 Nov 2006)
New Revision: 16638

Log:
- xfsprogs-2.7.11 is old by now. Provide a fallback SITE until someone
  verifies a newer version..
  Closes bug #1019


Modified:
   trunk/buildroot/package/xfsprogs/xfsprogs.mk


Changeset:
Modified: trunk/buildroot/package/xfsprogs/xfsprogs.mk
===================================================================
--- trunk/buildroot/package/xfsprogs/xfsprogs.mk	2006-11-22 21:24:58 UTC (rev 16637)
+++ trunk/buildroot/package/xfsprogs/xfsprogs.mk	2006-11-22 22:18:52 UTC (rev 16638)
@@ -5,7 +5,8 @@
 #############################################################
 XFSPROGS_VER:=2.7.11
 XFSPROGS_SOURCE=xfsprogs-$(XFSPROGS_VER).src.tar.gz
-XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
+#XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
+XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/
 XFSPROGS_DIR=$(BUILD_DIR)/xfsprogs-$(XFSPROGS_VER)
 XFSPROGS_CAT:=$(ZCAT)
 XFSPROGS_BINARY:=mkfs/mkfs.xfs
