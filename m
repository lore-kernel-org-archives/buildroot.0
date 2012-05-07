From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 May 2012 22:51:31 +0200
Subject: [Buildroot] [git commit] qemu/arm-vexpress: add new sample config
Message-ID: <20120507205339.95DF696C5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9412e3abb5332e1b55b50400ca7b5db60a7dffd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By popular demand!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/arm-vexpress/readme.txt  |    6 ++++++
 configs/qemu_arm_vexpress_defconfig |   22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

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
