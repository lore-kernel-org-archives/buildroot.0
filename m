Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF744C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 07:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5511D40025;
	Tue, 19 Jul 2022 07:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5511D40025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9_SdsOdzyzo; Tue, 19 Jul 2022 07:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1946540BA3;
	Tue, 19 Jul 2022 07:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1946540BA3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 578021BF355
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30C1D41527
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C1D41527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 73M-n9a5EJqm for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 07:40:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C20410E9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8C20410E9
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 07:40:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8839B1C0017;
 Tue, 19 Jul 2022 07:40:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 09:40:41 +0200
Message-Id: <20220719074042.2214649-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
References: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658216451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4LioqxtXbIbbgXxmb9jNwChF1Q6dJFv16LdUUyTkkk=;
 b=g3HXGr6e2Bncf+uSN1thE2w/55kdydxD1ikGrlGRIqW2juB6HnpHDTVwokXg3SrUDpq4ty
 JzU5+66w460y5kE0xXKUBWuietrqi/AC6xzua3RQlyrW8DYcrEKgHooFb8xFT6ZLM0gNgQ
 wR7GPj03tQ5UZe2ROLNvM+elFxRRjPoPH1CLgEitqgriJmRjYNY6A5Jo4xd2Z8sBQ2CMjl
 cknhKkz3vxUW7eUVjMqY6XEe0g3GtmxWpn8DDPQcbP4CuG69NzvFrN7dJ98lU14EYhxv5F
 3XMeuT4CIBC2BrVVs6IbX3zt2+r+a3q7khTaY5ong1iuM7r0jPztS+wrbYFp7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g3HXGr6e
Subject: [Buildroot] [PATCH 3/4] boot/grub2: update readme.txt details
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

For the Qemu-compatible UEFI firmware, the kraxel.org pointed to by
the readme.txt file is outdated. Instead, point to the recently added
ovmf-bin package in Buildroot.

While at it, drop the pci=nocrs information, as it is no longer
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/readme.txt | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
index 0282fbdd13..c8d475ec73 100644
--- a/boot/grub2/readme.txt
+++ b/boot/grub2/readme.txt
@@ -86,17 +86,10 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
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
+   You can get it using the ovmf-bin package in Buildroot (installed
+   in BINARIES_DIR), or use one provided by your distribution as OVMF.
+2. qemu-system-{i386,x86-64} -bios <path-to-OVMF.fd> -hda disk.img
 
 Notes on using Grub2 for ARM u-boot-based platforms
 ===================================================
@@ -177,8 +170,10 @@ using qemu and EFI firmware built for qemu.
  2. make
 
  3. Download the EFI firmware for qemu aarch64
-    https://www.kraxel.org/repos/jenkins/edk2/
-    (or use one provided by your distribution as OVMF-aarch64 or AAVMF)
+
+    You can get it using the ovmf-bin package in Buildroot (installed
+    in BINARIES_DIR), or use one provided by your distribution as
+    OVMF-aarch64 or AAVMF.
 
  4. Run qemu with:
 
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
