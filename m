Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17DDC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 16:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85AA480EC6;
	Fri, 19 Jul 2024 16:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rO3vAifFSa6k; Fri, 19 Jul 2024 16:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925738223D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925738223D;
	Fri, 19 Jul 2024 16:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 819F41BF313
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 16:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C36760659
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 16:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PqXcDGL3I30 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 16:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA90D6064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA90D6064B
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA90D6064B
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 16:16:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a77abe5c709so209072766b.2
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 09:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721405764; x=1722010564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+fRl0zynYUFUeMq9ds4xtm2yhI0TSiTl9nV10kTaQ0=;
 b=NfKebZczaRTGyEfE50R9/iMF4A6v8yicNBJXmHBl+CmMch2BBBDQFpnZ9M8zUwZLRU
 R0KpAyB0LS56ud2dKhqubEbet8yX/OeMhTznaVyRBCNmkYswo/X7zIe9CpfTWyJ1FfWP
 xmyGUB5khDtQMzmrpi0ldEi2gc53oEVt/QIKK/O22Se3ZdmQ9RAPMRpNslZeBGPG4HrB
 eA7zCU6BJ1tybQBfApqa53d8JtC4f/wqaK4E0ReZJ2CMIB+j+23UX5v1v6XWEkCtk/9P
 qUIr9elro7Y7fwOcvjMnbsM3FkV7JKnqKif2BwglozRcQQO0EXqFtLGriv+UUHRTb/H1
 U7qg==
X-Gm-Message-State: AOJu0YzVhzKHlqTnRQr00KHlBQIaI8tiefOJhmYi+Or6p/OQyN9LZvSU
 xaSvSq8IBqe0V2Edj/Lx+tqoVVXTEuZoUJJGjVGXy0xRboJTYtBUafx9mQpHOgaIW+KUV6sRj9N
 B
X-Google-Smtp-Source: AGHT+IGrQHXeQRFKifcVjjUK2i5wfeiD4fcJrOkhuPmCX3ze6118sEFbwOfwHIkE91OxC/WIBaeExg==
X-Received: by 2002:a17:907:2d8a:b0:a7a:1d35:4106 with SMTP id
 a640c23a62f3a-a7a1d35420amr419231966b.5.1721405763105; 
 Fri, 19 Jul 2024 09:16:03 -0700 (PDT)
