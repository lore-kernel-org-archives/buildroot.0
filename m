From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 10:40:09 +0100
Subject: [Buildroot] [PATCH] configs/licheepi_zero: U-Boot needs pylibfdt
Message-ID: <20191216094010.1749054-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like all Allwinner platforms, building the licheepi_zero U-Boot
configuration requires pylibfdt.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314331

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/licheepi_zero_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index 8bb21292ca..fd875d5f4c 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-- 
2.23.0
