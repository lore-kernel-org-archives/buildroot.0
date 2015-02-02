From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:25:30 +0100
Subject: [Buildroot] [git commit] configs/udoo_quad_defconfig: new defconfig
Message-ID: <20150202202604.ABCFB8019A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61d9bf5ae77211db65df8ce21c454f44b9bbe21e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added defconfig for UDOO Quad board. Used official (manufacturer) kernel 3.0.35.
Kernel is patched in order to use gcc version 4.8 and above, according to
mailing list at
https://lists.yoctoproject.org/pipermail/meta-freescale/2013-July/003531.html

Bootloader is also downloaded from official (manufacturer) repository.

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
[ThomasDS: use explicit commits instead of 'master'; clarify source for
kernel and u-boot as 'manufacturer']
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(compile-tested only)
[Thomas P: remove glibc, C++ and mdev selection, added some comments.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/udoo_quad_defconfig |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/configs/udoo_quad_defconfig b/configs/udoo_quad_defconfig
new file mode 100644
index 0000000..82e160a
--- /dev/null
+++ b/configs/udoo_quad_defconfig
@@ -0,0 +1,31 @@
+# Architceture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV3=y
+
+# Toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.0.35"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/UDOOboard/Kernel_Unico"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8a6eb060a0d968048f88d5a94510fc6db2c37939"
+BR2_LINUX_KERNEL_PATCH="https://github.com/torvalds/linux/commit/455bd4c430b0c0a361f38e8658a0d6cb469942b5.patch https://github.com/torvalds/linux/commit/418df63adac56841ef6b0f1fcf435bc64d4ed177.patch"
+BR2_LINUX_KERNEL_DEFCONFIG="UDOO"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="udoo_quad"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/UDOOboard/U-Boot_Unico-2013"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1b90fd4bafb1efe05f88eaded731d99a1428f497"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
