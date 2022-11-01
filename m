Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D294C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE8CE408AC;
	Tue,  1 Nov 2022 22:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE8CE408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgtiMWU8090Z; Tue,  1 Nov 2022 22:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4006940AB9;
	Tue,  1 Nov 2022 22:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4006940AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A50831BF5DE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B58560E2F
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B58560E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-6DUF2yJo8M for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:04:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0442A60881
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0442A60881
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:03:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 24027C0009;
 Tue,  1 Nov 2022 22:03:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:03:34 +0100
Message-Id: <20221101220354.403933-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667340238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drBmWwf1oabdmVHO8kTKnCL/ZV3alfHbGg4eV6tno8s=;
 b=lpoctsY2h1+BhwXPzbjbu8Pj28Q8bh/gHsnYmiwCv3IqV4rcOBmKo4DQWdiD68J/Yl2xs/
 CA2XQWcK3fRe9d8bkbwKfvFQbRL65H+IRiLY3HJlpxBYlcbwErrV6NyZOGilPXYl1uw4O4
 LIVxDzuSQ0EuUocjGlcA6gGIUrOP5AtmLjIMbAJhhXoUjY31BYlO7XfkU92Twu9ebyWZVo
 PAZq8d38AT38g+r8m07pFfDOFCAJYUCkOSRbzbebddny1miGYhrMh6k6zkZeLA3FcHBiRG
 4m/QB5X1JOsx8tmh8u9a1c9sdXWs0LYrPSHOvcSrPrKZQWTgXmW81qgFfotCMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lpoctsY2
Subject: [Buildroot] [PATCH 02/21] configs/arm_juno: remove defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234498972

Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                          |   4 -
 board/arm/juno/linux-juno-defconfig | 169 ----------------------------
 board/arm/juno/readme.txt           | 134 ----------------------
 configs/arm_juno_defconfig          |  23 ----
 4 files changed, 330 deletions(-)
 delete mode 100644 board/arm/juno/linux-juno-defconfig
 delete mode 100644 board/arm/juno/readme.txt
 delete mode 100644 configs/arm_juno_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 15aa440c72..3e03dd51f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1226,10 +1226,6 @@ F:	support/testing/tests/package/test_python_scipy.py
 N:	Gustavo Heinz <gustavo@gsthnz.com>
 F:	package/python-m2crypto/
 
-N:	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
-F:	configs/arm_juno_defconfig
-F:	board/arm/juno/
-
 N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 F:	board/terasic/de10nano_cyclone5/
 F:	configs/terasic_de10nano_cyclone5_defconfig
