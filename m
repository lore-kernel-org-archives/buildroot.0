From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 22:00:58 +0200
Subject: [Buildroot] [git commit] configs/orangepi_plus: U-Boot needs
 pylibfdt
Message-ID: <20190421201515.67B1C81429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdce55778b3e2109881dcedf6e1f2d7e553737f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of U-Boot to 2019.01, pylibfdt is needed to be able to
build the U-Boot image, so we need to enable
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339509

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
index a5ca6a8c5f..be3eba51fe 100644
--- a/configs/orangepi_plus_defconfig
+++ b/configs/orangepi_plus_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 
