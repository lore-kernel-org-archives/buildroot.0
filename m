Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD9C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 15:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19B74179F;
	Sat, 24 Sep 2022 15:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F19B74179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eqU_SGP6Uz1; Sat, 24 Sep 2022 15:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1EC410BD;
	Sat, 24 Sep 2022 15:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1EC410BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E64D1BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 279F960BF6
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 279F960BF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKK672O6CT5j for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 15:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A50960E0A
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 15:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A50960E0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3818F854F4; Sat, 24 Sep 2022 15:09:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 17:09:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fca098295bcae0c277a2a89873afdedb1145026
X-Git-Newrev: 711ec0ceaaa10275a5ca23d54e656f782d1a5d81
X-Patchwork-Hint: ignore
Message-Id: <20220924150947.3818F854F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: fix
 gbm.pc
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

commit: https://git.buildroot.net/buildroot/commit/?id=711ec0ceaaa10275a5ca23d54e656f782d1a5d81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgbm isn't output/target specific, only one version is included
in gpu-core/usr/lib/libgbm.so.
Similarly only gbm.pc is included and not gbm_x11.pc.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 63d5d3c2ea..3c88b8b11e 100644
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
