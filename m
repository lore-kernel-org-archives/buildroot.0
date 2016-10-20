From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 23:31:14 +0200
Subject: [Buildroot] [git commit] configs/zynq_*: add
	BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
Message-ID: <20161020213127.2C38C7F990@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59b9cc7a2dffcd5eb192609eebe3f6a9a9293462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The U-Boot configuration for Zynq boards have CONFIG_FIT_SIGNATURE=y,
so they need OpenSSL to be available on the host system. In order to
add OpenSSL to the build this commit adds the
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the relevant defconfigs.

Fixes #9316.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/zynq_microzed_defconfig | 1 +
 configs/zynq_zc706_defconfig    | 1 +
 configs/zynq_zed_defconfig      | 1 +
 configs/zynq_zybo_defconfig     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index ca6d010..dd580ab 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -23,6 +23,7 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 6f7215c..3f7fd8c 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index e5bf3de..0febf82 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -23,6 +23,7 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
diff --git a/configs/zynq_zybo_defconfig b/configs/zynq_zybo_defconfig
index aef1ac2..ee6fa06 100644
--- a/configs/zynq_zybo_defconfig
+++ b/configs/zynq_zybo_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zybo"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
