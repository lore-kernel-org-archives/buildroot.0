From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 28 May 2016 22:36:42 +0900
Subject: [Buildroot] [PATCH] configs: zynq: revive BR2_LINUX_KERNEL_UIMAGE
Message-ID: <1464442602-24726-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5c67cb1d0445 ("linux: use zImage by default on ARM") changed
the default kernel image, but missed to update Zynq defconfigs.

U-Boot on Zynq boards still loads uImage, so BR2_LINUX_KERNEL_UIMAGE
should be defined to generate uImage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 configs/zynq_microzed_defconfig | 1 +
 configs/zynq_zc706_defconfig    | 1 +
 configs/zynq_zed_defconfig      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index c73fae5..3faa3b8 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -9,6 +9,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2015.1"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
+BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index d1a46ca..fff49d3 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -10,6 +10,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2014.2.01"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
+BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 1330be4..0e2c8ff 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -9,6 +9,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2015.1"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
+BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-- 
1.9.1
