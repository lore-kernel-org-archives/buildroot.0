From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:32:37 +0200
Subject: [Buildroot] [git commit] configs/atmel_sama5d3xek: bump to
 linux4sam_5.8
Message-ID: <20180406193333.34FCD803CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=597136c2be37874de9c670d9ce7a439d6196d323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump sama5d3xek to linux4sam_5.8. The 3 foundation components have their tags
changed (AT91Bootstrap, U-Boot, Linux kernel).  This requires bumping the kernel
header version and u-boot dtc as well.

at91bootstrap 3.8.10 is required to support gcc7.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/atmel_sama5d3xek_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
index 4fa4d79282..95deb6f232 100644
--- a/configs/atmel_sama5d3xek_defconfig
+++ b/configs/atmel_sama5d3xek_defconfig
@@ -5,12 +5,12 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.5)/linux-linux4sam_5.5.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d33ek sama5d34ek sama5d35ek sama5d36ek"
@@ -25,14 +25,15 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3xeknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.8"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3xek_nandflash"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 
 # Host packages
