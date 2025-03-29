Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22E3C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 10:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B0A40B77;
	Sat, 29 Mar 2025 10:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6-RVkGCYh-b; Sat, 29 Mar 2025 10:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD077409C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD077409C3;
	Sat, 29 Mar 2025 10:15:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89E1519C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7602C408F1
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ns_TLN0VT0f4 for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 10:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D88694018F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D88694018F
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:15:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C61D8835DA; Sat, 29 Mar 2025 10:15:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 11:14:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d85d23e16fdf9e6574e2a3cbdf4d27d17cd6942
X-Git-Newrev: f3ce9a56f92a07c1fe30ea6054923a2266dcb5b2
X-Patchwork-Hint: ignore
Message-Id: <20250329101537.C61D8835DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d:
 re-install headers to staging
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
Content-Type: multipart/mixed; boundary="===============5252406946978867985=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5252406946978867985==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f3ce9a56f92a07c1fe30ea6054923a2266dcb5b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 44355f799805 ("package/freescale-imx/imx-gpu-g2d: install the
specific library for i.MX8MM") accidentally remove the headers'
installation to the staging directory. Fix that.

Fixes: 44355f799805 ("package/freescale-imx/imx-gpu-g2d: install the specific library for i.MX8MM")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 1154943b3a..3d67d22f67 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -26,6 +26,7 @@ endef
 IMX_GPU_G2D_SUBDIR = $(if $(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM),mx8mm,)
 
 define IMX_GPU_G2D_INSTALL_STAGING_CMDS
+	cp -a $(@D)/g2d/usr/include/* $(STAGING_DIR)/usr/include/
 	cp -a $(@D)/g2d/usr/lib/$(IMX_GPU_G2D_SUBDIR)/libg2d*  $(STAGING_DIR)/usr/lib/
 endef
 

--===============5252406946978867985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5252406946978867985==--
