Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A834C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 14:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0833B60693;
	Sun,  9 Aug 2026 14:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RQqCsVf84qO; Sun,  9 Aug 2026 14:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3DD560603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786287533;
	bh=pdWJJN397h+6m+viudlDWerqfHF1dRHaon6bMIWGqrc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LQogd9bM9W23mQJuY/PgRhtfKxZz5W7hjbhANdJTEcOn1POhDSsBS0D7olcSMcTHy
	 J463ILYiUA8OWJqrR1sw8W1z8Tyr4nifD2CRL5IYWDQ7K8etia+n4qIPWM/w37Td61
	 GiHgrTsEcmakfksqGcPNiqOk+mwRbkuF2Uj1FTdeuwqnBQ7Wi/JbEZiQYZ/z30rMKr
	 8+VKutW77nbJml6rGvyszmER2PYNGGa04oDKvmovLbHdw35QUVu2KMq+HEONx53iu2
	 OlMnJf/ZSIm0hy0+OYyOIog6FMTonetIhXaFiBTyQQHvX71+brXX9oRCpAy6be/Om4
	 EZCz66XvRqvFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3DD560603;
	Sun,  9 Aug 2026 14:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38B2640A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ACEE80B84
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaefsm_QFO1I for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 14:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41CF080AE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41CF080AE3
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 14:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B9028D21C; Sun,  9 Aug 2026 14:58:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 16:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1473993d17bb9592406478689528411cfe13d0e
X-Git-Newrev: 2dd13e328f118363165b47258429604a5ffd3b41
X-Patchwork-Hint: ignore
Message-Id: <20260809145801.6B9028D21C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2dd13e328f118363165b47258429604a5ffd3b41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Simple DirectMedia Layer 3 is a library that allows programs
portable low level access to a video framebuffer, audio output,
mouse, and keyboard. It is not compatible with SDL2.

Compared to SDL2, SDL3 now requires <wchar.h> unconditionally. See:
https://github.com/libsdl-org/SDL/blob/release-3.4.12/include/SDL3/SDL_stdinc.h#L53

Compared to SDL2, SDL3 now always requires threads:
https://github.com/libsdl-org/SDL/blob/release-3.4.12/CMakeLists.txt#L3660

https://www.libsdl.org/
https://wiki.libsdl.org/SDL3/README-migration

