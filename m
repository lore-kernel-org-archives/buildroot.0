Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD3FC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 07:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4F3C83E1C;
	Tue, 19 Jul 2022 07:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F3C83E1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wMyBAh3izcT; Tue, 19 Jul 2022 07:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DBC83E11;
	Tue, 19 Jul 2022 07:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97DBC83E11
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F05C1BF355
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AF08410E9
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF08410E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAI9eM6TiEzN for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 07:40:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AE004152A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AE004152A
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 07:40:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 978A71C0008;
 Tue, 19 Jul 2022 07:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 09:40:42 +0200
Message-Id: <20220719074042.2214649-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
References: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658216452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aDDzB2qgH8S6S+TcLRy7Xj3xjIr3jAhYwLFL1sdUMcY=;
 b=Kqm+Ma1301M/+lvwJhLPY/YJzk+Hcq3yA/l4MZgsoQsQDEEol1/abZgdvPOKyjGFWH6BaQ
 m0DJuw5kvUQfa/6ccf2NN3UMxLroCuquVFrwV4YJCfrwTLbJfyXK+/fMqdsUs0ZagnZvcY
 c/RRipQdXFA+qJJLgmC5zBt0xDcjR2G16iXuB9OgZNnWnPqC4aG2Rzzty9tBIKpHgVeuiU
 CPuSbtIv3H6UYg3t0FGkes/bUL61eLWjs3Vo4fqRKJhrEOLAqPLaBb5Vg/sRN0bNGwHtQq
 1g2/cLVA3nRKSpO6l8HCAshN4Rc3ZfvMPOWY3LJwtAIGiVMd+G/14atnvYVBig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kqm+Ma13
Subject: [Buildroot] [PATCH 4/4] support/testing/tests/boot: new test cases
 for Grub
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds four test cases for Grub:

 - Grub i386 legacy BIOS
 - Grub i386 UEFI
 - Grub x86-64 UEFI
 - Grub AArch64 UEFI

There is some overlap with the ISO9660 filesystem test cases, some of
which use Grub, but we found it relevant to have separate test cases
for Grub, which were useful to test Grub in non-ISO9660 situations.

The Grub ARM UEFI case is not tested, as it requires Grub to be
chain-loaded by U-Boot. Implementing this test case is left as an
exercise for the reader.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |   2 +
 support/testing/tests/boot/test_grub.py       | 153 ++++++++++++++++++
 .../boot/test_grub/genimage-aarch64-efi.cfg   |  32 ++++
 .../tests/boot/test_grub/grub-aarch64-efi.cfg |   6 +
 .../boot/test_grub/linux-aarch64-efi.config   |   1 +
 .../tests/boot/test_grub/post-build.sh        |   7 +
 .../boot/test_grub/post-image-aarch64-efi.sh  |   8 +
 7 files changed, 209 insertions(+)
 create mode 100644 support/testing/tests/boot/test_grub.py
 create mode 100644 support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
 create mode 100644 support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
 create mode 100644 support/testing/tests/boot/test_grub/linux-aarch64-efi.config
 create mode 100755 support/testing/tests/boot/test_grub/post-build.sh
 create mode 100755 support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh

diff --git a/DEVELOPERS b/DEVELOPERS
index 34effa6005..3f697e63ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2855,6 +2855,8 @@ F:	package/squashfs/
 F:	package/tinifier/
 F:	package/wayland/
 F:	package/weston/
+F:	support/testing/tests/boot/test_grub.py
+F:	support/testing/tests/boot/test_grub/
 F:	support/testing/tests/boot/test_syslinux.py
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask.py
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
new file mode 100644
index 0000000000..33476f212e
--- /dev/null
+++ b/support/testing/tests/boot/test_grub.py
@@ -0,0 +1,153 @@
+import os
+
+import infra.basetest
+
+
+class TestGrubi386BIOS(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_core2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+        BR2_LINUX_KERNEL_INSTALL_TARGET=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_PC=y
+        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        self.emulator.boot(arch="i386", options=["-hda", hda])
+        self.emulator.login()
+
+
+class TestGrubi386EFI(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_core2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+        BR2_LINUX_KERNEL_INSTALL_TARGET=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EFIVAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_EFI=y
+        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
+        BR2_TARGET_OVMF_BIN=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        bios = os.path.join(self.builddir, "images", "RELEASEIa32_OVMF.fd")
+        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda])
+        self.emulator.login()
+
+        cmd = "modprobe efivarfs"
+        self.assertRunOk(cmd)
+
+        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
+        self.assertRunOk(cmd)
+
+        cmd = "efivar -l"
+        self.assertRunOk(cmd)
+
+
+class TestGrubX8664EFI(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+        BR2_LINUX_KERNEL_INSTALL_TARGET=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EFIVAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_X86_64_EFI=y
+        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
+        BR2_TARGET_OVMF_BIN=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        bios = os.path.join(self.builddir, "images", "RELEASEX64_OVMF.fd")
+        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda])
+        self.emulator.login()
+
+        cmd = "modprobe efivarfs"
+        self.assertRunOk(cmd)
+
+        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
+        self.assertRunOk(cmd)
+
+        cmd = "efivar -l"
+        self.assertRunOk(cmd)
+
+
+class TestGrubAArch64EFI(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="{post_image}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EFIVAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_OVMF_BIN=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
+                   linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        bios = os.path.join(self.builddir, "images", "RELEASEAARCH64_QEMU_EFI.fd")
+        self.emulator.boot(arch="aarch64", options=["-M", "virt", "-cpu", "cortex-a53", "-bios", bios, "-hda", hda])
+        self.emulator.login()
+
+        cmd = "modprobe efivarfs"
+        self.assertRunOk(cmd)
+
+        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
+        self.assertRunOk(cmd)
+
+        cmd = "efivar -l"
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
new file mode 100644
index 0000000000..11615c885a
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
@@ -0,0 +1,32 @@
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
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		offset = 32K
+		bootable = true
+	}
+
+	partition root {
+		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
+		partition-uuid = UUID_TMP
+		image = "rootfs.ext2"
+	}
+}
diff --git a/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
new file mode 100644
index 0000000000..d40af0df24
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+ linux /Image root=PARTUUID=UUID_TMP rootwait console=ttyAMA0
+}
diff --git a/support/testing/tests/boot/test_grub/linux-aarch64-efi.config b/support/testing/tests/boot/test_grub/linux-aarch64-efi.config
new file mode 100644
index 0000000000..839566bae0
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/linux-aarch64-efi.config
@@ -0,0 +1 @@
+CONFIG_ACPI=y
diff --git a/support/testing/tests/boot/test_grub/post-build.sh b/support/testing/tests/boot/test_grub/post-build.sh
new file mode 100755
index 0000000000..8d6f0318de
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if [ -d "$BINARIES_DIR/efi-part/" ]; then
+    sed -i 's%tty1%ttyS0,115200%' "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
+else
+    sed -i 's%tty1%ttyS0,115200%' "$TARGET_DIR/boot/grub/grub.cfg"
+fi
diff --git a/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh b/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh
new file mode 100755
index 0000000000..2db516ef2d
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+set -e
+
+UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
+sed "s/UUID_TMP/$UUID/g" support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg > "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
+sed "s/UUID_TMP/$UUID/g" support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg > "$BINARIES_DIR/genimage-aarch64-efi.cfg"
+support/scripts/genimage.sh -c "$BINARIES_DIR/genimage-aarch64-efi.cfg"
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
