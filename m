From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 23:05:24 +0200
Subject: [Buildroot] [git commit] zedboard: Generate BOOT.BIN automatically
Message-ID: <20150718211743.1D24A807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46d6a561be418e67c3f859f7d3e7461b2a663749
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The U-Boot v2015.07 builds working SPL without a manual
intervention. The BOOT.BIN is generated from the standard
SPL so no BR2_TARGET_UBOOT_SPL_NAME redefinition is needed.
The SPL requires the u-boot-dtb.img file to boot properly.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/zedboard_defconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index 76688e9..cd6436c 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -19,8 +19,8 @@ BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2014.1"
-BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2015.07-rc2"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="boot.bin"
+BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