Received: from mind.home ([2a02:a03f:8b19:d600:77b0:81c2:554:9d13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7be69bsm50192066b.80.2024.07.19.09.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 09:16:02 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 18:15:57 +0200
Message-ID: <20240719161557.8832-2-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240719161557.8832-1-javad.rahimipetroudi@mind.be>
References: <20240719161557.8832-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1721405764; x=1722010564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+fRl0zynYUFUeMq9ds4xtm2yhI0TSiTl9nV10kTaQ0=;
 b=IPWsikpvjnu285HqRQ6wK2+QBBmG/6xT8w4LUdoV1cP4i8ELGkIJbWqFZtqloZC+aP
 hV1bPxPuz+tYezsPoUJMLf1aHH3HDlJGAAlIKk0BMwO8/up+uNMBY8hc2UAyuT6cl64j
 4id9rxFFvkuN5UpaXKUHNRsoiA/pKtdtIGDd1KvQ0uOqX/CrJRUBzWkbTdN4g8CLfUh5
 odifcIpusbgi18IJM8hu1vZ1SPU/ibgR39dYnsicXyBbBvunlHMGyTAZBfOPjBrqr9a1
 vNT3lOk+CLy5RgGyYozYIFmmP8puf0gwX50qPMj33EIyb2lJ7fMIc+6+peTVAosGCDsY
 pQvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=IPWsikpv
Subject: [Buildroot] [PATCH 2/2] package/mpv: bump version to v0.38.0
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The waf build system is currently broken in Buildroot, since
the bump to Python 3.12. This causes mpv to fail to build.
A simple workaround is to switch to bump version to v0.38.0
and switch to meson - waf support will be removed entirely
in later releases.

Bumping version to v0.38.0 was required, because building
v0.35.1 was failed even when switching to meson. For this
reason, this patch both upgrades the mpv version and also
change the build system to meson.

Due to such change 0001-fix-powerpc64-altivec.patch also
has been removed. As it was modifing waflib for ppc64.

The conversion of all options was checked by verifying in
meson_options.txt that the option name hasn't changed.

Fixes: http://autobuild.buildroot.net/results/474/474d6b3cb4c3582d7bca2e4f93188b9f7e01aa8e

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
 .checkpackageignore                          |   1 -
 package/mpv/0001-fix-powerpc64-altivec.patch |  32 -----
 package/mpv/Config.in                        |   1 +
 package/mpv/mpv.hash                         |   2 +-
 package/mpv/mpv.mk                           | 127 +++++++++----------
 5 files changed, 64 insertions(+), 99 deletions(-)
 delete mode 100644 package/mpv/0001-fix-powerpc64-altivec.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 2e6e8a9cac..1432b3af3b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -950,7 +950,6 @@ package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch lib_patch.Upstream
 package/mpd/S95mpd lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
-package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
 package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
diff --git a/package/mpv/0001-fix-powerpc64-altivec.patch b/package/mpv/0001-fix-powerpc64-altivec.patch
deleted file mode 100644
index 45983fec8f..0000000000
--- a/package/mpv/0001-fix-powerpc64-altivec.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] Work around bool type redefinition by altivec
-
-On powerpc64le, the SDL header may include altivec.h and this
-(combined with -std=c99) will cause a compile failure due to bool
-being redefined as a vector type.
-
-Adjust the compiler flags to add -std=gnu99 (which is compatible with
-altivec) when using gcc. The generic flag '-std=c99' is left in place for other
-compilers (in the gcc case it is overridden by the (later) gnu flag).
-
-Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
----
- waftools/detections/compiler.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/waftools/detections/compiler.py b/waftools/detections/compiler.py
-index 5bbba87..50836a2 100644
---- a/waftools/detections/compiler.py
-+++ b/waftools/detections/compiler.py
-@@ -43,7 +43,8 @@ def __add_gcc_flags__(ctx):
-                        "-Wno-switch", "-Wparentheses", "-Wpointer-arith",
-                        "-Wno-pointer-sign",
-                        # GCC bug 66425
--                       "-Wno-unused-result"]
-+                       "-Wno-unused-result",
-+                       "-std=gnu99"]
- 
- def __add_clang_flags__(ctx):
-     ctx.env.CFLAGS += ["-Wno-logical-op-parentheses", "-fcolor-diagnostics",
--- 
-2.10.0.297.gf6727b0
-
diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 5c32f593fe..1eb4294c0d 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_LIBASS
+	select BR2_PACKAGE_LIBPLACEBO
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# Select xkbcommon for wayland to avoid being mysterious
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index a09015619d..6f55f369fb 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41df981b7b84e33a2ef4478aaf81d6f4f5c8b9cd2c0d337ac142fc20b387d1a9  mpv-0.35.1.tar.gz
+sha256  86d9ef40b6058732f67b46d0bbda24a074fae860b3eaae05bab3145041303066  mpv-0.38.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index cf37091186..4977e6a291 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,207 +4,204 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.35.1
+MPV_VERSION = 0.38.0
 MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
 MPV_DEPENDENCIES = \
-	host-pkgconf ffmpeg libass zlib \
+	host-pkgconf ffmpeg libass libplacebo zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE.GPL
 MPV_CPE_ID_VENDOR = mpv
 MPV_INSTALL_STAGING = YES
 
-MPV_NEEDS_EXTERNAL_WAF = YES
-
 # Some of these options need testing and/or tweaks
 MPV_CONF_OPTS = \
-	--prefix=/usr \
-	--disable-android \
-	--disable-caca \
-	--disable-cocoa \
-	--disable-coreaudio \
-	--disable-cuda-hwaccel \
-	--disable-opensles \
-	--disable-rubberband \
-	--disable-uchardet \
-	--disable-vapoursynth
+	-Degl-android=disabled\
+	-Dcaca=disabled \
+	-Dcocoa=disabled \
+	-Dcoreaudio=disabled \
+	-Dcuda-hwaccel=disabled \
+	-Dopensles=disabled \
+	-Drubberband=disabled \
+	-Duchardet=disabled \
+	-Dvapoursynth=disabled
 
 ifeq ($(BR2_REPRODUCIBLE),y)
-MPV_CONF_OPTS += --disable-build-date
+MPV_CONF_OPTS += -Dbuild-date=disabled
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
+MPV_CONF_OPTS += -Dlibmpv=true
 else
-MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static
+MPV_CONF_OPTS += -Dlibmpv=false
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-MPV_CONF_OPTS += --enable-alsa
+MPV_CONF_OPTS += -Dalsa=enabled
 MPV_DEPENDENCIES += alsa-lib
 else
-MPV_CONF_OPTS += --disable-alsa
+MPV_CONF_OPTS += -Dalsa=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
-MPV_CONF_OPTS += --enable-gbm
+MPV_CONF_OPTS += -Dgbm=enabled
 MPV_DEPENDENCIES += mesa3d
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
-MPV_CONF_OPTS += --enable-egl-drm
+MPV_CONF_OPTS += -Degl-drm=enabled
 else
-MPV_CONF_OPTS += --disable-egl-drm
+MPV_CONF_OPTS += -Degl-drm=disabled
 endif
 else
-MPV_CONF_OPTS += --disable-gbm --disable-egl-drm
+MPV_CONF_OPTS += -Dgbm=disabled -Degl-drm=disabled
 endif
 
 # jack support
 # It also requires 64-bit sync intrinsics
 ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_JACK2),yy)
