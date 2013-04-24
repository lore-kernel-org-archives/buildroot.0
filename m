From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Apr 2013 09:19:19 +0200
Subject: [Buildroot] [git commit] beaglebone_defconfig: use u-boot 2013.04,
	add comments
Message-ID: <20130424071929.3E10A9B800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53b2e94e2fbcf13ae4ff0d549a44bda3de6b0ab2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/beaglebone_defconfig |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index e19cdcb..8eeed77 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,22 +1,32 @@
+# architecture
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-fpu=vfpv3 --with-float=hard"
 # BR2_SOFT_FLOAT is not set
+
+# system
 BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+
+# filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
-# Lock down headers to avoid breaking with new defaults
+
+# lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.2.9"
+
+# bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
-BR2_TARGET_UBOOT_2012_10=y
+BR2_TARGET_UBOOT_2013_04=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
+
+# kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/koenkooi/linux.git"
