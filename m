From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 00:15:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target: cloop cpio cramfs
	device/AMD device/Atm etc...
Message-ID: <20081208081558.D17AF3C6BF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 00:15:58 -0800 (Mon, 08 Dec 2008)
New Revision: 24310

Log:
target/: get rid of unneeded $(strip ..)

Modified:
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/cloop/Makefile.in
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/device/AMD/Makefile.in
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/device/Atmel/atngw100-base/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100-expanded/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100/Makefile.in
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/device/Hitachi/Makefile.in
   trunk/buildroot/target/device/Sharp/Makefile.in
   trunk/buildroot/target/device/Soekris/Makefile.in
   trunk/buildroot/target/device/Via/Makefile.in
   trunk/buildroot/target/device/jp/Makefile.in
   trunk/buildroot/target/device/jp/q5/linux.mk
   trunk/buildroot/target/device/valka/Makefile.in
   trunk/buildroot/target/device/x86/Makefile.in
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/powerpc/yaboot/yaboot.mk
   trunk/buildroot/target/romfs/romfs.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk
   trunk/buildroot/target/u-boot/Makefile.in
   trunk/buildroot/target/ubifs/ubifsroot.mk
   trunk/buildroot/target/x86/grub/grub.mk
   trunk/buildroot/target/x86/grub2/grub2.mk
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -11,7 +11,7 @@
 include target/x86/Makefile.in
 include target/powerpc/Makefile.in
 
-ifeq ($(strip $(BR2_TARGET_UBOOT)),y)
+ifeq ($(BR2_TARGET_UBOOT),y)
 include target/u-boot/Makefile.in
 endif
 
@@ -22,13 +22,11 @@
 # We already did add the kernel target to TARGETS and now just pull in the rules
 # to actually build this target.
 
-ifeq ($(strip $(subst ",,$(BR2_KERNEL_LINUX))),y)
-#"))
+ifeq ($(BR2_KERNEL_LINUX),y)
 include target/linux/Makefile.in
 endif
 
-ifeq ($(strip $(subst ",,$(BR2_KERNEL_LINUX_ADVANCED))),y)
-#"))
+ifeq ($(BR2_KERNEL_LINUX_ADVANCED),y)
 include target/linux/Makefile.in.advanced
 endif
 

Modified: trunk/buildroot/target/cloop/Makefile.in
===================================================================
--- trunk/buildroot/target/cloop/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/cloop/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,3 +1,3 @@
-ifeq ($(strip $(BR2_TARGET_ROOTFS_CLOOP)),y)
+ifeq ($(BR2_TARGET_ROOTFS_CLOOP),y)
 TARGETS+=clooproot
 endif

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -91,6 +91,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_CPIO)),y)
+ifeq ($(BR2_TARGET_ROOTFS_CPIO),y)
 TARGETS+=cpioroot
 endif

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -91,6 +91,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_CRAMFS)),y)
+ifeq ($(BR2_TARGET_ROOTFS_CRAMFS),y)
 TARGETS+=cramfsroot
 endif

Modified: trunk/buildroot/target/device/AMD/Makefile.in
===================================================================
--- trunk/buildroot/target/device/AMD/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/AMD/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,5 +1,5 @@
 # Override the default uClibc configuration
-ifeq ($(strip $(BR2_TARGET_AMD_ALCHEMY_DBAU1500)),y)
+ifeq ($(BR2_TARGET_AMD_ALCHEMY_DBAU1500),y)
 
 include target/device/AMD/DBAu1500/Makefile.in
 include target/device/AMD/DBAu1500/linux.mk

Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -5,7 +5,8 @@
 #############################################################
 DATAFLASHBOOT_VERSION:=1.05
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
-ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
+ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
+# "))
 DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)/Source
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
 DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)
@@ -42,6 +43,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_DATAFLASHBOOT)),y)
+ifeq ($(BR2_TARGET_DATAFLASHBOOT),y)
 TARGETS+=dataflash
 endif

Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,11 +1,11 @@
 # *******************************************************************
 
-ifeq ($(strip $(BR2_TARGET_ATMEL)),y)
+ifeq ($(BR2_TARGET_ATMEL),y)
 ATMEL_PATH:=target/device/Atmel
 
