From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 21:44:35 +0200
Subject: [Buildroot] [git commit] configs/orangepi_pc2: U-Boot needs pylibfdt
Message-ID: <20190421201515.60BA281429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fbdd867483189c46127f18411aaef380fabc52f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of U-Boot to 2019.01, pylibfdt is needed to be able to
build the U-Boot image, so we need to enable
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339505

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_pc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 7114e62bdb..cd02b46e34 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -20,6 +20,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
