From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:38 +0100
Subject: [Buildroot] [PATCH 14/15] board: add support for the MinnowBoard
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384188459-1332-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/minnowboard/grub.cfg         |   6 ++
 board/minnowboard/linux-3.8.config | 172 +++++++++++++++++++++++++++++++++++++
 board/minnowboard/post-build.sh    |   2 +
 board/minnowboard/readme.txt       |  40 +++++++++
 configs/minnowboard_defconfig      |  12 +++
 5 files changed, 232 insertions(+)
 create mode 100644 board/minnowboard/grub.cfg
 create mode 100644 board/minnowboard/linux-3.8.config
 create mode 100755 board/minnowboard/post-build.sh
 create mode 100644 board/minnowboard/readme.txt
 create mode 100644 configs/minnowboard_defconfig

diff --git a/board/minnowboard/grub.cfg b/board/minnowboard/grub.cfg
new file mode 100644
index 0000000..33a0f4a
--- /dev/null
+++ b/board/minnowboard/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /bzImage root=/dev/mmcblk0p2 rootwait console=ttyPCH0,115200
+}
diff --git a/board/minnowboard/linux-3.8.config b/board/minnowboard/linux-3.8.config
new file mode 100644
index 0000000..460aa2d
--- /dev/null
+++ b/board/minnowboard/linux-3.8.config
@@ -0,0 +1,172 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_RCU_FANOUT=32
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_DEBUG=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_RESOURCE_COUNTERS=y
+CONFIG_MEMCG=y
+CONFIG_MEMCG_SWAP=y
+CONFIG_MEMCG_KMEM=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_BLK_CGROUP=y
+CONFIG_NAMESPACES=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EMBEDDED=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=y
+CONFIG_KPROBES=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_SMP=y
+CONFIG_MATOM=y
+CONFIG_SCHED_SMT=y
+CONFIG_PREEMPT=y
+CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
+CONFIG_X86_CHECK_BIOS_CORRUPTION=y
+# CONFIG_MTRR_SANITIZER is not set
+CONFIG_EFI=y
+CONFIG_EFI_STUB=y
+CONFIG_HZ_1000=y
+CONFIG_PM_RUNTIME=y
+CONFIG_PM_DEBUG=y
+CONFIG_PM_ADVANCED_DEBUG=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_X86_ACPI_CPUFREQ=y
+CONFIG_INTEL_IDLE=y
+CONFIG_PCI_MMCONFIG=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_MSI=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM_SUB_POLICY=y
+CONFIG_NET_KEY_MIGRATE=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER=m
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_CRYPTOLOOP=m
+CONFIG_BLK_DEV_RAM=y
+CONFIG_PCH_PHUB=m
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=m
+CONFIG_NETCONSOLE=y
+CONFIG_TUN=m
+CONFIG_PCH_GBE=m
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO_POLLED=y
+# CONFIG_MOUSE_PS2 is not set
+# CONFIG_SERIO_I8042 is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_PCH_UART=y
+CONFIG_SERIAL_PCH_UART_CONSOLE=y
+CONFIG_GEN_RTC=y
+CONFIG_GEN_RTC_X=y
+CONFIG_HPET=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_EG20T=m
+CONFIG_SPI=y
+CONFIG_SPI_GPIO=m
+CONFIG_SPI_TOPCLIFF_PCH=m
+CONFIG_SPI_SPIDEV=m
+CONFIG_GPIOLIB=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_GPIO_SCH=y
+CONFIG_GPIO_PCH=y
+CONFIG_WATCHDOG=y
+CONFIG_SOFT_WATCHDOG=m
+CONFIG_AGP=m
+CONFIG_DRM=m
+CONFIG_FB=y
+CONFIG_FB_EFI=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
+CONFIG_SOUND=m
+CONFIG_SND=m
+CONFIG_SND_HDA_INTEL=m
+CONFIG_USB=y
+CONFIG_USB_SUSPEND=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_GADGET=m
+CONFIG_USB_EG20T=m
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PCI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=y
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_DMADEVICES=y
+CONFIG_PCH_DMA=y
+CONFIG_MINNOWBOARD=y
+CONFIG_MINNOWBOARD_GPIO=m
+CONFIG_MINNOWBOARD_KEYS=m
+CONFIG_EFI_VARS=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_FANOTIFY=y
+CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
+CONFIG_ISO9660_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_CONFIGFS_FS=m
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_PRINTK_TIME=y
+CONFIG_FRAME_WARN=1024
+CONFIG_TIMER_STATS=y
+CONFIG_LATENCYTOP=y
+CONFIG_BLK_DEV_IO_TRACE=y
diff --git a/board/minnowboard/post-build.sh b/board/minnowboard/post-build.sh
new file mode 100755
index 0000000..e3f4a92
--- /dev/null
+++ b/board/minnowboard/post-build.sh
@@ -0,0 +1,2 @@
+#!/bin/sh
+cp board/minnowboard/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/minnowboard/readme.txt b/board/minnowboard/readme.txt
new file mode 100644
index 0000000..28ae1cd
--- /dev/null
+++ b/board/minnowboard/readme.txt
@@ -0,0 +1,40 @@
+Prepare the SD card for the Minnow Board
+========================================
+
+ 1. Partition the SD card with a GPT partition table
+
+    sudo cgdisk /dev/mmcblk0
+
+    Create two partitions:
+
+     a) First partition of a few dozens of megabytes, which will be
+     	used to store the bootloader and the kernel image. Type must
+     	be EF00 (EFI partition).
+
+     b) Second partition of any size, which will be used to store the
+        root filesystem. Type must be 8300 (Linux filesystem)
+
+ 2. Prepare the boot partition
+
+    We will format it, mount it, copy the EFI data generated by
+    Buildroot, and the kernel image.
+
+    sudo mkfs.vfat -F 32 -n boot /dev/mmcblk0p1
+    sudo mount /dev/mmcblk0p1 /mnt
+    sudo cp -a output/images/efi-part/* /mnt/
+    sudo cp output/images/bzImage /mnt/
+    sudo umount /mnt
+
+ 3. Prepare the root partition
+
+    We will format it, mount it, and extract the root filesystem.
+
+    sudo mkfs.ext3 -L root /dev/mmcblk0p2
+    sudo mount /dev/mmcblk0p2 /mnt
+    sudo tar -C /mnt -xf output/images/rootfs.tar
+    sudo umount /mnt
+
+ 4. Enjoy
+
+Additional informations about this board can be found at
+http://www.minnowboard.org/.
diff --git a/configs/minnowboard_defconfig b/configs/minnowboard_defconfig
new file mode 100644
index 0000000..ce4a1b1
--- /dev/null
+++ b/configs/minnowboard_defconfig
@@ -0,0 +1,12 @@
+BR2_x86_64=y
+BR2_x86_atom=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyPCH0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.yoctoproject.org/linux-yocto-3.8"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ba1587b9b62c801d161897303aa6d22809485f9b"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-3.8.config"
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_I386_EFI=y
-- 
1.8.1.2
