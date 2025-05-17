Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8ADC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4751071056;
	Mon, 19 May 2025 11:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIQ2VGg6EGa5; Mon, 19 May 2025 11:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A49B7104E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A49B7104E;
	Mon, 19 May 2025 11:03:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6495D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25101410E1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hc2s1C-nkj_B for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D28CE411C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D28CE411C2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D10BF83BC0; Mon, 19 May 2025 10:40:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 16:03:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3f1f404b5c59eaf3ae52ef1a4c8c2d74c0b5c80c
X-Git-Newrev: 15cfdf4915f32e8dffc3eae65d3b406ed219ebe9
X-Patchwork-Hint: ignore
Message-Id: <20250519104007.D10BF83BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: update vc4/v3d
 drivers help messages
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
Content-Type: multipart/mixed; boundary="===============4536824994994839891=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4536824994994839891==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=15cfdf4915f32e8dffc3eae65d3b406ed219ebe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This updates the VC4/V3D driver messages with the addition of the
current supported hardwares (VideoCore and Raspberry Pi).

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 841a173ac2..99cb0b955c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -255,7 +255,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 # runtime
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
-	  Driver for Broadcom VC6 (rpi4) GPUs (needs vc4).
+	  Driver for Broadcom VC6/7 (rpi4/5) GPUs (needs vc4).
 
 	  It requires a kernel 4.18+ with DRM V3D support enabled:
 
@@ -270,7 +270,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
-	  Driver for Broadcom VC4 (rpi2/3) GPUs.
+	  Driver for Broadcom VC4 (rpi0/1/2/3) GPUs.
+
 	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL

--===============4536824994994839891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4536824994994839891==--
