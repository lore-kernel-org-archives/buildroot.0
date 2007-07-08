From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 04:25:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/iso9660
Message-ID: <20070708112525.EE423A458D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 04:25:25 -0700 (Sun, 08 Jul 2007)
New Revision: 19028

Log:
- iso9660 target does not build target kernel due to missing dependency. Closes #1194


Modified:
   trunk/buildroot/target/iso9660/iso9660.mk


Changeset:
Modified: trunk/buildroot/target/iso9660/iso9660.mk
===================================================================
--- trunk/buildroot/target/iso9660/iso9660.mk	2007-07-08 11:03:43 UTC (rev 19027)
+++ trunk/buildroot/target/iso9660/iso9660.mk	2007-07-08 11:25:25 UTC (rev 19028)
@@ -54,7 +54,7 @@
 ISO9660_OPTS+=-U
 endif
 
-$(ISO9660_TARGET): host-fakeroot $(EXT2_TARGET) grub mkisofs
+$(ISO9660_TARGET): host-fakeroot $(LINUX_KERNEL) $(EXT2_TARGET) grub mkisofs
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
