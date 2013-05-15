From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 15 May 2013 18:12:04 -0500
Subject: [Buildroot] [PATCH 3/3] zedboard: add Avnet Zedboard support.
In-Reply-To: <1368659524-21154-1-git-send-email-spenser@gillilanding.com>
References: <1368659524-21154-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368659524-21154-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add defconfig and board dir for Avnet Zedboard

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 board/avnet/zedboard/readme.txt |   13 +++++++++++++
 configs/zedboard_defconfig      |   21 +++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 board/avnet/zedboard/readme.txt
 create mode 100644 configs/zedboard_defconfig

diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
new file mode 100644
index 0000000..eaa2cb8
--- /dev/null
+++ b/board/avnet/zedboard/readme.txt
@@ -0,0 +1,13 @@
+This is the buildroot board support for the Avnet Zedboard. The Zedboard is
+a development board based on the Xilinx Zynq-7000 based All-Programmable 
+System-On-Chip.
+
+Zedboard information including schematics, reference designs, and manuals are
+available from http://www.zedboard.org .
+
+To boot the Zedboard using a buildroot generated image copy the following files
+to the sdcard:
+	zynq-zed.dtb -> devicetree.dtb
+	rootfs.cpio.gz.uboot -> uramdisk.image.gz
+	uImage -> uImage
+
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
new file mode 100644
index 0000000..0dfc581
--- /dev/null
+++ b/configs/zedboard_defconfig
@@ -0,0 +1,21 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="xilinx-v14.5"
+BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="xilinx-v14.5"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-- 
1.7.9.5
