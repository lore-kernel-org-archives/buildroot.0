Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6FCE7DEF8
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBAD840BE1;
	Mon,  2 Feb 2026 15:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xO9GOJJObD4; Mon,  2 Feb 2026 15:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F5EC40B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770046828;
	bh=iGLO93lCWYqvyY+VdtO9yzxZ0LcOeK52n9eUge8F7nc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rzBz1sJHE+UL6cFsqOvMxTd9pf4IkHZytadubVeX8sBpue9s2IYyTTPrkwWDk5FZJ
	 RIPJM5zteBnaHD9ryy3fOpPObWj4k8w2bKcYe2eQQNPTf5fBxEZe6s7MSN992nPk6/
	 vzhTaEzK1Gg3I1uAKdxitVkmJCig7Reoer3S0Tc2xoNZwBBLa02xVKsRJ/H7886GQe
	 dCa0cuIuRPW84eN5Qxw2qso9YbOBhlnwj57PoKMxt4XQLVngdJBkVhEIHuLotGij+G
	 b4NuT5xtauRcSoEXbd3+8GAmINAOm5+HMlOowhwOrnEiFncWAc6DML9ab9SPwXl7kk
	 JS01qCQlFYa7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5EC40B11;
	Mon,  2 Feb 2026 15:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 050D71E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4893F40660
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUyis5HGdhYe for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4424B407BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4424B407BB
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C484863A4; Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 16:21:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8538604cc806ce5486cef13f8d2f372c8f112e38
X-Git-Newrev: 1a6e81fa13b8c36fc743a358773bbeebcbed0c92
X-Patchwork-Hint: ignore
Message-Id: <20260202154017.2C484863A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hp_9000: new defconfig
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5838575614708303080=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5838575614708303080==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1a6e81fa13b8c36fc743a358773bbeebcbed0c92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig to run Linux on a large range of 32-bit HP PA-RISC 1.1
Workstations, such as the HP 9000 700 and Visualize workstations.

While at it, add this defconfig to myself in DEVELOPERS.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 board/hp/9000/genimage.cfg.in                      | 16 ++++++
 board/hp/9000/palo.sh.in                           | 21 ++++++++
 .../9000/patches/linux-headers/linux-headers.hash  |  1 +
 board/hp/9000/patches/linux/linux.hash             |  2 +
 board/hp/9000/post-image.sh                        | 16 ++++++
 board/hp/9000/readme.txt                           | 57 ++++++++++++++++++++++
 configs/hp_9000_defconfig                          | 20 ++++++++
 8 files changed, 135 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 703f5c345c..2a81272d20 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3372,10 +3372,12 @@ F:	arch/Config.in.hppa
 F:	arch/arch.mk.hppa
 F:	board/arm/foundation-v8/
 F:	board/bananapi/bananapi-m2-zero/
+F:	board/hp/9000/
 F:	board/qemu/hppa-b160l/
 F:	boot/palo/
 F:	configs/arm_foundationv8_defconfig
 F:	configs/bananapi_m2_zero_defconfig
+F:	configs/hp_9000_defconfig
 F:	configs/qemu_hppa_b160l_defconfig
 F:	configs/uevm5432_defconfig
 F:	package/i7z/
