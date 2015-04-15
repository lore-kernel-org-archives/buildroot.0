From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 14:05:07 -0300
Subject: [Buildroot] [PATCH 10/15] configs/qemu: update ppc virtex ml507
In-Reply-To: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429117512-15472-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to kernel 4.0.
Use a custom kernel config to avoid the caveat of a huge debug-enabled
one.
And also reduce defconfig options to avoid bloat.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/ppc-virtex-ml507/linux-4.0.config | 36 ++++++++++++++++++++++++++++
 board/qemu/ppc-virtex-ml507/readme.txt       |  2 +-
 configs/qemu_ppc_virtex_ml507_defconfig      | 11 +++++----
 3 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 board/qemu/ppc-virtex-ml507/linux-4.0.config

diff --git a/board/qemu/ppc-virtex-ml507/linux-4.0.config b/board/qemu/ppc-virtex-ml507/linux-4.0.config
new file mode 100644
index 0000000..ed4eb79
--- /dev/null
+++ b/board/qemu/ppc-virtex-ml507/linux-4.0.config
@@ -0,0 +1,36 @@
+CONFIG_44x=y
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_EBONY is not set
+CONFIG_XILINX_VIRTEX440_GENERIC_BOARD=y
+CONFIG_MATH_EMULATION=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_XILINX_SYSACE=y
+CONFIG_NETDEVICES=y
+CONFIG_SERIO_XILINX_XPS_PS2=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_XILINX_HWICAP=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_XILINX=y
+CONFIG_FB=y
+CONFIG_FB_XILINX=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_EXT4_FS=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
index f8bf150..0cf1f9d 100644
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ b/board/qemu/ppc-virtex-ml507/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index a5b97db..fd53483 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,10 +6,10 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -17,8 +17,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
-BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.0.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
-- 
2.0.5
