Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E97E92FDA
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 20:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DCC81E03;
	Mon, 29 Dec 2025 20:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1_cnjLFrtSy; Mon, 29 Dec 2025 20:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92CAF81DFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767041231;
	bh=7qhyLp/3qt53ODk+LD0zIjL3Uqzk75cwceVZB+eFHzk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ihNZB6VILZ61Ug6TP8wFJWvlBCuXiEueZg1lKizrrJi5VeDTuc1kIxSxMU+I1AJH4
	 qHXyvsHO4nJHmXj6ub4hnKV7+8T9F7t16fNso/KlW+ErzcYXE8KPMAociUlRM3///6
	 XAA/ASBy61JnRtnJxJJ64CPjriQXKC1+EfyDVH7p95gSHKBY+bmT3N9++mfbjs3vcg
	 ce9qkzaHHXDSchNJZhIbxp2LjbxN6E99JNtq1MZecWFIHrmS1isqDTde5/tMeTcmjb
	 NXHm2mCQxzllEZRlqIg7JjjiD15d2OVQ3TUEFW1RRiqmRHz7OPrjo/5Hb2EPE42H6N
	 pE+PmJzAbRttA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CAF81DFB;
	Mon, 29 Dec 2025 20:47:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27BED177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25588407AD
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 20:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MW8SOrHd9BWh for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 20:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E0F40792
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67E0F40792
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 20:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5767D87BAB; Mon, 29 Dec 2025 20:47:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 21:24:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f784c823ef8357aa36828342f83d5fd59995937e
X-Git-Newrev: 10419e76c6b70d79884b9da6361bdd5281068120
X-Patchwork-Hint: ignore
Message-Id: <20251229204709.5767D87BAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/piglit: bump version to git
 62d499d63d
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10419e76c6b70d79884b9da6361bdd5281068120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disabled vulkan tests added by upstream commit:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f

Added X11-related configure options due to upstream commit:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/d958b70d1fc5c2ee039363d862b14ca498a50e82

Added configure options to fix build errors without libdrm and with
libegl/libgles enabled but without X11.
These build errors were not seen before due to other build errors
unfixed since the bump of python3 to 3.10 with buildroot commit
25b1fc2898d68ddf2674b14c738045875fc5a2dc:
https://patchwork.ozlabs.org/project/buildroot/patch/20230723074303.603364-1-bernd@kuhls.net/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - add back commit log comments from v2 patch
 - add git commit id in commit log title
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/piglit/piglit.hash |  2 +-
 package/piglit/piglit.mk   | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 2c0b6aa52a..a778401253 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ba4d1839038905f3833e9ab23b385913e08d552533dd222cc203c79c10e09918  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git4.tar.gz
+sha256  0553524e1bfce646771560805cbe523204c59dcee20dc58bb9baa87134a50ea1  piglit-62d499d63d2b8b29a67efd9d93ed9b6a94d4950e-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 4d17405d10..619f29204f 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
+PIGLIT_VERSION = 62d499d63d2b8b29a67efd9d93ed9b6a94d4950e
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
@@ -29,16 +29,27 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
 PIGLIT_CONF_OPTS += \
 	-DPIGLIT_USE_WAFFLE=ON \
 	-DPIGLIT_BUILD_CL_TESTS=OFF \
+	-DPIGLIT_BUILD_VK_TESTS=OFF \
 	-DPIGLIT_BUILD_WGL_TESTS=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 # libxcb for xcb-dri2
+PIGLIT_CONF_OPTS += -DPIGLIT_USE_X11=ON
 PIGLIT_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXext \
 	xorgproto \
 	$(if $(BR2_PACKAGE_LIBXCB),libxcb)
+else
+PIGLIT_CONF_OPTS += -DPIGLIT_USE_X11=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBXCB),yy)
+PIGLIT_DEPENDENCIES += libdrm
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_DMA_BUF_TESTS=ON
+else
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_DMA_BUF_TESTS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
@@ -54,7 +65,7 @@ else
 PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLX_TESTS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
 PIGLIT_DEPENDENCIES += libegl
 PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLES1_TESTS=ON \
 	-DPIGLIT_BUILD_GLES2_TESTS=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
