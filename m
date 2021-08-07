Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB437C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:36:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273E060EB2
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 273E060EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B7D40247;
	Sat,  7 Aug 2021 10:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdPuFuwUS0dC; Sat,  7 Aug 2021 10:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0CBD4023C;
	Sat,  7 Aug 2021 10:36:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1A61BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C03C6067F
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NzqJTDD8Gdd5 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:35:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1E6C6065C
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 10:35:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D253D8758E; Sat,  7 Aug 2021 10:35:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 12:35:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7491bf18b2f668340d6d504f419aef14f964d45c
X-Git-Newrev: 2007a6e5e609edcccf75f7e6e58f9732cbb44cb3
X-Patchwork-Hint: ignore
Message-Id: <20210807103542.D253D8758E@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 configs/microchip_sama5d2_icp_mmc_dev_defconfig: drop
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2007a6e5e609edcccf75f7e6e58f9732cbb44cb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig is download at91bootstrap3 using a tarball, not over
git.

Fixes:

  configs/microchip_sama5d2_icp_mmc_dev_defconfig:63:warning: override: BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL changes choice state

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/microchip_sama5d2_icp_mmc_dev_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index 1966d4baf1..50ae0a9ce7 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -59,7 +59,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0-rc2)/at91bootstrap-v4.0.0-rc2.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_icpsd_uboot"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
