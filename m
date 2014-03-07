From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Mar 2014 09:31:05 -0300
Subject: [Buildroot] [PATCH 3/3] configs/olimex_imx233_olinuxino: fix and
	bump relevant versions
In-Reply-To: <1394195465-27656-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394195465-27656-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394195465-27656-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tweak the config to deal with b155f5a5ab321b06df1c5d5f5e104438e8288cf8
fallout.
And bump to the latest kernel versions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../imx233_olinuxino/{linux-3.12.config => linux-3.13.config}      | 3 ---
 configs/olimex_imx233_olinuxino_defconfig                          | 7 ++++---
 2 files changed, 4 insertions(+), 6 deletions(-)
 rename board/olimex/imx233_olinuxino/{linux-3.12.config => linux-3.13.config} (97%)

diff --git a/board/olimex/imx233_olinuxino/linux-3.12.config b/board/olimex/imx233_olinuxino/linux-3.13.config
similarity index 97%
rename from board/olimex/imx233_olinuxino/linux-3.12.config
rename to board/olimex/imx233_olinuxino/linux-3.13.config
index f7b6aa6..61e2421 100644
--- a/board/olimex/imx233_olinuxino/linux-3.12.config
+++ b/board/olimex/imx233_olinuxino/linux-3.13.config
@@ -54,7 +54,6 @@ CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
 CONFIG_MTD_M25P80=y
-# CONFIG_M25PXX_USE_FAST_READ is not set
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -86,7 +85,6 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
-CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_DEVKMEM is not set
@@ -132,7 +130,6 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_PHY=y
 CONFIG_USB_MXS_PHY=y
 CONFIG_MMC=y
 CONFIG_MMC_UNSAFE_RESUME=y
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index e43ee08..2ee9ce6 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -15,7 +15,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.13.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Bootloader
 BR2_TARGET_MXS_BOOTLETS=y
@@ -26,9 +27,9 @@ BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME="imx23_olinuxino_dev"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.13.config"
 BR2_LINUX_KERNEL_PATCH="http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/101-soc-audio-dts.patch http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/ASoC_driver_for_i.MX233.patch"
 BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
-- 
1.8.3.2
