From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 04:34:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ext2
Message-ID: <20061222123436.CC9B04859E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 04:34:35 -0800 (Fri, 22 Dec 2006)
New Revision: 17050

Log:
- BR2_TARGET_ROOTFS_EXT2_RESBLKS is ignored if it is 0. It should be used if it is 0 (since 0 means something here--"do not reserve any blocks".
  Thanks to timw. Closes #484.


Modified:
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2006-12-22 12:22:15 UTC (rev 17049)
+++ trunk/buildroot/target/ext2/ext2root.mk	2006-12-22 12:34:35 UTC (rev 17050)
@@ -54,7 +54,7 @@
 EXT2_OPTS += -i $(strip $(BR2_TARGET_ROOTFS_EXT2_INODES))
 endif
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),)
 EXT2_OPTS += -r $(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS))
 endif
 
