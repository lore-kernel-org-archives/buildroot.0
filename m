From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jun 2018 21:24:58 +0200
Subject: [Buildroot] [git commit] configs/imx6ulpico: Bump kernel and U-Boot
Message-ID: <20180608192414.E331187FDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd77f8d7f6401cf7c4d3438caab457848322791d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel to version 4.17 and U-Boot to 2018.05.

As the imx_v6_v7_defconfig in 4.17 already selects the
CONFIG_CFG80211_WEXT option, the linux.fragment can
be simply removed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/technexion/imx6ulpico/linux.fragment | 1 -
 configs/imx6ulpico_defconfig               | 9 ++++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/board/technexion/imx6ulpico/linux.fragment b/board/technexion/imx6ulpico/linux.fragment
deleted file mode 100644
index 892d0cb7b9..0000000000
--- a/board/technexion/imx6ulpico/linux.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_CFG80211_WEXT=y
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 96ac038d2f..69d1a8055d 100644
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
