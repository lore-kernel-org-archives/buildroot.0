From: Fabio Estevam <festevam@gmail.com>
Date: Fri,  8 Jun 2018 14:26:23 -0300
Subject: [Buildroot] [PATCH 1/2] configs/imx6ulpico: Bump kernel and U-Boot
Message-ID: <1528478784-7892-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kernel to version 4.17 and U-Boot to 2018.05.

As the imx_v6_v7_defconfig in 4.17 already selects the
CONFIG_CFG80211_WEXT option, the linux.fragment can
be simply removed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/technexion/imx6ulpico/linux.fragment | 1 -
 configs/imx6ulpico_defconfig               | 9 ++++-----
 2 files changed, 4 insertions(+), 6 deletions(-)
 delete mode 100644 board/technexion/imx6ulpico/linux.fragment

diff --git a/board/technexion/imx6ulpico/linux.fragment b/board/technexion/imx6ulpico/linux.fragment
deleted file mode 100644
index 892d0cb..0000000
--- a/board/technexion/imx6ulpico/linux.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_CFG80211_WEXT=y
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 96ac038..69d1a80 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.17 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
@@ -15,9 +15,8 @@ BR2_ROOTFS_OVERLAY="board/technexion/imx6ulpico/rootfs_overlay"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technexion/imx6ulpico/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-hobbit"
 
@@ -37,7 +36,7 @@ BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # required tools to create the eMMC image
-- 
2.7.4
