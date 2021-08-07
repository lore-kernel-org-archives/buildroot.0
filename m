Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1308DC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:34:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A5761158
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90A5761158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 467754024F;
	Sat,  7 Aug 2021 10:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoVm1kUW9-qn; Sat,  7 Aug 2021 10:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 604AC40265;
	Sat,  7 Aug 2021 10:34:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4A0A1BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD2D96065C
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KH-_5ormBIye for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:34:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E990605F4
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 10:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0F23A8C9D9; Sat,  7 Aug 2021 10:34:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 12:33:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28803d38e571250d599b1c59054f09cfef6a7a04
X-Git-Newrev: 7491bf18b2f668340d6d504f419aef14f964d45c
X-Patchwork-Hint: ignore
Message-Id: <20210807103404.0F23A8C9D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 configs/microchip_sama5d2_icp_mmc_defconfig: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=7491bf18b2f668340d6d504f419aef14f964d45c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig is download at91bootstrap3 using a tarball, not over
git.

Fixes:

  configs/microchip_sama5d2_icp_mmc_defconfig:20:warning: override: BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL changes choice state

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/microchip_sama5d2_icp_mmc_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
index 2196555311..e41fdf2d31 100644
--- a/configs/microchip_sama5d2_icp_mmc_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_defconfig
@@ -16,7 +16,6 @@ BR2_TARGET_ROOTFS_EXT2=y
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
