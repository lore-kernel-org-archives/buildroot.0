Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11499C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:05:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD73E61B72
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD73E61B72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C38404A9;
	Wed, 17 Nov 2021 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hkpiPAXaoAS; Wed, 17 Nov 2021 15:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B3140319;
	Wed, 17 Nov 2021 15:05:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2011BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEFE7606CC
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SyGRAUdvK35 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F8D66064F
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:05:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF0B98B8BD; Wed, 17 Nov 2021 15:01:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:01:43 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 48ef67212d6fc4b24a8b943e270f9e578f18ed2e
X-Git-Newrev: cfa225ea10148502964603a685ea5da22d353778
X-Patchwork-Hint: ignore
Message-Id: <20211117150119.CF0B98B8BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/freescale-imx/imx-vpuwrap: don't override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfa225ea10148502964603a685ea5da22d353778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Don't override IMX_VPUWRAP_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: keep multi-line conditional blocks]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8e86c81418f681bce5d6507ee016d7786e048af0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index fdad3a5f2b..4f89165403 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -10,11 +10,11 @@ IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
 IMX_VPUWRAP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_IMX_VPU),y)
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu
+IMX_VPUWRAP_DEPENDENCIES += imx-vpu
 endif
 
 ifeq ($(BR2_PACKAGE_IMX_VPU_HANTRO),y)
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu-hantro
+IMX_VPUWRAP_DEPENDENCIES += imx-vpu-hantro
 endif
 
 IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