-BOARD_NAME:=$(strip  $(subst ",, $(BR2_BOARD_NAME)))
+BOARD_NAME:=$(strip $(subst ",, $(BR2_BOARD_NAME)))
 #"))
-BOARD_PATH:=$(strip  $(subst ",, $(BR2_BOARD_PATH)))
+BOARD_PATH:=$(strip $(subst ",, $(BR2_BOARD_PATH)))
 #"))
 
 ATMEL_TARGET:=$(ATMEL_PATH)/root
@@ -13,22 +13,22 @@
 TARGET_DEVICE_TABLE:=$(ATMEL_TARGET)/device_table.txt
 TARGET_SKELETON_LINKS:=$(ATMEL_TARGET)/skel.tar.gz
 
-TARGET_ATMEL_COPYTO:=$(strip  $(subst ",, $(BR2_TARGET_ATMEL_COPYTO)))
+TARGET_ATMEL_COPYTO:=$(strip $(subst ",, $(BR2_TARGET_ATMEL_COPYTO)))
 
 # These are set by Config.in
-DOWNLOAD_LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
+DOWNLOAD_LINUX26_VERSION:= $(strip $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
 #"))
 ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
-LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_LINUX26_VERSION)))
+LINUX26_VERSION:=$(strip $(subst ",, $(BR2_LINUX26_VERSION)))
 #"))
 ifeq ($(LINUX26_VERSION),)
 LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
-LINUX26_RC_PATCH:=$(strip  $(subst ",, $(BR2_LINUX26_RC_PATCH)))
+LINUX26_RC_PATCH:=$(strip $(subst ",, $(BR2_LINUX26_RC_PATCH)))
 #"))
 
 # These are set by "new" Config.in
@@ -39,7 +39,7 @@
 
 #LINUX26_BINLOC=$(LINUX26_FORMAT)
 #LINUX26_BINLOC:=$(BINARIES_DIR)/$(LINUX26_KERNEL)
-ifeq ($(strip $(BR2_avr32)),y)
+ifeq ($(BR2_avr32),y)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/images/$(BR2_PACKAGE_LINUX_FORMAT)
 endif
 
@@ -63,15 +63,15 @@
 UBOOT_CONFIG:=$(UBOOT_BOARD_NAME)_config
 UBOOT_CONFIG_FILE:=$(BOARD_PATH)/u-boot/$(UBOOT_BOARD_NAME).h
 
-ifeq ($(strip $(BR2_TARGET_UBOOT_AT91)),y)
+ifeq ($(BR2_TARGET_UBOOT_AT91),y)
 include $(ATMEL_PATH)/u-boot/u-boot.mk
 endif
 
-ifeq ($(strip $(BR2_TARGET_DATAFLASHBOOT)),y)
+ifeq ($(BR2_TARGET_DATAFLASHBOOT),y)
 include $(ATMEL_PATH)/DataFlashBoot/DataflashBoot.mk
 endif
 
-ifeq ($(strip $(BR2_TARGET_AT91BOOTSTRAP)),y)
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 include $(ATMEL_PATH)/at91bootstrap/at91bootstrap.mk
 endif
 

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -86,6 +86,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_AT91BOOTSTRAP)),y)
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 TARGETS+=at91bootstrap
 endif

Modified: trunk/buildroot/target/device/Atmel/atngw100/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Atmel/atngw100/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,4 +1,4 @@
-ifeq ($(strip $(BR2_TARGET_AVR32_ATNGW100)),y)
+ifeq ($(BR2_TARGET_AVR32_ATNGW100),y)
 ATNGW100_PATH=target/device/Atmel/atngw100
 
 TARGET_SKELETON=$(ATNGW100_PATH)/target_skeleton

Modified: trunk/buildroot/target/device/Atmel/atngw100-base/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-base/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Atmel/atngw100-base/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,4 +1,4 @@
-ifeq ($(strip $(BR2_TARGET_AVR32_ATNGW100_BASE)),y)
+ifeq ($(BR2_TARGET_AVR32_ATNGW100_BASE),y)
 ATNGW100_BASE_PATH=target/device/Atmel/atngw100-base
 
 TARGET_SKELETON=$(ATNGW100_BASE_PATH)/target_skeleton

Modified: trunk/buildroot/target/device/Atmel/atngw100-expanded/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-expanded/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Atmel/atngw100-expanded/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,4 +1,4 @@
-ifeq ($(strip $(BR2_TARGET_AVR32_ATNGW100_EXPANDED)),y)
+ifeq ($(BR2_TARGET_AVR32_ATNGW100_EXPANDED),y)
 ATNGW100_EXPANDED_PATH=target/device/Atmel/atngw100-expanded
 
 TARGET_SKELETON=$(ATNGW100_EXPANDED_PATH)/target_skeleton

Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -247,7 +247,7 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_UBOOT_AT91)),y)
+ifeq ($(BR2_TARGET_UBOOT_AT91),y)
 TARGETS+=uboot
 endif
 

Modified: trunk/buildroot/target/device/Hitachi/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Hitachi/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Hitachi/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,5 +1,5 @@
 # Override the default uClibc configuration
-ifeq ($(strip $(BR2_TARGET_HITACHI_MS7206SE01)),y)
+ifeq ($(BR2_TARGET_HITACHI_MS7206SE01),y)
 
 include target/device/Hitachi/MS7206SE01/Makefile.in
 

Modified: trunk/buildroot/target/device/Sharp/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Sharp/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Sharp/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,5 +1,5 @@
 # Override the default uClibc configuration
-ifeq ($(strip $(BR2_TARGET_SHARP_LNODE80)),y)
+ifeq ($(BR2_TARGET_SHARP_LNODE80),y)
 
 include target/device/Sharp/LNode80/Makefile.in
 include target/device/Sharp/LNode80/linux.mk

Modified: trunk/buildroot/target/device/Soekris/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Soekris/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Soekris/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,11 +1,11 @@
 # Override the default uClibc configuration
-ifeq ($(strip $(BR2_TARGET_SOEKRIS)),y)
+ifeq ($(BR2_TARGET_SOEKRIS),y)
 
-ifeq ($(strip $(BR2_TARGET_SOEKRIS_NET4521)),y)
+ifeq ($(BR2_TARGET_SOEKRIS_NET4521),y)
 UCLIBC_CONFIG_FILE:=target/device/Soekris/net4521/uClibc.config
 BR2_PACKAGE_BUSYBOX_CONFIG:=target/device/Soekris/net4521/busybox.config
 
-ifeq ($(strip $(BR2_PACKAGE_LINUX)),y)
+ifeq ($(BR2_PACKAGE_LINUX),y)
 TARGETS+=linux
 include target/device/Soekris/net4521/linux.mk
 endif
@@ -15,11 +15,11 @@
 #SOEKRIS_NET4801_PATH=target/device/Soekris/net4801
 BOARD_PATH=target/device/Soekris/net4801
 
-ifeq ($(strip $(BR2_TARGET_SOEKRIS_NET4801)),y)
+ifeq ($(BR2_TARGET_SOEKRIS_NET4801),y)
 UCLIBC_CONFIG_FILE:=$(BOARD_PATH)/uClibc.config
 BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox.config
 
-ifeq ($(strip $(BR2_PACKAGE_LINUX)),y)
+ifeq ($(BR2_PACKAGE_LINUX),y)
 TARGETS+=linux26
 include target/device/Soekris/soekris_gpio/soekris_gpio.mk
 LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config

Modified: trunk/buildroot/target/device/Via/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Via/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/Via/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,7 +1,7 @@
 # Override the default uClibc configuration
-ifeq ($(strip $(BR2_TARGET_VIA_EPIA_MII)),y)
+ifeq ($(BR2_TARGET_VIA_EPIA_MII),y)
 
-ifeq ($(strip $(BR2_PACKAGE_LINUX)),y)
+ifeq ($(BR2_PACKAGE_LINUX),y)
 TARGETS+=linux
 include target/device/Via/epia-mii/linux.mk
 endif

Modified: trunk/buildroot/target/device/jp/Makefile.in
===================================================================
--- trunk/buildroot/target/device/jp/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/jp/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,5 +1,5 @@
 # Override the default uClibc configuration
-ifeq ($(strip $(BR2_TARGET_Q5)),y)
+ifeq ($(BR2_TARGET_Q5),y)
 
 include target/device/jp/q5/Makefile.in
 include target/device/jp/q5/linux.mk

Modified: trunk/buildroot/target/device/jp/q5/linux.mk
===================================================================
--- trunk/buildroot/target/device/jp/q5/linux.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/jp/q5/linux.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -84,7 +84,7 @@
 	$(SED) "s,^ARCH.*,ARCH=$(LINUX_KARCH),g;" $(LINUX_DIR)/Makefile
 	$(SED) "s,^CROSS_COMPILE.*,CROSS_COMPILE=$(KERNEL_CROSS),g;" $(LINUX_DIR)/Makefile
 	-cp $(LINUX_KCONFIG) $(LINUX_DIR)/.config
-ifeq ($(strip $(BR2_mips)),y)
+ifeq ($(BR2_mips),y)
 	$(SED) "s,CONFIG_CPU_LITTLE_ENDIAN=y,# CONFIG_CPU_LITTLE_ENDIAN is not set\n# CONFIG_BINFMT_IRIX is not set," $(LINUX_DIR)/.config
 endif
 	$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX_DIR) oldconfig include/linux/version.h

Modified: trunk/buildroot/target/device/valka/Makefile.in
===================================================================
--- trunk/buildroot/target/device/valka/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/valka/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,4 +1,4 @@
-ifeq ($(strip $(BR2_TARGET_VALKA)),y)
+ifeq ($(BR2_TARGET_VALKA),y)
 VALKA_PATH= target/device/valka
 
 TARGET_SKELETON=$(VALKA_PATH)/target_skeleton

Modified: trunk/buildroot/target/device/x86/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/device/x86/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -1,3 +1,3 @@
-ifeq ($(strip $(BR2_i386)),y)
+ifeq ($(BR2_i386),y)
 include target/device/x86/i386/Makefile.in
 endif

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/ext2/ext2root.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -42,20 +42,20 @@
 
 EXT2_OPTS :=
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_SQUASH)),y)
+ifeq ($(BR2_TARGET_ROOTFS_EXT2_SQUASH),y)
 EXT2_OPTS += -U
 endif
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
-EXT2_OPTS += -b $(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS))
+EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endif
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
-EXT2_OPTS += -N $(strip $(BR2_TARGET_ROOTFS_EXT2_INODES))
+EXT2_OPTS += -N $(BR2_TARGET_ROOTFS_EXT2_INODES)
 endif
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),)
-EXT2_OPTS += -m $(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS))
+EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
 EXT2_BASE := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_OUTPUT))
