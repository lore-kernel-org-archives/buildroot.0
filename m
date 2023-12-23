Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACAFC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A16C781EB4;
	Sat, 23 Dec 2023 21:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A16C781EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaLrmrAYm-C1; Sat, 23 Dec 2023 21:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A56AA821E5;
	Sat, 23 Dec 2023 21:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A56AA821E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62A9F1BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C9BB821E2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C9BB821E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w7NzkE4rZKm8 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:30:18 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2104781EB4
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2104781EB4
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E347B13F88D;
 Sat, 23 Dec 2023 22:30:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 22:29:48 +0100
Message-ID: <20231223212948.2512412-2-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231223212948.2512412-1-ju.o@free.fr>
References: <20231223194150.1152752-1-ju.o@free.fr>
 <20231223212948.2512412-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703367016;
 bh=o8mOY4M2kSovT/TFHVoaeyOHkR3FXeZtVHWMPdKU0EY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DRW3BdYGbv099vm/8PK3x8jWnYhG3lQdltMIuiPPP8Hh3829htpE1oc72Pdp5jyMs
 w2OmEuRZFbTQp7BmSN/4eA0K4TOl4M0D2hqCOqFvYPG5JypJJTqkNtF+AwHNFG3765
 nHFgjw2L4zyi+ugqe9GiceNz4Wn5L7sjBk0qic+fuZ5FFnG5DlxM/xXZjSZ3n2kn/v
 G5JyU198FDF+ZiGsD5o5IubbHotgR1paniH+IzbEAAcqOHo+nK47wMRJ5PFH5ux6wC
 BWSxPNlYAZ4kksrNLeklXXYnjWNrLbElt8D9dGBX8OVWe5XbWJDcQ+5tS2+lJI7e6I
 m6Rsw/r5XQrWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DRW3BdYG
Subject: [Buildroot] [PATCH v2 2/2] configs/qemu_riscv64_virt_efi: new
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig enables edk2 UEFI shell and grub2 riscv64-efi boot
of a Linux Kernel.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Remove BR2_TOOLCHAIN_EXTERNAL=y in defconfig.
  (it was an incorrect leftover from a test)
- Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1 in defconfig.

Patch series tested on branch master at commit 1667987 with commands:

    make check-package
    ...
    0 warnings generated

    make qemu_riscv64_virt_efi_defconfig
    make
    output/images/start-qemu.sh

Once logged as root in emulator:

    dmesg | grep -i efi
    mount -t efivarfs efivarfs /sys/firmware/efi/efivars
    ls -al /sys/firmware/efi/efivars
---
 DEVELOPERS                                    |  2 ++
 .../riscv64-virt-efi/assemble-flash-images    | 11 ++++++
 board/qemu/riscv64-virt-efi/genimage.cfg      | 34 ++++++++++++++++++
 board/qemu/riscv64-virt-efi/grub.cfg          |  6 ++++
 board/qemu/riscv64-virt-efi/readme.txt        | 36 +++++++++++++++++++
 configs/qemu_riscv64_virt_efi_defconfig       | 19 ++++++++++
 6 files changed, 108 insertions(+)
 create mode 100755 board/qemu/riscv64-virt-efi/assemble-flash-images
 create mode 100644 board/qemu/riscv64-virt-efi/genimage.cfg
 create mode 100644 board/qemu/riscv64-virt-efi/grub.cfg
 create mode 100644 board/qemu/riscv64-virt-efi/readme.txt
 create mode 100644 configs/qemu_riscv64_virt_efi_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index bad07d51aa..cfd8b7bd8f 100644
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
