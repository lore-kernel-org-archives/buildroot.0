From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 May 2012 11:06:03 -0300
Subject: [Buildroot] [PATCH] qemu/arm-vexpress: add new sample config
Message-ID: <1336399563-25710-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By popular demand!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-vexpress/readme.txt  |    6 ++++++
 configs/qemu_arm_vexpress_defconfig |   22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/arm-vexpress/readme.txt
 create mode 100644 configs/qemu_arm_vexpress_defconfig

diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
new file mode 100644
index 0000000..0d3631c
--- /dev/null
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -0,0 +1,6 @@
+Run the emulation with:
+
+  qemu-system-arm -M vexpress-a9 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=sd -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
new file mode 100644
index 0000000..7388279
--- /dev/null
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -0,0 +1,22 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# system
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Lock to 3.3 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_3=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.4"
+BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
