Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328DFEEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D889F403E1;
	Thu,  1 Jan 2026 16:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0p79egcOxxpe; Thu,  1 Jan 2026 16:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09312406A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767285003;
	bh=cLjp/0oSkZKTLZeWO0jIFoH3Enx9GHV4ixTWd3j+FBM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KeTLrYzs/mT+B5Znb2knfSTor0N8CFvh0+2o7A6f23EMxu7Losifbp1XxrhKC8vuA
	 i2SN4RvzgHR3UNiswZWTHAn1uHYbDI2cGxPW/miGUBuFheEIVFudwHtCrWbU/13AUF
	 HfN48/LXlbReyNWEeye1bop8tuw4+m1RBiTvW2tzOVNl4XqG9sx/i6oFOcVjZRSiJW
	 f8Aqbd0auoQvehkNj1kM/hhaa9/HAqMbyY4+Rvcs6JKCIbSImMlZb+BR+zde9wN5EE
	 Ez5jirSZWft23TG2IXksJi9pKhGifSC+15zlBAh4cHqRoDHseB6bFtOjNBWWT37E9u
	 k0xk6hlks5FYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09312406A3;
	Thu,  1 Jan 2026 16:30:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7531F19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63A1B607DC
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLcl58QL8INL for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62E3E6078A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62E3E6078A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F15D87E20; Thu,  1 Jan 2026 16:30:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 17:22:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 006aab8d64d2179d77df9a696b3fd8636f541640
X-Git-Newrev: 73254947809797a3c2c0e421ead477fbe833d807
X-Patchwork-Hint: ignore
Message-Id: <20260101163000.5F15D87E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: bump version to 0.4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=73254947809797a3c2c0e421ead477fbe833d807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream patch to fix build with ffmpeg 8.0.

Added dependency to libplacebo:
https://github.com/mpv-player/mpv/commit/f5ca11e12bc55d14bd6895b619c4abfd470c6452

Added optional dependency to libdisplay-info when libdrm is enabled:
https://github.com/mpv-player/mpv/commit/a4d9bdd262b808d0c8663d28023ff21fef862803

Removed -Drpi option:
https://github.com/mpv-player/mpv/commit/343a5fd345a84572ea5693a805119067d5b0fbc8

Removed configure options for atomic support:
https://github.com/mpv-player/mpv/commit/2fa695c3f9d4164344228ef4083e87369de3bb33

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-compilation-after-deprecated-definitio.patch | 39 ++++++++++++++++++++++
 package/mpv/Config.in                              | 12 ++++---
 package/mpv/mpv.hash                               |  4 +--
 package/mpv/mpv.mk                                 | 17 ++++------
 4 files changed, 56 insertions(+), 16 deletions(-)

diff --git a/package/mpv/0001-demux_mkv-fix-compilation-after-deprecated-definitio.patch b/package/mpv/0001-demux_mkv-fix-compilation-after-deprecated-definitio.patch
new file mode 100644
index 0000000000..8e216497f4
--- /dev/null
+++ b/package/mpv/0001-demux_mkv-fix-compilation-after-deprecated-definitio.patch
@@ -0,0 +1,39 @@
+From 26b29fba02a2782f68e2906f837d21201fc6f1b9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>
+Date: Fri, 28 Mar 2025 19:12:01 +0100
+Subject: [PATCH] demux_mkv: fix compilation after deprecated definitions
+ removal
+
+See: https://github.com/FFmpeg/FFmpeg/commit/822432769868da325ba03774df1084aa78b9a5a0
+
+Upstream: https://github.com/mpv-player/mpv/commit/26b29fba02a2782f68e2906f837d21201fc6f1b9
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ demux/demux_mkv.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/demux/demux_mkv.c b/demux/demux_mkv.c
+index 135edcc23d82b..cc7ce3e98f4f6 100644
+--- a/demux/demux_mkv.c
++++ b/demux/demux_mkv.c
+@@ -2200,16 +2200,16 @@ static int demux_mkv_open_sub(demuxer_t *demuxer, mkv_track_t *track)
+             // [0x30..0x37] are component tags utilized for
+             // non-mobile captioning service ("profile A").
+             if (component_tag >= 0x30 && component_tag <= 0x37)
+-                lav->profile = FF_PROFILE_ARIB_PROFILE_A;
++                lav->profile = AV_PROFILE_ARIB_PROFILE_A;
+             break;
+         case 0x0012:
+             // component tag 0x87 signifies a mobile/partial reception
+             // (1seg) captioning service ("profile C").
+             if (component_tag == 0x87)
+-                lav->profile = FF_PROFILE_ARIB_PROFILE_C;
++                lav->profile = AV_PROFILE_ARIB_PROFILE_C;
+             break;
+         }
+-        if (lav->profile == FF_PROFILE_UNKNOWN)
++        if (lav->profile == AV_PROFILE_UNKNOWN)
+             MP_WARN(demuxer, "ARIB caption profile %02x / %04x not supported.\n",
+                     component_tag, data_component_id);
+     }
diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 5c32f593fe..a4515a97e0 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -6,18 +6,21 @@ config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
 
 config BR2_PACKAGE_MPV
 	bool "mpv"
-	depends on BR2_INSTALL_LIBSTDCPP # libass
+	depends on BR2_INSTALL_LIBSTDCPP # libass, libplacebo
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libplacebo
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_STATIC_LIBS # libplacebo
 	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBDISPLAY_INFO if BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_LIBASS
+	select BR2_PACKAGE_LIBPLACEBO
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# Select xkbcommon for wayland to avoid being mysterious
@@ -35,10 +38,11 @@ config BR2_PACKAGE_MPV
 
 	  https://mpv.io/
 
-comment "mpv needs a toolchain w/ C++, NPTL, gcc >= 4.9"
+comment "mpv needs a toolchain w/ C++, NPTL, gcc >= 10, dynamic library"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		BR2_STATIC_LIBS
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index a09015619d..55011bf339 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41df981b7b84e33a2ef4478aaf81d6f4f5c8b9cd2c0d337ac142fc20b387d1a9  mpv-0.35.1.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL
+sha256  10a0f4654f62140a6dd4d380dcf0bbdbdcf6e697556863dc499c296182f081a3  mpv-0.40.0.tar.gz
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENSE.GPL
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index a6e0641bd0..29d4ebfaf7 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.35.1
+MPV_VERSION = 0.40.0
 MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
 MPV_DEPENDENCIES = \
-	host-pkgconf ffmpeg libass zlib \
+	host-pkgconf ffmpeg libass libplacebo zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE.GPL
@@ -24,8 +24,7 @@ MPV_CONF_OPTS = \
 	-Dopensles=disabled \
 	-Drubberband=disabled \
 	-Duchardet=disabled \
-	-Dvapoursynth=disabled \
-	-Drpi=disabled
+	-Dvapoursynth=disabled
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 MPV_CONF_OPTS += -Dbuild-date=false
@@ -38,6 +37,10 @@ else
 MPV_CONF_OPTS += -Dalsa=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDISPLAY_INFO),y)
+MPV_DEPENDENCIES += libdisplay-info
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
 MPV_CONF_OPTS += -Dgbm=enabled
 MPV_DEPENDENCIES += mesa3d
@@ -207,10 +210,4 @@ else
 MPV_CONF_OPTS += -Dx11=disabled
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-MPV_CONF_OPTS += -Dstdatomic=enabled
-else
-MPV_CONF_OPTS += -Dstdatomic=disabled
-endif
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
