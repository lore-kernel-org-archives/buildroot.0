From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 06:03:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080423130351.559DF3C742@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-23 06:03:50 -0700 (Wed, 23 Apr 2008)
New Revision: 21808

Log:
u-boot: use correct ARCH


Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 13:03:47 UTC (rev 21807)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 13:03:50 UTC (rev 21808)
@@ -12,7 +12,7 @@
 U_BOOT_BIN:=u-boot.bin
 U_BOOT_TOOLS_BIN:=mkimage
 # u-boot still uses arch=ppc for powerpc
-U_BOOT_ARCH=$(echo $(KERNEL_ARCH)|$(SED) 's/powerpc/ppc/')
+U_BOOT_ARCH:=$(shell echo $(KERNEL_ARCH)|$(HOST_SED_DIR)/bin/sed 's/powerpc/ppc/')
 
 ifneq ($(BR2_TARGET_U_BOOT_CONFIG_BOARD),)
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/configs/$(subst _config,,$(BR2_TARGET_U_BOOT_CONFIG_BOARD)).h
@@ -106,7 +106,7 @@
 	$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
-		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(KERNEL_ARCH) \
+		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
 		 -C $(U_BOOT_DIR)
 
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
