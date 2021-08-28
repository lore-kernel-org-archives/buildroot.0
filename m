Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5771C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:54:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58F186054E
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58F186054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E9164012A;
	Sat, 28 Aug 2021 15:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emLIcLZB7iJe; Sat, 28 Aug 2021 15:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DA4A401D1;
	Sat, 28 Aug 2021 15:54:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 767471BF95A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64A42606C2
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tagy87NbZZd for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:54:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D53B605F0
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:54:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E173E85F2F; Sat, 28 Aug 2021 15:53:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:49:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8c8a2973c7aaa42be1b057c45f42c7bd98c0d10b
X-Git-Newrev: 6d664e9cfe6475cf7020e0f7e802b53f082c2250
X-Patchwork-Hint: ignore
Message-Id: <20210828155322.E173E85F2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl2: use
 BR2_PACKAGE_MESA3D_GBM
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d664e9cfe6475cf7020e0f7e802b53f082c2250
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BR2_PACKAGE_MESA3D_GBM should be used instead of
BR2_PACKAGE_MESA3D_OPENGL_EGL as spotted by Arnout in review of
https://patchwork.ozlabs.org/project/buildroot/patch/20210821093908.677218-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sdl2/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 07de75a4d5..2ad45e4d00 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -32,14 +32,13 @@ comment "X11 video driver needs X.org"
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
 	depends on BR2_PACKAGE_LIBDRM
-	# requires libgbm from mesa3d
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_PACKAGE_MESA3D_GBM
 
 comment "KMS/DRM video driver needs libdrm"
 	depends on !BR2_PACKAGE_LIBDRM
 
-comment "KMS/DRM video driver needs an OpenGL EGL backend provided by mesa3d"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+comment "KMS/DRM video driver needs mesa3d w/ GBM"
+	depends on !BR2_PACKAGE_MESA3D_GBM
 
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
