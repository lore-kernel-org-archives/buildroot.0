From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 10:34:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20070129183438.A26EF485D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 10:34:37 -0800 (Mon, 29 Jan 2007)
New Revision: 17642

Log:
- added diskless/net support and new patches, mainly network drivers.
  Closes #721. Thanks, janlana


Added:
   trunk/buildroot/target/x86/grub/grub.400-nic_update2.patch.bz2

Modified:
   trunk/buildroot/target/x86/grub/Config.in
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/Config.in
===================================================================
--- trunk/buildroot/target/x86/grub/Config.in	2007-01-29 18:03:54 UTC (rev 17641)
+++ trunk/buildroot/target/x86/grub/Config.in	2007-01-29 18:34:37 UTC (rev 17642)
@@ -15,3 +15,156 @@
 	  A splashimage is a 14-color indexed .xpm picture which
 	  is displayed as background for the grub menu.
 
+config BR2_TARGET_GRUB_DISKLESS
+	bool "enable diskless support"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable diskless support
+
+config BR2_TARGET_GRUB_3c595
+	bool "enable 3Com595 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable 3Com595 driver
+
+config BR2_TARGET_GRUB_3c90x
+	bool "enable 3Com90x driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable 3Com90x driver
+
+config BR2_TARGET_GRUB_davicom
+	bool "enable Davicom driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Davicom driver
+
+config BR2_TARGET_GRUB_e1000
+	bool "enable Etherexpress Pro/1000 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Etherexpress Pro/1000 driver
+
+config BR2_TARGET_GRUB_eepro100
+	bool "enable Etherexpress Pro/100 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Etherexpress Pro/100 driver
+
+config BR2_TARGET_GRUB_epic100
+	bool "enable SMC 83c170 EPIC/100 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable SMC 83c170 EPIC/100 driver
+
+config BR2_TARGET_GRUB_forcedeth
+	bool "enable Nvidia Geforce driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Nvidia Geforce driver
+
+config BR2_TARGET_GRUB_natsemi
+	bool "enable NatSemi DP8381x driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable NatSemi DP8381x driver
+
+config BR2_TARGET_GRUB_ns83820
+	bool "enable NS83820 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable NS83820 driver
+
+config BR2_TARGET_GRUB_ns8390
+	bool "enable NE2000 PCI driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable NE2000 PCI driver
+
+config BR2_TARGET_GRUB_pcnet32
+	bool "enable AMD Lance/PCI PCNet/32 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable AMD Lance/PCI PCNet/32 driver
+
+config BR2_TARGET_GRUB_pnic
+	bool "enable Bochs Pseudo Nic driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Bochs Pseudo Nic driver
+
+config BR2_TARGET_GRUB_rtl8139
+	bool "enable Realtek 8139 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Realtek 8139 driver
+
+config BR2_TARGET_GRUB_r8169
+	bool "enable Realtek 8169 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Realtek 8169 driver
+
+config BR2_TARGET_GRUB_sis900
+	bool "enable SIS 900 and SIS 7016 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable SIS 900 and SIS 7016 driver
+
+config BR2_TARGET_GRUB_tg3
+	bool "enable Broadcom Tigon3 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Broadcom Tigon3 driver
+
+config BR2_TARGET_GRUB_tulip
+	bool "enable Tulip driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Tulip driver
+
+config BR2_TARGET_GRUB_tlan
+	bool "enable TI ThunderLAN driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable TI ThunderLAN driver
+
+config BR2_TARGET_GRUB_undi
+	bool "enable PXE UNDI driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable PXE UNDI driver
+
+config BR2_TARGET_GRUB_via_rhine
+	bool "enable Rhine-I/II driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Rhine-I/II driver
+
+config BR2_TARGET_GRUB_w89c840
+	bool "enable Winbond W89c840 driver"
+	default n
+	depends on BR2_TARGET_GRUB
+	help
+	  enable Winbond W89c840 driver

Added: trunk/buildroot/target/x86/grub/grub.400-nic_update2.patch.bz2
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/target/x86/grub/grub.400-nic_update2.patch.bz2
___________________________________________________________________
Name: svn:mime-type
   + application/octet-stream

Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2007-01-29 18:03:54 UTC (rev 17641)
+++ trunk/buildroot/target/x86/grub/grub.mk	2007-01-29 18:34:37 UTC (rev 17642)
@@ -21,41 +21,62 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH=grub_0.97-20.diff.gz
+GRUB_PATCH:=grub_0.97-20.diff.gz
 GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub
+GRUB_PATCH_SITE:=http://ftp.debian.org/debian/pool/main/g/grub
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
 GRUB_BINARY:=grub/grub
 GRUB_TARGET_BINARY:=bin/grub
+GRUB_SPLASHIMAGE=$(TOPDIR)/target/x86/grub/splash.xpm.gz
 
-GRUB_TARGET_FILES:=
-ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
-GRUB_CONFIGURE_ARGS+=--enable-graphics
-GRUB_SPLASHIMAGE=$(TOPDIR)/target/x86/grub/splash.xpm.gz
-GRUB_TARGET_FILES+=$(GRUB_SPLASHIMAGE)
-endif
+
 GRUB_CFLAGS=-DSUPPORT_LOOPDEV
-
 ifeq ($(BR2_LARGEFILE),)
 GRUB_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
