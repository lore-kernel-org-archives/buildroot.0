Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C83C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:41:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C488F610A2
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C488F610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A100980EF5;
	Wed, 10 Nov 2021 09:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MY4Sw2vbuZRW; Wed, 10 Nov 2021 09:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 096B480EF2;
	Wed, 10 Nov 2021 09:41:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6431BF9B4
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF6380EF5
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RSJif8ifj06 for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6496F80EF2
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AA34C8B885; Wed, 10 Nov 2021 09:36:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 10:38:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a3165e0977ad44ce487f8b346ebcfaf78237f9a
X-Git-Newrev: 8e86c81418f681bce5d6507ee016d7786e048af0
X-Patchwork-Hint: ignore
Message-Id: <20211110093634.AA34C8B885@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpuwrap: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e86c81418f681bce5d6507ee016d7786e048af0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override IMX_VPUWRAP_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: keep multi-line conditional blocks]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
