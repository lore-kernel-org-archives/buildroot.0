Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0437CEFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00850409A9;
	Wed,  4 Mar 2026 21:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxO2GBmIMSiy; Wed,  4 Mar 2026 21:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 136D7408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772661030;
	bh=g6bMCblzfhQUZWyUi3MMbre32CFZHXb4aDCfM6Cqm/E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a0b90oheJjuYTeU59R8DA8y/Orali32IbSvpSsKBJEH1HrIxj7NabI+Y06PhIrA2/
	 HOw7aY//DavXj9gYhSwoKHFSQgsaLwvmSSS6Zqwt/2JaZuJEh55OtARVeD4jusSe8M
	 RhzIqDbAZXQqJ3gKDn3+0Skyl0GUq1WXQhimc/NY9wEkApShcyvapEUMpX/ghTV5lp
	 NnRl12CiJpGmPpYZ1BRX6AbB/NJ10Y+0BQEsrl4nTE57sijTlo8e/YSj0x+oF4Oyl+
	 VJ9lHCGSrZ8CnYVwb7r2Xw3zHrUAcem541gs/A942gkhbHT3csw4MLLEtXXZS3o5y2
	 iUJlNsQsCkcOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 136D7408FF;
	Wed,  4 Mar 2026 21:50:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89E531EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB92408FF
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ca0gTxySa3J5 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 939FE406D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 939FE406D5
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99E3A863A4; Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:48:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 746519df52a459708b4eef8cee8992c9af933ca8
X-Git-Newrev: cf16e1abe01d76916a0951fc52e5b57c6998607f
X-Patchwork-Hint: ignore
Message-Id: <20260304215027.99E3A863A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fs/test_iso9660: remove
 32bit EFI tests
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf16e1abe01d76916a0951fc52e5b57c6998607f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

EDK2 removed OVMF IA32 support in commit [1], which is included in
version edk2-stable202511. This commit removes tests relying on it.

[1] https://github.com/tianocore/edk2/commit/1fb88ffe284782cc79e306306b8d19829b6248b7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
