Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07EEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 12:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85DEA83180;
	Sat, 22 Jan 2022 12:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KklbsUAoF9D; Sat, 22 Jan 2022 12:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34EF83112;
	Sat, 22 Jan 2022 12:15:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 376621BF2AF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22B9160601
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RGRJd44zhnF for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 12:15:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8820B600D4
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 12:15:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CD63C82598; Sat, 22 Jan 2022 12:08:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 13:15:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 970f1b0df0e47979f0c6284dd5c40ff1d477b506
X-Git-Newrev: b399de3a1299636a734c96e6abef063d3dcfc0a9
X-Patchwork-Hint: ignore
Message-Id: <20220122120834.CD63C82598@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_pitx_imx8m: remove
 BR2_ARM_FPU_VFPV3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b399de3a1299636a734c96e6abef063d3dcfc0a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The FP setting is not used for aarch64 in buildroot. The FPU options are
set implicit.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/kontron_pitx_imx8m_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 4053e1e398..0e3868b583 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -1,6 +1,5 @@
 # Architecture
 BR2_aarch64=y
-BR2_ARM_FPU_VFPV3=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
