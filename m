Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F22C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:39:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C9E361102
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C9E361102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F393642568;
	Fri, 20 Aug 2021 21:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9hcMRc_urum; Fri, 20 Aug 2021 21:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729C942566;
	Fri, 20 Aug 2021 21:39:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 168571BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0D9A400F7
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRiZ57cIS975 for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:38:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE52440729
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:38:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 479448D5A1; Fri, 20 Aug 2021 21:37:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 23:37:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e09dd3e4439579ec4d984dc79c7a05153074ecd
X-Git-Newrev: 880228044b1ee3f16b5e7fee065e8a2f57d31ee6
X-Patchwork-Hint: ignore
Message-Id: <20210820213724.479448D5A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-gpu-viv: make pkg-config fixups mutually
 exclusive
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

commit: https://git.buildroot.net/buildroot/commit/?id=880228044b1ee3f16b5e7fee065e8a2f57d31ee6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The IMX_GPU_VIV_FIXUP_PKGCONFIG fixup is defined conditionally
depending on the value of IMX_GPU_VIV_LIB_TARGET, which means that
obviously only one of the definitions is possible. Make this clear by
using a ifeq ... else ifeq ... else ifeq ... endif logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 9d974cac41..df39d3ddc2 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -46,15 +46,11 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
-endif
-
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
+else ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
-endif
-
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
+else ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
 		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc || exit 1; \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
