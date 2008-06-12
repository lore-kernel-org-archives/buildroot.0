From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Jun 2008 00:27:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080612072748.ED59C3C700@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-12 00:27:48 -0700 (Thu, 12 Jun 2008)
New Revision: 22298

Log:
u-boot: cleanup arch handling

Thanks to Hamish Moffatt.


Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-06-11 18:29:48 UTC (rev 22297)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-06-12 07:27:48 UTC (rev 22298)
@@ -12,7 +12,7 @@
 U_BOOT_BIN:=u-boot.bin
 U_BOOT_TOOLS_BIN:=mkimage
 # u-boot still uses arch=ppc for powerpc
-U_BOOT_ARCH=$(shell echo $(KERNEL_ARCH)|$(HOST_SED_DIR)/bin/sed 's/powerpc/ppc/')
+U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 
 ifneq ($(BR2_TARGET_U_BOOT_CONFIG_BOARD),)
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/configs/$(subst _config,,$(BR2_TARGET_U_BOOT_CONFIG_BOARD)).h
