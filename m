From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 23:07:12 +0200
Subject: [Buildroot] [git commit] configs/solidrun_macchiatobin_mainline:
 bump Linux and U-Boot versions
Message-ID: <20200415205308.CA5598EDA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06d0e99c2e9a438643a2998b568436ed359e3aa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux to 5.6.3, U-Boot to 2020.01. New kernel and modules based
on arm64 defconfig do not fit into default size filesystem anymore.
So increase filesystem size to 120M.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/solidrun_macchiatobin_mainline_defconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
index e601092d67..f1ca7764b1 100644
--- a/configs/solidrun_macchiatobin_mainline_defconfig
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
 BR2_TARGET_GENERIC_HOSTNAME="mcbin"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
 
@@ -19,7 +19,7 @@ BR2_TARGET_MV_DDR_MARVELL=y
 # U-Boot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_USE_DEFCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mvebu_mcbin-88f8040"
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/uboot-fragme
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
@@ -40,6 +40,8 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_TAR=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
