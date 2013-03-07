From: Carlo Caione <carlo.caione@gmail.com>
Date: Thu,  7 Mar 2013 23:39:23 +0100
Subject: [Buildroot] [PATCH 2/3] cubieboard: config file
In-Reply-To: <1362695964-20697-1-git-send-email-carlo.caione@gmail.com>
References: <1362695964-20697-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <1362695964-20697-2-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configuration file for cubieboard (http://cubieboard.org/)

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
 configs/cubieboard_defconfig | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 configs/cubieboard_defconfig

diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
new file mode 100644
index 0000000..42d8eb3
--- /dev/null
+++ b/configs/cubieboard_defconfig
@@ -0,0 +1,33 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a8=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="sun4i"
+BR2_TARGET_GENERIC_ISSUE="Welcome to use sun4i"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubieboard/post-build.sh"
+
+# Additional tools
+BR2_PACKAGE_HOST_SUNXI_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="sunxi-3.4"
+BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
+BR2_LINUX_KERNEL_DEFCONFIG="sun4i"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="cubieboard"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_VERSION="sunxi"
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="sunxi"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-- 
1.8.1.5
