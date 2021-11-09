Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524A2C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:48:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1516061151
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1516061151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDEA04033B;
	Tue,  9 Nov 2021 10:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3kXqWa61xsi; Tue,  9 Nov 2021 10:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E99ED4032F;
	Tue,  9 Nov 2021 10:48:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E713B1BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D339A403CB
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_N-SDYTDPU5 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:48:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DC74403B7
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 965578B7C6; Tue,  9 Nov 2021 10:44:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 11:46:37 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b6d9a84b2ffcc443a600b42d06253ed244a002aa
X-Git-Newrev: 4f0c76c14bdcb96b96de3f2e62828223ed1a23a5
X-Patchwork-Hint: ignore
Message-Id: <20211109104440.965578B7C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 configs/qemu_aarch64_sbsa_defconfig: add gitlab runtime testing tag
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f0c76c14bdcb96b96de3f2e62828223ed1a23a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Enable the runtime testing by adding the tag in the readme.txt

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Reviewed-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0bd07a0cc63c0933fcda5c78fbda6df99c4aaa29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 9285ad7586..2eb75cbe87 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -15,8 +15,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
 
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
