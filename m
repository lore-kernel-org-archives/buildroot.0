Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F90C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5577141754;
	Mon,  6 Feb 2023 21:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5577141754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojma70im3rv1; Mon,  6 Feb 2023 21:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A65AB40935;
	Mon,  6 Feb 2023 21:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A65AB40935
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2362E1BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E18734056E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E18734056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWKA4Xkh1GEL for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E8054052E
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E8054052E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C84983DB0; Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 22:46:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 557c68fbd29551f4db6215ab03abfaaa54c6f78f
X-Git-Newrev: fa75c4a3054e0cd3457f9e50deb1b9c06325c242
X-Patchwork-Hint: ignore
Message-Id: <20230206214646.6C84983DB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-demos: bump version to 8.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa75c4a3054e0cd3457f9e50deb1b9c06325c242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package build system changed from autotools to meson. Autotools
was deprecated in commit [1], which is included in this 8.5.0
version. It was definitevely removed soon after, in commit [2].

The package patch file making libgl optional was fully rewritten
for meson.

This patch also updates the old ftp _SITE url to the new https one,
published in the project README.rst file. See [3].

This patch also removes openvg and freetype2 dependencies, as their
support was removed in commit [4]. The 'gbm' option is removed, and
the option 'libdrm' is added.

The md5 and sha1 entries in hash files are also removed, to keep only
sha256 and sha512 from the release announce email [5].

For change log, see the release announce [5].

