Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68056107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E46260F2C;
	Sat, 14 Mar 2026 07:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8y5OX1HMxq3; Sat, 14 Mar 2026 07:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD3E60F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474589;
	bh=rNE2PCgE4+sfLtl1FwrX9YwGO2pAojl3ueMQouUdDCE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dg4EFAQPF9XGnNfyKtcaXJioNL9aK4LMW7NVtJDsw+Jofs9kwOLS2/erwMHJEGsed
	 HK7OpwthZIeOFZTulvkEhx7KEFp/r1P/CN6G11Vb+j7XVsI83Wb3WtDrZq7T06HhBV
	 vZybrxfRnfV1dppwvCYl9F/iiB7sg0cFuoKQRyC91bzTla8YHq5Ln0dYJ0fEP0Og34
	 RZMfiVgJHz0so5inEnqD7Lelc3ziSZH36/CYIFMor1jwsx7EmwfxFQRH9q0xhd6ANF
	 y0odVpXu6Q0zC6+auWnd+bH1//RYSkNPrn/Buh81kxZJITgdYwwJeeGKfKYKHvoxEo
	 GPHYk0fHMpijA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD3E60F28;
	Sat, 14 Mar 2026 07:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24A19201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED11040FE9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYgnYEBAn8WN for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD3F440FE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD3F440FE8
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1EA886102; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:02:53 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9f755efa4bc44c75dfd5dfe4b9b0a9f38809b8e3
X-Git-Newrev: d0d88a9d472d67be6dee1a06ffec775e1cd8f9dc
X-Patchwork-Hint: ignore
Message-Id: <20260314074935.D1EA886102@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0d88a9d472d67be6dee1a06ffec775e1cd8f9dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
