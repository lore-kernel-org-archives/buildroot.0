From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Oct 2016 22:13:41 +0200
Subject: [Buildroot] [git commit] beaglebone: defconfigs: select ext4 as
	rootfs
Message-ID: <20161018202210.974047FC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70f5fb8c697126bd6470d9b9a53c709ec816aa2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select ext4 as root file system as the genimage config expects ext4 not ext2.
Tested on beaglebone, beagleboneblack and AM335x EVM

[Peter: reworded slightly]
Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_defconfig     | 1 +
 configs/beaglebone_qt5_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 072719b..a3efabf 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 31ee35a..18ee139 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -25,6 +25,7 @@ BR2_PACKAGE_TI_SGX_DEMOS=y
 BR2_PACKAGE_TI_SGX_KM=y
 BR2_PACKAGE_TI_SGX_UM=y
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
