From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Thu, 22 Oct 2015 12:01:18 +0100
Subject: [Buildroot] [PATCH v6] board: add support for Synopsys VDK Software
	Development Platform
Message-ID: <28a76c89b596d02f7d5b2e8ccfee2d82cfe00569.1445511464.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Virtualizer Development Kit (VDK) Family for ARM Cortex Products
consists of a set of virtual prototypes that provide a virtualizer for 
the ARM core variants. The VDK is a standalone package that runs on an 
host computer.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---

Change v5 -> v6:
 - Remove options from the VDK defconfig (Arnaut Vandecappelle)
 - Filesystem packages as modules (Arnaut Vandecappelle)
 - New readme.txt (Arnaut Vandecappelle)
 - Added BR2_TARGET_ROOTFS_EXT2_4 to the buildroot' defconfig (Arnaut Vandecappelle)
Change v4 -> v5:
 - Changelog format, minimal defconfig (Yann E. MORIN)
Change v3 -> v4:
 - drop 'Image' boot option (Thomas Petazzoni)
Change v2 -> v3:
 - kernel defconfig was not generated properly (Thomas Petazzoni)

 board/synopsys/vdk/linux-vdk-aarch64-defconfig | 143 +++++++++++++++++++++++++
 board/synopsys/vdk/readme.txt                  |  64 +++++++++++
 configs/snps_aarch64_vdk_defconfig             |  16 +++
 3 files changed, 223 insertions(+)
 create mode 100644 board/synopsys/vdk/linux-vdk-aarch64-defconfig
 create mode 100644 board/synopsys/vdk/readme.txt
 create mode 100644 configs/snps_aarch64_vdk_defconfig

diff --git a/board/synopsys/vdk/linux-vdk-aarch64-defconfig b/board/synopsys/vdk/linux-vdk-aarch64-defconfig
new file mode 100644
index 0000000..8109e16
--- /dev/null
+++ b/board/synopsys/vdk/linux-vdk-aarch64-defconfig
@@ -0,0 +1,143 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_PROFILING=y
+CONFIG_CC_STACKPROTECTOR_REGULAR=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_SMP=y
+CONFIG_SCHED_MC=y
+CONFIG_SCHED_SMT=y
+CONFIG_NR_CPUS=8
+CONFIG_PREEMPT=y
+CONFIG_DEFAULT_MMAP_MIN_ADDR=32768
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
+CONFIG_CMDLINE="console=ttyAMA0 earlyprintk=pl011,0x1c090000 debug user_debug=31 loglevel=9 root=/dev/vda"
+CONFIG_CMDLINE_FORCE=y
+CONFIG_BINFMT_MISC=y
+CONFIG_CPU_IDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
+CONFIG_ARM_DT_BL_CPUFREQ=y
+CONFIG_ARM_SPCI_CPUFREQ=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM_USER=y
+CONFIG_NET_KEY=y
+CONFIG_NET_KEY_MIGRATE=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_SYN_COOKIES=y
+CONFIG_NETWORK_PHY_TIMESTAMPING=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VEXPRESS_CONFIG=y
+CONFIG_CONNECTOR=m
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_VIRTIO_BLK=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=m
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_UINPUT=y
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_POWER_RESET_VEXPRESS=y
+CONFIG_FB=y
+CONFIG_FB_ARMCLCD=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+CONFIG_USB_HIDDEV=y
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_SYNOPSYS=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_ULPI=y
+CONFIG_USB_DUMMY_HCD=m
+CONFIG_USB_G_SERIAL=m
+CONFIG_MMC=y
+CONFIG_MMC_ARMMMCI=y
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
+CONFIG_SWITCH=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_COMMON_CLK_VERSATILE=y
+CONFIG_CLK_SP810=y
+CONFIG_CLK_VEXPRESS_OSC=y
+CONFIG_COMMON_CLK_SCPI=y
+CONFIG_MAILBOX=y
+CONFIG_ARM_SCPI_PROTOCOL=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_BTRFS_FS=m
+CONFIG_QFMT_V2=y
+CONFIG_AUTOFS4_FS=m
+CONFIG_MSDOS_FS=m
+CONFIG_VFAT_FS=m
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=m
+CONFIG_ECRYPT_FS=m
+CONFIG_CRAMFS=m
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_SCHEDSTATS=y
+CONFIG_TIMER_STATS=y
+CONFIG_FUNCTION_TRACER=y
+CONFIG_STRICT_DEVMEM=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK_XFRM=y
+CONFIG_LSM_MMAP_MIN_ADDR=0
+
diff --git a/board/synopsys/vdk/readme.txt b/board/synopsys/vdk/readme.txt
new file mode 100644
index 0000000..9601547
--- /dev/null
+++ b/board/synopsys/vdk/readme.txt
@@ -0,0 +1,64 @@
+Synopsys VDK Software Development Platform
+
+Intro
+=====
+
+The Virtualizer Development Kit (VDK) Family for ARM Cortex Products
+consists of a set of virtual prototypes that provide a virtualizer for 
+the ARM core variants. The VDK is a standalone package that runs on an 
+host computer.
+
+Buildroot will generate the kernel image and a minimal root filesystem.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+Configuring Buildroot is pretty simple, just execute:
+
+  $ make snps_aarch64_vdk_defconfig
+
+Build the rootfs and kernel
+---------------------------
+
+Note: you will need to have access to the network, since Buildroot will
+download the packages' sources.
+
+You may now build your rootfs with:
+
+  $ make
+
+(This may take a while)
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    -- rootfs.ext2
+    -- Image
+
+Installing your rootfs and Image
+================================
+Now copy the content of the output/images folder to the VDK' skins folder:
+
+   $ cp rootfs.ext2 Image <vdk_installation_path>/skins/Vanilla-Cortex/ARMv8
+
+
+Starting the VDK
+================================
+Go the VDK' installation root and execute the 'start' script:
+
+   $ cd <vdk_installation_path>
+   $ ./start.sh
+
+The VP Explorer application will be executed, starting the simulation
+automatically.
+
+For more information about Synopsys' VDK please check:
+http://www.synopsys.com/Prototyping/VirtualPrototyping/Pages/default.aspx
+
+
diff --git a/configs/snps_aarch64_vdk_defconfig b/configs/snps_aarch64_vdk_defconfig
new file mode 100644
index 0000000..982158e
--- /dev/null
+++ b/configs/snps_aarch64_vdk_defconfig
@@ -0,0 +1,16 @@
+BR2_aarch64=y
+BR2_KERNEL_HEADERS_3_18=y
+BR2_TARGET_GENERIC_HOSTNAME="vdk-buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS VDK by Buildroot"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/kernel/linux-linaro-tracking.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-3.18-2014.12"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/synopsys/vdk/linux-vdk-aarch64-defconfig"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
-- 
1.8.1.5
