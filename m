Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98453C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 12:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 445B283829;
	Sat,  1 Mar 2025 12:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVdKiOKzQNiS; Sat,  1 Mar 2025 12:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 491F98494F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491F98494F;
	Sat,  1 Mar 2025 12:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE383181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1EF76FC60
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cW6UjYTH2DKb for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A636FBE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1A636FBE8
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87CAD87E7F; Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:31:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c5c772ef8036c530763c1c00ac54c97f3e89b0ab
X-Git-Newrev: 44355f79980562177228c5f010683fa4cffe47b9
X-Patchwork-Hint: ignore
Message-Id: <20250301124922.87CAD87E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-gpu-g2d: install the specific library for i.MX8MM
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
Content-Type: multipart/mixed; boundary="===============3322160162230257211=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3322160162230257211==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=44355f79980562177228c5f010683fa4cffe47b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============3322160162230257211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3322160162230257211==--
