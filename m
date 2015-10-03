From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Oct 2015 20:44:14 +0100
Subject: [Buildroot] [PATCH 4/7] configs: fix configurations that need
	host-dtc
In-Reply-To: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1443901457-7914-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

olimex_a20_olinuxino_lime_defconfig and zedboard_defconfig use U-Boot
2015.07, and they need host-dtc to build properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig | 1 +
 configs/zedboard_defconfig                  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index fa2e98e..53286b4 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -37,6 +37,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index 761e32f..92e7c59 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
 BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/zedboard/uboot"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
-- 
2.6.0
