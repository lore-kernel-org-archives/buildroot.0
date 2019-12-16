From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:54:58 +0100
Subject: [Buildroot] [git commit] configs/imx8mmpico: bump BSP components to
 4.14.98_2.0.0
Message-ID: <20191216214717.A69098B80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15bfa265f1a2b7728bb2691e7b8f1393bc83d7f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Kernel, U-Boot and ATF to TechNexion BSP, based on NXP
4.14.98_2.0.0 release.

This patch also remove BR2_TARGET_UBOOT_FORMAT_IMX in defconfig which
is not needed for this platform.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx8mmpico_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
index d30dc0672a..f04946a8d1 100644
--- a/configs/imx8mmpico_defconfig
+++ b/configs/imx8mmpico_defconfig
@@ -4,7 +4,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-pico-pi.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux,7ff5de3f5d79c77ab7ecaa6e346ad0e7fb7f0570)/linux-7ff5de3f5d79c77ab7ecaa6e346ad0e7fb7f0570.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux,9146d4dcb2dda0c7614f74f824cfb20d29bd85f8)/linux-9146d4dcb2dda0c7614f74f824cfb20d29bd85f8.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-pico-pi freescale/imx8mm-pico-pi-ili9881c freescale/imx8mm-pico-pi-sn65dsi84-hj070na"
@@ -18,16 +18,15 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-edm,d3391226ba25b1cc6cba7e6c15a2a7e09319b969)/u-boot-edm-d3391226ba25b1cc6cba7e6c15a2a7e09319b969.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-edm,9a070a5b4460124054bc459edfc9d1b43e5403bb)/u-boot-edm-9a070a5b4460124054bc459edfc9d1b43e5403bb.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
