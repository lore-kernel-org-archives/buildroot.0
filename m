Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4E8107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F718610A1;
	Sat, 14 Mar 2026 08:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iaHtfxZFpTl; Sat, 14 Mar 2026 08:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3884C6100A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475233;
	bh=V41qxy750KkpcgACpeDTaAnIoaJbLUrYO6MsxZhFKBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SMl5WlGPBwMjc8Op2L9YC5BHaS7tZSTVjBWXmkbX7GcslpHSvxxzHWKPVhKXWjBMT
	 0rAXe2ERHYBpZM3ZH2idifUpmyR9up4bBqRikRpfW53RkFhKnPiU942DCjqp9clzlh
	 gPSUpEe+c+5TOIJocR8xBVKo0c2lT09391mSnn8N+QhWPlM2SgJQKwGwTLYUnFSOfL
	 v/o1Qm9OTGXJ+WzA9raToZtIE6BXg0EqKl6mjEQxbmPlEGxChgjuc2+VYM/XuOeoYK
	 /f/CJ80W6t/ZCGUMv7w92t8OJk/xjOwDU/HTWVUlpQJQTt0aqWYTh5+61vCU1D4OQL
	 kDW9VbEQhuVqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3884C6100A;
	Sat, 14 Mar 2026 08:00:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D0CC1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D0641046
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uz1tLy0KG3U8 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C9F41043
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97C9F41043
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C11D085EE5; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:02:50 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 03fbcb03d0f9295983c09e529a4bde98283957a8
X-Git-Newrev: 8e9f7ab19a66bd833a61ad72e63d50e5a34ea26d
X-Patchwork-Hint: ignore
Message-Id: <20260314080009.C11D085EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing:
 fs/test_iso9660: remove 32bit EFI tests
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e9f7ab19a66bd833a61ad72e63d50e5a34ea26d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

EDK2 removed OVMF IA32 support in commit [1], which is included in
version edk2-stable202511. This commit removes tests relying on it.

[1] https://github.com/tianocore/edk2/commit/1fb88ffe284782cc79e306306b8d19829b6248b7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit cf16e1abe01d76916a0951fc52e5b57c6998607f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/fs/test_iso9660.py | 79 +-------------------------------
 1 file changed, 2 insertions(+), 77 deletions(-)

diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 1b86bfbfc1..947aca5f54 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -18,22 +18,9 @@ BASIC_CONFIG = \
     """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
 
 
-def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
+def test_mount_internal_external(emulator, builddir, internal=True):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
-    if efi:
-        efi_img = os.path.join(builddir, "images", "OVMF.fd")
-        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
-        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
-        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
-        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
-        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
-        # This workaround is needed only when efi=True since it imply EDK2 is used.
-        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
-        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
-        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
-        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img, "-fw_cfg", qemu_fw_cfg])
-    else:
-        emulator.boot(arch="i386", options=["-cdrom", img])
+    emulator.boot(arch="i386", options=["-cdrom", img])
     emulator.login()
 
     if internal:
@@ -114,68 +101,6 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
-class TestIso9660Grub2EFI(infra.basetest.BRTest):
-    config = BASIC_CONFIG + \
-        """
-        BR2_TARGET_ROOTFS_ISO9660=y
-        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
-        BR2_TARGET_GRUB2=y
-        BR2_TARGET_GRUB2_I386_EFI=y
-        BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat part_msdos part_gpt normal iso9660"
-        BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI="{}"
-        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
-        BR2_TARGET_EDK2=y
-        """.format(infra.filepath("conf/grub2-efi.cfg"),
-                   infra.filepath("conf/grub2.cfg"))
-
-    def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
-                                                 self.builddir, internal=True,
-                                                 efi=True)
-        self.assertEqual(exit_code, 0)
-
-        exit_code = test_touch_file(self.emulator)
-        self.assertEqual(exit_code, 0)
-
-
-class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
-    config = BASIC_CONFIG + \
-        """
-        BR2_TARGET_ROOTFS_ISO9660=y
-        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
-        BR2_TARGET_GRUB2=y
-        BR2_TARGET_GRUB2_I386_PC=y
-        BR2_TARGET_GRUB2_I386_EFI=y
-        BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
-        BR2_TARGET_GRUB2_BUILTIN_MODULES_PC="boot linux ext2 fat squash4 part_msdos part_gpt normal iso9660 biosdisk"
-        BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC=""
-        BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal iso9660 efi_gop"
-        BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI="{}"
-        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
-        BR2_TARGET_EDK2=y
-        """.format(infra.filepath("conf/grub2-efi.cfg"),
-                   infra.filepath("conf/grub2.cfg"))
-
-    def test_run(self):
-        exit_code = test_mount_internal_external(self.emulator,
-                                                 self.builddir, internal=True,
-                                                 efi=False)
-        self.assertEqual(exit_code, 0)
-
-        exit_code = test_touch_file(self.emulator)
-        self.assertEqual(exit_code, 0)
-
-        self.emulator.stop()
-
-        exit_code = test_mount_internal_external(self.emulator,
-                                                 self.builddir, internal=True,
-                                                 efi=True)
-        self.assertEqual(exit_code, 0)
-
-        exit_code = test_touch_file(self.emulator)
-        self.assertEqual(exit_code, 0)
-
-
 #
 # Syslinux
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