[1] https://gitlab.freedesktop.org/mesa/demos/-/commit/2df8e9710834c3b42ce5cfb67b7662c110ab904e
[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/abfead37587f1f2e124bdfcde755b6e90421b538
[3] https://gitlab.freedesktop.org/mesa/demos/-/blob/mesa-demos-8.5.0/README.rst
[4] https://gitlab.freedesktop.org/mesa/demos/-/commit/e6d0d9a8682c544870fd41983ea2e0484b9767b1
[5] https://lists.freedesktop.org/archives/mesa-announce/2022-May/000677.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-demos-makes-opengl-an-optional-component.patch | 157 +++++++++++----------
 package/mesa3d-demos/mesa3d-demos.hash             |   8 +-
 package/mesa3d-demos/mesa3d-demos.mk               |  56 ++++----
 3 files changed, 112 insertions(+), 109 deletions(-)

diff --git a/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
index b328fca810..e51b6f1a2a 100644
--- a/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
+++ b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
@@ -1,88 +1,101 @@
-From bb0ffae7164d296d32da24fa5499534de259169a Mon Sep 17 00:00:00 2001
-From: Spenser Gilliland <spenser@gillilanding.com>
-Date: Sat, 24 Feb 2018 11:36:17 +0100
+From 9ec9f7b4d0ef5e799ca4cc5103163e4630d184d8 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 16 Sep 2022 22:30:59 +0200
 Subject: [PATCH] demos: makes opengl an optional component
 
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
-[Romain: convert to git patch, rebase on 8.4.0]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
+This patch is a port of [1] for the new meson build system.
+
+[1].
+https://git.busybox.net/buildroot/tree/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch?h=2022.08
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
- configure.ac               | 12 +++++++++++-
- src/egl/opengl/Makefile.am |  2 ++
- src/util/Makefile.am       |  2 ++
- 3 files changed, 15 insertions(+), 1 deletion(-)
+ meson.build         | 19 ++++++++++++-------
+ meson_options.txt   |  1 +
+ src/egl/meson.build |  5 ++++-
+ src/meson.build     |  4 +++-
+ 4 files changed, 20 insertions(+), 9 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 0b5e9a76..24298c44 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -51,6 +51,14 @@ m4_ifndef([PKG_PROG_PKG_CONFIG],
-   ACLOCAL="aclocal -I/other/macro/dir" before running autoreconf.])])
- PKG_PROG_PKG_CONFIG()
+diff --git a/meson.build b/meson.build
+index e1968fab..a15699d6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -38,7 +38,10 @@ add_project_arguments(
+ dep_m = cc.find_library('m', required : false)
+ dep_winmm = cc.find_library('winmm', required : false)
  
-+AC_ARG_ENABLE([gl],
-+    [AS_HELP_STRING([--enable-gl],
-+        [enable GL library @<:@default=no@:>@])],
-+    [gl_enabled="$enableval"],
-+    [gl_enabled=auto])
-+
-+if test "x$gl_enabled" != "xno"; then
-+
- dnl Get the pkg-config definitions for libGL.  We include a fallback
- dnl path for GL implementation that don't provide a .pc file
- PKG_CHECK_MODULES(GL, [gl], [], [
-@@ -112,6 +120,8 @@ PKG_CHECK_MODULES(GLU, [glu], [],
- DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
- DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
+-dep_gl = dependency('gl')
++dep_gl = dependency('gl', required : get_option('gl'))
++if not dep_gl.found()
++  add_project_arguments('-DEGL_NO_X11=1', language: 'c')
++endif
  
-+fi
-+
- AC_ARG_ENABLE([egl],
-     [AS_HELP_STRING([--enable-egl],
-         [enable EGL library @<:@default=auto@:>@])],
-@@ -302,7 +312,7 @@ AC_SUBST([MESA_GLAPI])
- AC_SUBST([WAYLAND_CFLAGS])
- AC_SUBST([WAYLAND_LIBS])
+ dep_gles1 = dependency('glesv1_cm', required : get_option('gles1'))
+ dep_gles2 = dependency('glesv2', required : get_option('gles2'))
+@@ -75,13 +78,15 @@ endif
  
--
-+AM_CONDITIONAL(HAVE_GL, test "x$gl_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_EGL, test "x$egl_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_GLESV1, test "x$glesv1_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_GLESV2, test "x$glesv2_enabled" = "xyes")
-diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am
-index 6d184ff6..219ab850 100644
---- a/src/egl/opengl/Makefile.am
-+++ b/src/egl/opengl/Makefile.am
-@@ -56,6 +56,7 @@ endif
- endif
+ dep_threads = dependency('threads')
  
- if HAVE_EGL
-+if HAVE_GL
- bin_PROGRAMS = \
- 	eglinfo
- noinst_PROGRAMS = \
-@@ -64,6 +65,7 @@ noinst_PROGRAMS = \
- 	$(EGL_X11_DEMOS) \
- 	$(EGL_WL_DEMOS)
+-dep_glu = dependency('glu', required : dep_x11.found())
+-if not dep_glu.found()
+-  _glu_name = 'GLU'
+-  if host_machine.system() == 'windows'
+-    _glu_name = 'glu32'
++if dep_gl.found()
++  dep_glu = dependency('glu', required : dep_x11.found())
++  if not dep_glu.found()
++    _glu_name = 'GLU'
++    if host_machine.system() == 'windows'
++      _glu_name = 'glu32'
++    endif
++    dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h')
+   endif
+-  dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h')
  endif
+ 
+ # GBM is needed for EGL on KMS
+diff --git a/meson_options.txt b/meson_options.txt
+index ddadd2e3..f5405698 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,5 +1,6 @@
+ option('with-glut',              type : 'string')
+ option('egl',                    type : 'feature')
++option('gl',                     type : 'feature')
+ option('gles1',                  type : 'feature')
+ option('gles2',                  type : 'feature')
+ option('osmesa',                 type : 'feature')
+diff --git a/src/egl/meson.build b/src/egl/meson.build
+index d1846921..42bf8ecd 100644
+--- a/src/egl/meson.build
++++ b/src/egl/meson.build
+@@ -19,7 +19,10 @@
+ # SOFTWARE.
+ 
+ subdir('eglut')
+-subdir('opengl')
++
++if dep_gl.found()
++  subdir('opengl')
 +endif
  
- egltri_x11_SOURCES = egltri.c
- eglgears_x11_SOURCES = eglgears.c
-diff --git a/src/util/Makefile.am b/src/util/Makefile.am
-index 759a293a..012b9c75 100644
---- a/src/util/Makefile.am
-+++ b/src/util/Makefile.am
-@@ -27,7 +27,9 @@ AM_CFLAGS = \
- AM_LDFLAGS = \
- 	$(DEMO_LIBS)
+ if dep_gles1.found()
+   subdir('opengles1')
+diff --git a/src/meson.build b/src/meson.build
+index 39cac78d..7607c6de 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -20,7 +20,9 @@
+ 
+ subdir('glad')
  
-+if HAVE_GL
- noinst_LTLIBRARIES = libutil.la
+-subdir('util')
++if dep_gl.found()
++  subdir('util')
 +endif
  
- if HAVE_GLUT
- AM_CFLAGS += \
+ if dep_glut.found()
+   subdir('demos')
 -- 
-2.14.3
+2.37.3
 
diff --git a/package/mesa3d-demos/mesa3d-demos.hash b/package/mesa3d-demos/mesa3d-demos.hash
index 8a4955f120..b0cfb88816 100644
--- a/package/mesa3d-demos/mesa3d-demos.hash
+++ b/package/mesa3d-demos/mesa3d-demos.hash
@@ -1,5 +1,3 @@
-# From https://lists.freedesktop.org/archives/mesa-dev/2018-February/186542.html
-md5  6b65a02622765522176d00f553086fa3  mesa-demos-8.4.0.tar.bz2
-sha1  57ba892e919fa22ce3db9f25e7331a6fa33c652c  mesa-demos-8.4.0.tar.bz2
-sha256  01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d  mesa-demos-8.4.0.tar.bz2
-sha512  b72d03cad36e0535ff18dcfb222ec4200064b9264f6da51a6e5f03b0dd912abe188bc1d600b6698de3ce6f63b28d2ce01565886ca8e7079edc4967fbf2fb0957  mesa-demos-8.4.0.tar.bz2
+# From https://lists.freedesktop.org/archives/mesa-announce/2022-May/000677.html
+sha256  cea2df0a80f09a30f635c4eb1a672bf90c5ddee0b8e77f4d70041668ef71aac1  mesa-demos-8.5.0.tar.bz2
+sha512  df6a7f09638ca389d6e8bc569e599dcc59c9aa280bcfb95976d83e5cd3edfe74bb3a31f0953956dc16faa540ee5b09990e3377e1341d836fc527e50ace6e60b8  mesa-demos-8.5.0.tar.bz2
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 6b5262a2e9..5f7fe8e24d 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -4,77 +4,69 @@
 #
 ################################################################################
 
-MESA3D_DEMOS_VERSION = 8.4.0
+MESA3D_DEMOS_VERSION = 8.5.0
 MESA3D_DEMOS_SOURCE = mesa-demos-$(MESA3D_DEMOS_VERSION).tar.bz2
-MESA3D_DEMOS_SITE = ftp://ftp.freedesktop.org/pub/mesa/demos
-# 0001-demos-makes-opengl-an-optional-component.patch
-MESA3D_DEMOS_AUTORECONF = YES
+MESA3D_DEMOS_SITE = https://archive.mesa3d.org/demos/$(MESA3D_DEMOS_VERSION)
 MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
 MESA3D_DEMOS_CONF_OPTS += \
-	--disable-gles1
+	-Dgles1=disabled
 
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
 MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu xlib_libX11 xlib_libXext
-MESA3D_DEMOS_CONF_OPTS += --enable-gl --enable-x11
+MESA3D_DEMOS_CONF_OPTS += -Dgl=enabled -Dx11=enabled
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-gl --disable-x11
+MESA3D_DEMOS_CONF_OPTS += -Dgl=disabled -Dx11=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
 MESA3D_DEMOS_DEPENDENCIES += libegl
-MESA3D_DEMOS_CONF_OPTS += --enable-egl
+MESA3D_DEMOS_CONF_OPTS += -Degl=enabled
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-egl
+MESA3D_DEMOS_CONF_OPTS += -Degl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MESA3D_DEMOS_DEPENDENCIES += libgles
-MESA3D_DEMOS_CONF_OPTS += --enable-gles2
+MESA3D_DEMOS_CONF_OPTS += -Dgles2=enabled
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-gles2
+MESA3D_DEMOS_CONF_OPTS += -Dgles2=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-MESA3D_DEMOS_DEPENDENCIES += libopenvg
-MESA3D_DEMOS_CONF_OPTS += --enable-vg
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+MESA3D_DEMOS_DEPENDENCIES += libdrm
+MESA3D_DEMOS_CONF_OPTS += -Dlibdrm=enabled
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-vg
+MESA3D_DEMOS_CONF_OPTS += -Dlibdrm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
+# Meson search for gbm, but has no option to enable/disable it. See:
+# https://gitlab.freedesktop.org/mesa/demos/-/blob/mesa-demos-8.5.0/meson.build#L88
+# We still add the dependency, if needed, to make sure it will always
+# be detected.
 MESA3D_DEMOS_DEPENDENCIES += mesa3d
-MESA3D_DEMOS_CONF_OPTS += --enable-gbm
-else
-MESA3D_DEMOS_CONF_OPTS += --disable-gbm
-endif
-
-ifeq ($(BR2_PACKAGE_FREETYPE),y)
-MESA3D_DEMOS_DEPENDENCIES += freetype
-MESA3D_DEMOS_CONF_OPTS += --enable-freetype2
-else
-MESA3D_DEMOS_CONF_OPTS += --disable-freetype2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 MESA3D_DEMOS_DEPENDENCIES += libfreeglut
-MESA3D_DEMOS_CONF_OPTS += --with-glut=$(STAGING_DIR)/usr
+MESA3D_DEMOS_CONF_OPTS += -Dwith-glut=$(STAGING_DIR)/usr
 # osmesa support depends on glut
 ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_GALLIUM),y)
-MESA3D_DEMOS_CONF_OPTS += --enable-osmesa
+MESA3D_DEMOS_CONF_OPTS += -Dosmesa=enabled
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-osmesa
+MESA3D_DEMOS_CONF_OPTS += -Dosmesa=disabled
 endif
 else
-MESA3D_DEMOS_CONF_OPTS += --without-glut --disable-osmesa
+MESA3D_DEMOS_CONF_OPTS += -Dosmesa=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEMOS_DEPENDENCIES += wayland
-MESA3D_DEMOS_CONF_OPTS += --enable-wayland
+MESA3D_DEMOS_CONF_OPTS += -Dwayland=enabled
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-wayland
+MESA3D_DEMOS_CONF_OPTS += -Dwayland=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
