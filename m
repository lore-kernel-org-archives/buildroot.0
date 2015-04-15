From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 14:04:59 -0300
Subject: [Buildroot] [PATCH 02/15] configs/qemu: update arm versatile
In-Reply-To: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429117512-15472-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to kernel 4.0.
Remove redudant/pointless kernel options to reduce bloat.
Switch from smc9111 to rtl8139 for networking because of issues.
Enable evdev support for better x11 testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-versatile/linux-3.19.config | 81 ------------------------------
 board/qemu/arm-versatile/linux-4.0.config  | 43 ++++++++++++++++
 board/qemu/arm-versatile/readme.txt        |  4 +-
 configs/qemu_arm_versatile_defconfig       | 10 ++--
 4 files changed, 50 insertions(+), 88 deletions(-)
 delete mode 100644 board/qemu/arm-versatile/linux-3.19.config
 create mode 100644 board/qemu/arm-versatile/linux-4.0.config

diff --git a/board/qemu/arm-versatile/linux-3.19.config b/board/qemu/arm-versatile/linux-3.19.config
deleted file mode 100644
index dd5db53..0000000
--- a/board/qemu/arm-versatile/linux-3.19.config
+++ /dev/null
@@ -1,81 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_ARCH_VERSATILE=y
-CONFIG_MACH_VERSATILE_AB=y
-CONFIG_PCI=y
-CONFIG_AEABI=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="root=1f03 mem=32M"
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_PHYSMAP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_EEPROM_LEGACY=m
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_NETDEVICES=y
-CONFIG_SMC91X=y
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_AMBAKMI=y
-CONFIG_LEGACY_PTY_COUNT=16
-CONFIG_SERIAL_8250=m
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=m
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_ARMCLCD=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_SOUND=y
-CONFIG_SND=m
-CONFIG_SND_MIXER_OSS=m
-CONFIG_SND_PCM_OSS=m
-CONFIG_SND_ARMAACI=m
-CONFIG_MMC=y
-CONFIG_MMC_ARMMMCI=m
-CONFIG_EXT4_FS=y
-CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_JFFS2_FS=y
-CONFIG_CRAMFS=y
-CONFIG_MINIX_FS=y
-CONFIG_ROMFS_FS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=y
-CONFIG_NFSD_V3=y
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
-CONFIG_FONTS=y
-CONFIG_FONT_ACORN_8x8=y
diff --git a/board/qemu/arm-versatile/linux-4.0.config b/board/qemu/arm-versatile/linux-4.0.config
new file mode 100644
index 0000000..9a1ae58
--- /dev/null
+++ b/board/qemu/arm-versatile/linux-4.0.config
@@ -0,0 +1,43 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_ARCH_VERSATILE=y
+CONFIG_MACH_VERSATILE_AB=y
+CONFIG_PCI=y
+CONFIG_AEABI=y
+CONFIG_USE_OF=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_SYM53C8XX_2=y
+CONFIG_NETDEVICES=y
+CONFIG_8139CP=y
+CONFIG_PHYLIB=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=m
+CONFIG_FB=y
+CONFIG_FB_ARMCLCD=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_SOUND=y
+CONFIG_SND=m
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_ARMAACI=m
+CONFIG_EXT4_FS=y
+CONFIG_VFAT_FS=m
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_MAGIC_SYSRQ=y
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index cfa30e2..af65d05 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -1,8 +1,8 @@
 Run the emulation with:
 
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=smc91c111 -net user
+  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 272e55b..0c3399e 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
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
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.0.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
2.0.5