+
+GRUB_CONFIG-$(BR2_TARGET_GRUB_SPLASH) += --enable-graphics
+GRUB_CONFIG-$(BR2_TARGET_GRUB_DISKLESS) += --enable-diskless
+GRUB_CONFIG-$(BR2_TARGET_GRUB_3c595) += --enable-3c595
+GRUB_CONFIG-$(BR2_TARGET_GRUB_3c90x) += --enable-3c90x
+GRUB_CONFIG-$(BR2_TARGET_GRUB_davicom) += --enable-davicom
+GRUB_CONFIG-$(BR2_TARGET_GRUB_e1000) += --enable-e1000
+GRUB_CONFIG-$(BR2_TARGET_GRUB_eepro100) += --enable-eepro100
+GRUB_CONFIG-$(BR2_TARGET_GRUB_epic100) += --enable-epic100
+GRUB_CONFIG-$(BR2_TARGET_GRUB_forcedeth) += --enable-forcedeth
+GRUB_CONFIG-$(BR2_TARGET_GRUB_natsemi) += --enable-natsemi
+GRUB_CONFIG-$(BR2_TARGET_GRUB_ns83820) += --enable-ns83820
+GRUB_CONFIG-$(BR2_TARGET_GRUB_ns8390) += --enable-ns8390
+GRUB_CONFIG-$(BR2_TARGET_GRUB_pcnet32) += --enable-pcnet32
+GRUB_CONFIG-$(BR2_TARGET_GRUB_pnic) += --enable-pnic
+GRUB_CONFIG-$(BR2_TARGET_GRUB_rtl8139) += --enable-rtl8139
+GRUB_CONFIG-$(BR2_TARGET_GRUB_r8169) += --enable-r8169
+GRUB_CONFIG-$(BR2_TARGET_GRUB_sis900) += --enable-sis900
+GRUB_CONFIG-$(BR2_TARGET_GRUB_tg3) += --enable-tg3
+GRUB_CONFIG-$(BR2_TARGET_GRUB_tulip) += --enable-tulip
+GRUB_CONFIG-$(BR2_TARGET_GRUB_tlan) += --enable-tlan
+GRUB_CONFIG-$(BR2_TARGET_GRUB_undi) += --enable-undi
+GRUB_CONFIG-$(BR2_TARGET_GRUB_via_rhine) += --enable-via-rhine
+GRUB_CONFIG-$(BR2_TARGET_GRUB_w89c840) += --enable-w89c840
+
 $(DL_DIR)/$(GRUB_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GRUB_SITE)/$(GRUB_SOURCE)
 
 $(DL_DIR)/$(GRUB_PATCH):
-	 $(WGET) -P $(DL_DIR) $(GRUB_SITE)/$(GRUB_PATCH)
+	 $(WGET) -P $(DL_DIR) $(GRUB_PATCH_SITE)/$(GRUB_PATCH)
 
 grub-source: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
 
 $(GRUB_DIR)/.unpacked: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
 	$(GRUB_CAT) $(DL_DIR)/$(GRUB_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	$(GRUB_CAT) $(DL_DIR)/$(GRUB_PATCH)  | patch -p1 -d $(GRUB_DIR)
+	toolchain/patch-kernel.sh $(GRUB_DIR) $(DL_DIR) $(GRUB_PATCH)
 	for i in `grep -v "^#" $(GRUB_DIR)/debian/patches/00list`; do \
 		cat $(GRUB_DIR)/debian/patches/$$i | patch -p1 -d $(GRUB_DIR); \
 	done
-	toolchain/patch-kernel.sh $(GRUB_DIR) target/x86/grub/ grub\*.patch
-	touch $(GRUB_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(GRUB_DIR) target/x86/grub grub.\*.patch{,.bz2}
+	touch $@
 
 $(GRUB_DIR)/.configured: $(GRUB_DIR)/.unpacked
 	(cd $(GRUB_DIR); rm -rf config.cache; \
@@ -70,9 +91,9 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--disable-auto-linux-mem-opt \
-		$(GRUB_CONFIGURE_ARGS) \
+		$(GRUB_CONFIG-y) \
 	);
-	touch  $(GRUB_DIR)/.configured
+	touch  $@
 
 $(GRUB_DIR)/$(GRUB_BINARY): $(GRUB_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)
@@ -81,13 +102,19 @@
 	cp $(GRUB_DIR)/$(GRUB_BINARY) $(TARGET_DIR)/sbin/
 	test -d $(TARGET_DIR)/boot/grub || mkdir -p $(TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage1/stage1 $(GRUB_DIR)/stage2/*1_5 $(GRUB_DIR)/stage2/stage2 $(TARGET_DIR)/boot/grub/
+ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
+	test -f $(TARGET_DIR)/boot/grub/$(GRUB_SPLASHIMAGE) || \
+		cp $(GRUB_SPLASHIMAGE) $(TARGET_DIR)/boot/grub/
+endif
 
-
 grub: grub-target_binary
 
 grub-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB_DIR) uninstall
 	-$(MAKE) -C $(GRUB_DIR) clean
+	rm -f $(TARGET_DIR)/boot/grub/$(GRUB_SPLASHIMAGE) \
+		$(TARGET_DIR)/sbin/$(GRUB_BINARY) \
+		$(TARGET_DIR)/boot/grub/{stage{1,2},*1_5}
 
 grub-dirclean:
 	rm -rf $(GRUB_DIR)
