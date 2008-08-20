From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 20 Aug 2008 13:04:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080820200419.21B353C64F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-20 13:04:18 -0700 (Wed, 20 Aug 2008)
New Revision: 23123

Log:
u-boot: bump version

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-08-20 20:04:14 UTC (rev 23122)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-08-20 20:04:18 UTC (rev 23123)
@@ -3,7 +3,7 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION:=1.3.2
+U_BOOT_VERSION:=1.3.4
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
@@ -126,7 +126,8 @@
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -DUSE_HOSTCC -o $@ \
-		$(U_BOOT_DIR)/tools/mkimage.c $(U_BOOT_DIR)/tools/crc32.c
+		$(U_BOOT_DIR)/tools/mkimage.c \
+		$(addprefix $(U_BOOT_DIR)/tools/,crc32.c image.c md5.c sha1.c fdt*.c)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
