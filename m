From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 23:20:35 +0100
Subject: [Buildroot] [git commit] configs/warp7: Bump to mainline kernel 4.9
Message-ID: <20161228222502.308577FD6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26e27bd22fbb985879698292718131f70a0d95d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use mainline 4.9 instead of a custom kernel based on NXP 4.1.

As mx7 boots in non-secure mode in mainline kernel, change the
U-Boot target to "warp7".

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/warp7/linux.fragment |  1 -
 configs/warp7_defconfig    | 13 ++++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/board/warp7/linux.fragment b/board/warp7/linux.fragment
index 00f74cb..892d0cb 100644
--- a/board/warp7/linux.fragment
+++ b/board/warp7/linux.fragment
@@ -1,2 +1 @@
 CONFIG_CFG80211_WEXT=y
-CONFIG_BRCMFMAC=m
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index fca7a1d..ca7cd00 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -13,17 +13,16 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Freescale/linux-fslc.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="efaf36531fe7b1fc15a48033e5972825c91f9fc6"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/warp7/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 
 # U-Boot
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="warp7_secure"
+BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
