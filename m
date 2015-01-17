From: Ivo Slanina <ivo.slanina@gmail.com>
Date: Sat, 17 Jan 2015 23:18:32 +0100
Subject: [Buildroot] [PATCH 1/1] configs/udoo_quad_defconfig: new defconfig
Message-ID: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added defconfig for UDOO Quad board. Used official kernel 3.0.35.
Kernel is patched in order to use gcc version 4.8 and above,
according to mailing list at
https://lists.yoctoproject.org/pipermail/meta-freescale/2013-July/003531.html

Bootloader is also downloaded from official repository.

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
---
 configs/udoo_quad_defconfig |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 configs/udoo_quad_defconfig

diff --git a/configs/udoo_quad_defconfig b/configs/udoo_quad_defconfig
new file mode 100644
index 0000000..32e9a61
--- /dev/null
+++ b/configs/udoo_quad_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV3=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.0.35"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/UDOOboard/Kernel_Unico"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
+BR2_LINUX_KERNEL_PATCH="https://github.com/torvalds/linux/commit/455bd4c430b0c0a361f38e8658a0d6cb469942b5.patch https://github.com/torvalds/linux/commit/418df63adac56841ef6b0f1fcf435bc64d4ed177.patch"
+BR2_LINUX_KERNEL_DEFCONFIG="UDOO"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="udoo_quad"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/UDOOboard/U-Boot_Unico-2013"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
1.7.10.4