@@ -155,6 +155,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2)),y)
+ifeq ($(BR2_TARGET_ROOTFS_EXT2),y)
 TARGETS+=ext2root
 endif

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -6,7 +6,7 @@
 #
 #############################################################
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_INITRAMFS)),y)
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 INITRAMFS_TARGET:=$(IMAGE).initramfs_list
 else
 INITRAMFS_TARGET:= #nothing
@@ -41,7 +41,7 @@
 initramfs-source:
 
 initramfs-clean:
-ifeq ($(strip $(BR2_TARGET_ROOTFS_INITRAMFS)),y)
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	-rm -f $(INITRAMFS_TARGET)
 endif
 initramfs-dirclean:

Modified: trunk/buildroot/target/iso9660/iso9660.mk
===================================================================
--- trunk/buildroot/target/iso9660/iso9660.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/iso9660/iso9660.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -50,7 +50,7 @@
 #")
 ISO9660_OPTS:=
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_ISO9660_SQUASH)),y)
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
 ISO9660_OPTS+=-U
 endif
 
@@ -90,6 +90,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_ISO9660)),y)
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
 TARGETS+=iso9660root
 endif

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-JFFS2_OPTS := -e $(strip $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE))
+JFFS2_OPTS := -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
 SUMTOOL_OPTS := $(JFFS2_OPTS)
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PAD)),y)
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_PAD),y)
 ifneq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE)),0x0)
 JFFS2_OPTS += --pad=$(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE))
 else
