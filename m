From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:55:04 +0100
Subject: [Buildroot] [git commit] configs/imx8mpico: bump BSP components to
 4.14.98_2.0.0
Message-ID: <20191216214717.B688F8B80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87884ae6d895c0223c5c5f7197c6b480119a3f9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Kernel, U-Boot and ATF to TechNexion BSP, based on NXP
4.14.98_2.0.0 release.

This patch also remove BR2_TARGET_UBOOT_FORMAT_IMX in defconfig which
is not needed for this platform.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx8mpico_defconfig | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/configs/imx8mpico_defconfig b/configs/imx8mpico_defconfig
index f22fad0730..5478f267fc 100644
--- a/configs/imx8mpico_defconfig
+++ b/configs/imx8mpico_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pico-8m.dtb"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-pico-pi.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux,d69606b85de50b01e7c028ea2188308ab6612c80)/linux-d69606b85de50b01e7c028ea2188308ab6612c80.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux,9146d4dcb2dda0c7614f74f824cfb20d29bd85f8)/linux-9146d4dcb2dda0c7614f74f824cfb20d29bd85f8.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/pico-8m freescale/pico-8m-dcss-ili9881c"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-pico-pi freescale/imx8mq-pico-pi-dcss-ili9881c"
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
 BR2_PACKAGE_FIRMWARE_IMX=y
@@ -18,16 +18,15 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.9.88_2.2.0_8qxp_beta2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-edm,2fb0ee63229919807737b83d49f5813f594939ac)/u-boot-edm-2fb0ee63229919807737b83d49f5813f594939ac.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-8m"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-edm,9a070a5b4460124054bc459edfc9d1b43e5403bb)/u-boot-edm-9a070a5b4460124054bc459edfc9d1b43e5403bb.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mq"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
