Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CC1C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B4A280E13;
	Wed,  7 Feb 2024 09:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAztrK1dT-77; Wed,  7 Feb 2024 09:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 740E680E4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740E680E4E;
	Wed,  7 Feb 2024 09:22:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A27FF1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 902086139B
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nCg69fpogPDJ for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA24B60AF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA24B60AF6
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:22:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2BFB87518; Wed,  7 Feb 2024 09:22:34 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 10:19:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b75fb9f5a51261843807779a99c6c383cdad95c1
X-Git-Newrev: 694001df1ad6024b2a3f2748bb3712c782573087
X-Patchwork-Hint: ignore
Message-Id: <20240207092234.B2BFB87518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62x_sk_defconfig: drop
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=694001df1ad6024b2a3f2748bb3712c782573087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfig choice is the default one, so it is redundant and can be
removed without effect.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/ti_am62x_sk_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 495b233789..f88252a89c 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -24,7 +24,6 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
