Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9AEEE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1037940545;
	Mon, 21 Aug 2023 13:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1037940545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2y7soh-VzixH; Mon, 21 Aug 2023 13:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220E140928;
	Mon, 21 Aug 2023 13:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 220E140928
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C23941BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98BDD40134
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98BDD40134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6J0WsLaYxcta for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:04:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C324036E
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C324036E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEF8585F9E; Mon, 21 Aug 2023 13:04:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 15:04:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 875ab7d9e3d32990cd07fbab3c68f31dfa9927a4
X-Git-Newrev: fd2fa74c5336d4efaaa3c9aabed625679d0e0265
X-Patchwork-Hint: ignore
Message-Id: <20230821130445.BEF8585F9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/microchip_mpfs_icicle_defconfig: update RVC config option
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd2fa74c5336d4efaaa3c9aabed625679d0e0265
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update the RISCV_ISA_RVC config option to match updated RISCV kconfig
instruction set options.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/microchip_mpfs_icicle_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index a3b3093982..54a4d55a5f 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,6 +1,6 @@
 BR2_riscv=y
 BR2_riscv_g=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
