Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CFF107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C3FE40FF2;
	Sat, 14 Mar 2026 07:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Akymfm26UzjH; Sat, 14 Mar 2026 07:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F5C41002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474590;
	bh=XQwfqGWM2Zbmff+NRjVAc5yddF9rPhrYBQ/N2AYccaw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HLSIHEgQiKZbAC8CWaSWAB9FAf/MmnBJqU19RnUPR/QSXocrEw0P7FnjQ84RCu1uc
	 nVOeJrpAn5XT0h/CWUBpTNXXajTE1kUXeAZi6d2FIR7valBDnlE8/n004MQQnQksEj
	 nuj5J0p1gDM4Ywcw/+s01eXujQ6ZLThTcC4gy5vvRGEsCz52Mky/XTBaQGoUq44O+9
	 4kzR+DeOxnM8lqHxLpMtfjaaYhqXYGj5ymRkDHqCZbm1Wzvkluha+5YyJRT95lPbBo
	 pCJjagn7SF9z3nhFRC5sHrHY/vE7K6oFWiO0VVySLOOGXJl2TtNr/YRYB7WWUS84X/
	 omLdyXSk7JvFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F5C41002;
	Sat, 14 Mar 2026 07:49:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 882731B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EDFD60EF7
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2nlk-9l0LCx for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B466960EE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B466960EE7
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCCC4818DC; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:03:16 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d0d88a9d472d67be6dee1a06ffec775e1cd8f9dc
X-Git-Newrev: b2dedc55414cfbe50d0d6237c4ad38c2343ee51c
X-Patchwork-Hint: ignore
Message-Id: <20260314074935.DCCC4818DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing:
 boot/test_grub: remove 32bit EFI test
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2dedc55414cfbe50d0d6237c4ad38c2343ee51c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

EDK2 removed OVMF IA32 support in commit [1], which is included in
version edk2-stable202511. This commit removes the test relying on it.

[1] https://github.com/tianocore/edk2/commit/1fb88ffe284782cc79e306306b8d19829b6248b7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit bd06eace372761d7ced25d73579122db8d643058)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/boot/test_grub.py | 50 ---------------------------------
 1 file changed, 50 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 7ce7066875..061bfc9a2f 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -32,56 +32,6 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
         self.emulator.login()
 
 
-class TestGrubi386EFI(infra.basetest.BRTest):
-    config = \
-        """
-        BR2_x86_core2=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
-        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
-        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
-        BR2_LINUX_KERNEL_INSTALL_TARGET=y
-        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-        BR2_PACKAGE_EFIVAR=y
-        BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_EDK2=y
-        BR2_TARGET_GRUB2=y
-        BR2_TARGET_GRUB2_I386_EFI=y
-        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
-        BR2_PACKAGE_HOST_GENIMAGE=y
-        BR2_PACKAGE_HOST_MTOOLS=y
-        BR2_PACKAGE_HOST_DOSFSTOOLS=y
-        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
-
-    def test_run(self):
-        hda = os.path.join(self.builddir, "images", "disk.img")
-        bios = os.path.join(self.builddir, "images", "OVMF.fd")
-        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
-        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
-        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
-        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
-        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
-        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
-        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
-        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
-        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
-        self.emulator.login()
-
-        cmd = "modprobe efivarfs"
-        self.assertRunOk(cmd)
-
-        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
-        self.assertRunOk(cmd)
-
-        cmd = "efivar -l"
-        self.assertRunOk(cmd)
-
-
 class TestGrubX8664EFI(infra.basetest.BRTest):
     config = \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
