From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 Aug 2006 01:03:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20060822080319.0C625486BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-08-22 01:03:19 -0700 (Tue, 22 Aug 2006)
New Revision: 15904

Log:
mkfs.jffs2 doesn't like short form of pad option with arg

Modified:
   trunk/buildroot/target/jffs2/jffs2root.mk


Changeset:
Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2006-08-22 02:42:47 UTC (rev 15903)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2006-08-22 08:03:19 UTC (rev 15904)
@@ -7,9 +7,10 @@
 JFFS2_OPTS := -e $(strip $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE))
 
 ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PAD)),y)
+ifneq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE)),0x0)
+JFFS2_OPTS += --pad=$(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE))
+else
 JFFS2_OPTS += -p
-ifneq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE)),0x0)
-JFFS2_OPTS += $(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE))
 endif
 endif
 
