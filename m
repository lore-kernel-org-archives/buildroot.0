Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA17C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA5F40B13;
	Sat, 23 Jul 2022 17:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA5F40B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onYKWG8_lQ0g; Sat, 23 Jul 2022 17:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F8114055E;
	Sat, 23 Jul 2022 17:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8114055E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7AEC1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C064260FD7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C064260FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZnuIqUPL7pE for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:04:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0015460F9F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0015460F9F
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AFBBA848C5; Sat, 23 Jul 2022 16:51:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:04:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f3debbc370a48fc2f408701088162041bcf1f7c
X-Git-Newrev: 13bb4199386ddfc8a6aa5946e4aeabe6ef311b6b
X-Patchwork-Hint: ignore
Message-Id: <20220723165112.AFBBA848C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: update readme.txt details
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=13bb4199386ddfc8a6aa5946e4aeabe6ef311b6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the Qemu-compatible UEFI firmware, the kraxel.org pointed to by
the readme.txt file is outdated. Instead, instruct users to use EDK2.
either by building it from source, or by grabbing pre-built ones, or
from their distributions.

While at it, drop the pci=nocrs information, as it is no longer
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/readme.txt | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
index 0282fbdd13..5d59fb4e22 100644
--- a/boot/grub2/readme.txt
+++ b/boot/grub2/readme.txt
@@ -86,17 +86,14 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
 To test your i386/x86-64 EFI image in Qemu
 ------------------------------------------
 
-1. Download the EFI BIOS for Qemu
-   Version IA32 or X64 depending on the chosen Grub2
-   platform (i386-efi vs. x86-64-efi)
-   https://www.kraxel.org/repos/jenkins/edk2/
-   (or use one provided by your distribution as OVMF)
-2. Extract, and rename OVMF.fd to bios.bin and
-   CirrusLogic5446.rom to vgabios-cirrus.bin.
-3. qemu-system-{i386,x86-64} -L ovmf-dir/ -hda disk.img
-4. Make sure to pass pci=nocrs to the kernel command line,
-   to workaround a bug in the EFI BIOS regarding the
-   EFI framebuffer.
+1. Download/install the EFI BIOS for Qemu
+   You can get it using the edk2 package in Buildroot (installed
+   in BINARIES_DIR), grab prebuilt images from the unofficial nightly
+   builds [0], or use one provided by your distribution as OVMF.
+
+   [0] https://github.com/retrage/edk2-nightly
+
+2. qemu-system-{i386,x86-64} -bios <path-to-OVMF.fd> -hda disk.img
 
 Notes on using Grub2 for ARM u-boot-based platforms
 ===================================================
@@ -177,8 +174,13 @@ using qemu and EFI firmware built for qemu.
  2. make
 
  3. Download the EFI firmware for qemu aarch64
-    https://www.kraxel.org/repos/jenkins/edk2/
-    (or use one provided by your distribution as OVMF-aarch64 or AAVMF)
+
+    You can get it using the edk2 package in Buildroot (installed
+    in BINARIES_DIR), grab prebuilt images from the unofficial nightly
+    builds [1], or use one provided by your distribution as OVMF-aarch64
+    or AAVMF.
+
+    [1] https://github.com/retrage/edk2-nightly
 
  4. Run qemu with:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
