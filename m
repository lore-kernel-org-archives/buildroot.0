Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BDEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:09:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 898E661BAA
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 898E661BAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5078B40926;
	Wed, 17 Nov 2021 15:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stmy0B_DK00n; Wed, 17 Nov 2021 15:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF3040937;
	Wed, 17 Nov 2021 15:09:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13C271BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EBC480CE6
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MESD9WIl8Gug for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BDF480CA4
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 056F38D47B; Wed, 17 Nov 2021 15:05:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:01:26 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 4842afad1ea336fcf3a704bdc7becf3af85d7f71
X-Git-Newrev: 3934f1ec89a77e916e0f862ae9c6008fadbd32fc
X-Patchwork-Hint: ignore
Message-Id: <20211117150507.056F38D47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=3934f1ec89a77e916e0f862ae9c6008fadbd32fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
