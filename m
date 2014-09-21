From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 21 Sep 2014 21:35:06 +0200
Subject: [Buildroot] [PATCH 1/3] qemu-microblazeel: update to latest kernel
Message-ID: <20140921193506.GA7473@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update config to Linux 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/microblazeel-mmu/linux-3.14.config |   59 -------------------------
 board/qemu/microblazeel-mmu/linux-3.16.config |   59 +++++++++++++++++++++++++
 board/qemu/microblazeel-mmu/readme.txt        |    2 +-
 configs/qemu_microblazeel_mmu_defconfig       |   10 ++---
 4 files changed, 65 insertions(+), 65 deletions(-)
 delete mode 100644 board/qemu/microblazeel-mmu/linux-3.14.config
 create mode 100644 board/qemu/microblazeel-mmu/linux-3.16.config

diff --git a/board/qemu/microblazeel-mmu/linux-3.14.config b/board/qemu/microblazeel-mmu/linux-3.14.config
deleted file mode 100644
index d31faf6..0000000
--- a/board/qemu/microblazeel-mmu/linux-3.14.config
+++ /dev/null
@@ -1,59 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
-CONFIG_INITRAMFS_COMPRESSION_GZIP=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-# CONFIG_BASE_FULL is not set
-# CONFIG_FUTEX is not set
-# CONFIG_EPOLL is not set
-# CONFIG_SIGNALFD is not set
-# CONFIG_SHMEM is not set
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
-CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
-CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
-CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
-CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
-CONFIG_HZ_100=y
-CONFIG_MMU=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE_FORCE=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_INET_LRO is not set
-# CONFIG_IPV6 is not set
-CONFIG_PROC_DEVICETREE=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_NETDEVICES=y
-CONFIG_NET_VENDOR_XILINX=y
-CONFIG_XILINX_EMACLITE=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-# CONFIG_DNOTIFY is not set
-CONFIG_NFS_FS=y
-CONFIG_CIFS=y
-CONFIG_CIFS_STATS=y
-CONFIG_CIFS_STATS2=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_SLAB=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_EARLY_PRINTK=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/board/qemu/microblazeel-mmu/linux-3.16.config b/board/qemu/microblazeel-mmu/linux-3.16.config
new file mode 100644
index 0000000..d31faf6
--- /dev/null
+++ b/board/qemu/microblazeel-mmu/linux-3.16.config
@@ -0,0 +1,59 @@
+CONFIG_SYSVIPC=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
+CONFIG_INITRAMFS_COMPRESSION_GZIP=y
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_SHMEM is not set
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
+CONFIG_HZ_100=y
+CONFIG_MMU=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_FORCE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_LRO is not set
+# CONFIG_IPV6 is not set
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_NETDEVICES=y
+CONFIG_NET_VENDOR_XILINX=y
+CONFIG_XILINX_EMACLITE=y
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EXT2_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_NFS_FS=y
+CONFIG_CIFS=y
+CONFIG_CIFS_STATS=y
+CONFIG_CIFS_STATS2=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_SLAB=y
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_EARLY_PRINTK=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index d402d13..05a054a 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 14feb83..14b6cd9 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.14 headers to avoid breaking with newer kernels
+# Lock to 3.16 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.14.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.14.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.16.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
-- 
1.7.10.4
