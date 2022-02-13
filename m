Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7631EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 10:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E49A60B5D;
	Sun, 13 Feb 2022 10:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yt_W19XCrYPc; Sun, 13 Feb 2022 10:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3D460A8A;
	Sun, 13 Feb 2022 10:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 155401BF2C9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0414C80F5D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fLbqQ3BvAqGt for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 10:48:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5642880F48
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 10:48:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 503F782815; Sun, 13 Feb 2022 10:41:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 11:45:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93d751217ee4cc18ebe48138ee4e712b5224fcf7
X-Git-Newrev: bc54915cebf609b4b4b2037f9ba6464ff2a7e9f3
X-Patchwork-Hint: ignore
Message-Id: <20220213104101.503F782815@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: add rng tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc54915cebf609b4b4b2037f9ba6464ff2a7e9f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add rng tools. Without this, when booting, prompt will not
appear until 'random: crng init done' appears.
Avoid this by using rng tools without the libjitterentropy.
Libjitterentropy is a jitter source of entropy which does
not help for AT91 cpus as the jitter does not have
enough variance to generate fast enough entropy.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/microchip_sama7g5ek_mmc_dev_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index c11ea2f518..6eb6c282e0 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -31,6 +31,8 @@ BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_RNG_TOOLS=y
+# BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY is not set
 BR2_PACKAGE_SETSERIAL=y
 BR2_PACKAGE_SPI_TOOLS=y
 BR2_PACKAGE_USBUTILS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
