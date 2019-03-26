From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 13:26:01 +0100
Subject: [Buildroot] [git commit] board/qemu/riscv32-virt: convert Linux
 defconfig into a fragment
Message-ID: <20190326122750.9EC2E864B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6939ea5c5d10a280206bd637897d63607d2ef47d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert the config to the arch defconfig plus a fragment. When this
fragment is applied we will generate the same config as we previously
did.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/riscv32-virt/linux.config          |  23 ------
 board/qemu/riscv32-virt/linux.config.fragment | 104 ++++++++++++++++++++++++++
 configs/qemu_riscv32_virt_defconfig           |   4 +-
 3 files changed, 106 insertions(+), 25 deletions(-)

diff --git a/board/qemu/riscv32-virt/linux.config b/board/qemu/riscv32-virt/linux.config
deleted file mode 100644
index c25583f768..0000000000
--- a/board/qemu/riscv32-virt/linux.config
+++ /dev/null
@@ -1,23 +0,0 @@
-CONFIG_ARCH_RV32I=y
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
diff --git a/board/qemu/riscv32-virt/linux.config.fragment b/board/qemu/riscv32-virt/linux.config.fragment
new file mode 100644
index 0000000000..2ecc83c8e1
--- /dev/null
+++ b/board/qemu/riscv32-virt/linux.config.fragment
@@ -0,0 +1,104 @@
+CONFIG_ARCH_RV32I=y
+# CONFIG_ARCH_RV64I is not set
+# CONFIG_ATA is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+# CONFIG_BLK_DEV_INITRD is not set
+# CONFIG_BLK_DEV_LOOP is not set
+# CONFIG_BPF_SYSCALL is not set
+# CONFIG_CGROUPS is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+# CONFIG_CMODEL_MEDANY is not set
+CONFIG_CMODEL_MEDLOW=y
+CONFIG_CRYPTO_AEAD=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_CRYPTO_DRBG=y
+CONFIG_CRYPTO_DRBG_MENU=y
+CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_CRYPTO_ENGINE=y
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_JITTERENTROPY=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_NULL=y
+CONFIG_CRYPTO_RNG=y
+CONFIG_CRYPTO_RNG_DEFAULT=y
+CONFIG_CRYPTO_SHA256=y
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_DEBUG_KERNEL is not set
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_DRM is not set
+# CONFIG_ETHERNET is not set
+# CONFIG_EXPERT is not set
+CONFIG_EXT2_FS=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_FB is not set
+CONFIG_FRAME_WARN=1024
+# CONFIG_FTRACE is not set
+CONFIG_HID_A4TECH=y
+CONFIG_HID_APPLE=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_ITE=y
+CONFIG_HID_KENSINGTON=y
+CONFIG_HID_LOGITECH=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_HID_REDRAGON=y
+# CONFIG_HVC_RISCV_SBI is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_I2C is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_INPUT_FF_MEMLESS=y
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_KEYS is not set
+CONFIG_MAXPHYSMEM_2GB=y
+# CONFIG_MDIO_DEVICE is not set
+# CONFIG_MODULES is not set
+# CONFIG_MSDOS_FS is not set
+# CONFIG_NETLINK_DIAG is not set
+# CONFIG_NFS_FS is not set
+# CONFIG_NLS is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+# CONFIG_PCIE_XILINX is not set
+CONFIG_PGTABLE_LEVELS=2
+# CONFIG_PHYLIB is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_PRINTK_TIME is not set
+# CONFIG_PROC_CHILDREN is not set
+# CONFIG_RAS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SIFIVE_PLIC is not set
+# CONFIG_SYNC_FILE is not set
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_TMPFS_XATTR is not set
+# CONFIG_USB is not set
+# CONFIG_USER_NS is not set
+# CONFIG_VFAT_FS is not set
+CONFIG_VIRT_DRIVERS=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+# CONFIG_WIRELESS is not set
+# CONFIG_WLAN is not set
+# CONFIG_XZ_DEC is not set
+CONFIG_32BIT=y
+# CONFIG_EXT2_FS_XATTR is not set
+CONFIG_GENERIC_ATOMIC64=y
+CONFIG_GENERIC_LIB_ASHLDI3=y
+CONFIG_GENERIC_LIB_ASHRDI3=y
+CONFIG_GENERIC_LIB_LSHRDI3=y
+CONFIG_GENERIC_LIB_UCMPDI2=y
+# CONFIG_HID_LOGITECH_HIDPP is not set
+CONFIG_LBDAF=y
+# CONFIG_LOGIG940_FF is not set
+# CONFIG_LOGIRUMBLEPAD2_FF is not set
+# CONFIG_LOGITECH_FF is not set
+# CONFIG_LOGIWHEELS_FF is not set
+
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 6f9a61b11c..fab152e50a 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -18,8 +18,8 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux.config"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/riscv32-virt/linux.config.fragment"
 
 # Bootloader
 BR2_TARGET_RISCV_PK=y
