From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 05:42:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/initramfs
Message-ID: <20081208134204.5531A3C7A0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 05:42:04 -0800 (Mon, 08 Dec 2008)
New Revision: 24322

Log:
target/initramfs: actually build initramfs target

Currently, BR2_TARGET_ROOTFS_INITRAMFS doesn't actually do anything,
as it doesn't alter $(TARGETS)

This change hooks up the TARGETS variable to INITRAMFS_TARGET (which
is only set if BR2_TARGET_ROOTFS_INITRAMFS=y), so that the initramfs
list is built.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Modified:
   trunk/buildroot/target/initramfs/initramfs.mk


Changeset:
Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2008-12-08 13:42:01 UTC (rev 24321)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2008-12-08 13:42:04 UTC (rev 24322)
@@ -12,6 +12,8 @@
 INITRAMFS_TARGET:= #nothing
 endif
 
+TARGETS+=$(INITRAMFS_TARGET)
+
 $(INITRAMFS_TARGET) initramfs: host-fakeroot makedevs
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
