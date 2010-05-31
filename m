From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:07:53 +0200
Subject: [Buildroot] [PATCH 07/46] u-boot: remove option to configure
	download site
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fd8347fd9ea408c4150f9358521a5dfceca92bc4.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |    4 ----
 boot/u-boot/u-boot.mk |    2 +-
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 49d66c4..3f4110a 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -33,10 +33,6 @@ config BR2_UBOOT_VERSION
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
 	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
 
-config BR2_U_BOOT_SITE
-	string
-	default "ftp://ftp.denx.de/pub/u-boot"
-
 source "target/device/Config.in.u-boot"
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index a875f2b..7e98ca8 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -7,7 +7,7 @@ U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
 
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 
-U_BOOT_SITE:=$(call qstrip,$(BR2_U_BOOT_SITE))
+U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
 U_BOOT_PATCH_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
 U_BOOT_CAT:=$(BZCAT)
-- 
1.7.0.4
