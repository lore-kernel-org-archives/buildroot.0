Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46508CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 106EB80771;
	Thu,  4 Sep 2025 16:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ru4jqBkFU7fQ; Thu,  4 Sep 2025 16:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE04807BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE04807BA;
	Thu,  4 Sep 2025 16:14:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14F90106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9093280764
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1jp1Kpo2GeJ for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D15580778
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D15580778
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B06987F44; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 35488a2f875a54242105ffc751e661502d5ce78d
X-Git-Newrev: ed5efcf57aa4e7df7d0b7731b568618637fc3510
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.3B06987F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/pcengines_apu2:
 remove defconfig, broken
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed5efcf57aa4e7df7d0b7731b568618637fc3510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274139

It is using the unmaintained, not even LTS 5.16 kernel, which no
longer builds with recent toolchains.

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dpcengines_apu2&kind=BUILD

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274139

Cc: Danilo Bargen <mail@dbrgn.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 3601fb6fef2a1c99dd265d963d046d065b208571)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore               |  1 -
 DEVELOPERS                        |  2 --
 board/pcengines/apu2/isolinux.cfg |  6 -----
 board/pcengines/apu2/linux.config | 51 ---------------------------------------
 board/pcengines/apu2/readme.txt   | 40 ------------------------------
 configs/pcengines_apu2_defconfig  | 17 -------------
 6 files changed, 117 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7457749c62..3ba2dedfad 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -179,7 +179,6 @@ configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
-configs/pcengines_apu2_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_sopine_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index d6f145a8b5..78557bcd65 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -765,8 +765,6 @@ N:	Daniel Sangue <daniel.sangue@sangue.ch>
 F:	package/libftdi1/
 
 N:	Danilo Bargen <mail@dbrgn.ch>
-F:	board/pcengines/apu2/
-F:	configs/pcengines_apu2_defconfig
 F:	package/tealdeer/
 
 N:	Danomi Manchego <danomimanchego123@gmail.com>
diff --git a/board/pcengines/apu2/isolinux.cfg b/board/pcengines/apu2/isolinux.cfg
deleted file mode 100644
index cb19b5a89e..0000000000
--- a/board/pcengines/apu2/isolinux.cfg
+++ /dev/null
@@ -1,6 +0,0 @@
-serial 0 115200
-default 1
-label 1
-      kernel __KERNEL_PATH__
-      initrd __INITRD_PATH__
-      append root=/dev/sr0 console=ttyS0,115200n8
diff --git a/board/pcengines/apu2/linux.config b/board/pcengines/apu2/linux.config
deleted file mode 100644
index 5e3593b018..0000000000
--- a/board/pcengines/apu2/linux.config
+++ /dev/null
@@ -1,51 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_CGROUPS=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SMP=y
-CONFIG_HYPERVISOR_GUEST=y
-CONFIG_PARAVIRT=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_VIRTIO_BLK=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_VIRTIO=y
-CONFIG_ATA=y
-CONFIG_SATA_AHCI=y
-CONFIG_ATA_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-CONFIG_IGB=y
-CONFIG_NE2K_PCI=y
-CONFIG_8139CP=y
-# CONFIG_WLAN is not set
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_VIRTIO_CONSOLE=y
-CONFIG_HW_RANDOM_VIRTIO=m
-CONFIG_DRM=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-# CONFIG_SND_PCI is not set
-CONFIG_USB=y
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_VIRTIO_PCI=y
-CONFIG_VIRTIO_BALLOON=y
-CONFIG_VIRTIO_INPUT=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
-CONFIG_EXT4_FS=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/pcengines/apu2/readme.txt b/board/pcengines/apu2/readme.txt
deleted file mode 100644
index 9da1b802cc..0000000000
--- a/board/pcengines/apu2/readme.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Intro
-=====
-
-This is a board configuration for the apu2 platform by PC Engines.
-
-https://pcengines.ch/apu2.htm
-
-Since the apu2 does not have any graphical output, the default configuration
-will ensure that the kernel output as well as the login prompt will be sent to
-the serial port.
-
-How to build
-============
-
-The provided defconfig creates a hybrid isolinux image that can be booted from
-either an USB stick or a CD.
-
-    $ make pcengines_apu2_defconfig
-    $ make
-
-How to write to an USB stick
-============================
-
-Once the build process is finished you will have an image
-called "rootfs.iso9660" in the output/images/ directory.
-
-Copy the bootable "rootfs.iso9660" onto the USB stick with "dd":
-
-    $ sudo dd if=output/images/rootfs.iso9660 of=/dev/sdX bs=1M conv=fsync
-    $ sudo sync
-
-How to connect to the apu2
-==========================
-
-Connect to the DB9 serial port of the apu2 board (either directly or through a
-USB adapter) with a baudrate of 115200.
-
-For example with miniterm (part of pyserial):
-
-    $ miniterm.py -f direct /dev/ttyUSB0 115200
diff --git a/configs/pcengines_apu2_defconfig b/configs/pcengines_apu2_defconfig
deleted file mode 100644
index b55d55fe2e..0000000000
--- a/configs/pcengines_apu2_defconfig
+++ /dev/null
@@ -1,17 +0,0 @@
-BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
-BR2_TARGET_GENERIC_HOSTNAME="apu2"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_SYSTEM_DHCP="eth0"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
-BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_ISO9660=y
-BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="board/pcengines/apu2/isolinux.cfg"
-BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_SYSLINUX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
