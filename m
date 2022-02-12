Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCB2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81CB040361;
	Sat, 12 Feb 2022 11:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qnw1EWosmzZI; Sat, 12 Feb 2022 11:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D422409D8;
	Sat, 12 Feb 2022 11:54:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30B691BF3A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9117C81516
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6DLhAAvaxOA for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:54:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A135881759
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:54:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C019A7F960; Sat, 12 Feb 2022 11:46:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 12:51:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37dae0ac31f82d5808c40dafc42267db35cbd262
X-Git-Newrev: a778def2ac28eb7a993a33e51ab305b0c833d713
X-Patchwork-Hint: ignore
Message-Id: <20220212114631.C019A7F960@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/synopsys: remove outdated vdk boards
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a778def2ac28eb7a993a33e51ab305b0c833d713
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove outdated and unused aarch64 and archs38 Synopsys VDK boards.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                     |   5 -
 board/synopsys/vdk/linux-vdk-aarch64-defconfig | 143 -------------------------
 board/synopsys/vdk/readme.txt                  |  65 -----------
 configs/snps_aarch64_vdk_defconfig             |  12 ---
 configs/snps_archs38_vdk_defconfig             |  20 ----
 5 files changed, 245 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index eb073c41f1..689673fce7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -215,7 +215,6 @@ F:	configs/snps_arc700_axs101_defconfig
 F:	configs/snps_archs38_axs103_defconfig
 F:	configs/snps_archs38_haps_defconfig
 F:	configs/snps_archs38_hsdk_defconfig
-F:	configs/snps_archs38_vdk_defconfig
 
 N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
 F:	package/axfsutils/
@@ -1420,10 +1419,6 @@ F:	package/ssdp-responder/
 F:	package/sysklogd/
 F:	package/watchdogd/
 
-N:	Joao Pinto <jpinto@synopsys.com>
-F:	board/synopsys/vdk/
-F:	configs/snps_aarch64_vdk_defconfig
-
 N:	Jochen Baltes <jochen.baltes@gmail.com>
 F:	package/altera-stapl
 
