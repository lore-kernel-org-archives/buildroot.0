Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5E3C83F0A
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D48783A0C;
	Sat,  5 Jul 2025 17:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DacXpIeMi0py; Sat,  5 Jul 2025 17:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1161583A45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1161583A45;
	Sat,  5 Jul 2025 17:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70FE312E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB85D81186
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6QD-EQbct0a for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF13983A05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF13983A05
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC2F085FE9; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4a4b8552f80c1ce8b0e70fcfae58c74091fbb63
X-Git-Newrev: 59f661b8faf1ac0892dd46875732b9d5591f1d85
X-Patchwork-Hint: ignore
Message-Id: <20250705174708.EC2F085FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/loongarch64_efi: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59f661b8faf1ac0892dd46875732b9d5591f1d85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce bread new loongarch64-efi board, with skeleton
from aarch64-efi board.

It corverd most LoongArch64 systems.

Linux 6.12, as the most recent LTS kernel, was chosen
to ensure proper architecture support is included.

This board config is validated on my Lemote A2101
Loongson 3A5000 board.

A developer entry is created for myself for future contacts
as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 ++
 board/loongarch64-efi/genimage-efi.cfg             | 30 +++++++++++++++++
 board/loongarch64-efi/grub.cfg                     |  6 ++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/loongarch64-efi/patches/linux/linux.hash     |  2 ++
 board/loongarch64-efi/post-image.sh                |  5 +++
 board/loongarch64-efi/readme.txt                   | 38 ++++++++++++++++++++++
 configs/loongarch64_efi_defconfig                  | 22 +++++++++++++
 8 files changed, 106 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f232b52867..fce7c18474 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1644,6 +1644,8 @@ F:	package/rtty/
 
 N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 F:	arch/Config.in.loongarch
+F:	board/loongarch64-efi
+F:	configs/loongarch64_efi_defconfig
 
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
diff --git a/board/loongarch64-efi/genimage-efi.cfg b/board/loongarch64-efi/genimage-efi.cfg
new file mode 100644
index 0000000000..24b9a8d943
--- /dev/null
+++ b/board/loongarch64-efi/genimage-efi.cfg
@@ -0,0 +1,30 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+		file vmlinux.efi {
+			image = "vmlinux.efi"
+		}
+	}
+
+	size = 64M
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = U
+		offset = 32K
+		bootable = true
+	}
+
+	partition root {
+		partition-type-uuid = root-loongarch64
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/loongarch64-efi/grub.cfg b/board/loongarch64-efi/grub.cfg
new file mode 100644
index 0000000000..2006f6d60d
--- /dev/null
+++ b/board/loongarch64-efi/grub.cfg
@@ -0,0 +1,6 @@
+/set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /vmlinux.efi root=PARTLABEL=root rootwait console=ttyS0,115200
+}
diff --git a/board/loongarch64-efi/patches/linux-headers/linux-headers.hash b/board/loongarch64-efi/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/loongarch64-efi/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/loongarch64-efi/patches/linux/linux.hash b/board/loongarch64-efi/patches/linux/linux.hash
new file mode 100644
index 0000000000..381f3427a6
--- /dev/null
+++ b/board/loongarch64-efi/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  a9b020721778384507010177d3929e7d4058f7f6120f05a99d56b5c5c0346a70  linux-6.12.32.tar.xz
diff --git a/board/loongarch64-efi/post-image.sh b/board/loongarch64-efi/post-image.sh
new file mode 100755
index 0000000000..fdb17ece70
--- /dev/null
+++ b/board/loongarch64-efi/post-image.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+cp -f "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
diff --git a/board/loongarch64-efi/readme.txt b/board/loongarch64-efi/readme.txt
new file mode 100644
index 0000000000..8b92f620f9
--- /dev/null
+++ b/board/loongarch64-efi/readme.txt
@@ -0,0 +1,38 @@
+The loongarch64_efi_defconfig allows to build a minimal Linux system that
+can boot on all loongarch64 systems providing an New World [1] EFI firmware.
+
+This includes almost all LoongArch Loongson-3 series workstations and servers,
+see [2] for hardware and firmware information.
+
+Building and booting
+====================
+
+$ make loongarch64_efi_defconfig
+$ make
+
+The file output/images/disk.img is a complete disk image that can be
+booted, it includes the grub2 bootloader, Linux kernel and root
+filesystem.
+
+Testing under Qemu
+==================
+
+This image can also be tested using Qemu:
+
+qemu-system-loongarch64 \
+	-M virt \
+	-cpu la464 \
+	-nographic \
+	-bios </path/to/QEMU_EFI.fd> \
+	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
+	-device virtio-blk-pci,drive=hd0 \
+	-netdev user,id=eth0 \
+	-device virtio-net-pci,netdev=eth0
+
+Note that </path/to/QEMU_EFI.fd> needs to point to a valid loongarch64 UEFI
+firmware image for qemu.
+It may be provided by your distribution as a edk2-loongarch64 package,
+in path such as /usr/share/edk2/loongarch64/QEMU_EFI.fd .
+
+[1]: https://areweloongyet.com/en/docs/old-and-new-worlds/
+[2]: https://github.com/loongson/Firmware
diff --git a/configs/loongarch64_efi_defconfig b/configs/loongarch64_efi_defconfig
new file mode 100644
index 0000000000..c98699330d
--- /dev/null
+++ b/configs/loongarch64_efi_defconfig
@@ -0,0 +1,22 @@
+BR2_loongarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/loongarch64-efi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/loongarch64-efi/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/loongarch64-efi/genimage-efi.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.32"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_LOONGARCH64_EFI=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