-MPV_CONF_OPTS += --enable-jack
+MPV_CONF_OPTS += -Djack=enabled
 MPV_DEPENDENCIES += jack2
 else
-MPV_CONF_OPTS += --disable-jack
+MPV_CONF_OPTS += -Djack=disabled
 endif
 
 # jpeg support
 ifeq ($(BR2_PACKAGE_JPEG),y)
-MPV_CONF_OPTS += --enable-jpeg
+MPV_CONF_OPTS += -Djpeg=enabled
 MPV_DEPENDENCIES += jpeg
 else
-MPV_CONF_OPTS += --disable-jpeg
+MPV_CONF_OPTS += -Djpeg=disabled
 endif
 
 # lcms2 support
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-MPV_CONF_OPTS += --enable-lcms2
+MPV_CONF_OPTS += -Dlcms2=enabled
 MPV_DEPENDENCIES += lcms2
 else
-MPV_CONF_OPTS += --disable-lcms2
+MPV_CONF_OPTS += -Dlcms2=disabled
 endif
 
 # libarchive support
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
-MPV_CONF_OPTS += --enable-libarchive
+MPV_CONF_OPTS += -Dlibarchive=enabled
 MPV_DEPENDENCIES += libarchive
 else
-MPV_CONF_OPTS += --disable-libarchive
+MPV_CONF_OPTS += -Dlibarchive=disabled
 endif
 
 # bluray support
 ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
-MPV_CONF_OPTS += --enable-libbluray
+MPV_CONF_OPTS += -Dlibbluray=enabled
 MPV_DEPENDENCIES += libbluray
 else
-MPV_CONF_OPTS += --disable-libbluray
+MPV_CONF_OPTS += -Dlibbluray=disabled
 endif
 
 # libcdio-paranoia
 ifeq ($(BR2_PACKAGE_LIBCDIO_PARANOIA),y)
-MPV_CONF_OPTS += --enable-cdda
+MPV_CONF_OPTS += -Dcdda=enabled
 MPV_DEPENDENCIES += libcdio-paranoia
 else
-MPV_CONF_OPTS += --disable-cdda
+MPV_CONF_OPTS += -Dcdda=disabled
 endif
 
 # libdvdnav
 ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
-MPV_CONF_OPTS += --enable-dvdnav
+MPV_CONF_OPTS += -Ddvdnav=enabled
 MPV_DEPENDENCIES += libdvdnav
 else
-MPV_CONF_OPTS += --disable-dvdnav
+MPV_CONF_OPTS += -Ddvdnav=disabled
 endif
 
 # libdrm
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
-MPV_CONF_OPTS += --enable-drm
+MPV_CONF_OPTS += -Ddrm=enabled
 MPV_DEPENDENCIES += libdrm
 else
-MPV_CONF_OPTS += --disable-drm
+MPV_CONF_OPTS += -Ddrm=disabled
 endif
 
 # libvdpau
 ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
-MPV_CONF_OPTS += --enable-vdpau
+MPV_CONF_OPTS += -Dvdpau=enabled
 MPV_DEPENDENCIES += libvdpau
 else
-MPV_CONF_OPTS += --disable-vdpau
+MPV_CONF_OPTS += -Dvdpau=disabled
 endif
 
 # LUA support, only for lua51/lua52/luajit
 # This enables the controller (OSD) together with libass
 ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUAJIT),y)
