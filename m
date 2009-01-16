From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 11:48:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target: cloop cramfs
	device/AMD/DBAu1500 device/ etc...
Message-ID: <20090116114844.1F209774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 11:48:43 +0000 (Fri, 16 Jan 2009)
New Revision: 24871

Log:
target/: convert to DOWNLOAD helper

Modified:
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk
   trunk/buildroot/target/device/Soekris/net4521/linux.mk
   trunk/buildroot/target/device/Soekris/soekris_gpio/soekris_gpio.mk
   trunk/buildroot/target/device/Via/epia-mii/linux.mk
   trunk/buildroot/target/device/jp/q5/linux.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/target/powerpc/yaboot/yaboot.mk
   trunk/buildroot/target/romfs/romfs.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/ubifs/ubifsroot.mk
   trunk/buildroot/target/x86/grub/grub.mk
   trunk/buildroot/target/x86/grub2/grub2.mk
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/target/cloop/cloop.mk
===================================================================
--- trunk/buildroot/target/cloop/cloop.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/cloop/cloop.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -11,10 +11,10 @@
 CLOOP_TARGET:=$(IMAGE).cloop
 ### Note: not used yet! ck
 ### $(DL_DIR)/$(CLOOP_PATCH1):
-### $(WGET) -P $(DL_DIR) $(CLOOP_PATCH1_URL)/$(CLOOP_PATCH1)
+### $(call DOWNLOAD,$(CLOOP_PATCH1_URL),$(CLOOP_PATCH1))
 
 $(DL_DIR)/$(CLOOP_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(CLOOP_SITE)/$(CLOOP_SOURCE)
+	 $(call DOWNLOAD,$(CLOOP_SITE),$(CLOOP_SOURCE))
 
 $(CLOOP_DIR)/.unpacked: $(DL_DIR)/$(CLOOP_SOURCE) ### $(DL_DIR)/$(CLOOP_PATCH1)
 	$(ZCAT) $(DL_DIR)/$(CLOOP_SOURCE) | tar -C $(BUILD_DIR) -xvf -

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -14,7 +14,7 @@
 endif
 
 $(DL_DIR)/$(CRAMFS_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(CRAMFS_SITE)/$(CRAMFS_SOURCE)
+	 $(call DOWNLOAD,$(CRAMFS_SITE),$(CRAMFS_SOURCE))
 
 $(CRAMFS_DIR): $(DL_DIR)/$(CRAMFS_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(CRAMFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -

Modified: trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -41,7 +41,7 @@
 
 
 $(DL_DIR)/$(LINUX26_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
+	 $(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)

Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -13,7 +13,7 @@
 DATAFLASHBOOT_BINARY:=$(DATAFLASHBOOT_NAME).bin
 
 $(DL_DIR)/$(DATAFLASHBOOT_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(DATAFLASHBOOT_SITE)/$(DATAFLASHBOOT_SOURCE)
+	 $(call DOWNLOAD,$(DATAFLASHBOOT_SITE),$(DATAFLASHBOOT_SOURCE))
 
 $(DATAFLASHBOOT_DIR)/.unpacked: $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
 	mkdir -p $(PROJECT_BUILD_DIR)

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -42,7 +42,7 @@
 endif
 
 $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(AT91BOOTSTRAP_SITE)/$(AT91BOOTSTRAP_SOURCE)
+	 $(call DOWNLOAD,$(AT91BOOTSTRAP_SITE),$(AT91BOOTSTRAP_SOURCE))
 
 $(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	mkdir -p $(PROJECT_BUILD_DIR)

Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -43,10 +43,10 @@
 UBOOT_CUSTOM:=$(UBOOT_DIR)/include/custom.h
 
 $(DL_DIR)/$(UBOOT_SOURCE):
-	$(WGET) -P $(DL_DIR) $(UBOOT_SITE)/$(UBOOT_SOURCE)
+	$(call DOWNLOAD,$(UBOOT_SITE),$(UBOOT_SOURCE))
 
 $(DL_DIR)/$(UBOOT_PATCH_SOURCE):
-	$(WGET) -P $(DL_DIR) $(UBOOT_PATCH_SITE)/$(UBOOT_PATCH_SOURCE)
+	$(call DOWNLOAD,$(UBOOT_PATCH_SITE),$(UBOOT_PATCH_SOURCE))
 
 $(UBOOT_DIR)/.unpacked: $(DL_DIR)/$(UBOOT_SOURCE)
 	mkdir -p $(BUILD_DIR)

Modified: trunk/buildroot/target/device/Sharp/LNode80/linux.mk
===================================================================
--- trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -57,7 +57,7 @@
 
 $(DL_DIR)/$(LINUX_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
+	$(call DOWNLOAD,$(LINUX_SITE),$(LINUX_SOURCE))
 
 $(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
 	mkdir -p $(TOOL_BUILD_DIR)

Modified: trunk/buildroot/target/device/Soekris/net4521/linux.mk
===================================================================
--- trunk/buildroot/target/device/Soekris/net4521/linux.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/Soekris/net4521/linux.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -58,7 +58,7 @@
 
 $(DL_DIR)/$(LINUX_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
+	$(call DOWNLOAD,$(LINUX_SITE),$(LINUX_SOURCE))
 
 $(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
 	mkdir -p $(TOOL_BUILD_DIR)

Modified: trunk/buildroot/target/device/Soekris/soekris_gpio/soekris_gpio.mk
===================================================================
--- trunk/buildroot/target/device/Soekris/soekris_gpio/soekris_gpio.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/Soekris/soekris_gpio/soekris_gpio.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -30,7 +30,7 @@
 SOEKRIS_GPIO_MODULE_DIR=lib/modules/$(LINUX_VERSION)/kernel/drivers/soekris/
 
 $(DL_DIR)/$(SOEKRIS_GPIO_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(SOEKRIS_GPIO_SITE)/$(SOEKRIS_GPIO_SOURCE)
+	 $(call DOWNLOAD,$(SOEKRIS_GPIO_SITE),$(SOEKRIS_GPIO_SOURCE))
 
 soekris_gpio-source: $(DL_DIR)/$(SOEKRIS_GPIO_SOURCE)
 

Modified: trunk/buildroot/target/device/Via/epia-mii/linux.mk
===================================================================
--- trunk/buildroot/target/device/Via/epia-mii/linux.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/Via/epia-mii/linux.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -46,7 +46,7 @@
 
 $(DL_DIR)/$(LINUX_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
+	$(call DOWNLOAD,$(LINUX_SITE),$(LINUX_SOURCE))
 
 $(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
 	mkdir -p $(TOOL_BUILD_DIR)

Modified: trunk/buildroot/target/device/jp/q5/linux.mk
===================================================================
--- trunk/buildroot/target/device/jp/q5/linux.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/device/jp/q5/linux.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -56,7 +56,7 @@
 
 $(DL_DIR)/$(LINUX_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(WGET) -P $(DL_DIR) $(LINUX_SITE)/$(LINUX_SOURCE)
+	$(call DOWNLOAD,$(LINUX_SITE),$(LINUX_SOURCE))
 
 $(LINUX_DIR)/.unpacked: $(DL_DIR)/$(LINUX_SOURCE)
 	mkdir -p $(TOOL_BUILD_DIR)

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/ext2/ext2root.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -9,7 +9,7 @@
 GENEXT2_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
 
 $(DL_DIR)/$(GENEXT2_SOURCE):
-	$(WGET) -P $(DL_DIR) $(GENEXT2_SITE)/$(GENEXT2_SOURCE)
+	$(call DOWNLOAD,$(GENEXT2_SITE),$(GENEXT2_SOURCE))
 
 $(GENEXT2_DIR)/.unpacked: $(DL_DIR)/$(GENEXT2_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(GENEXT2_SOURCE) | tar -C $(BUILD_DIR) -xvf -

Modified: trunk/buildroot/target/iso9660/iso9660.mk
===================================================================
--- trunk/buildroot/target/iso9660/iso9660.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/iso9660/iso9660.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -10,7 +10,7 @@
 MKISOFS_TARGET:=$(MKISOFS_DIR)/mkisofs/OBJ/i686-linux-cc/mkisofs
 
 $(DL_DIR)/$(MKISOFS_SOURCE):
-	$(WGET) -P $(DL_DIR) $(MKISOFS_SITE)/$(MKISOFS_SOURCE)
+	$(call DOWNLOAD,$(MKISOFS_SITE),$(MKISOFS_SOURCE))
 
 mkisofs-source: $(DL_DIR)/$(MKISOFS_SOURCE)
 

Modified: trunk/buildroot/target/powerpc/yaboot/yaboot.mk
===================================================================
--- trunk/buildroot/target/powerpc/yaboot/yaboot.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/powerpc/yaboot/yaboot.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -11,7 +11,7 @@
 YABOOT_DIR:=$(BUILD_DIR)/yaboot-1.3.13
 
 $(DL_DIR)/$(YABOOT_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(YABOOT_SITE)/$(YABOOT_SOURCE)
+	 $(call DOWNLOAD,$(YABOOT_SITE),$(YABOOT_SOURCE))
 
 yaboot-source: $(DL_DIR)/$(YABOOT_SOURCE)
 

Modified: trunk/buildroot/target/romfs/romfs.mk
===================================================================
--- trunk/buildroot/target/romfs/romfs.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/romfs/romfs.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -9,7 +9,7 @@
 ROMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/romfs
 
 $(DL_DIR)/$(ROMFS_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(ROMFS_SITE)/$(ROMFS_SOURCE)
+	 $(call DOWNLOAD,$(ROMFS_SITE),$(ROMFS_SOURCE))
 
 $(ROMFS_DIR): $(DL_DIR)/$(ROMFS_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(ROMFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -10,7 +10,7 @@
 SQUASHFS_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(SQUASHFS_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(SQUASHFS_SITE)/$(SQUASHFS_SOURCE)
+	 $(call DOWNLOAD,$(SQUASHFS_SITE),$(SQUASHFS_SOURCE))
 
 $(SQUASHFS_DIR)/.unpacked: $(DL_DIR)/$(SQUASHFS_SOURCE) #$(SQUASHFS_PATCH)
 	$(SQUASHFS_CAT) $(DL_DIR)/$(SQUASHFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -

Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -13,7 +13,7 @@
 MKFS_UBIFS_NAME:=mkfs.ubifs
 
 $(DL_DIR)/$(MKFS_UBIFS_SOURCE):
-	$(WGET) -O $(DL_DIR)/$(MKFS_UBIFS_SOURCE) "$(MKFS_UBIFS_URL)"
+	$(call DOWNLOAD,"$(MKFS_UBIFS_URL)")
 
 $(MKFS_UBIFS_DIR)/.unpacked: $(DL_DIR)/$(MKFS_UBIFS_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(MKFS_UBIFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -

Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/x86/grub/grub.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -62,10 +62,10 @@
 GRUB_CONFIG-$(BR2_TARGET_GRUB_w89c840) += --enable-w89c840
 
 $(DL_DIR)/$(GRUB_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(GRUB_SITE)/$(GRUB_SOURCE)
+	 $(call DOWNLOAD,$(GRUB_SITE),$(GRUB_SOURCE))
 
 $(DL_DIR)/$(GRUB_PATCH):
-	 $(WGET) -P $(DL_DIR) $(GRUB_PATCH_SITE)/$(GRUB_PATCH)
+	 $(call DOWNLOAD,$(GRUB_PATCH_SITE),$(GRUB_PATCH))
 
 grub-source: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
 

Modified: trunk/buildroot/target/x86/grub2/grub2.mk
===================================================================
--- trunk/buildroot/target/x86/grub2/grub2.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/x86/grub2/grub2.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -62,10 +62,10 @@
 GRUB2_CONFIG-$(BR2_TARGET_GRUB2_w89c840) += --enable-w89c840
 
 $(DL_DIR)/$(GRUB2_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(GRUB2_SITE)/$(GRUB2_SOURCE)
+	 $(call DOWNLOAD,$(GRUB2_SITE),$(GRUB2_SOURCE))
 
 $(DL_DIR)/$(GRUB2_PATCH):
-	 $(WGET) -P $(DL_DIR) $(GRUB2_PATCH_SITE)/$(GRUB2_PATCH)
+	 $(call DOWNLOAD,$(GRUB2_PATCH_SITE),$(GRUB2_PATCH))
 
 grub2-source: $(DL_DIR)/$(GRUB2_SOURCE) $(DL_DIR)/$(GRUB2_PATCH)
 

Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2009-01-16 11:47:05 UTC (rev 24870)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2009-01-16 11:48:43 UTC (rev 24871)
@@ -32,7 +32,7 @@
 
 
 $(DL_DIR)/$(SYSLINUX_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(SYSLINUX_SITE)/$(SYSLINUX_SOURCE)
+	 $(call DOWNLOAD,$(SYSLINUX_SITE),$(SYSLINUX_SOURCE))
 
 syslinux-source: $(DL_DIR)/$(SYSLINUX_SOURCE)
 
