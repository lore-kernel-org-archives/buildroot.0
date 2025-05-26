Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5473FC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D361B83BF5;
	Sat, 31 May 2025 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfG9lwHZt_eA; Sat, 31 May 2025 17:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A93D483CE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A93D483CE0;
	Sat, 31 May 2025 17:06:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F998236
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89AA46072E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0qqnK4zh_ZL for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9045B607E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9045B607E7
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DD17861E5; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 18:52:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4717aa6f2ef2d41370c152d9d8ea8b9b8d08fc12
X-Git-Newrev: 1488157475581250017754c7126854e6762966cf
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.8DD17861E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mesa3d: update
 vc4/v3d drivers help messages
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0519779438112905379=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0519779438112905379==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1488157475581250017754c7126854e6762966cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This updates the VC4/V3D driver messages with the addition of the
current supported hardwares (VideoCore and Raspberry Pi).

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 15cfdf4915f32e8dffc3eae65d3b406ed219ebe9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mesa3d/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dd016c8b0f..37d2221946 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -248,7 +248,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 # runtime
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
-	  Driver for Broadcom VC6 (rpi4) GPUs (needs vc4).
+	  Driver for Broadcom VC6/7 (rpi4/5) GPUs (needs vc4).
 
 	  It requires a kernel 4.18+ with DRM V3D support enabled:
 
@@ -263,7 +263,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
-	  Driver for Broadcom VC4 (rpi2/3) GPUs.
+	  Driver for Broadcom VC4 (rpi0/1/2/3) GPUs.
+
 	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL

--===============0519779438112905379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0519779438112905379==--
