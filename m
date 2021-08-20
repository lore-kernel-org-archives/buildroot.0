Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358FAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:43:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD0560E52
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECD0560E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFC704013E;
	Sat,  4 Sep 2021 18:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXPTsNxrTXVV; Sat,  4 Sep 2021 18:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D21FC4022D;
	Sat,  4 Sep 2021 18:43:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03F9F1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0212B4026C
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20F_YVbNXw1K for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 755134013E
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D6CB8834C; Sat,  4 Sep 2021 18:23:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 23:37:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c52337143309d0ffd58a7f06ef85fdfdaa5a7a2
X-Git-Newrev: 1e09dd3e4439579ec4d984dc79c7a05153074ecd
X-Patchwork-Hint: ignore
Message-Id: <20210904182355.3D6CB8834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: drop
 pkg-config files installation
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e09dd3e4439579ec4d984dc79c7a05153074ecd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
