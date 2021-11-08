Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CAAC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 09:58:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44FC260F36
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 09:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44FC260F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E897F607D3;
	Mon,  8 Nov 2021 09:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0iWrRDiWcAn8; Mon,  8 Nov 2021 09:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451CF607CA;
	Mon,  8 Nov 2021 09:58:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9790E1BF373
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 09:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8395740101
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 09:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_qDgfeCgmLE for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 09:57:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FADC40175
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 09:57:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5FE798B604; Mon,  8 Nov 2021 09:54:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 10:56:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17c516d67afd041093964824dcb0dfa8fc618fe6
X-Git-Newrev: 0bd07a0cc63c0933fcda5c78fbda6df99c4aaa29
X-Patchwork-Hint: ignore
Message-Id: <20211108095407.5FE798B604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_aarch64_sbsa_defconfig: add
 gitlab runtime testing tag
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bd07a0cc63c0933fcda5c78fbda6df99c4aaa29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the runtime testing by adding the tag in the readme.txt

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Reviewed-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/aarch64-sbsa/readme.txt  | 2 +-
 configs/qemu_aarch64_sbsa_defconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
index b62947f55f..cf5f66d4d6 100644
--- a/board/qemu/aarch64-sbsa/readme.txt
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -23,7 +23,7 @@ Run the emulation with:
     -nographic \
     -pflash output/images/SBSA_FLASH0.fd \
     -pflash output/images/SBSA_FLASH1.fd \
-    -hda output/images/disk.img
+    -hda output/images/disk.img # qemu_aarch64_sbsa_defconfig
 
 Note that if you want to run sbsa-ref emulation with QEMU provided by
 your distro (i.e., not host-qemu by Buildroot) then you may need to
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index d1e0adadd1..e7d3bd03ca 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -16,8 +16,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 
 # Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
 
 # Linux headers same as kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
