Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBB7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:42:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AFF860F13
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AFF860F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE5E404CF;
	Mon,  6 Sep 2021 15:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upkDhCBl2Zul; Mon,  6 Sep 2021 15:42:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AA8404D7;
	Mon,  6 Sep 2021 15:42:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 861F81BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 747E8824CB
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-ccJgjWGuG6 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:42:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D156682499
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:42:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3468A886E5; Mon,  6 Sep 2021 15:40:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 17:39:11 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 6608f2a3c4f25a5e1fc506b19ecf74517b0b4dc8
X-Git-Newrev: a756987095993805ae05b303db735fa8b13841a5
X-Patchwork-Hint: ignore
Message-Id: <20210906154059.3468A886E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/sdl2: kmsdrm
 needs GBM
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

commit: https://git.buildroot.net/buildroot/commit/?id=a756987095993805ae05b303db735fa8b13841a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

kmsdrm needs GBM (and so mesa3d) since its addition in version 2.0.6:
https://github.com/libsdl-org/SDL/commit/56363ebf6124b345e1cfbd14fb6c0e654837910c

If libgbm is not found, kmsdrm will be silently disabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5bb4e281c0c9fdd867eb7471f4e1ae82028d596d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/Config.in | 5 +++++
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index f29b3c7c38..07de75a4d5 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -32,10 +32,15 @@ comment "X11 video driver needs X.org"
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
 	depends on BR2_PACKAGE_LIBDRM
+	# requires libgbm from mesa3d
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
 
 comment "KMS/DRM video driver needs libdrm"
 	depends on !BR2_PACKAGE_LIBDRM
 
+comment "KMS/DRM video driver needs an OpenGL EGL backend provided by mesa3d"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
 	depends on BR2_PACKAGE_HAS_LIBGL
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index a2e426e578..c7fe7051de 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -150,7 +150,7 @@ SDL2_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2_KMSDRM),y)
-SDL2_DEPENDENCIES += libdrm
+SDL2_DEPENDENCIES += libdrm mesa3d
 SDL2_CONF_OPTS += --enable-video-kmsdrm
 else
 SDL2_CONF_OPTS += --disable-video-kmsdrm
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
