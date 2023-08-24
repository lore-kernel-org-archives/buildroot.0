Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D416C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 20:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3240C416B2;
	Thu, 24 Aug 2023 20:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3240C416B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvHFTwG7WlB4; Thu, 24 Aug 2023 20:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B93D416B1;
	Thu, 24 Aug 2023 20:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B93D416B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 619871BF27E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4795D41722
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4795D41722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HKw5RJch5hn for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 20:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D783416B9
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 20:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D783416B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E300786263; Thu, 24 Aug 2023 20:33:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 22:32:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ebe92f37a2c0db044a03d314da39eff8c237f909
X-Git-Newrev: 486664685d887773105ab323a4279b95411f683d
X-Patchwork-Hint: ignore
Message-Id: <20230824203324.E300786263@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_pc2: change
 /dev/ mangement to mdev
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=486664685d887773105ab323a4279b95411f683d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is needed to auto-load some kernel modules needed for the HW to
work.

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_pc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 7536704947..a1fb9a112c 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -2,6 +2,7 @@ BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
