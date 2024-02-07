Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D113C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E0783AA4;
	Wed,  7 Feb 2024 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0CP4zRAekpqp; Wed,  7 Feb 2024 14:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F0783ABE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F0783ABE;
	Wed,  7 Feb 2024 14:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C75B1BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35073401B1
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzpdjHsFURLO for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E49F5405ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E49F5405ED
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:58:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0B72875AB; Wed,  7 Feb 2024 14:58:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 15:57:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 820db039f2d6e34326400f01ab61d21cb664fa34
X-Git-Newrev: 65a12fb53ab95a22a2a7b19b8f53396ce4fb561c
X-Patchwork-Hint: ignore
Message-Id: <20240207145844.D0B72875AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am64x_sk_defconfig: drop
 redundant defconfig choice
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

commit: https://git.buildroot.net/buildroot/commit/?id=65a12fb53ab95a22a2a7b19b8f53396ce4fb561c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfig choice is the default one, so it is redundant and can be
removed without effect.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/ti_am64x_sk_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index b3e69e9e93..4bfd31f0c8 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -24,7 +24,6 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
