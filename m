Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F9EC46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D715404D8;
	Sun, 24 Dec 2023 16:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D715404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkQSwJo9rKDw; Sun, 24 Dec 2023 16:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70D3D40518;
	Sun, 24 Dec 2023 16:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70D3D40518
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 532E51BF304
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD3EB60BB6
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD3EB60BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pSbC2BYe9_zM for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1CF860C03
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1CF860C03
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEA7282753; Sun, 24 Dec 2023 16:56:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 17:55:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f439b47ed6e987306c7de6d9c3be11de04935377
X-Git-Newrev: 8219955118fee56ccd3ca8a13a6350d0e15de418
X-Patchwork-Hint: ignore
Message-Id: <20231224165609.AEA7282753@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_riscv64_virt_efi: new
 defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=8219955118fee56ccd3ca8a13a6350d0e15de418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig enables edk2 UEFI shell and grub2 riscv64-efi boot
of a Linux Kernel.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                        |  2 ++
 board/qemu/riscv64-virt-efi/assemble-flash-images | 11 +++++++
 board/qemu/riscv64-virt-efi/genimage.cfg          | 34 +++++++++++++++++++++
 board/qemu/riscv64-virt-efi/grub.cfg              |  6 ++++
 board/qemu/riscv64-virt-efi/readme.txt            | 36 +++++++++++++++++++++++
 configs/qemu_riscv64_virt_efi_defconfig           | 19 ++++++++++++
 6 files changed, 108 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 834be54eb1..b5158ba986 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1713,11 +1713,13 @@ F:	configs/ts7680_defconfig
 F:	package/paho-mqtt-c
 
 N:	Julien Olivain <ju.o@free.fr>
+F:	board/qemu/riscv64-virt-efi/
 F:	board/spike/
 F:	board/technexion/imx8mmpico/
 F:	board/technexion/imx8mpico/
 F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
+F:	configs/qemu_riscv64_virt_efi_defconfig
 F:	configs/spike_riscv64_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
diff --git a/board/qemu/riscv64-virt-efi/assemble-flash-images b/board/qemu/riscv64-virt-efi/assemble-flash-images
new file mode 100755
index 0000000000..abcaa2c93b
--- /dev/null
+++ b/board/qemu/riscv64-virt-efi/assemble-flash-images
@@ -0,0 +1,11 @@
+#! /bin/sh
+
+set -e
+
+BOARD_DIR="$(dirname "$0")"
+
+cp -f "${BOARD_DIR}"/grub.cfg "${BINARIES_DIR}"/efi-part/EFI/BOOT/grub.cfg
+
+# The QEMU riscv64 virt machine expects flash devices to be 32M.
+truncate -s 32M "${BINARIES_DIR}"/RISCV_VIRT_CODE.fd
+truncate -s 32M "${BINARIES_DIR}"/RISCV_VIRT_VARS.fd
diff --git a/board/qemu/riscv64-virt-efi/genimage.cfg b/board/qemu/riscv64-virt-efi/genimage.cfg
new file mode 100644
index 0000000000..46950591e0
--- /dev/null
+++ b/board/qemu/riscv64-virt-efi/genimage.cfg
@@ -0,0 +1,34 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file Image {
+			image = "Image"
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
+		# For partition-type-uuid value, see:
+		# https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
+		# SD_GPT_ROOT_RISCV64
+		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/qemu/riscv64-virt-efi/grub.cfg b/board/qemu/riscv64-virt-efi/grub.cfg
new file mode 100644
index 0000000000..d99e19c4cd
--- /dev/null
+++ b/board/qemu/riscv64-virt-efi/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=PARTLABEL=root rootwait
+}
diff --git a/board/qemu/riscv64-virt-efi/readme.txt b/board/qemu/riscv64-virt-efi/readme.txt
new file mode 100644
index 0000000000..6b9651a011
--- /dev/null
+++ b/board/qemu/riscv64-virt-efi/readme.txt
@@ -0,0 +1,36 @@
+Intro
+=====
+
+This is a RISC-V 64bit UEFI Linux boot demo in QEmu virt machine.
+
+Build
+=====
+
+    make qemu_riscv64_virt_efi_defconfig
+    make
+
+Emulation
+=========
+
+Run the emulation with:
+
+    qemu-system-riscv64 \
+        -M virt,pflash0=pflash0,pflash1=pflash1,acpi=off \
+        -smp 4 \
+        -m 1024 \
+        -nographic \
+        -blockdev node-name=pflash0,driver=file,read-only=on,filename=output/images/RISCV_VIRT_CODE.fd \
+        -blockdev node-name=pflash1,driver=file,filename=output/images/RISCV_VIRT_VARS.fd \
+        \
+        -drive file=output/images/disk.img,format=raw,id=hd0 \
+        -device virtio-blk-device,drive=hd0 \
+        \
+        -netdev user,id=net0 \
+        -device virtio-net-device,netdev=net0 # qemu_riscv64_virt_efi_defconfig
+
+Note: for information, qemu version >= 8.0.0 is needed for this UEFI
+Linux demo. It introduced the two pflash memories (previous versions
+had only one). The host-qemu package in Buildroot (enabled in this
+defconfig) is sufficient to run this demo. In case another qemu is
+used (for example, from the host OS), make sure to check the version
+requirement.
diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
new file mode 100644
index 0000000000..79aadf78ca
--- /dev/null
+++ b/configs/qemu_riscv64_virt_efi_defconfig
@@ -0,0 +1,19 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/riscv64-virt-efi/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/riscv64-virt-efi/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.69"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_EDK2=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_RISCV64_EFI=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
