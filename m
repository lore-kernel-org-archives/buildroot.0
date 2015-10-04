From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 20:17:35 +0200
Subject: [Buildroot] [git commit] configs: fix configurations that need
	host-dtc
Message-ID: <20151004181804.8F761807E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40fe3349a7a7adcbbeda9105571f4cb2b9d5dc31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

olimex_a20_olinuxino_lime_defconfig and zedboard_defconfig use U-Boot
2015.07, and they need host-dtc to build properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig |    1 +
 configs/zedboard_defconfig                  |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
