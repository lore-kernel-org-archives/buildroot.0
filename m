Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADFBC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DC5D82768;
	Tue, 18 Mar 2025 15:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mH6-NbLtdQMM; Tue, 18 Mar 2025 15:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78EB98224A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78EB98224A;
	Tue, 18 Mar 2025 15:03:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 193B7D8C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 590C18141B
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LSvDd6-PDvE for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C9E814BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40C9E814BB
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E497880EC; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:31:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5c772ef8036c530763c1c00ac54c97f3e89b0ab
X-Git-Newrev: 44355f79980562177228c5f010683fa4cffe47b9
X-Patchwork-Hint: ignore
Message-Id: <20250318150242.3E497880EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d: install
 the specific library for i.MX8MM
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============4710566122759843691=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4710566122759843691==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=44355f79980562177228c5f010683fa4cffe47b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the i.MX8MM, this package contains a specific library that is not
linked to OpenCL because there is no openCL support on i.MX8MM GPU.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 0a7ee3c298..213f20a7d9 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -22,12 +22,14 @@ define IMX_GPU_G2D_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_G2D_DL_DIR)/$(IMX_GPU_G2D_SOURCE))
 endef
 
+IMX_GPU_G2D_SUBDIR = $(if $(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM),mx8mm,)
+
 define IMX_GPU_G2D_INSTALL_STAGING_CMDS
-	cp -a $(@D)/g2d/usr/* $(STAGING_DIR)/usr
+	cp -a $(@D)/g2d/usr/lib/$(IMX_GPU_G2D_SUBDIR)/libg2d*  $(STAGING_DIR)/usr/lib/
 endef
 
 define IMX_GPU_G2D_INSTALL_TARGET_CMDS
-	cp -a $(@D)/g2d/usr/lib $(TARGET_DIR)/usr
+	cp -a $(@D)/g2d/usr/lib/$(IMX_GPU_G2D_SUBDIR)/libg2d*  $(TARGET_DIR)/usr/lib/
 endef
 
 $(eval $(generic-package))

--===============4710566122759843691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4710566122759843691==--
