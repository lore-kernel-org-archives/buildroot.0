From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:24 +0100
Subject: [Buildroot] [PATCH 53/55] board: Add a Qemu PPC g3beige board
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bae547a05389e7d0bd591564dd3cb0c40674e6a4.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/powerpc-g3beige/linux-2.6.36.config |   86 ++++++++++++++++++++++++
 board/qemu/powerpc-g3beige/readme.txt          |    6 ++
 configs/qemu_ppc_g3beige_defconfig             |   15 ++++
 3 files changed, 107 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/powerpc-g3beige/linux-2.6.36.config
 create mode 100644 board/qemu/powerpc-g3beige/readme.txt
 create mode 100644 configs/qemu_ppc_g3beige_defconfig

diff --git a/board/qemu/powerpc-g3beige/linux-2.6.36.config b/board/qemu/powerpc-g3beige/linux-2.6.36.config
new file mode 100644
index 0000000..098dae3
--- /dev/null
+++ b/board/qemu/powerpc-g3beige/linux-2.6.36.config
@@ -0,0 +1,86 @@
+CONFIG_ALTIVEC=y
+CONFIG_EXPERIMENTAL=y
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+CONFIG_LBDAF=y
+CONFIG_PPC_PMAC=y
+CONFIG_PPC_OF_BOOT_TRAMPOLINE=y
+CONFIG_PPC601_SYNC_FIX=y
+CONFIG_HIGHMEM=y
+CONFIG_NO_HZ=y
+CONFIG_BINFMT_ELF=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_PM=y
+CONFIG_SECCOMP=y
+CONFIG_PCCARD=y
+CONFIG_PCMCIA=y
+CONFIG_PCMCIA_LOAD_CIS=y
+CONFIG_PCMCIA_IOCTL=y
+CONFIG_YENTA=y
+CONFIG_ADVANCED_OPTIONS=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_MMAP=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_INET_LRO=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_CONNECTOR=y
+CONFIG_PROC_EVENTS=y
+CONFIG_BLK_DEV=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_IDE=y
+CONFIG_IDE_GD=y
+CONFIG_IDE_GD_ATA=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_PROC_FS=y
+CONFIG_BLK_DEV_CMD64X=y
+CONFIG_BLK_DEV_IDE_PMAC=y
+CONFIG_IEEE1394=y
+CONFIG_IEEE1394_OHCI1394=y
+CONFIG_IEEE1394_ETH1394=y
+CONFIG_IEEE1394_RAWIO=y
+CONFIG_IEEE1394_VIDEO1394=y
+CONFIG_IEEE1394_DV1394=y
+CONFIG_MACINTOSH_DRIVERS=y
+CONFIG_ADB=y
+CONFIG_ADB_CUDA=y
+CONFIG_ADB_PMU=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_MACE=y
+CONFIG_BMAC=y
+CONFIG_HAPPYMEAL=y
+CONFIG_SUNGEM=y
+CONFIG_CASSINI=y
+CONFIG_NET_PCI=y
+CONFIG_PCNET32=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+CONFIG_8139TOO=y
+CONFIG_8139TOO_PIO=y
+CONFIG_SERIO=y
+CONFIG_SERIAL_PMACZILOG=y
+CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_SSB=y
+CONFIG_SSB_PCIHOST=y
+CONFIG_SSB_PCMCIAHOST=y
+CONFIG_SSB_DRIVER_PCICORE=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_SQUASHFS=y
+CONFIG_LIBCRC32C=y
+CONFIG_BOOTX_TEXT=y
+CONFIG_CRYPTO_HW=y
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
new file mode 100644
index 0000000..1006af9
--- /dev/null
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -0,0 +1,6 @@
+Run the emulation with:
+
+  qemu-system-ppc -M g3beige -kernel vmlinux -hda rootfs.ext2 -append "console=ttyS0 root=/dev/hdc" -serial stdio
+
+The login prompt will appear in the terminal that started Qemu. The
+graphical window is the framebuffer.
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
new file mode 100644
index 0000000..8b9212d
--- /dev/null
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -0,0 +1,15 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_440fp=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-2.6.36.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
1.7.0.4
