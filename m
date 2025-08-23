Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2587ACA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 18:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E063E83EC8;
	Sat, 23 Aug 2025 18:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qpt3oJfQ9WhA; Sat, 23 Aug 2025 18:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA92B83EC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA92B83EC0;
	Sat, 23 Aug 2025 18:51:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFA27E4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D67A941199
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poLN_U4EO6id for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 18:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F003841169
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F003841169
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC1A9846AE; Sat, 23 Aug 2025 18:51:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 20:19:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cff52ab07c2143611b4ce0ea83199d8695437bc2
X-Git-Newrev: da3996a39d3330722a8458c296c5bccfdd6a0adc
X-Patchwork-Hint: ignore
Message-Id: <20250823185136.DC1A9846AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl: improve existing patches
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da3996a39d3330722a8458c296c5bccfdd6a0adc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Replace patch 0001 by a properly Git-formatted patch, cherry-picked
  from the upstream Git repository at
  https://github.com/libsdl-org/SDL-1.2

- Add Upstream: tags on both patches, with the upstream Git
  commit. Updated .checkpackageignore accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                |  2 -
 ...1-Fix-compilation-with-libX11-1.5.99.902.patch} | 51 +++++++++++++---------
 ...-SDL_x11yuv.c-fix-possible-use-after-free.patch |  5 ++-
 3 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d5f5c5f751..c88968e4d5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1040,8 +1040,6 @@ package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch lib
 package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch lib_patch.Upstream
 package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch lib_patch.Upstream
 package/scrub/0001-configure-ac-make-sure-m4-macros-are-included-in-the-build.patch lib_patch.Upstream
-package/sdl/0001-fix-compilation-with-libx11.patch lib_patch.Upstream
-package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch lib_patch.Upstream
 package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch lib_patch.Upstream
 package/sdl_mixer/0002-configure__set_macro_directory.patch lib_patch.Upstream
 package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch lib_patch.Upstream
diff --git a/package/sdl/0001-fix-compilation-with-libx11.patch b/package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
similarity index 57%
rename from package/sdl/0001-fix-compilation-with-libx11.patch
rename to package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
index 27f244883e..83f0ab2bb1 100644
--- a/package/sdl/0001-fix-compilation-with-libx11.patch
+++ b/package/sdl/0001-Fix-compilation-with-libX11-1.5.99.902.patch
@@ -1,20 +1,24 @@
-sdl: Fix compilation with libX11 >= 1.5.99.902
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-# HG changeset patch
-# User Azamat H. Hackimov <azamat.hackimov@gmail.com>
-# Date 1370184533 -21600
-# Node ID 91ad7b43317a6387e115ecdf63a49137f47e42c8
-# Parent  f7fd5c3951b9ed922fdf696f7182e71b58a13268
-Fix compilation with libX11 >= 1.5.99.902.
+From 41410b72746cfc7ff515aefed62b0b179bf6e8da Mon Sep 17 00:00:00 2001
+From: "Azamat H. Hackimov" <azamat.hackimov@gmail.com>
+Date: Sun, 2 Jun 2013 20:48:53 +0600
+Subject: [PATCH] Fix compilation with libX11 >= 1.5.99.902.
 
 These changes fixes bug #1769 for SDL 1.2
 (http://bugzilla.libsdl.org/show_bug.cgi?id=1769).
 
-diff -r f7fd5c3951b9 -r 91ad7b43317a configure.in
---- a/configure.in	Wed Apr 17 00:56:53 2013 -0700
-+++ b/configure.in	Sun Jun 02 20:48:53 2013 +0600
-@@ -1169,6 +1169,17 @@
+Upstream: 5d79977ec7a6b58afa6e4817035aaaba186f7e9f
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ configure.in               | 11 +++++++++++
+ include/SDL_config.h.in    |  1 +
+ src/video/x11/SDL_x11sym.h |  4 ++++
+ 3 files changed, 16 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index 08c8e1e9..89c526d4 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1127,6 +1127,17 @@ AC_HELP_STRING([--enable-video-x11-xrandr], [enable X11 Xrandr extension for ful
              if test x$definitely_enable_video_x11_xrandr = xyes; then
                  AC_DEFINE(SDL_VIDEO_DRIVER_X11_XRANDR)
              fi
@@ -32,10 +36,11 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a configure.in
          fi
      fi
  }
-diff -r f7fd5c3951b9 -r 91ad7b43317a include/SDL_config.h.in
---- a/include/SDL_config.h.in	Wed Apr 17 00:56:53 2013 -0700
-+++ b/include/SDL_config.h.in	Sun Jun 02 20:48:53 2013 +0600
-@@ -283,6 +283,7 @@
+diff --git a/include/SDL_config.h.in b/include/SDL_config.h.in
+index 8bb1773c..78ca747b 100644
+--- a/include/SDL_config.h.in
++++ b/include/SDL_config.h.in
+@@ -282,6 +282,7 @@
  #undef SDL_VIDEO_DRIVER_WINDIB
  #undef SDL_VIDEO_DRIVER_WSCONS
  #undef SDL_VIDEO_DRIVER_X11
@@ -43,10 +48,11 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a include/SDL_config.h.in
  #undef SDL_VIDEO_DRIVER_X11_DGAMOUSE
  #undef SDL_VIDEO_DRIVER_X11_DYNAMIC
  #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XEXT
-diff -r f7fd5c3951b9 -r 91ad7b43317a src/video/x11/SDL_x11sym.h
---- a/src/video/x11/SDL_x11sym.h	Wed Apr 17 00:56:53 2013 -0700
-+++ b/src/video/x11/SDL_x11sym.h	Sun Jun 02 20:48:53 2013 +0600
-@@ -165,7 +165,11 @@
+diff --git a/src/video/x11/SDL_x11sym.h b/src/video/x11/SDL_x11sym.h
+index 4875b989..bd83f7f5 100644
+--- a/src/video/x11/SDL_x11sym.h
++++ b/src/video/x11/SDL_x11sym.h
+@@ -165,7 +165,11 @@ SDL_X11_SYM(Bool,XShmQueryExtension,(Display* a),(a),return)
   */
  #ifdef LONG64
  SDL_X11_MODULE(IO_32BIT)
@@ -58,3 +64,6 @@ diff -r f7fd5c3951b9 -r 91ad7b43317a src/video/x11/SDL_x11sym.h
  SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,len),)
  #endif
  
+-- 
+2.50.1
+
diff --git a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
index d7858d0f96..68e66bd5a2 100644
--- a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
+++ b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
@@ -1,9 +1,10 @@
-From d7e00208738a0bc6af302723fe64908ac35b777b Mon Sep 17 00:00:00 2001
+From c24c08c9aa0f92213793e5ef404f2c387603d7f8 Mon Sep 17 00:00:00 2001
 From: Ozkan Sezer <sezeroz@gmail.com>
 Date: Sat, 18 Jun 2022 14:55:00 +0300
 Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
 
 Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
+Upstream: d7e00208738a0bc6af302723fe64908ac35b777b
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  src/video/x11/SDL_x11yuv.c | 2 +-
@@ -24,5 +25,5 @@ index 62698dfd..0d5754e3 100644
  								0, width, height);
  		}
 -- 
-2.30.2
+2.50.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
