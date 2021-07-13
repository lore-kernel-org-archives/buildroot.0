From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:53:37 +0200
Subject: [Buildroot] [git commit] configs/orangepi_zero_defconfig: bump BSP
 versions
Message-ID: <20210713192708.CFC4893652@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45f39e4ba01936114d80126c424150e46022f677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux to 5.12.2 and U-Boot to 2021.04.

Introduce minor cleanup: use SPL options instead of custom image
options for combined SPL image.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/orangepi_zero_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index b008523c84..1c107b10e6 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -3,13 +3,13 @@ BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
