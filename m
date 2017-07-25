From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 20:44:27 +0200
Subject: [Buildroot] [git commit] configs/warp7: Bump U-Boot and kernel
	versions
Message-ID: <20170725184018.6422F8215C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4ceb3e0783b98ec12f4ab4f73842ea3a9ce2148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to 2017.07 and kernel to version 4.12.3.

As imx_v6_v7_defconfig in 4.12 selects CONFIG_CFG80211_WEXT=y,
remove the linux.fragment file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/warp7/linux.fragment | 1 -
 configs/warp7_defconfig    | 9 ++++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/board/warp7/linux.fragment b/board/warp7/linux.fragment
deleted file mode 100644
index 892d0cb..0000000
--- a/board/warp7/linux.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_CFG80211_WEXT=y
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index c18a782..7de4bb5 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,9 +15,8 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.3"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/warp7/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 
@@ -25,7 +24,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # wifi firmware for brcm43430
