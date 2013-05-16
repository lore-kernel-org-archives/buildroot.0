From: Carlo Caione <carlo.caione@gmail.com>
Date: Thu, 16 May 2013 07:34:26 +0200
Subject: [Buildroot] [PATCH 1/2] cubieboard: defconfig for mainline kernel
In-Reply-To: <1368682467-12228-1-git-send-email-carlo.caione@gmail.com>
References: <1368682467-12228-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <1368682467-12228-2-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a new defconfig supporting the cubieboard. Differently from the
previous defconfig (cubieboard_defconfig) using kernel and tools directly
taken from the linux-sunxi repository, this defconfig uses the mainline kernel
that already partially supports the board.
The only sunxi-specific package is sunxi-uboot that will be replaced as soon
as a mainline version is released.

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
 configs/cubieboard_mainline_defconfig | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 configs/cubieboard_mainline_defconfig

diff --git a/configs/cubieboard_mainline_defconfig b/configs/cubieboard_mainline_defconfig
new file mode 100644
index 0000000..169fdb0
--- /dev/null
+++ b/configs/cubieboard_mainline_defconfig
@@ -0,0 +1,27 @@
+BR2_arm=y
+BR2_cortex_a8=y
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="cubieboard"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_VERSION="sunxi-current"
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="3b3cb912783a51cae12b09a5c0f42c076c555c91"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_UBOOT_IMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_INTREE_DTS=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-cubieboard"
+
+# Filesystem images
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_NONE=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
1.8.2.3