diff --git a/board/synopsys/vdk/linux-vdk-aarch64-defconfig b/board/synopsys/vdk/linux-vdk-aarch64-defconfig
deleted file mode 100644
index 8109e16925..0000000000
--- a/board/synopsys/vdk/linux-vdk-aarch64-defconfig
+++ /dev/null
@@ -1,143 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_CGROUPS=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
-CONFIG_PROFILING=y
-CONFIG_CC_STACKPROTECTOR_REGULAR=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_SMP=y
-CONFIG_SCHED_MC=y
-CONFIG_SCHED_SMT=y
-CONFIG_NR_CPUS=8
-CONFIG_PREEMPT=y
-CONFIG_DEFAULT_MMAP_MIN_ADDR=32768
-CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
-CONFIG_CMDLINE="console=ttyAMA0 earlyprintk=pl011,0x1c090000 debug user_debug=31 loglevel=9 root=/dev/vda"
-CONFIG_CMDLINE_FORCE=y
-CONFIG_BINFMT_MISC=y
-CONFIG_CPU_IDLE=y
-CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
-CONFIG_ARM_DT_BL_CPUFREQ=y
-CONFIG_ARM_SPCI_CPUFREQ=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=y
-CONFIG_NET_KEY=y
-CONFIG_NET_KEY_MIGRATE=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
-CONFIG_SYN_COOKIES=y
-CONFIG_NETWORK_PHY_TIMESTAMPING=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_VEXPRESS_CONFIG=y
-CONFIG_CONNECTOR=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_NBD=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=65536
-CONFIG_VIRTIO_BLK=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_BLK_DEV_DM=y
-CONFIG_NETDEVICES=y
-CONFIG_STMMAC_ETH=m
-CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_MISC=y
-CONFIG_INPUT_UINPUT=y
-CONFIG_SERIO_AMBAKMI=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_VIRTIO_CONSOLE=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_POWER_RESET_VEXPRESS=y
-CONFIG_FB=y
-CONFIG_FB_ARMCLCD=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-CONFIG_USB_HIDDEV=y
-CONFIG_USB=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_HCD_SYNOPSYS=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_NOP_USB_XCEIV=y
-CONFIG_USB_ULPI=y
-CONFIG_USB_DUMMY_HCD=m
-CONFIG_USB_G_SERIAL=m
-CONFIG_MMC=y
-CONFIG_MMC_ARMMMCI=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_ONESHOT=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_LEDS_TRIGGER_BACKLIGHT=y
-CONFIG_LEDS_TRIGGER_CPU=y
-CONFIG_LEDS_TRIGGER_GPIO=y
-CONFIG_SWITCH=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_PL031=y
-CONFIG_VIRTIO_BALLOON=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
-CONFIG_COMMON_CLK_VERSATILE=y
-CONFIG_CLK_SP810=y
-CONFIG_CLK_VEXPRESS_OSC=y
-CONFIG_COMMON_CLK_SCPI=y
-CONFIG_MAILBOX=y
-CONFIG_ARM_SCPI_PROTOCOL=y
-CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_BTRFS_FS=m
-CONFIG_QFMT_V2=y
-CONFIG_AUTOFS4_FS=m
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_HUGETLBFS=m
-CONFIG_ECRYPT_FS=m
-CONFIG_CRAMFS=m
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_VIRTUALIZATION=y
-CONFIG_KVM=y
-CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_SCHEDSTATS=y
-CONFIG_TIMER_STATS=y
-CONFIG_FUNCTION_TRACER=y
-CONFIG_STRICT_DEVMEM=y
-CONFIG_SECURITY=y
-CONFIG_SECURITY_NETWORK_XFRM=y
-CONFIG_LSM_MMAP_MIN_ADDR=0
-
diff --git a/board/synopsys/vdk/readme.txt b/board/synopsys/vdk/readme.txt
deleted file mode 100644
index 9804647340..0000000000
--- a/board/synopsys/vdk/readme.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Synopsys VDK Software Development Platform
-
-Intro
-=====
-
-The Virtualizer Development Kit (VDK) Family for ARM Cortex Products
-consists of a set of virtual prototypes that provide a virtualizer for
-the ARM core variants. The VDK is a standalone package that runs on an
-host computer.
-
-Buildroot will generate the kernel image and a minimal root filesystem.
-
-How to build it
-===============
-
-Configure Buildroot
--------------------
-
-Configuring Buildroot is pretty simple, just execute:
-
-  $ make snps_aarch64_vdk_defconfig
-
-Build the rootfs and kernel
----------------------------
-
-Note: you will need to have access to the network, since Buildroot will
-download the packages' sources.
-
-You may now build your rootfs with:
-
-  $ make
-
-(This may take a while)
-
-Result of the build
--------------------
-
-After building, you should obtain this tree:
-
-    output/images/
-    -- rootfs.ext2
-    -- Image
-
-Installing your rootfs and Image
-================================
-
-Now copy the content of the output/images folder to the VDK' skins
-folder:
-
-   $ cp rootfs.ext2 Image <vdk_installation_path>/skins/Vanilla-Cortex/ARMv8
-
-
-Starting the VDK
-================================
-
-Go the VDK' installation root and execute the 'start' script:
-
-   $ cd <vdk_installation_path>
-   $ ./start.sh
-
-The VP Explorer application will be executed, starting the simulation
-automatically.
-
-For more information about Synopsys' VDK please check:
-http://www.synopsys.com/Prototyping/VirtualPrototyping/Pages/default.aspx
diff --git a/configs/snps_aarch64_vdk_defconfig b/configs/snps_aarch64_vdk_defconfig
deleted file mode 100644
index b55dce1ad6..0000000000
--- a/configs/snps_aarch64_vdk_defconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
-BR2_TARGET_GENERIC_HOSTNAME="vdk-buildroot"
-BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS VDK by Buildroot"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/synopsys/vdk/linux-vdk-aarch64-defconfig"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
deleted file mode 100644
index 8d8e9f7559..0000000000
--- a/configs/snps_archs38_vdk_defconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-# Architecture
-BR2_arcle=y
-BR2_archs38=y
-
-# System
-BR2_TARGET_GENERIC_HOSTNAME="archs38_vdk"
-BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
-BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
-BR2_LINUX_KERNEL_VMLINUX=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
