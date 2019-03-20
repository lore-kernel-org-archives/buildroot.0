From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Wed, 20 Mar 2019 00:38:04 +0000
Subject: [Buildroot] [PATCH v5 1/4] board/qemu/riscv32-virt: Update linux
 config
Message-ID: <20190320003706.1126-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the Linux defconfig. This defconfig is the in tree defconfig with
32-bit support enabled.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 board/qemu/riscv32-virt/linux.config | 35 +++++++++++-----------------
 configs/qemu_riscv32_virt_defconfig  |  4 ++--
 2 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/board/qemu/riscv32-virt/linux.config b/board/qemu/riscv32-virt/linux.config
index c25583f768..fa8a9fd650 100644
--- a/board/qemu/riscv32-virt/linux.config
+++ b/board/qemu/riscv32-virt/linux.config
@@ -1,23 +1,14 @@
+CONFIG_32BIT=y
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PGTABLE_LEVELS=2
 CONFIG_ARCH_RV32I=y
-CONFIG_SMP=y
-CONFIG_NR_CPUS=8
-CONFIG_PCI=y
-CONFIG_SYSVIPC=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_WIRELESS is not set
-CONFIG_VIRTIO_BLK=y
-CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-# CONFIG_ETHERNET is not set
-# CONFIG_WLAN is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_VIRT_DRIVERS=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
+# CONFIG_ARCH_RV64I is not set
+CONFIG_MAXPHYSMEM_2GB=y
+CONFIG_LBDAF=y
+# CONFIG_SCSI_NSP32 is not set
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_GENERIC_LIB_ASHLDI3=y
+CONFIG_GENERIC_LIB_ASHRDI3=y
+CONFIG_GENERIC_LIB_LSHRDI3=y
+CONFIG_GENERIC_LIB_UCMPDI2=y
+CONFIG_GENERIC_LIB_UMODDI3=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 6f9a61b11c..15b4c5624c 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -18,8 +18,8 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux.config"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/riscv32-virt/linux.config"
 
 # Bootloader
 BR2_TARGET_RISCV_PK=y
-- 
2.21.0
