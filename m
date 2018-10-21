From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 21 Oct 2018 14:06:21 +0100
Subject: [Buildroot] [PATCH v2 2/2] configs/qemu: add
 qemu_riscv32_virt_defconfig
In-Reply-To: <20181021130621.17834-1-mark.corbin@embecosm.com>
References: <20181021130621.17834-1-mark.corbin@embecosm.com>
Message-ID: <20181021130621.17834-2-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add RISC-V 32-bit defconfig for QEMU virt machine.

Tested with QEMU 2.12.1

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 board/qemu/riscv32-virt/linux.config | 23 +++++++++++++++++++++++
 configs/qemu_riscv32_virt_defconfig  | 24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 board/qemu/riscv32-virt/linux.config
 create mode 100644 configs/qemu_riscv32_virt_defconfig

diff --git a/board/qemu/riscv32-virt/linux.config b/board/qemu/riscv32-virt/linux.config
new file mode 100644
index 0000000000..c25583f768
--- /dev/null
+++ b/board/qemu/riscv32-virt/linux.config
@@ -0,0 +1,23 @@
+CONFIG_ARCH_RV32I=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=8
+CONFIG_PCI=y
+CONFIG_SYSVIPC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_WIRELESS is not set
+CONFIG_VIRTIO_BLK=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+# CONFIG_ETHERNET is not set
+# CONFIG_WLAN is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRT_DRIVERS=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
new file mode 100644
index 0000000000..aec85e4639
--- /dev/null
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -0,0 +1,24 @@
+# Architecture
+BR2_riscv=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fe92d7905c6ea0ebeabeb725b8040754ede7c220"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux.config"
+
+# Bootloader
+BR2_TARGET_RISCV_PK=y
-- 
2.17.1
