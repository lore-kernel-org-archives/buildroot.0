From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 26 Sep 2014 18:58:13 +0200
Subject: [Buildroot] [PATCH 3/3] qemu-ppc: update kernel to latest for
	g3beige emulation
Message-ID: <20140926165813.GA21134@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Linux Kernel to 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/powerpc-g3beige/linux-3.13.config |   47 --------------------------
 board/qemu/powerpc-g3beige/linux-3.16.config |   47 ++++++++++++++++++++++++++
 board/qemu/powerpc-g3beige/readme.txt        |    2 +-
 configs/qemu_ppc_g3beige_defconfig           |   10 +++---
 4 files changed, 53 insertions(+), 53 deletions(-)
 delete mode 100644 board/qemu/powerpc-g3beige/linux-3.13.config
 create mode 100644 board/qemu/powerpc-g3beige/linux-3.16.config

diff --git a/board/qemu/powerpc-g3beige/linux-3.13.config b/board/qemu/powerpc-g3beige/linux-3.13.config
deleted file mode 100644
index a8dd1f6..0000000
--- a/board/qemu/powerpc-g3beige/linux-3.13.config
+++ /dev/null
@@ -1,47 +0,0 @@
-CONFIG_ALTIVEC=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
-CONFIG_PPC601_SYNC_FIX=y
-CONFIG_HIGHMEM=y
-CONFIG_PCCARD=y
-CONFIG_YENTA=y
-CONFIG_ADVANCED_OPTIONS=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_CONNECTOR=y
-CONFIG_PROC_DEVICETREE=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_CMD64X=y
-CONFIG_BLK_DEV_IDE_PMAC=y
-CONFIG_ADB=y
-CONFIG_ADB_CUDA=y
-CONFIG_ADB_PMU=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_MACE=y
-CONFIG_BMAC=y
-CONFIG_NE2K_PCI=y
-CONFIG_8139CP=y
-CONFIG_8139TOO=y
-CONFIG_HAPPYMEAL=y
-CONFIG_SUNGEM=y
-CONFIG_CASSINI=y
-CONFIG_SERIAL_PMACZILOG=y
-CONFIG_SERIAL_PMACZILOG_TTYS=y
-CONFIG_SERIAL_PMACZILOG_CONSOLE=y
-CONFIG_SSB=y
-CONFIG_SSB_PCMCIAHOST=y
-CONFIG_SSB_DRIVER_PCICORE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_SQUASHFS=y
-CONFIG_LIBCRC32C=y
-CONFIG_BOOTX_TEXT=y
diff --git a/board/qemu/powerpc-g3beige/linux-3.16.config b/board/qemu/powerpc-g3beige/linux-3.16.config
new file mode 100644
index 0000000..a8dd1f6
--- /dev/null
+++ b/board/qemu/powerpc-g3beige/linux-3.16.config
@@ -0,0 +1,47 @@
+CONFIG_ALTIVEC=y
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_SLAB=y
+CONFIG_PPC601_SYNC_FIX=y
+CONFIG_HIGHMEM=y
+CONFIG_PCCARD=y
+CONFIG_YENTA=y
+CONFIG_ADVANCED_OPTIONS=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CONNECTOR=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_BLK_DEV_CMD64X=y
+CONFIG_BLK_DEV_IDE_PMAC=y
+CONFIG_ADB=y
+CONFIG_ADB_CUDA=y
+CONFIG_ADB_PMU=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_MACE=y
+CONFIG_BMAC=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+CONFIG_8139TOO=y
+CONFIG_HAPPYMEAL=y
+CONFIG_SUNGEM=y
+CONFIG_CASSINI=y
+CONFIG_SERIAL_PMACZILOG=y
+CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
+CONFIG_SSB=y
+CONFIG_SSB_PCMCIAHOST=y
+CONFIG_SSB_DRIVER_PCICORE=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_SQUASHFS=y
+CONFIG_LIBCRC32C=y
+CONFIG_BOOTX_TEXT=y
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 2711350..e716830 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.7.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 1668e72..ad2de80 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,17 +6,17 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.13 headers to avoid breaking with newer kernels
+# Lock to 3.16 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.16.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
-- 
1.7.10.4
