From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:02:45 +0200
Subject: [Buildroot] [git commit] configs/qemu: update ppc g3beige
Message-ID: <20150416060439.102617FFA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e07008b1a137e96dc2f80311750b448c59aae83d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to kernel 4.0.
Simplify kernel config to reduce bloat.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/ppc-g3beige/linux-3.19.config |   46 ------------------------------
 board/qemu/ppc-g3beige/linux-4.0.config  |   25 ++++++++++++++++
 board/qemu/ppc-g3beige/readme.txt        |    2 +-
 configs/qemu_ppc_g3beige_defconfig       |   10 +++---
 4 files changed, 31 insertions(+), 52 deletions(-)

diff --git a/board/qemu/ppc-g3beige/linux-3.19.config b/board/qemu/ppc-g3beige/linux-3.19.config
deleted file mode 100644
index 26be1c5..0000000
--- a/board/qemu/ppc-g3beige/linux-3.19.config
+++ /dev/null
@@ -1,46 +0,0 @@
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
-CONFIG_EXT4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_SQUASHFS=y
-CONFIG_LIBCRC32C=y
-CONFIG_BOOTX_TEXT=y
diff --git a/board/qemu/ppc-g3beige/linux-4.0.config b/board/qemu/ppc-g3beige/linux-4.0.config
new file mode 100644
index 0000000..7994553
--- /dev/null
+++ b/board/qemu/ppc-g3beige/linux-4.0.config
@@ -0,0 +1,25 @@
+CONFIG_ALTIVEC=y
+CONFIG_SYSVIPC=y
+CONFIG_HIGHMEM=y
+CONFIG_YENTA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_BLK_DEV_CMD64X=y
+CONFIG_BLK_DEV_IDE_PMAC=y
+CONFIG_ADB=y
+CONFIG_ADB_CUDA=y
+CONFIG_ADB_PMU=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_8139CP=y
+CONFIG_SERIAL_PMACZILOG=y
+CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_BOOTX_TEXT=y
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index 65cb261..cd358b3 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 285093c..3e3438c 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,17 +6,17 @@ BR2_powerpc_750=y
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
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.0.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
