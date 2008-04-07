From: hamish at uclibc.org <hamish@uclibc.org>
Date: Sun,  6 Apr 2008 18:44:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ubifs
Message-ID: <20080407014407.3E6943C429@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-04-06 18:44:06 -0700 (Sun, 06 Apr 2008)
New Revision: 21659

Log:
Update to mkfs.ubifs v0.4 release. Note that you need the latest ubifs
kernel code because the on-flash format has changed.


Modified:
   trunk/buildroot/target/ubifs/ubifsroot.mk


Changeset:
Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2008-04-07 00:46:29 UTC (rev 21658)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2008-04-07 01:44:06 UTC (rev 21659)
@@ -3,8 +3,10 @@
 # mkfs.ubifs to build to target ubifs filesystems
 #
 #############################################################
-MKFS_UBIFS_VERSION=2582f128dad78591bc3adcc87c343c690bb82e61
-MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=$(MKFS_UBIFS_VERSION);sf=tgz
+#MKFS_UBIFS_VERSION=2582f128dad78591bc3adcc87c343c690bb82e61
+#MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=$(MKFS_UBIFS_VERSION);sf=tgz
+MKFS_UBIFS_VERSION=v0.4
+MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=refs/tags/mkfs.ubifs-$(MKFS_UBIFS_VERSION);sf=tgz
 MKFS_UBIFS_SOURCE:=mkfs.ubifs-$(MKFS_UBIFS_VERSION).tar.gz
 MKFS_UBIFS_DIR:= $(BUILD_DIR)/mkfs-ubifs-$(MKFS_UBIFS_VERSION)
 MKFS_UBIFS_CAT:=$(ZCAT)
