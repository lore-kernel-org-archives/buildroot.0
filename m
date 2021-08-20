Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85845C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D0D961130
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D0D961130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A610400F7;
	Fri, 20 Aug 2021 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlcosFziy8rK; Fri, 20 Aug 2021 21:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA8A540723;
	Fri, 20 Aug 2021 21:38:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0BEE1BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD9A06142B
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEUEANNQJiVR for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:38:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBED260612
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:38:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3A7308D5B6; Fri, 20 Aug 2021 21:37:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 23:37:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c52337143309d0ffd58a7f06ef85fdfdaa5a7a2
X-Git-Newrev: 1e09dd3e4439579ec4d984dc79c7a05153074ecd
X-Patchwork-Hint: ignore
Message-Id: <20210820213724.3A7308D5B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-gpu-viv: drop pkg-config files installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e09dd3e4439579ec4d984dc79c7a05153074ecd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We manually install pkg-config files from
$(@D)/gpu-core/usr/lib/pkgconfig to the STAGING_DIR right after
copying the entire $(@D)/gpu-core/usr/* files to STAGING_DIR. This
makes the manual copying of pkg-config files pretty useless.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 51b04f82d4..9d974cac41 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -75,11 +75,6 @@ endef
 
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
-	for lib in egl gbm glesv1_cm glesv2 vg; do \
-		$(INSTALL) -m 0644 -D \
-			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
-			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
-	done
 endef
 
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
