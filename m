Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921C8107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F3B41059;
	Sat, 14 Mar 2026 08:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ks0le769DeAo; Sat, 14 Mar 2026 08:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8373741040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475236;
	bh=x99GT7fNuk8rGI3HTiIt98F7j2czK/xc8aOeuDHFvH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H2Fu4v7iAC5O9NrborqNXLvT81dLs/ctohCkNTntLpwCdN+n4r3kvY75+MikbcAPa
	 ptyDjBFy0R8tVg3FmpcyXTZGgFy+TrrHyba1L3C0TQY2GGbnMFa3DNXcIi18bRV1va
	 mFpZBG9T4jUHATLgi+znMcWvUDwEaAcU01Xs0/84+WYZqP5M3k4DP6hi0HT+RDT6B/
	 8G6VnUVwEgkLZDpF1IBw5X3mUQ2q4khjpZ4cWAUx8zyDQzYCDOivcqi6Dab4rz7LCn
	 7P8hit/NyRlyFUiMJyGadMSD05rY3lNafTcJx4AedKKoyI3hbOjFzb88jZ2TA+zyqk
	 Od4mUwT+l/0rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8373741040;
	Sat, 14 Mar 2026 08:00:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 030DA1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87C2961024
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PviEdP1MFm46 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9337561009
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9337561009
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8B8E85E16; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:03:13 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8e9f7ab19a66bd833a61ad72e63d50e5a34ea26d
X-Git-Newrev: 95cd6f8bc3d0fca48a95e96ea287d3c684e4f624
X-Patchwork-Hint: ignore
Message-Id: <20260314080009.C8B8E85E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95cd6f8bc3d0fca48a95e96ea287d3c684e4f624
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
