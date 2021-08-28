Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE0CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:45:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DA1060F56
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DA1060F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D53EE81B60;
	Sat,  4 Sep 2021 18:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LplEpjHkKWQT; Sat,  4 Sep 2021 18:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 299EC81C0A;
	Sat,  4 Sep 2021 18:45:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7DF1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A1FD40275
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKYcyfgRZPlp for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8628B402B8
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 57B7D8834A; Sat,  4 Sep 2021 18:23:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:49:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c8a2973c7aaa42be1b057c45f42c7bd98c0d10b
X-Git-Newrev: 6d664e9cfe6475cf7020e0f7e802b53f082c2250
X-Patchwork-Hint: ignore
Message-Id: <20210904182356.57B7D8834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: use BR2_PACKAGE_MESA3D_GBM
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d664e9cfe6475cf7020e0f7e802b53f082c2250
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
