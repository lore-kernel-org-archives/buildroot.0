Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B955EFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D88688154C;
	Wed,  4 Mar 2026 21:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9vMK1Oi3JxC; Wed,  4 Mar 2026 21:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5723A81A65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772661032;
	bh=O3xsYTC7vXQcw4ZjNzGOzYfS+HciehhnuR/9XOv/p9U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y06ev6wGrCfKcLeX8bc592IxyjiRuxy12RjLS2mOvFoKY/xPtJuzVhIid+4eVxCEu
	 XgMWTMI7VhUX/FbUb7c1iYWRQVyjUjEadeO5fzQxe+6fSXCViJVEzMA70WGcjDplbG
	 hwfVaecYtGKpio1XdTecKMTBSkCTam1vhBaEErJrGDehAXx5D6GxCWcdRsdqi+EVft
	 FccyEcY3FdhYQRJAyG876fQxvX/3mAxtTRe43sMHrP3Z/PYO8nBsIPnB7mi7Hrb8RA
	 jtDpgCJZuAVrHh6Du+kEXI815oijMr7PfcMgvRiaT/1D2oLOzsss/579yW+ZgKgXoA
	 G96G0l75NEJPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5723A81A65;
	Wed,  4 Mar 2026 21:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37AC4223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74BE5811AF
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbBJAoh_EBCG for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9D2F811B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9D2F811B9
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6062863AF; Wed,  4 Mar 2026 21:50:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:48:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf16e1abe01d76916a0951fc52e5b57c6998607f
X-Git-Newrev: bd06eace372761d7ced25d73579122db8d643058
X-Patchwork-Hint: ignore
Message-Id: <20260304215027.A6062863AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: boot/test_grub: remove
 32bit EFI test
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd06eace372761d7ced25d73579122db8d643058
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

EDK2 removed OVMF IA32 support in commit [1], which is included in
version edk2-stable202511. This commit removes the test relying on it.

[1] https://github.com/tianocore/edk2/commit/1fb88ffe284782cc79e306306b8d19829b6248b7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
