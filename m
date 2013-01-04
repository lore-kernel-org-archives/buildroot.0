From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Jan 2013 16:27:57 -0300
Subject: [Buildroot] [PATCH] qemu/arm-nuri: add new sample config
Message-ID: <1357327677-12112-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the new arm-nuri sample qemu config.
Samsung Exynos4210 Cortex-A9 dual-core testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-nuri/readme.txt  |   10 ++++++++++
 configs/qemu_arm_nuri_defconfig |   25 +++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/arm-nuri/readme.txt
 create mode 100644 configs/qemu_arm_nuri_defconfig

diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
new file mode 100644
index 0000000..3925ab9
--- /dev/null
+++ b/board/qemu/arm-nuri/readme.txt
@@ -0,0 +1,10 @@
+Run the emulation with:
+
+  qemu-system-arm -M nuri -kernel output/images/zImage -append "console=ttySAC1,115200" -smp 2 -serial null -serial stdio
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
+
+Startup time is slow because of the SMP CPU emulation so be patient.
+
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
new file mode 100644
index 0000000..0ae0de6
--- /dev/null
+++ b/configs/qemu_arm_nuri_defconfig
@@ -0,0 +1,25 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_VFP_FLOAT=y
+# BR2_SOFT_FLOAT is not set
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttySAC1"
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Lock to 3.7 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_7=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
+BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.8.6
