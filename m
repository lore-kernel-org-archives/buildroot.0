Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B7C83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0069960F36;
	Sat,  5 Jul 2025 17:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TrPH4qHuwiIa; Sat,  5 Jul 2025 17:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C77ED6113E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C77ED6113E;
	Sat,  5 Jul 2025 17:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C05F445
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AE3283963
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0FodCCjdZa4 for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2790283A0C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2790283A0C
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 239EE819F0; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e20271ba37c3a40db1e9ab7317773a10a3940456
X-Git-Newrev: ef55ca4075081ec2f0f740204d2b44cd1e0cb00f
X-Patchwork-Hint: ignore
Message-Id: <20250705174709.239EE819F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_loongarch64_virt_efi: new
 defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef55ca4075081ec2f0f740204d2b44cd1e0cb00f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add qemu_loongarch64_virt_efi_defconfig, which builds EDK2
and host QEMU to test LoongArch64 buildroot.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Tested-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  2 ++
 board/qemu/loongarch64-virt-efi/genimage.cfg  | 30 ++++++++++++++++++++++++++
 board/qemu/loongarch64-virt-efi/grub.cfg      |  6 ++++++
 board/qemu/loongarch64-virt-efi/post-image.sh |  5 +++++
 board/qemu/loongarch64-virt-efi/readme.txt    | 31 +++++++++++++++++++++++++++
 configs/qemu_loongarch64_virt_efi_defconfig   | 25 +++++++++++++++++++++
 6 files changed, 99 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fce7c18474..99c403686a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1645,7 +1645,9 @@ F:	package/rtty/
 N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 F:	arch/Config.in.loongarch
 F:	board/loongarch64-efi
+F:	board/qemu/loongarch64-virt-efi
 F:	configs/loongarch64_efi_defconfig
+F:	configs/qemu_loongarch64_virt_efi_defconfig
 
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
diff --git a/board/qemu/loongarch64-virt-efi/genimage.cfg b/board/qemu/loongarch64-virt-efi/genimage.cfg
new file mode 100644
index 0000000000..24b9a8d943
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/genimage.cfg
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
diff --git a/board/qemu/loongarch64-virt-efi/grub.cfg b/board/qemu/loongarch64-virt-efi/grub.cfg
new file mode 100644
index 0000000000..dc3452fe6a
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /vmlinux.efi root=PARTLABEL=root rootwait console=ttyS0
+}
diff --git a/board/qemu/loongarch64-virt-efi/post-image.sh b/board/qemu/loongarch64-virt-efi/post-image.sh
new file mode 100755
index 0000000000..fdb17ece70
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/post-image.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+cp -f "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
diff --git a/board/qemu/loongarch64-virt-efi/readme.txt b/board/qemu/loongarch64-virt-efi/readme.txt
new file mode 100644
index 0000000000..7c35ee1efe
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/readme.txt
@@ -0,0 +1,31 @@
+Intro
+=====
+
+This is a LoongArch 64bit UEFI Linux boot demo in QEMU virt machine.
+
+Build
+=====
+
+    make qemu_loongarch64_virt-efi_defconfig
+    make
+
+Emulation
+=========
+
+Run the emulation with:
+
+    qemu-system-loongarch64 \
+        -M virt \
+        -smp 2 \
+        -m 1024 \
+        -nographic \
+        -bios output/images/QEMU_EFI.fd \
+        -drive file=output/images/disk.img,format=raw \
+        -netdev user,id=net0 \
+        -device virtio-net-pci,netdev=net0 # qemu_loongarch64_virt_efi_defconfig
+
+Note: for information, qemu version >= 9.0.0 is needed for this UEFI
+Linux demo. The host-qemu package in Buildroot (enabled in this
+defconfig) is sufficient to run this demo. In case another qemu is
+used (for example, from the host OS), make sure to check the version
+requirement.
diff --git a/configs/qemu_loongarch64_virt_efi_defconfig b/configs/qemu_loongarch64_virt_efi_defconfig
new file mode 100644
index 0000000000..945cb9232d
--- /dev/null
+++ b/configs/qemu_loongarch64_virt_efi_defconfig
@@ -0,0 +1,25 @@
+BR2_loongarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/loongarch64-virt-efi/post-image.sh board/qemu/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/loongarch64-virt-efi/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_EDK2=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_LOONGARCH64_EFI=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