diff --git a/board/hp/9000/genimage.cfg.in b/board/hp/9000/genimage.cfg.in
new file mode 100644
index 0000000000..5a59307552
--- /dev/null
+++ b/board/hp/9000/genimage.cfg.in
@@ -0,0 +1,16 @@
+image disk.img {
+	hdimage {
+		partition-table-type = "mbr"
+		disk-signature = 0x%PARTUUID%
+	}
+
+	partition boot {
+		partition-type= 0xF0
+		size = 16M
+	}
+
+	partition root {
+		partition-type= 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/hp/9000/palo.sh.in b/board/hp/9000/palo.sh.in
new file mode 100644
index 0000000000..9743111bc8
--- /dev/null
+++ b/board/hp/9000/palo.sh.in
@@ -0,0 +1,21 @@
+#!/bin/sh
+set -eu
+
+# Generate lifimage.
+palo \
+	--bootloader="${BINARIES_DIR}/iplboot" \
+	--commandline='0/vmlinux initrd=0/ramdisk' \
+	--configfile=/dev/null \
+	--init-tape="${BINARIES_DIR}/lifimage" \
+	--ramdisk="${BINARIES_DIR}/rootfs.cpio.gz" \
+	--recoverykernel="${BINARIES_DIR}/vmlinux" \
+	--verbose
+
+# Install loader to disk image.
+palo \
+	--bootloader="${BINARIES_DIR}/iplboot" \
+	--commandline="1/vmlinux root=PARTUUID=%PARTUUID%-02 rootwait" \
+	--configfile=/dev/null \
+	--init-partitioned="${BINARIES_DIR}/disk.img" \
+	--recoverykernel="${BINARIES_DIR}/vmlinux" \
+	--verbose
diff --git a/board/hp/9000/patches/linux-headers/linux-headers.hash b/board/hp/9000/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/hp/9000/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/hp/9000/patches/linux/linux.hash b/board/hp/9000/patches/linux/linux.hash
new file mode 100644
index 0000000000..e05e102f0e
--- /dev/null
+++ b/board/hp/9000/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  76bffbae7eab2a1de1ed05692bef709f43b02a52fe95ae655cacf0fa252213f3  linux-6.16.5.tar.xz
diff --git a/board/hp/9000/post-image.sh b/board/hp/9000/post-image.sh
new file mode 100755
index 0000000000..e489e0bf9e
--- /dev/null
+++ b/board/hp/9000/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+set -eu
+
+BOARD_DIR="$(dirname "$0")"
+
+# Generate a random 32-bit signature for the disk image and
+# substitute it in genimage configuration file and palo script.
+PARTUUID="$("$HOST_DIR"/bin/uuidgen -r |sed 's/-.*//')"
+
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg.in" \
+	> "$BINARIES_DIR/genimage.cfg"
+
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/palo.sh.in" \
+	> "$BINARIES_DIR/palo.sh"
+
+chmod +x "$BINARIES_DIR/palo.sh"
diff --git a/board/hp/9000/readme.txt b/board/hp/9000/readme.txt
new file mode 100644
index 0000000000..9a07c55253
--- /dev/null
+++ b/board/hp/9000/readme.txt
@@ -0,0 +1,57 @@
+Introduction
+============
+
+The hp_9000_defconfig is meant to run Linux on a large range of 32-bit
+HP PA-RISC 1.1 Workstations, such as the HP 9000 700 and Visualize
+workstations. [1]
+
+Building
+========
+
+  $ make hp_9000_defconfig
+  $ make
+
+Generated files under output/images:
+
+* lifimage: network bootable image comprising Linux kernel and ramdisk.
+* disk.img: bootable disk image, with Linux kernel and root filesystem.
+
+Running
+=======
+
+To run the generated system, one method is to write the disk image directly to
+the workstation hard disk drive using a PC and an SCSI adapter. Extract the
+disk from the workstation, connect it to the PC, then do:
+
+  # dd if=output/images/disk.img of=<hdd device> ; sync
+
+Put the disk back into the workstation, connect to the UART console with
+baudrate 9600; the firmware should boot Linux from disk and you should obtain a
+login prompt.
+
+Another method is to boot from the network. This necessitates to setup a DHCP
+and TFTP server, such as dnsmasq[2], to give the workstation its boot filename
+with DHCP and serve the lifimage with TFTP.
+
+Connect to the UART console with baudrate 9600 and interrupt the boot sequence
+of the firmware.
+
+On an HP 9000 712 workstation, do:
+
+  BOOT_ADMIN> boot lan
+
+On an HP Visualize J210XC workstation, do:
+
+  Configuration Menu: Enter command > boot lan
+  Interact with IPL (Y or N)?>  n
+
+The firmware should boot Linux from the network and you should obtain a login
+prompt.
+
+It is possible to download the disk image from the network and write it to the
+hard disk drive, for example with TFTP:
+
+  # tftp -g -r <path to>/disk.img -l /dev/sda <server ip>
+
+[1] https://www.openpa.net/systems/
+[2] https://dnsmasq.org/doc.html
diff --git a/configs/hp_9000_defconfig b/configs/hp_9000_defconfig
new file mode 100644
index 0000000000..29ad684d74
--- /dev/null
+++ b/configs/hp_9000_defconfig
@@ -0,0 +1,20 @@
+BR2_hppa=y
+BR2_parisc11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16=y
+BR2_GLOBAL_PATCH_DIR="board/hp/9000/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT=" board/hp/9000/post-image.sh support/scripts/genimage.sh $(BINARIES_DIR)/palo.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.16.5"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_PALO=y
+BR2_PACKAGE_HOST_GENIMAGE=y

--===============5838575614708303080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5838575614708303080==--