-MPV_CONF_OPTS += --enable-lua
+MPV_CONF_OPTS += -Dlua=enabled
 MPV_DEPENDENCIES += luainterpreter
 else
-MPV_CONF_OPTS += --disable-lua
+MPV_CONF_OPTS += -Dlua=disabled
 endif
 
 # OpenGL support
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-MPV_CONF_OPTS += --enable-gl
+MPV_CONF_OPTS += -Dgl=enabled
 MPV_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-MPV_CONF_OPTS += --enable-gl
+MPV_CONF_OPTS += -Dgl=enabled
 MPV_DEPENDENCIES += libgles
 else ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-MPV_CONF_OPTS += --enable-gl
+MPV_CONF_OPTS += -Dgl=enabled
 MPV_DEPENDENCIES += libegl
 else
-MPV_CONF_OPTS += --disable-gl
+MPV_CONF_OPTS += -Dgl=disabled
 endif
 
 # pulseaudio support
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-MPV_CONF_OPTS += --enable-pulse
+MPV_CONF_OPTS += -Dpulse=enabled
 MPV_DEPENDENCIES += pulseaudio
 else
-MPV_CONF_OPTS += --disable-pulse
+MPV_CONF_OPTS += -Dpulse=disabled
 endif
 
 # SDL support
 # Sdl2 requires 64-bit sync intrinsics
 ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_SDL2),yy)
-MPV_CONF_OPTS += --enable-sdl2
+MPV_CONF_OPTS += -Dsdl2=enabled
 MPV_DEPENDENCIES += sdl2
 else
-MPV_CONF_OPTS += --disable-sdl2
+MPV_CONF_OPTS += -Dsdl2=disabled
 endif
 
 # Raspberry Pi support
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-MPV_CONF_OPTS += --enable-rpi --enable-gl
+#MPV_CONF_OPTS += -Drpi=enabled -Dgl=enabled
 MPV_DEPENDENCIES += rpi-userland
-else
-MPV_CONF_OPTS += --disable-rpi
+#else
+#MPV_CONF_OPTS += -Drpi=disabled
 endif
 
 # va-api support
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
-MPV_CONF_OPTS += --enable-vaapi
+MPV_CONF_OPTS += -Dvaapi=enabled
 MPV_DEPENDENCIES += libva
 ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
-MPV_CONF_OPTS += --enable-vaapi-drm
+MPV_CONF_OPTS += -Dvaapi-drm=enabled
 else
-MPV_CONF_OPTS += --disable-vaapi-drm
+MPV_CONF_OPTS += -Dvaapi-drm=disabled
 endif
 else
-MPV_CONF_OPTS += --disable-vaapi --disable-vaapi-drm
+MPV_CONF_OPTS += -Dvaapi=disabled -Dvaapi-drm=disabled
 endif
 
 # wayland support
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-MPV_CONF_OPTS += --enable-wayland
+MPV_CONF_OPTS += -Dwayland=enabled
 MPV_DEPENDENCIES += libxkbcommon wayland wayland-protocols
 else
-MPV_CONF_OPTS += --disable-wayland
+MPV_CONF_OPTS += -Dwayland=disabled
 endif
 
 # Base X11 support. Config.in ensures that if BR2_PACKAGE_XORG7 is
 # enabled, xlib_libX11, xlib_libXext, xlib_libXinerama,
 # xlib_libXrandr, xlib_libXScrnSaver.
 ifeq ($(BR2_PACKAGE_XORG7),y)
-MPV_CONF_OPTS += --enable-x11
+MPV_CONF_OPTS += -Dx11=enabled
 MPV_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXext \
@@ -214,17 +211,17 @@ MPV_DEPENDENCIES += \
 	xlib_libXScrnSaver
 # XVideo
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
-MPV_CONF_OPTS += --enable-xv
+MPV_CONF_OPTS += -Dxv=enabled
 MPV_DEPENDENCIES += xlib_libXv
 else
-MPV_CONF_OPTS += --disable-xv
+MPV_CONF_OPTS += -Dxv=disabled
 endif
 else
-MPV_CONF_OPTS += --disable-x11
+MPV_CONF_OPTS += -Dx11=disabled
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 MPV_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
 endif
 
-$(eval $(waf-package))
+$(eval $(meson-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
