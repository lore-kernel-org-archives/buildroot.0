From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:36:12 +0100
Subject: [Buildroot] [git commit] configs/qemu_ppc_virtex_ml507: remove
 defconfig
Message-ID: <20210121211655.047007FCFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=370e663593b4e5baaa1ff1d65fa1618530b0f3b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for this board was removed in Linux upstream [1] since Xilinx
new design tools dropped these platforms in 2013, along with all
PPC405/PPC440 new designs. They are not maintained nor tested anymore.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7ade8495dcfd788a76e6877c9ea86f5207369ea4

Signed-off-by: Geoffrey Le Gourri??rec <geoffrey.legourrierec@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc-virtex-ml507/linux.config | 36 --------------------------------
 board/qemu/ppc-virtex-ml507/readme.txt   |  5 -----
 configs/qemu_ppc_virtex_ml507_defconfig  | 34 ------------------------------
 3 files changed, 75 deletions(-)

diff --git a/board/qemu/ppc-virtex-ml507/linux.config b/board/qemu/ppc-virtex-ml507/linux.config
deleted file mode 100644
index ed4eb792b6..0000000000
--- a/board/qemu/ppc-virtex-ml507/linux.config
+++ /dev/null
@@ -1,36 +0,0 @@
-CONFIG_44x=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-# CONFIG_EBONY is not set
-CONFIG_XILINX_VIRTEX440_GENERIC_BOARD=y
-CONFIG_MATH_EMULATION=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_XILINX_SYSACE=y
-CONFIG_NETDEVICES=y
-CONFIG_SERIO_XILINX_XPS_PS2=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_XILINX_HWICAP=y
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_GPIO_XILINX=y
-CONFIG_FB=y
-CONFIG_FB_XILINX=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_EXT4_FS=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
deleted file mode 100644
index feb4b2d7d6..0000000000
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-Run the emulation with:
-
- qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb output/images/virtex440-ml507.dtb # qemu_ppc_virtex_ml507_defconfig
-
-The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
deleted file mode 100644
index 0d1ab8e5d7..0000000000
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ /dev/null
@@ -1,34 +0,0 @@
-# Architecture
-BR2_powerpc=y
-BR2_powerpc_440=y
-
-# Filesystem
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
-
-# Use soft float
-BR2_POWERPC_SOFT_FLOAT=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.88"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux.config"
-BR2_LINUX_KERNEL_VMLINUX=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
-
-# Kernel needs mkimage
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-
-# host-qemu for gitlab testing
-BR2_PACKAGE_HOST_QEMU=y
-BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
