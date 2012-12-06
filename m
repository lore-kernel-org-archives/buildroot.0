From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Dec 2012 15:45:57 -0300
Subject: [Buildroot] [PATCH] qemu/ppc-virtex-ml507: add new sample config
Message-ID: <1354819557-26247-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new powerpc-virtex-ml507 sample qemu config.
Useful for powerpc softfloat testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/powerpc-virtex-ml507/readme.txt |    8 ++++++++
 configs/qemu_ppc_virtex_ml507_defconfig    |   22 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/powerpc-virtex-ml507/readme.txt
 create mode 100644 configs/qemu_ppc_virtex_ml507_defconfig

diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/powerpc-virtex-ml507/readme.txt
new file mode 100644
index 0000000..0500a95
--- /dev/null
+++ b/board/qemu/powerpc-virtex-ml507/readme.txt
@@ -0,0 +1,8 @@
+Run the emulation with:
+
+ cp output/images/virtex440-ml507.dtb ppc.dtb
+ qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0"
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 1.2.0
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
new file mode 100644
index 0000000..541d84c
--- /dev/null
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -0,0 +1,22 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_440=y
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Lock to 3.6 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_6=y
+
+# Use soft float
+BR2_SOFT_FLOAT=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.9"
+BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
+BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="44x/virtex440-ml507"
-- 
1.7.8.6
