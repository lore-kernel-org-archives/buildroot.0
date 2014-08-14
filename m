From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Aug 2014 17:55:10 -0300
Subject: [Buildroot] [PATCH] qemu/powerpc64-pseries: add new sample config
Message-ID: <1408049710-29800-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/powerpc64-pseries/readme.txt |  7 +++++++
 configs/qemu_ppc64_pseries_defconfig    | 23 +++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 board/qemu/powerpc64-pseries/readme.txt
 create mode 100644 configs/qemu_ppc64_pseries_defconfig

diff --git a/board/qemu/powerpc64-pseries/readme.txt b/board/qemu/powerpc64-pseries/readme.txt
new file mode 100644
index 0000000..45953f7
--- /dev/null
+++ b/board/qemu/powerpc64-pseries/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+ qemu-system-ppc64 -M pseries -cpu POWER7 -m 256 -kernel output/images/vmlinux -append 'console=hvc0 root=/dev/sda' -drive file=output/images/rootfs.ext2,if=scsi,index=0 -serial stdio -display curses
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
new file mode 100644
index 0000000..802ee08
--- /dev/null
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -0,0 +1,23 @@
+# Architecture
+BR2_powerpc64=y
+BR2_powerpc_power7=y
+
+# System
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Lock to 3.16 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.1"
+BR2_LINUX_KERNEL_DEFCONFIG="pseries"
+BR2_LINUX_KERNEL_VMLINUX=y
-- 
1.8.5.5
