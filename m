From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Aug 2014 17:43:51 -0300
Subject: [Buildroot] [PATCH] configs/imx233_olinuxino: bump to kernel 3.16
Message-ID: <1407357831-20429-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../imx233_olinuxino/{linux-3.13.config => linux-3.16.config}     | 4 +---
 configs/olimex_imx233_olinuxino_defconfig                         | 8 ++++----
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename board/olimex/imx233_olinuxino/{linux-3.13.config => linux-3.16.config} (98%)

diff --git a/board/olimex/imx233_olinuxino/linux-3.13.config b/board/olimex/imx233_olinuxino/linux-3.16.config
similarity index 98%
rename from board/olimex/imx233_olinuxino/linux-3.13.config
rename to board/olimex/imx233_olinuxino/linux-3.16.config
index 61e2421..4795023 100644
--- a/board/olimex/imx233_olinuxino/linux-3.13.config
+++ b/board/olimex/imx233_olinuxino/linux-3.16.config
@@ -53,7 +53,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -132,7 +131,6 @@ CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_USB_MXS_PHY=y
 CONFIG_MMC=y
-CONFIG_MMC_UNSAFE_RESUME=y
 CONFIG_MMC_MXS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
@@ -167,7 +165,7 @@ CONFIG_KEYS=y
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
-CONFIG_CRYPTO_DEV_DCP=y
+CONFIG_CRYPTO_DEV_MXS_DCP=y
 CONFIG_CRC_CCITT=y
 CONFIG_CRC_ITU_T=y
 CONFIG_CRC7=m
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 2ee9ce6..d516cb4 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -15,8 +15,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.6"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.16"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Bootloader
 BR2_TARGET_MXS_BOOTLETS=y
@@ -27,9 +27,9 @@ BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME="imx23_olinuxino_dev"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.16.config"
 BR2_LINUX_KERNEL_PATCH="http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/101-soc-audio-dts.patch http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/ASoC_driver_for_i.MX233.patch"
 BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
-- 
1.8.5.5