diff --git a/board/arm/juno/linux-juno-defconfig b/board/arm/juno/linux-juno-defconfig
deleted file mode 100644
index 64598d21a1..0000000000
--- a/board/arm/juno/linux-juno-defconfig
+++ /dev/null
@@ -1,169 +0,0 @@
-CONFIG_SMP=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
-CONFIG_AUDIT=y
-CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_BSD_PROCESS_ACCT_V3=y
-CONFIG_TASKSTATS=y
-CONFIG_TASK_DELAY_ACCT=y
-CONFIG_TASK_XACCT=y
-CONFIG_TASK_IO_ACCOUNTING=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
-CONFIG_MEMCG_KMEM=y
-CONFIG_CGROUP_HUGETLB=y
-CONFIG_SCHED_AUTOGROUP=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_PROFILING=y
-CONFIG_JUMP_LABEL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_ARCH_VEXPRESS=y
-CONFIG_PCI=y
-CONFIG_PCI_MSI=y
-CONFIG_PCI_HOST_GENERIC=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_HOTPLUG_PCI_PCIE=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_NR_CPUS=6
-CONFIG_PREEMPT=y
-CONFIG_KSM=y
-CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_CMA=y
-CONFIG_CMDLINE="console=ttyAMA0"
-CONFIG_COMPAT=y
-CONFIG_CPU_IDLE=y
-CONFIG_ARM_CPUIDLE=y
-CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-CONFIG_CPU_FREQ_GOV_INTERACTIVE=y
-CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
-CONFIG_ARM_DT_BL_CPUFREQ=y
-CONFIG_ARM_SCPI_CPUFREQ=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_BPF_JIT=y
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_SATA_AHCI=y
-CONFIG_SATA_AHCI_PLATFORM=y
-CONFIG_AHCI_XGENE=y
-CONFIG_PATA_PLATFORM=y
-CONFIG_PATA_OF_PLATFORM=y
-CONFIG_NETDEVICES=y
-CONFIG_TUN=y
-CONFIG_SKY2=y
-CONFIG_SMC91X=y
-CONFIG_SMSC911X=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIO_AMBAKMI=y
-CONFIG_LEGACY_PTY_COUNT=16
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_XILINX_PS_UART=y
-CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
-CONFIG_I2C_SLAVE=y
-CONFIG_SPI=y
-CONFIG_SPI_PL022=y
-CONFIG_PTP_1588_CLOCK=m
-CONFIG_GPIO_PL061=y
-CONFIG_GPIO_XGENE=y
-CONFIG_POWER_RESET_XGENE=y
-CONFIG_POWER_RESET_SYSCON=y
-CONFIG_REGULATOR=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_REGULATOR_VEXPRESS=m
-CONFIG_DRM=y
-CONFIG_DRM_I2C_NXP_TDA998X=y
-CONFIG_DRM_ARM=y
-CONFIG_DRM_HDLCD=y
-CONFIG_DRM_VIRTUAL_HDLCD=y
-CONFIG_FB_ARMCLCD=y
-CONFIG_LOGO=y
-CONFIG_USB=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_HCD_PLATFORM=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_HCD_PLATFORM=y
-CONFIG_USB_STORAGE=y
-CONFIG_USB_ISP1760=y
-CONFIG_NOP_USB_XCEIV=y
-CONFIG_USB_ULPI=y
-CONFIG_MMC=y
-CONFIG_MMC_ARMMMCI=y
-CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_MMC_SPI=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_EFI=y
-CONFIG_RTC_DRV_PL030=y
-CONFIG_RTC_DRV_PL031=y
-CONFIG_DMADEVICES=y
-CONFIG_PL330_DMA=y
-CONFIG_COMMON_CLK_SCPI=y
-CONFIG_ARM_TIMER_SP804=y
-CONFIG_MAILBOX=y
-CONFIG_ARM_MHU=y
-CONFIG_PHY_XGENE=y
-CONFIG_ARM_SCPI_PROTOCOL=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_FANOTIFY=y
-CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
-CONFIG_QUOTA=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_FUSE_FS=y
-CONFIG_CUSE=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_HUGETLBFS=y
-CONFIG_EFIVAR_FS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_VIRTUALIZATION=y
-CONFIG_KVM=y
-CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_LOCKUP_DETECTOR=y
-CONFIG_SECURITY=y
-CONFIG_CRYPTO_ANSI_CPRNG=y
-CONFIG_ARM64_CRYPTO=y
-CONFIG_CRYPTO_SHA1_ARM64_CE=y
-CONFIG_CRYPTO_SHA2_ARM64_CE=y
-CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
-CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_SOC=y
-CONFIG_SND_SIMPLE_CARD=y
-CONFIG_SND_DESIGNWARE_I2S=y
-CONFIG_CMA=y
-CONFIG_CMA_SIZE_MBYTES=64
diff --git a/board/arm/juno/readme.txt b/board/arm/juno/readme.txt
deleted file mode 100644
index b292d9636d..0000000000
--- a/board/arm/juno/readme.txt
+++ /dev/null
@@ -1,134 +0,0 @@
-ARM Juno r1/r0
-
-Intro
-=====
-
-These instructions apply to all models of the ARM Juno:
-  - Juno r0 (does not support PCIe)
-  - Juno r1 (supports PCIe)
-  - Juno r2 (Big Cluster with A72)
-
-Buildroot will generate the kernel image, device tree blob, bootloader binaries
-and a minimal root filesystem.
-
-How to build it
-===============
-
-Configure Buildroot
--------------------
-
-Configuring Buildroot is pretty simple, just execute:
-
-  $ make arm_juno_defconfig
-
-Build the rootfs, kernel and DTB
---------------------------------
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
-    +-- rootfs.tar
-    +-- juno.dtb (if Juno r0 is used)
-    +-- juno-r1.dtb (if Juno r1 is used)
-    +-- juno-r2.dtb (if Juno r2 is used)
-    +-- Image
-    +-- bl1.bin
-    +-- bl2.bin
-    +-- bl2u.bin
-    +-- bl31.bin
-    +-- fip.bin
-    +-- scp-fw.bin
-    +-- u-boot.bin
-
-Preparing your rootfs
-======================
-
-Format your pen drive as a ext3 filesystem by executing:
-
-   $ mkfs.ext3 /dev/<your device>
-
-Preparing your rootfs
-======================
-
-Format your pen drive as a ext3 filesystem by executing:
-
-   $ mkfs.ext3 /dev/<your device>
-
-Installing your rootfs
-======================
-
-After mounting the pen drive please execute the following:
-
-   $ sudo tar -xvf output/images/rootfs.tar -C <pen drive mount path>
-
-When completed make sure to unmount the device:
-
-   $ umount <pen drive mount path>
-
-Insert the pen drive in one of the ARM Juno' USB type A connectors.
-
-Configure *.dtb in the boot configuration for Juno r0
-=====================================================
-
-SITE1/HBI0262B/images.txt
-.....
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x00C00000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno.dtb     ;Image File Name
-NOR3NAME: board.dtb              ;Specify Image name to preserve file extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-......
-
-Configure *.dtb in the boot configuration for Juno r1
-=====================================================
-
-SITE1/HBI0262C/images.txt
-......
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x00C00000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-r1.dtb  ;Image File Name
-NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-......
-
-Configure *.dtb in the boot configuration for Juno r2
-=====================================================
-
-SITE1/HBI0262D/images.txt
-......
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02000000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
-NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-......
-
-Installing kernel image and DTB
-===============================
-
-1. Connect to the ARM Juno UART0 and execute USB_ON in the terminal
-2. Connect a USB cable between your PC and ARM Juno USB type B connector
-   A mass storage device should appear in your desktop.
-3. Open the software/ folder
-4. Copy the 'Image' file to software/
-5. Copy the 'juno-r1.dtb' (r1), 'juno.dtb' (r0) or juno-r2.dtb (r2) file to software/
-6. Copy the bootloader binaries (bl1.bin and fip.bin) to software/
-7. Press the red button in the front pannel of ARM Juno
-
-At this time, the board will erase the Flash entry for each new item and
-replace it with the lastest ones.
diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
deleted file mode 100644
index 5832986779..0000000000
--- a/configs/arm_juno_defconfig
+++ /dev/null
@@ -1,23 +0,0 @@
-BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
-BR2_TARGET_GENERIC_HOSTNAME="juno-buildroot"
-BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS Juno by Buildroot"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1 arm/juno-r2"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.4"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
-BR2_TARGET_VEXPRESS_FIRMWARE=y
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
