Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAAEC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC108142B;
	Mon,  5 Dec 2022 12:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC108142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bBVjfZvhUzl; Mon,  5 Dec 2022 12:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FEB81420;
	Mon,  5 Dec 2022 12:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69FEB81420
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13A571BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14DE6416B9
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14DE6416B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-VyBFvmpGa3 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 374E3415DE
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 374E3415DE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 350EF85BA2; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:54:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43f6ae0de3220118ec6520b421b39c580396720d
X-Git-Newrev: 4ef729d1cf86a9793c34a794f89905ca502e86d3
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.350EF85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro-vc:
 add INSTALL_STAGING_CMDS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ef729d1cf86a9793c34a794f89905ca502e86d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an INSTALL_STAGING_CMDS define as libraries needed by
imx-vpu-hantro-daemon.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index 1f033c1434..3d266fb5bd 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -8,6 +8,7 @@ IMX_VPU_HANTRO_VC_VERSION = 1.9.0
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
+IMX_VPU_HANTRO_VC_INSTALL_STAGING = YES
 
 IMX_VPU_HANTRO_VC_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
@@ -17,6 +18,13 @@ define IMX_VPU_HANTRO_VC_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
 endef
 
+define IMX_VPU_HANTRO_VC_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/
+	cp -dpfr $(@D)/usr/include/hantro_VC8000E_enc/*.h $(STAGING_DIR)/usr/include/
+	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so $(STAGING_DIR)/usr/lib/libhantro_vc8000e.so
+	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so.1 $(STAGING_DIR)/usr/lib/libhantro_vc8000e.so.1
+endef
+
 define IMX_VPU_HANTRO_VC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so
 	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so.1 $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
