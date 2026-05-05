Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4978FFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9C160B62;
	Tue,  5 May 2026 21:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOB1aXnQeBxJ; Tue,  5 May 2026 21:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAD4560B77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016032;
	bh=hVJxfeYKJl2wp/IE6Ih/OhBX790whNz6ye0A3rA/lrc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dvqql0AO5DpiXwwOT8FqGedv3vyHr9oSdSE7i+kd71DW+OujU1+5MBy8Yszp98YLT
	 9bpHnBgkj65TkYAwnxi6uu8ZP/VqcPs8VdSlRVjRZYMSLj/X6gPINV0VnrIxReuh8r
	 4E7CGac9ZoVObyk+wypTaZgSEgeKtzJ9FQd3yAY8RDOcvzgNToRz62kSrmEJJbmnb3
	 kgVueXIcasiVVHxFvZjV79Myo1aJTgRFH8PlIgn8dTgIaOmnET95fUJlvnU6d4tW8R
	 BG0Ju5pplcPGwii0Oj54PCCVWmg489+f4TjxbwuGDYO581xWZ1EI9P0zfU62rbTMqs
	 FaAbBiesMmmQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD4560B77;
	Tue,  5 May 2026 21:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ECA4315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB0D040C29
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3EcF-LOv-4R for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F69840B58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F69840B58
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B3C484569; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 760e16dcc033bb743cacf56449011bc6cdaf7bed
X-Git-Newrev: 9b93856d2d0f58cdbfe1256f691ec9848f755261
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.1B3C484569@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_grub: Kernel update
 bump to last LTS (6.18)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b93856d2d0f58cdbfe1256f691ec9848f755261
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y :
While building the kernel tools, libelf header is missing because objtools
was not compiled by default on older kernel versions. This results in the following error:

[...]tools/objtool/include/objtool/elf.h:10:10: fatal error: gelf.h: No such file or directory
   10 | #include <gelf.h>

That is why BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF was selected to build host-libelf.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
[Julien: updated kernel to 6.18.21]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_grub.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 061bfc9a2f..e873683b5a 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -14,7 +14,7 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
         BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -43,11 +43,12 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
         BR2_LINUX_KERNEL_INSTALL_TARGET=y
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_PACKAGE_EFIVAR=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_EDK2=y
@@ -91,7 +92,7 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         BR2_ROOTFS_POST_IMAGE_SCRIPT="{post_image}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
@@ -139,7 +140,7 @@ class TestGrubRiscV64EFI(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/riscv64-virt-efi/genimage.cfg"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.59"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
         BR2_PACKAGE_EFIVAR=y
         BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
