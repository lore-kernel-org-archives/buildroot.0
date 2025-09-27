Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC57CAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 12:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E1882FB1;
	Sat, 27 Sep 2025 12:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLBdXxNHLJwm; Sat, 27 Sep 2025 12:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355E782882
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 355E782882;
	Sat, 27 Sep 2025 12:54:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D16212D
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 12:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AAA1404A1
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 12:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51j3A2aDMov8 for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 12:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76B05413BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76B05413BB
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 12:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 555C886526; Sat, 27 Sep 2025 12:54:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Sep 2025 14:52:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5a99c4e91fcd6fc563e92d484b352d91aa9a98d
X-Git-Newrev: dd84d0584393a5f9209120bf83fcb62c86b4947f
X-Patchwork-Hint: ignore
Message-Id: <20250927125443.555C886526@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_x86_64_efi_defconfig: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd84d0584393a5f9209120bf83fcb62c86b4947f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig enables EDK2 UEFI firmware and grub2 x86_64-efi boot
of a Linux Kernel in QEMU virt machine.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
[Julien:
 - add .in suffix to genimage.cfg and grub.cfg template file names
 - change UUID_TMP template variable to %PARTUUID%
 - use human readable partition-type-uuid in genimage.cfg.in
 - break long qemu-system-x86_64 command line in readme.txt
 - add "-serial stdio" in readme.txt qemu command line for CI
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/x86_64-efi/genimage.cfg.in | 32 +++++++++++++++++++
 board/qemu/x86_64-efi/grub.cfg.in     |  6 ++++
 board/qemu/x86_64-efi/linux.config    | 59 +++++++++++++++++++++++++++++++++++
 board/qemu/x86_64-efi/post-build.sh   | 11 +++++++
 board/qemu/x86_64-efi/post-image.sh   |  8 +++++
 board/qemu/x86_64-efi/readme.txt      | 28 +++++++++++++++++
 configs/qemu_x86_64_efi_defconfig     | 25 +++++++++++++++
 7 files changed, 169 insertions(+)

diff --git a/board/qemu/x86_64-efi/genimage.cfg.in b/board/qemu/x86_64-efi/genimage.cfg.in
new file mode 100644
index 0000000000..0d50ed2ba4
--- /dev/null
+++ b/board/qemu/x86_64-efi/genimage.cfg.in
@@ -0,0 +1,32 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file bzImage {
+			image = "bzImage"
+		}
+	}
+
+	size = 16352K # 16MB - 32KB
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
+		partition-type-uuid = root-x86-64
+		partition-uuid = %PARTUUID%
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/qemu/x86_64-efi/grub.cfg.in b/board/qemu/x86_64-efi/grub.cfg.in
new file mode 100644
index 0000000000..16a1b17516
--- /dev/null
+++ b/board/qemu/x86_64-efi/grub.cfg.in
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /bzImage root=PARTUUID=%PARTUUID% rootwait console=tty1 console=ttyS0
+}
diff --git a/board/qemu/x86_64-efi/linux.config b/board/qemu/x86_64-efi/linux.config
new file mode 100644
index 0000000000..9362b7ecb5
--- /dev/null
+++ b/board/qemu/x86_64-efi/linux.config
@@ -0,0 +1,59 @@
+CONFIG_SYSVIPC=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_EFI=y
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_WIRELESS is not set
+CONFIG_PCI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_I915=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_DRM_BOCHS=y
+CONFIG_FB=y
+CONFIG_FB_VESA=y
+CONFIG_FB_EFI=y
+CONFIG_FIRMWARE_EDID=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_SQUASHFS=y
+CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/qemu/x86_64-efi/post-build.sh b/board/qemu/x86_64-efi/post-build.sh
new file mode 100755
index 0000000000..24eee7f0e5
--- /dev/null
+++ b/board/qemu/x86_64-efi/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Add a console on tty1
+if [ -e "${TARGET_DIR}/etc/inittab" ]; then
+    grep -qE '^tty1::' "${TARGET_DIR}/etc/inittab" || \
+	sed -i '/GENERIC_SERIAL/a\
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' "${TARGET_DIR}/etc/inittab"
+fi
diff --git a/board/qemu/x86_64-efi/post-image.sh b/board/qemu/x86_64-efi/post-image.sh
new file mode 100755
index 0000000000..119d7aca8f
--- /dev/null
+++ b/board/qemu/x86_64-efi/post-image.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+PARTUUID=$(dumpe2fs "${BINARIES_DIR}/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
+sed "s/%PARTUUID%/$PARTUUID/g" "${BOARD_DIR}/grub.cfg.in" > "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
+sed "s/%PARTUUID%/$PARTUUID/g" "${BOARD_DIR}/genimage.cfg.in" > "${BINARIES_DIR}/genimage.cfg"
+support/scripts/genimage.sh -c "${BINARIES_DIR}/genimage.cfg"
diff --git a/board/qemu/x86_64-efi/readme.txt b/board/qemu/x86_64-efi/readme.txt
new file mode 100644
index 0000000000..7f69be065f
--- /dev/null
+++ b/board/qemu/x86_64-efi/readme.txt
@@ -0,0 +1,28 @@
+Intro
+=====
+
+This is a x86_64 UEFI Linux boot demo in QEMU virt machine.
+
+Build
+=====
+
+    make qemu_x86_64_efi_defconfig
+    make
+
+Emulation
+=========
+
+Run the emulation with:
+
+    qemu-system-x86_64 \
+        -M pc \
+        -m 1024 \
+        -serial stdio \
+        -bios output/images/OVMF.fd \
+        -drive file=output/images/disk.img,format=raw \
+        -netdev user,id=net0 \
+        -device virtio-net-pci,netdev=net0 # qemu_x86_64_efi_defconfig
+
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
+The login prompt will appear in the graphical window.
diff --git a/configs/qemu_x86_64_efi_defconfig b/configs/qemu_x86_64_efi_defconfig
new file mode 100644
index 0000000000..e487b68687
--- /dev/null
+++ b/configs/qemu_x86_64_efi_defconfig
@@ -0,0 +1,25 @@
+BR2_x86_64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64-efi/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/x86_64-efi/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64-efi/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_EDK2=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
