From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Fri, 19 Jun 2015 17:29:51 +0200
Subject: [Buildroot] [PATCH 1/4] defconfig for warpboard
Message-ID: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a set of patch to add support for warpboard (Freescale board based on imx6sl)

Signed-off-by: Arthur LAMBERT <lambertarthur22@gmail.com>
---
 configs/warpboard_defconfig | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 configs/warpboard_defconfig

diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
new file mode 100644
index 0000000..188ea4d
--- /dev/null
+++ b/configs/warpboard_defconfig
@@ -0,0 +1,31 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# system
+BR2_TARGET_GENERIC_HOSTNAME="warpboard"
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:Freescale/linux-fslc.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="patches-4.0"
+BR2_LINUX_KERNEL_PATCH="board/freescale/warpboard/linux/"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/warpboard/linux-4.0.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
+
+# rootfs
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_TAR_BZIP2=y
+BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_VERSION="2015.04"
+BR2_TARGET_UBOOT_BOARDNAME="warp"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
1.9.1
