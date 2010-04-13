From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:34 +0200
Subject: [Buildroot] [PATCH 22/35] grub2: remove non-existing options
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1b4c1729709d0450599bfcb2951c54543dda8038.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Much of the grub2.mk seems to have been copy/pasted from
grub.mk. However, all the network/splashimage related ./configure
options do not exist in grub2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/Config.in |    9 ---------
 boot/grub2/grub2.mk  |   27 ---------------------------
 2 files changed, 0 insertions(+), 36 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7526399..d27cb4c 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -2,12 +2,3 @@ config BR2_TARGET_GRUB2
 	bool "grub2"
 	help
 	  The GRand Unified Bootloader for x86 systems, take #2.
-
-config BR2_TARGET_GRUB2_SPLASH
-	bool "Splashimage support"
-	depends on BR2_TARGET_GRUB2
-	help
-	  Add support for splashimage.
-	
-	  A splashimage is a 14-color indexed .xpm picture which
-	  is displayed as background for the grub menu.
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 0283ee1..daba78a 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -18,39 +18,12 @@ GRUB2_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub2
 GRUB2_PATCH_SITE:=$(GRUB2_SITE)
 GRUB2_CAT:=$(ZCAT)
 GRUB2_DIR:=$(BUILD_DIR)/grub-1.98
-GRUB2_BINARY:=grub2/grub2
-GRUB2_TARGET_BINARY:=sbin/grub2
-GRUB2_SPLASHIMAGE=$(TOPDIR)/boot/grub/splash.xpm.gz
 
 GRUB2_CFLAGS=-DSUPPORT_LOOPDEV
 ifeq ($(BR2_LARGEFILE),)
 GRUB2_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_SPLASH) += --enable-graphics
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_DISKLESS) += --enable-diskless
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_3c595) += --enable-3c595
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_3c90x) += --enable-3c90x
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_davicom) += --enable-davicom
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_e1000) += --enable-e1000
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_eepro100) += --enable-eepro100
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_epic100) += --enable-epic100
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_forcedeth) += --enable-forcedeth
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_natsemi) += --enable-natsemi
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_ns83820) += --enable-ns83820
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_ns8390) += --enable-ns8390
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_pcnet32) += --enable-pcnet32
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_pnic) += --enable-pnic
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_rtl8139) += --enable-rtl8139
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_r8169) += --enable-r8169
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_sis900) += --enable-sis900
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_tg3) += --enable-tg3
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_tulip) += --enable-tulip
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_tlan) += --enable-tlan
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_undi) += --enable-undi
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_via_rhine) += --enable-via-rhine
-GRUB2_CONFIG-$(BR2_TARGET_GRUB2_w89c840) += --enable-w89c840
-
 $(DL_DIR)/$(GRUB2_SOURCE):
 	 $(call DOWNLOAD,$(GRUB2_SITE),$(GRUB2_SOURCE))
 
-- 
1.6.3.3
