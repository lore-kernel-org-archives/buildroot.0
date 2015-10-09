From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Fri,  9 Oct 2015 18:08:24 +0100
Subject: [Buildroot] [PATCH v3] board: add support for ARM Juno r1
	Development Board
Message-ID: <e5d96cb71e852bcd3b4f0ac9a445a11d82ae7a7a.1444410355.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Juno r1 ARM Development Platform (ADP) is a software development
platform for ARMv8-A, it includes the Juno r1 Versatile Express board 
and an ARMv8-A reference software port available through Linaro.

Remark: The kernel' arm64 defconfig lacks a considerable amount of 
configuration items regarding the Juno r1 board, and that is the reason
of this custom kernel configuration file.


Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
 board/arm/junor1/linux-junor1-defconfig | 176 ++++++++++++++++++++++++++++++++
 board/arm/junor1/readme.txt             |  15 +++
 configs/arm_junor1_defconfig            |  12 +++
 3 files changed, 203 insertions(+)
 create mode 100644 board/arm/junor1/linux-junor1-defconfig
 create mode 100644 board/arm/junor1/readme.txt
 create mode 100644 configs/arm_junor1_defconfig

diff --git a/board/arm/junor1/linux-junor1-defconfig b/board/arm/junor1/linux-junor1-defconfig
new file mode 100644
index 0000000..b216d3e
--- /dev/null
+++ b/board/arm/junor1/linux-junor1-defconfig
@@ -0,0 +1,176 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_FHANDLE=y
+CONFIG_AUDIT=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_TASKSTATS=y
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_MEMCG=y
+CONFIG_MEMCG_SWAP=y
+CONFIG_MEMCG_KMEM=y
+CONFIG_CGROUP_HUGETLB=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_PROFILING=y
+CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_NR_CPUS=6
+CONFIG_PREEMPT=y
+CONFIG_KSM=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_CMA=y
+CONFIG_CMDLINE="console=ttyAMA0"
+CONFIG_COMPAT=y
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_CPUIDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_INTERACTIVE=y
+CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
+CONFIG_ARM_DT_BL_CPUFREQ=y
+CONFIG_ARM_SCPI_CPUFREQ=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_BPF_JIT=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_AHCI_XGENE=y
+CONFIG_PATA_PLATFORM=y
+CONFIG_PATA_OF_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_TUN=y
+CONFIG_VIRTIO_NET=y
+CONFIG_SKY2=y
+CONFIG_SMC91X=y
+CONFIG_SMSC911X=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_XILINX_PS_UART=y
+CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_I2C_SLAVE=y
+CONFIG_SPI=y
+CONFIG_SPI_PL022=y
+CONFIG_PTP_1588_CLOCK=m
+CONFIG_GPIO_PL061=y
+CONFIG_GPIO_XGENE=y
+CONFIG_POWER_RESET_XGENE=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_VEXPRESS=m
+CONFIG_DRM=y
+CONFIG_DRM_I2C_NXP_TDA998X=y
+CONFIG_DRM_ARM=y
+CONFIG_DRM_HDLCD=y
+CONFIG_DRM_VIRTUAL_HDLCD=y
+CONFIG_FB_ARMCLCD=y
+CONFIG_LOGO=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_XHCI_HCD=m
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_DWC3=m
+CONFIG_USB_ISP1760=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_ULPI=y
+CONFIG_USB_GADGET=m
+CONFIG_USB_DUMMY_HCD=m
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_MMC=y
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SPI=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_EFI=y
+CONFIG_RTC_DRV_PL030=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_DMADEVICES=y
+CONFIG_PL330_DMA=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_COMMON_CLK_SCPI=y
+CONFIG_ARM_TIMER_SP804=y
+CONFIG_MAILBOX=y
+CONFIG_ARM_MHU=y
+CONFIG_PHY_XGENE=y
+CONFIG_ARM_SCPI_PROTOCOL=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
+CONFIG_QUOTA=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_CUSE=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_HUGETLBFS=y
+CONFIG_EFIVAR_FS=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_FS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_LOCKUP_DETECTOR=y
+CONFIG_SECURITY=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_ARM64_CRYPTO=y
+CONFIG_CRYPTO_SHA1_ARM64_CE=y
+CONFIG_CRYPTO_SHA2_ARM64_CE=y
+CONFIG_CRYPTO_GHASH_ARM64_CE=y
+CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
+CONFIG_CRYPTO_AES_ARM64_NEON_BLK=y
diff --git a/board/arm/junor1/readme.txt b/board/arm/junor1/readme.txt
new file mode 100644
index 0000000..224078e
--- /dev/null
+++ b/board/arm/junor1/readme.txt
@@ -0,0 +1,15 @@
+This is the support for the ARM Juno r1 development board.
+
+Please follow the following steps to achieve the desired result:
+
+1. Install the root filesystem 
+1.1 The user should format a pen-drive (ext3 is the suggested 
+filesystem type).
+1.2 The user should untar the resulting root filesystem (deployed in 
+output/images/rootfs.tar) targetting the previously prepared pen-drive.
+
+2. Install the kernel image and Device Tree Blob
+2.1 The user should copy the Image file (output/Images/Image) and Device
+Tree Blob (output/build/<linux_folder>/arch/arm64/boot/dts/arm/juno-r1.dtb)
+to the Juno r1 Board
+
diff --git a/configs/arm_junor1_defconfig b/configs/arm_junor1_defconfig
new file mode 100644
index 0000000..fee4efc
--- /dev/null
+++ b/configs/arm_junor1_defconfig
@@ -0,0 +1,12 @@
+BR2_aarch64=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.2.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_TARGET_GENERIC_HOSTNAME="junor1-buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS Juno r1 by Buildroot"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.linaro.org/landing-teams/working/arm/kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="6917b51dee54f21816706af2278517b7af218f9a"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/junor1/linux-junor1-defconfig"
-- 
1.8.1.5