@@ -110,6 +110,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2)),y)
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2),y)
 TARGETS+=jffs2root
 endif

Modified: trunk/buildroot/target/powerpc/yaboot/yaboot.mk
===================================================================
--- trunk/buildroot/target/powerpc/yaboot/yaboot.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/powerpc/yaboot/yaboot.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -38,7 +38,7 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_YABOOT)),y)
+ifeq ($(BR2_TARGET_YABOOT),y)
 TARGETS+=yaboot
 endif
 

Modified: trunk/buildroot/target/romfs/romfs.mk
===================================================================
--- trunk/buildroot/target/romfs/romfs.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/romfs/romfs.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -74,6 +74,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_ROMFS)),y)
+ifeq ($(BR2_TARGET_ROOTFS_ROMFS),y)
 TARGETS+=romfsroot
 endif

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -85,6 +85,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_SQUASHFS)),y)
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS),y)
 TARGETS+=squashfsroot
 endif

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/tar/tarroot.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-TAR_OPTS:=$(strip $(BR2_TARGET_ROOTFS_TAR_OPTIONS))
+TAR_OPTS:=$(BR2_TARGET_ROOTFS_TAR_OPTIONS)
 TAR_TARGET:=$(IMAGE).tar
 
 TAR_COMPRESSOR:=
