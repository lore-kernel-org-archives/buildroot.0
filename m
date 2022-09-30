Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEABC433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 697BE4103C;
	Fri, 30 Sep 2022 15:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 697BE4103C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHMh5qAZ_mp1; Fri, 30 Sep 2022 15:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0996B41150;
	Fri, 30 Sep 2022 15:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0996B41150
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7DFC1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833C5842F8
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833C5842F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5NQ95gIzs9V for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:43:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD09D842F7
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD09D842F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB552866CC; Fri, 30 Sep 2022 15:43:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:33:35 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 95ed78ab7d26f45af09485b57a8ec0e33d70a4cb
X-Git-Newrev: 07306350b723a8c918eff3976ba3f53593ba2ba9
X-Patchwork-Hint: ignore
Message-Id: <20220930154304.BB552866CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/freescale-imx/imx-gpu-viv: fix gbm.pc
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

commit: https://git.buildroot.net/buildroot/commit/?id=07306350b723a8c918eff3976ba3f53593ba2ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libgbm isn't output/target specific, only one version is included
in gpu-core/usr/lib/libgbm.so.
Similarly only gbm.pc is included and not gbm_x11.pc.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 711ec0ceaaa10275a5ca23d54e656f782d1a5d81)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 1d76d79e2b..3c013bc176 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -57,7 +57,7 @@ define IMX_GPU_VIV_FIXUP_PKGCONFIG
 endef
 else ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
-	$(foreach lib,egl gbm glesv1_cm glesv2 vg, \
+	$(foreach lib,egl glesv1_cm glesv2 vg, \
 		ln -sf $(lib)_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$(lib).pc
 	)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
