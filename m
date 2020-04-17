From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 23:10:42 +0200
Subject: [Buildroot] [git commit] configs/olpc_xo175: new defconfig
Message-ID: <20200417205654.6CADC8F055@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb012f976791521365c11213c03729dda8677233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                  |  1 +
 DEVELOPERS                      |  1 +
 board/olpc/xo-1.75/linux.config | 47 +++++++++++++++++++++++++++++++++++++++++
 configs/olpc_xo175_defconfig    | 28 ++++++++++++++++++++++++
 4 files changed, 77 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b8629bd920..2dcc98dfb7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -243,6 +243,7 @@ olimex_a20_olinuxino_micro_defconfig: { extends: .defconfig }
 olimex_a33_olinuxino_defconfig: { extends: .defconfig }
 olimex_a64_olinuxino_defconfig: { extends: .defconfig }
 olimex_imx233_olinuxino_defconfig: { extends: .defconfig }
+olpc_xo175_defconfig: { extends: .defconfig }
 olpc_xo1_defconfig: { extends: .defconfig }
 openblocks_a6_defconfig: { extends: .defconfig }
 orangepi_lite2_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 7cf0630fb8..f94d3e4faf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1545,6 +1545,7 @@ F:	package/fswebcam/
 N:	Lubomir Rintel <lkundrak@v3.sk>
 F:	board/olpc/
 F:	configs/olpc_xo1_defconfig
+F:	configs/olpc_xo175_defconfig
 
 N:	Ludovic Desroches <ludovic.desroches@microchip.com>
 F:	board/atmel/
diff --git a/board/olpc/xo-1.75/linux.config b/board/olpc/xo-1.75/linux.config
new file mode 100644
index 0000000000..c5e0fe17e1
--- /dev/null
+++ b/board/olpc/xo-1.75/linux.config
@@ -0,0 +1,47 @@
+CONFIG_ARCH_MMP=y
+CONFIG_MACH_MMP2_DT=y
+CONFIG_MACH_MMP3_DT=y
+CONFIG_USB_EHCI_MV_U2O=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_HIGHMEM=y
+CONFIG_FORCE_MAX_ZONEORDER=16
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_REGULATOR_88PG86X=m
+CONFIG_VIDEO_MMP_CAMERA=y
+CONFIG_DRM_ARMADA=y
+CONFIG_DRM_DISPLAY_CONNECTOR=m
+CONFIG_DRM_SIMPLE_BRIDGE=m
+CONFIG_DRM_ETNAVIV=m
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_USB_EHCI_MV=y
+CONFIG_MMC_SDHCI_PXAV3=y
+CONFIG_OLPC_XO175=y
+CONFIG_OLPC_XO175_EC=y
+CONFIG_PHY_PXA_USB=y
+CONFIG_PHY_MMP3_USB=y
+CONFIG_CRYPTO_LZO=m
+CONFIG_LIBERTAS_SDIO=m
+CONFIG_LIBERTAS_THINFIRM=m
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
+CONFIG_MTD_SPI_NOR=m
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_SPI_NOR=m
+CONFIG_I2C_PXA=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SPI=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_SPI_SLAVE=y
+CONFIG_SND_SOC=y
+CONFIG_SND_SOC_RT5631=y
+CONFIG_PWRSEQ_SD8787=m
+CONFIG_RTC_DRV_DS1307=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ZFORCE=y
diff --git a/configs/olpc_xo175_defconfig b/configs/olpc_xo175_defconfig
new file mode 100644
index 0000000000..4317e72a78
--- /dev/null
+++ b/configs/olpc_xo175_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_pj4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olpc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olpc/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1.75/linux.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8=y
+BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9=y
+BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688=y
+BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787=y
+BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
+BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8887=y
+BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8897=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="XO175"
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O dir_index,^huge_file,^64bit,^extent"
+BR2_PACKAGE_HOST_GENIMAGE=y