@@ -21,7 +21,7 @@
 TAR_COMPRESSOR:=lzma -9 -c
 TAR_COMPRESSOR_EXT:=lzma
 endif
-ROOTFS_TAR_COPYTO:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_TAR_COPYTO)))
+ROOTFS_TAR_COPYTO:=$(subst ",,$(BR2_TARGET_ROOTFS_TAR_COPYTO))
 # "))
 
 tarroot: host-fakeroot makedevs
@@ -57,7 +57,7 @@
 endif
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
-EXT2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO)))
+EXT2_COPYTO := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO))
 # "))
 
 
@@ -72,6 +72,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_TAR)),y)
+ifeq ($(BR2_TARGET_ROOTFS_TAR),y)
 TARGETS+=tarroot
 endif

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-12-08 08:15:58 UTC (rev 24310)
@@ -21,10 +21,10 @@
 endif
 
 U_BOOT_TARGET_TOOLS:=
-ifeq ($(strip $(BR2_TARGET_UBOOT_TOOL_MKIMAGE)),y)
+ifeq ($(BR2_TARGET_UBOOT_TOOL_MKIMAGE),y)
 U_BOOT_TARGET_TOOLS+=$(TARGET_DIR)/usr/bin/mkimage
 endif
-ifeq ($(strip $(BR2_TARGET_UBOOT_TOOL_ENV)),y)
+ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
 U_BOOT_TARGET_TOOLS+=$(TARGET_DIR)/usr/sbin/fw_printenv
 endif
 
@@ -106,7 +106,7 @@
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),"")
 	$(call insert_define, CONFIG_BOOTCOMMAND, $(BR2_TARGET_UBOOT_BOOTCMD))
 endif
-ifeq ($(strip $(BR2_TARGET_UBOOT_SILENT)),y)
+ifeq ($(BR2_TARGET_UBOOT_SILENT),y)
 	$(call insert_define, CONFIG_SILENT_CONSOLE,)
 endif
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(U_BOOT_INC_CONF_FILE)
@@ -154,7 +154,7 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_UBOOT)),y)
+ifeq ($(BR2_TARGET_UBOOT),y)
 TARGETS+=u-boot
 endif
 

Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -113,7 +113,7 @@
 	$(UBIFS_ROOTFS_COMPRESSOR) $(UBIFS_BASE) > $(UBIFS_TARGET)
 endif
 
-UBIFS_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO)))
+UBIFS_COPYTO := $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO))
 # "))
 
 ubifsroot: $(UBIFS_TARGET)
@@ -135,7 +135,7 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_ROOTFS_UBIFS)),y)
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS),y)
 TARGETS+=ubifsroot
 endif
 

Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/x86/grub/grub.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -132,6 +132,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_GRUB)),y)
+ifeq ($(BR2_TARGET_GRUB),y)
 TARGETS+=grub
 endif

Modified: trunk/buildroot/target/x86/grub2/grub2.mk
===================================================================
--- trunk/buildroot/target/x86/grub2/grub2.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/x86/grub2/grub2.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -129,6 +129,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_GRUB2)),y)
+ifeq ($(BR2_TARGET_GRUB2),y)
 TARGETS+=grub2
 endif

Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2008-12-08 08:15:46 UTC (rev 24309)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2008-12-08 08:15:58 UTC (rev 24310)
@@ -62,9 +62,9 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_TARGET_SYSLINUX)),y)
+ifeq ($(BR2_TARGET_SYSLINUX),y)
 TARGETS+=syslinux
 endif
-ifeq ($(strip $(BR2_TARGET_PXELINUX)),y)
+ifeq ($(BR2_TARGET_PXELINUX),y)
 TARGETS+=pxelinux
 endif
