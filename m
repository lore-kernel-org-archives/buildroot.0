Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6033CC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:38:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E4B61130
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24E4B61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE11E60612;
	Fri, 20 Aug 2021 21:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r33FUrbBll-O; Fri, 20 Aug 2021 21:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 881196142A;
	Fri, 20 Aug 2021 21:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D19C21C1162
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0E6D40723
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k051bamTRVG1 for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:38:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8522400F7
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:38:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2ED758D5A1; Fri, 20 Aug 2021 21:37:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 23:37:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99896b841b30043f05a7dd2e9d9a9a48376f3aa3
X-Git-Newrev: 1c52337143309d0ffd58a7f06ef85fdfdaa5a7a2
X-Patchwork-Hint: ignore
Message-Id: <20210820213724.2ED758D5A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-gpu-viv: move pkg-config files fixup to the build
 step
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c52337143309d0ffd58a7f06ef85fdfdaa5a7a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The fixup of the pkg-config files modifies files in the build
directory (@D) but is done in the staging installation step, which
doesn't make much sense, especially since the build step already has
some fixup logic. So we move the fixup logic of the pkg-config files
into the build step.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 103c0341e3..51b04f82d4 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -42,16 +42,6 @@ define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
 
-# Instead of building, we fix up the inconsistencies that exist
-# in the upstream archive here. We also remove unused backend files.
-# Make sure these commands are idempotent.
-define IMX_GPU_VIV_BUILD_CMDS
-	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
-	for backend in fb x11 wayland; do \
-		$(RM) -r $(@D)/gpu-core/usr/lib/$$backend ; \
-	done
-endef
-
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
@@ -72,9 +62,19 @@ define IMX_GPU_VIV_FIXUP_PKGCONFIG
 endef
 endif
 
+# Instead of building, we fix up the inconsistencies that exist
+# in the upstream archive here. We also remove unused backend files.
+# Make sure these commands are idempotent.
+define IMX_GPU_VIV_BUILD_CMDS
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
+	for backend in fb x11 wayland; do \
+		$(RM) -r $(@D)/gpu-core/usr/lib/$$backend ; \
+	done
+	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
+endef
+
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
-	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
 		$(INSTALL) -m 0644 -D \
 			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