Signed-off-by: Michael Fischer <mf@go-sys.de>
[Julien:
 - sort SDL3_CONF_OPTS alphabetically
 - add "depends on BR2_USE_WCHAR" in Config.in
 - add "depends on BR2_TOOLCHAIN_HAS_THREADS" in Config.in
 - disable Arm Neon with uClibc
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS             |   1 +
 package/Config.in      |   1 +
 package/sdl3/Config.in |  81 ++++++++++++++++++++++++++++++++++++++
 package/sdl3/sdl3.hash |   5 +++
 package/sdl3/sdl3.mk   | 103 +++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 191 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c462d41d75..128ce22799 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2426,6 +2426,7 @@ F:	configs/arcturus_ucls1012a_defconfig
 N:	Michael Fischer <mf@go-sys.de>
 F:	package/gnuplot/
 F:	package/sdl2/
+F:	package/sdl3/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
diff --git a/package/Config.in b/package/Config.in
index 2e845f98db..084a17b7d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ comment "Graphic libraries"
 	source "package/sdl2_mixer/Config.in"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
+	source "package/sdl3/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/virglrenderer/Config.in"
diff --git a/package/sdl3/Config.in b/package/sdl3/Config.in
new file mode 100644
index 0000000000..7bce4ceaba
--- /dev/null
+++ b/package/sdl3/Config.in
@@ -0,0 +1,81 @@
+config BR2_PACKAGE_SDL3
+	bool "sdl3"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Simple DirectMedia Layer 3 - SDL3 is a library that allows
+	  programs portable low level access to a video framebuffer,
+	  audio output, mouse, and keyboard. It is not compatible with
+	  SDL2.
+
+	  http://www.libsdl.org/
+
+if BR2_PACKAGE_SDL3
+
+config BR2_PACKAGE_SDL3_X11
+	bool "X11 video driver"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+comment "X11 video driver needs X.org"
+	depends on !BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_SDL3_KMSDRM
+	bool "KMS/DRM video driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libdrm
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL3_OPENGL || BR2_PACKAGE_SDL3_OPENGLES
+	select BR2_PACKAGE_LIBDRM
+
+comment "KMS/DRM video driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "KMS/DRM video driver needs a GBM provider, and OpenGL or OpenGLES+EGL"
+	depends on !BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!(BR2_PACKAGE_SDL3_OPENGL || BR2_PACKAGE_SDL3_OPENGLES)
+
+config BR2_PACKAGE_SDL3_WAYLAND
+	bool "Wayland video driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL3_OPENGLES
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+
+comment "Wayland video driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "Wayland video driver needs wayland with an OpenGLES+EGL backend"
+	depends on !BR2_PACKAGE_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_SDL3_OPENGLES
+
+config BR2_PACKAGE_SDL3_OPENGL
+	bool "OpenGL (GLX)"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # X11 video driver
+	select BR2_PACKAGE_SDL3_X11
+
+comment "OpenGL support needs X11 and an OpenGL provider"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_SDL3_OPENGLES
+	bool "OpenGL ES"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+
+comment "OpenGL ES support needs an OpenGL ES provider"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+endif
+
+comment "sdl3 needs a toolchain w/ dynamic library, threads, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/sdl3/sdl3.hash b/package/sdl3/sdl3.hash
new file mode 100644
index 0000000000..7340628dc7
--- /dev/null
+++ b/package/sdl3/sdl3.hash
@@ -0,0 +1,5 @@
+# Locally calculated after checking
+# https://www.libsdl.org/release/SDL3-3.4.12.tar.gz.sig
+sha256  f07b958a9ac5020fb7a44cadb957f658b2149c3c8abb4f63145fac9303249db7  SDL3-3.4.12.tar.gz
+# Locally calculated
+sha256  1c040b8271b37e5076359f8fd54240e371114112924d2df81ef87c7d6a1dfdfd  LICENSE.txt
diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
new file mode 100644
index 0000000000..ecbcbf4bc2
--- /dev/null
+++ b/package/sdl3/sdl3.mk
@@ -0,0 +1,103 @@
+################################################################################
+#
+# sdl3
+#
+################################################################################
+
+SDL3_VERSION = 3.4.12
+SDL3_SOURCE = SDL3-$(SDL3_VERSION).tar.gz
+SDL3_SITE = http://www.libsdl.org/release
+SDL3_LICENSE = Zlib
+SDL3_LICENSE_FILES = LICENSE.txt
+SDL3_CPE_ID_VENDOR = libsdl
+SDL3_CPE_ID_PRODUCT = simple_directmedia_layer
+SDL3_INSTALL_STAGING = YES
+
+SDL3_CONF_OPTS = \
+	-DSDL_DBUS=OFF \
+	-DSDL_DUMMYVIDEO=OFF \
+	-DSDL_HIDAPI=OFF \
+	-DSDL_IBUS=OFF \
+	-DSDL_INSTALL_DOCS=OFF \
+	-DSDL_JOYSTICK_MFI=OFF \
+	-DSDL_JOYSTICK_VIRTUAL=OFF \
+	-DSDL_OFFSCREEN=OFF \
+	-DSDL_PULSEAUDIO=OFF \
+	-DSDL_RENDER_D3D=OFF \
+	-DSDL_RPATH=OFF \
+	-DSDL_STATIC=ON \
+	-DSDL_UNIX_CONSOLE_BUILD=ON \
+	-DSDL_VIVANTE=OFF \
+	-DSDL_VULKAN=OFF
+
+# SDL3 fails to build in Thumb mode on some ARM architectures
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SDL3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
+# SDL3 needs <fenv.h> when Arm Neon is enabled.
+# https://github.com/libsdl-org/SDL/blob/release-3.4.12/src/audio/SDL_audiotypecvt.c#L26
+# The <fenv.h> header is not available by default in uClibc, so we
+# disable Neon in that specific case.
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_ARM_CPU_HAS_NEON),yy)
+SDL3_CONF_OPTS += -DSDL_ARMNEON=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+SDL3_DEPENDENCIES += udev
+SDL3_CONF_OPTS += -DSDL_LIBUDEV=ON
+else
+SDL3_CONF_OPTS += -DSDL_LIBUDEV=OFF
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+SDL3_CONF_OPTS += -DSDL_SSE=ON
+else
+SDL3_CONF_OPTS += -DSDL_SSE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_X11),y)
+SDL3_DEPENDENCIES += xlib_libX11 xlib_libXext
+SDL3_CONF_OPTS += -DSDL_X11=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_WAYLAND),y)
+SDL3_DEPENDENCIES += libegl libxkbcommon wayland wayland-protocols
+SDL3_CONF_OPTS += -DSDL_WAYLAND=ON
+else
+SDL3_CONF_OPTS += -DSDL_WAYLAND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_OPENGL),y)
+SDL3_DEPENDENCIES += libgl
+SDL3_CONF_OPTS += -DSDL_OPENGL=ON
+else
+SDL3_CONF_OPTS += -DSDL_OPENGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_OPENGLES),y)
+SDL3_DEPENDENCIES += libgles libegl
+SDL3_CONF_OPTS += -DSDL_OPENGLES=ON
+else
+SDL3_CONF_OPTS += -DSDL_OPENGLES=OFF
+endif
+
+# The explicit dependencies make sure libdrm/gbm/egl are built before
+# sdl3, otherwise the kmsdrm video driver is silently disabled at
+# configure time.
+ifeq ($(BR2_PACKAGE_SDL3_KMSDRM),y)
+SDL3_DEPENDENCIES += libdrm libgbm libegl
+SDL3_CONF_OPTS += -DSDL_KMSDRM=ON
+else
+SDL3_CONF_OPTS += -DSDL_KMSDRM=OFF
+endif
+
+# SDL3 installs a copy of its license on the target, drop it
+define SDL3_REMOVE_LICENSES
+	rm -rf $(TARGET_DIR)/usr/share/licenses/SDL3
+endef
+SDL3_POST_INSTALL_TARGET_HOOKS += SDL3_REMOVE_LICENSES
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
