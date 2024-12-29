Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C62EC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A20D54FC9F;
	Fri, 28 Feb 2025 16:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJ1YQfKMA1IG; Fri, 28 Feb 2025 16:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A674FCA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73A674FCA6;
	Fri, 28 Feb 2025 16:47:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 055571DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20E4342E04
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEJBDn3Jv7PI for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D2744257D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D2744257D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 453BC85B5E; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:25:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d6f3baf0e01be13e0d46475f462b30bd7b002dd
X-Git-Newrev: 9fab7bb79dddaeff17dd084160b0dbd4754a5fc0
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.453BC85B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl: drop directfb
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9fab7bb79dddaeff17dd084160b0dbd4754a5fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As we're about to remove the DirectFB package, let's drop DirectFB
support in sdl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  5 ++---
 Config.in.legacy                                   |  7 ++++++
 ...atch => 0001-fix-compilation-with-libx11.patch} |  0
 package/sdl/0001-use-correct-directfb-config.patch | 25 ----------------------
 ...SDL_x11yuv.c-fix-possible-use-after-free.patch} |  0
 package/sdl/Config.in                              |  4 ----
 package/sdl/sdl.mk                                 | 12 +++--------
 7 files changed, 12 insertions(+), 41 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b17ed1b7fb..d2d96c66ba 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1112,9 +1112,8 @@ package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch lib
 package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch lib_patch.Upstream
 package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch lib_patch.Upstream
 package/scrub/0001-configure-ac-make-sure-m4-macros-are-included-in-the-build.patch lib_patch.Upstream
-package/sdl/0001-use-correct-directfb-config.patch lib_patch.Upstream
-package/sdl/0002-fix-compilation-with-libx11.patch lib_patch.Upstream
-package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch lib_patch.Upstream
+package/sdl/0001-fix-compilation-with-libx11.patch lib_patch.Upstream
+package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch lib_patch.Upstream
 package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch lib_patch.Upstream
 package/sdl_mixer/0002-configure__set_macro_directory.patch lib_patch.Upstream
 package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 76d656846e..1a1ee21424 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_SDL_DIRECTFB
+	bool "sdl directfb support removed"
+	select BR2_LEGACY
+	help
+	  The directfb support from SDL is no longer available, as
+	  directfb is no longer packaged in Buildroot.
+
 config BR2_PACKAGE_QT5BASE_DIRECTFB
 	bool "qt5base directfb support removed"
 	select BR2_LEGACY
diff --git a/package/sdl/0002-fix-compilation-with-libx11.patch b/package/sdl/0001-fix-compilation-with-libx11.patch
similarity index 100%
rename from package/sdl/0002-fix-compilation-with-libx11.patch
rename to package/sdl/0001-fix-compilation-with-libx11.patch
diff --git a/package/sdl/0001-use-correct-directfb-config.patch b/package/sdl/0001-use-correct-directfb-config.patch
deleted file mode 100644
index ef671a1ddd..0000000000
--- a/package/sdl/0001-use-correct-directfb-config.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-[PATCH] configure.in: use correct directfb-config in version check
-
-The configure script has just checked for the correct directfb-config
-script, so also use it for the version check instead of whatever
-might be in the path.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: SDL-1.2.15/configure.in
-===================================================================
---- SDL-1.2.15.orig/configure.in
-+++ SDL-1.2.15/configure.in
-@@ -1276,7 +1276,7 @@
-         else
-             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
-             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
--            set -- `directfb-config --version | sed 's/\./ /g'`
-+            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
-             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
-             if test $HAVE_VERSION -ge $NEED_VERSION; then
-                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
-
diff --git a/package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
similarity index 100%
rename from package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
rename to package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 9f1e34de5c..1d9887f324 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -13,10 +13,6 @@ config BR2_PACKAGE_SDL_FBCON
 	bool "SDL framebuffer console video driver"
 	default y
 
-config BR2_PACKAGE_SDL_DIRECTFB
-	bool "SDL DirectFB video driver"
-	depends on BR2_PACKAGE_DIRECTFB
-
 config BR2_PACKAGE_SDL_X11
 	bool "SDL X11 video driver"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 462600debb..439c30b2a5 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -28,7 +28,9 @@ HOST_SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
 SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 HOST_SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
-SDL_CONF_OPTS += --enable-video-qtopia=no
+SDL_CONF_OPTS += \
+	--enable-video-qtopia=no \
+	--enable-video-directfb=no
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_CONF_OPTS += --enable-video-fbcon=yes
@@ -36,14 +38,6 @@ else
 SDL_CONF_OPTS += --enable-video-fbcon=no
 endif
 
-ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
-SDL_DEPENDENCIES += directfb
-SDL_CONF_OPTS += --enable-video-directfb=yes
-SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-else
-SDL_CONF_OPTS += --enable-video-directfb=no
-endif
-
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
 SDL_CONF_OPTS += --enable-video-x11=yes
 SDL_DEPENDENCIES += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
