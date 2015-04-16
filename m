From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:02:45 +0200
Subject: [Buildroot] [git commit] configs/qemu: update microblazebe/el
Message-ID: <20150416060438.795E6818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4e8c18897fd175a1a06f4b40842a8e52f701c76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to kernel 4.0.
Remove redundant/pointless kernel options to reduce bloat.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/microblazebe-mmu/linux-3.19.config |   56 ------------------------
 board/qemu/microblazebe-mmu/linux-4.0.config  |   19 ++++++++
 board/qemu/microblazebe-mmu/readme.txt        |    2 +-
 board/qemu/microblazeel-mmu/linux-3.19.config |   57 -------------------------
 board/qemu/microblazeel-mmu/linux-4.0.config  |   18 ++++++++
 board/qemu/microblazeel-mmu/readme.txt        |    2 +-
 configs/qemu_microblazebe_mmu_defconfig       |   10 ++--
 configs/qemu_microblazeel_mmu_defconfig       |   10 ++--
 8 files changed, 49 insertions(+), 125 deletions(-)

diff --git a/board/qemu/microblazebe-mmu/linux-3.19.config b/board/qemu/microblazebe-mmu/linux-3.19.config
deleted file mode 100644
index fc25c9d..0000000
--- a/board/qemu/microblazebe-mmu/linux-3.19.config
+++ /dev/null
@@ -1,56 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
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
-CONFIG_OPT_LIB_ASM=y
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
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_NETDEVICES=y
-CONFIG_XILINX_EMACLITE=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_USB_SUPPORT is not set
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
diff --git a/board/qemu/microblazebe-mmu/linux-4.0.config b/board/qemu/microblazebe-mmu/linux-4.0.config
new file mode 100644
index 0000000..6b4ff22
--- /dev/null
+++ b/board/qemu/microblazebe-mmu/linux-4.0.config
@@ -0,0 +1,19 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_OPT_LIB_ASM=y
+CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
+CONFIG_MMU=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_XILINX_EMACLITE=y
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+# CONFIG_VGA_CONSOLE is not set
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index c6375cc..9f93ab5 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/board/qemu/microblazeel-mmu/linux-3.19.config b/board/qemu/microblazeel-mmu/linux-3.19.config
deleted file mode 100644
index 53ef203..0000000
--- a/board/qemu/microblazeel-mmu/linux-3.19.config
+++ /dev/null
@@ -1,57 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
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
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_NETDEVICES=y
-CONFIG_XILINX_EMACLITE=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_USB_SUPPORT is not set
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
-CONFIG_CRYPTO_CRC32C=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-CONFIG_CRC16=y
diff --git a/board/qemu/microblazeel-mmu/linux-4.0.config b/board/qemu/microblazeel-mmu/linux-4.0.config
new file mode 100644
index 0000000..c7d6b30
--- /dev/null
+++ b/board/qemu/microblazeel-mmu/linux-4.0.config
@@ -0,0 +1,18 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
+CONFIG_MMU=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_XILINX_EMACLITE=y
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+# CONFIG_VGA_CONSOLE is not set
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 3a5d55a..230527d 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 8fb077b..098688b 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.0.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 80f8207..021018c 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -9,16 +9,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.0.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
