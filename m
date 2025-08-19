Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B98CA0EED
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 10:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B85E407B3;
	Tue, 19 Aug 2025 10:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kthh_unjRN1X; Tue, 19 Aug 2025 10:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D93F409C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D93F409C7;
	Tue, 19 Aug 2025 10:09:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90853E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72EED409C7
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbOjwAvfGZ-a for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 10:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63B5C407B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63B5C407B3
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63B5C407B3
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:09:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 668401A0B85
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:09:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4098B60697;
 Tue, 19 Aug 2025 10:09:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 294DE1C22C587; 
 Tue, 19 Aug 2025 12:09:00 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danilo Bargen <mail@dbrgn.ch>
Date: Tue, 19 Aug 2025 12:08:57 +0200
Message-ID: <20250819100858.3317240-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755598143; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=cXKDpRk7zS1MWPfcusIyXmuwMDVE5M85Q1EEZmAxLWg=;
 b=HDC6MxeLIPmRTFddVWMJ6h3RJ5ZjuL+yrXOrq96CUx9ImWzrh976z2eEB2ehLz0VM8MROx
 1QDjGlcRm1YRi+qkpEBw/MLXd0xko1sBne429iXo0XVABQhFN3Wu6zV1+6nLH/XtzzcTpH
 LegLcHQoEPna7sYpxRiYkc+1t05K79GblWG8PFdMUo8Ogex2bQ3fATfcUbT6nrPRAvCm5I
 YwqL2VltOZj0Nlj5yNH/eQtCET5qhEVoDJad/An6swHakGMD6KbpZIoCezEiozrscdnNV4
 vBb6k2uCrL8PclmBSVRbFNXhIxOKuzVK+mBn4XoHtnGFyGBgK9xjAGZ42u7JQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HDC6MxeL
Subject: [Buildroot] [PATCH] configs/pcengines_apu2: remove defconfig, broken
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .checkpackageignore               |  1 -
 DEVELOPERS                        |  2 --
 board/pcengines/apu2/isolinux.cfg |  6 ----
 board/pcengines/apu2/linux.config | 51 -------------------------------
 board/pcengines/apu2/readme.txt   | 40 ------------------------
 configs/pcengines_apu2_defconfig  | 17 -----------
 6 files changed, 117 deletions(-)
 delete mode 100644 board/pcengines/apu2/isolinux.cfg
 delete mode 100644 board/pcengines/apu2/linux.config
 delete mode 100644 board/pcengines/apu2/readme.txt
 delete mode 100644 configs/pcengines_apu2_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index ccc58d0be8..93f36640b3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -164,7 +164,6 @@ configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
-configs/pcengines_apu2_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_sopine_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 242179d803..38dc7ab074 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -776,8 +776,6 @@ N:	Daniel Sangue <daniel.sangue@sangue.ch>
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
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
