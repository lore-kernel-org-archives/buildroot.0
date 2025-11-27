Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30407CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E867261701;
	Thu, 27 Nov 2025 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GC0PuaRKRSjU; Thu, 27 Nov 2025 19:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E03FE616E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E03FE616E8;
	Thu, 27 Nov 2025 19:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AD822A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8890340420
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPdnI12DBuBm for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 037BC4023A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 037BC4023A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 037BC4023A
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32D70B979CE7; Thu, 27 Nov 2025 20:54:33 +0100 (CET)
Message-ID: <18aa8d4c-7536-4048-83a7-8e1651256dba@rnout.be>
Date: Thu, 27 Nov 2025 20:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>,
 Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-7-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251106204522.3273683-7-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2FdSxEnsw7Mee9qM+nXJmkDW8pApVVMTv1jRzKrlO2c=;
 b=QdAMwj5pxgLKf9BXbiIwK1VHXV54oeqGWAR/7VvvxZDYZFsHbJnDy0nt1ONEwd7eFQXUjZ
 j1+P4XsLfZvzB+jRsPFrgmzVH34WFlJLvdboc0IXWV1XWFoXXP7bHackKk852pRM9nFJSr
 UhtHktioGQXBY0N0guwTuAXBQv9Sn9BPDcZIgsQlB2wEv8/l/Q1S/ITB4Jj9nI0CXa4HKI
 71SMw87r+uNBGF3INzgU+Mc3qc1PG9Nir+bZI3c11H12c6FUz1OFHzsv23pW5EHXrI1GXs
 BIk+ycfDoBFawFtNnMXKUNYuHidhmwKebqgGkCGKphBBp5hJfvJnbexLoyXiLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QdAMwj5p
Subject: Re: [Buildroot] [PATCH v3 06/14] package/mediastreamer: remove
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/11/2025 21:45, Bernd Kuhls wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> mediastreamer was only needed as a dependency of linphone, as is
> anyway bundled in more recent versions of linphone, making a separate
> package unnnecessary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                           |   2 -
>   Config.in.legacy                              |   8 +
>   package/Config.in                             |   1 -
>   ...-nowebcam.c-fix-build-without-ffmpeg.patch |  55 ------
>   ...FER_PADDING_SIZE-to-determine-paddin.patch |  46 -----
>   package/mediastreamer/Config.in               |  28 ---
>   package/mediastreamer/mediastreamer.hash      |   3 -
>   package/mediastreamer/mediastreamer.mk        | 179 ------------------
>   8 files changed, 8 insertions(+), 314 deletions(-)
>   delete mode 100644 package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
>   delete mode 100644 package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
>   delete mode 100644 package/mediastreamer/Config.in
>   delete mode 100644 package/mediastreamer/mediastreamer.hash
>   delete mode 100644 package/mediastreamer/mediastreamer.mk
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index e73e7100a5..afc9d412ec 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -690,8 +690,6 @@ package/matchbox-panel/0003-mb-applet-battery.patch lib_patch.Upstream
>   package/matchbox-startup-monitor/0001-true-false.patch lib_patch.Upstream
>   package/matchbox/0001-defaulttheme.patch lib_patch.Upstream
>   package/matchbox/0002-src-Fix-build-with-gcc-10.patch lib_patch.Upstream
> -package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch lib_patch.Upstream
> -package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch lib_patch.Upstream
>   package/memstat/0001-PATH_MAX.patch lib_patch.Upstream
>   package/mender-connect/S43mender-connect Shellcheck
>   package/menu-cache/0001-Support-gcc10-compilation.patch lib_patch.Upstream
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 8f3099d89a..4744df6573 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_MEDIASTREAMER
> +	bool "mediastreamer has been removed"
> +	select BR2_LEGACY
> +	help
> +	  This package has been removed as part of the linphone
> +	  removal. In addition, newer version of linphone directly
> +	  bundle mediastreamer making a separate package unnecessary.
> +
>   config BR2_PACKAGE_BELR
>   	bool "belr has been removed"
>   	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index 456c922413..09475970f9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2000,7 +2000,6 @@ menu "Multimedia"
>   	source "package/libvpx/Config.in"
>   	source "package/libyuv/Config.in"
>   	source "package/live555/Config.in"
> -	source "package/mediastreamer/Config.in"
>   	source "package/x264/Config.in"
>   	source "package/x265/Config.in"
>   endmenu
> diff --git a/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch b/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
> deleted file mode 100644
> index 8e7812c389..0000000000
> --- a/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 342f59f1603f759b6dd90754f8dba14d08947f55 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 27 Feb 2020 16:18:35 +0100
> -Subject: [PATCH] src/videofilters/nowebcam.c: fix build without ffmpeg or jpeg
> -
> -jpeg2yuv is only defined if ffmpeg or turbojpeg is available
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - CMakeLists.txt              | 3 +++
> - src/videofilters/nowebcam.c | 4 ++++
> - 2 files changed, 7 insertions(+)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 0efc1a5f..6668db2b 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -336,7 +336,10 @@ if(ENABLE_JPEG)
> - 	if(NOT TURBOJPEG_FOUND)
> - 		message(WARNING "Could not find libturbo-jpeg, mediastreamer2 will be compiled without LibJpeg-Turbo")
> - 		set(ENABLE_JPEG OFF CACHE BOOL "Enable JPEG support" FORCE)
> -+		add_definitions(-DNO_JPEG)
> - 	endif()
> -+else()
> -+	add_definitions(-DNO_JPEG)
> - endif()
> - if(ENABLE_QRCODE)
> - 	find_package(Zxing)
> -diff --git a/src/videofilters/nowebcam.c b/src/videofilters/nowebcam.c
> -index a2344dcd..afb0d7b1 100644
> ---- a/src/videofilters/nowebcam.c
> -+++ b/src/videofilters/nowebcam.c
> -@@ -107,7 +107,9 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpath, MSVideoSize *reqsize) {
> - 	if (err != st_sizel) {
> - 		  ms_error("Could not read as much as wanted !");
> - 	}
> -+#if !(defined(NO_FFMPEG) && defined(NO_JPEG))
> - 	m = jpeg2yuv(jpgbuf, st_sizel, reqsize);
> -+#endif
> - 	ms_free(jpgbuf);
> - 	if (m == NULL) {
> - 		CloseHandle(fd);
> -@@ -140,7 +142,9 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpath, MSVideoSize *reqsize) {
> - 		if (err != statbuf.st_size) {
> - 			ms_error("Could not read as much as wanted: %i<>%li !", err, (long)statbuf.st_size);
> - 		}
> -+#if !(defined(NO_FFMPEG) && defined(NO_JPEG))
> - 		m = jpeg2yuv(jpgbuf,statbuf.st_size,reqsize);
> -+#endif
> - 		ms_free(jpgbuf);
> - 		if (m == NULL) {
> - 			close(fd);
> ---
> -2.25.0
> -
> diff --git a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
> deleted file mode 100644
> index 9fd3fda2ec..0000000000
> --- a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 84b1919124884232e0fa30b30458470db27c73fc Mon Sep 17 00:00:00 2001
> -From: James Cowgill <jcowgill@debian.org>
> -Date: Sat, 18 Aug 2018 12:56:38 +0200
> -Subject: [PATCH] Use AV_INPUT_BUFFER_PADDING_SIZE to determine padding
> - size
> -
> -Hardcoding the value for FF_INPUT_BUFFER_PADDING_SIZE is not safe
> -because  upstream FFmpeg might change it (as they did in FFmpeg 4.0).
> -
> -Instead, use FFmpeg's AV_INPUT_BUFFER_PADDING_SIZE if available and
> -only hardcode a value if FFmpeg is disabled (in which case the value
> -doesn't particularly matter anyway). For compatibility with older
> -FFmpeg versions, define AV_INPUT_BUFFER_PADDING_SIZE if hasn't been
> -defined yet.
> -
> -Downloaded from
> -https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901735
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -[Fabrice: updated for 4.3.1]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Dario: make the patch to be applied with fuzz factor 0]
> -Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ----
> - src/utils/ffmpeg-priv.h     | 4 ++++
> - src/videofilters/nowebcam.c | 4 ++--
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/utils/ffmpeg-priv.h b/src/utils/ffmpeg-priv.h
> -index c0745a9a..d59ea0e1 100644
> ---- a/src/utils/ffmpeg-priv.h
> -+++ b/src/utils/ffmpeg-priv.h
> -@@ -115,6 +115,10 @@
> - extern "C" {
> - #endif
> -
> -+#ifndef AV_INPUT_BUFFER_PADDING_SIZE
> -+#define AV_INPUT_BUFFER_PADDING_SIZE FF_INPUT_BUFFER_PADDING_SIZE
> -+#endif
> -+
> - #ifndef HAVE_FUN_avcodec_encode_video2
> - int avcodec_encode_video2 (AVCodecContext *avctx, AVPacket *avpkt, const AVFrame *frame, int *got_packet_ptr);
> - #endif
> ---
> -2.18.0
> -
> diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
> deleted file mode 100644
> index e776b60df3..0000000000
> --- a/package/mediastreamer/Config.in
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -config BR2_PACKAGE_MEDIASTREAMER
> -	bool "mediastreamer"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_STATIC_LIBS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # ortp
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
> -	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
> -	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
> -	select BR2_PACKAGE_MBEDTLS
> -	select BR2_PACKAGE_ORTP
> -	help
> -	  Mediastreamer is a powerful and lightweighted streaming
> -	  engine specialized for voice/video telephony applications.
> -
> -	  It is the library that is responsible for all the receiving
> -	  and sending of multimedia streams in linphone, including
> -	  voice/video capture, encoding and decoding, and rendering.
> -
> -	  http://www.linphone.org/technical-corner/mediastreamer2
> -
> -comment "mediastreamer needs a toolchain w/ threads, C++, dynamic library, gcc >= 5"
> -	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> -
> -comment "mediastreamer needs a toolchain not affected by GCC bug 64735"
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> diff --git a/package/mediastreamer/mediastreamer.hash b/package/mediastreamer/mediastreamer.hash
> deleted file mode 100644
> index dfa469d8dd..0000000000
> --- a/package/mediastreamer/mediastreamer.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  64bdfe9dd6bfa64b492b21a45ad4bb36d67626a7f3b3ab2084a708864f129e84  mediastreamer-4.4.8.tar.gz
> -sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
> diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
> deleted file mode 100644
> index febbb7b343..0000000000
> --- a/package/mediastreamer/mediastreamer.mk
> +++ /dev/null
> @@ -1,179 +0,0 @@
> -################################################################################
> -#
> -# mediastreamer
> -#
> -################################################################################
> -
> -MEDIASTREAMER_VERSION = 4.4.8
> -MEDIASTREAMER_SITE = \
> -	https://gitlab.linphone.org/BC/public/mediastreamer2/-/archive/$(MEDIASTREAMER_VERSION)
> -MEDIASTREAMER_LICENSE = GPL-3.0+
> -MEDIASTREAMER_LICENSE_FILES = LICENSE.txt
> -MEDIASTREAMER_INSTALL_STAGING = YES
> -MEDIASTREAMER_DEPENDENCIES = ortp
> -MEDIASTREAMER_CONF_OPTS = \
> -	-DENABLE_DOC=OFF \
> -	-DENABLE_GL=OFF \
> -	-DENABLE_GLX=OFF \
> -	-DENABLE_MKV=OFF \
> -	-DENABLE_SOUND=OFF \
> -	-DENABLE_STRICT=OFF \
> -	-DENABLE_TOOLS=OFF \
> -	-DENABLE_UNIT_TESTS=OFF \
> -	-DENABLE_ZRTP=OFF
> -
> -ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> -MEDIASTREAMER_CONF_OPTS += \
> -	-DENABLE_ALSA=ON \
> -	-DENABLE_SOUND=ON
> -MEDIASTREAMER_DEPENDENCIES += alsa-lib
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_ALSA=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_BCG729),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_G729=ON
> -MEDIASTREAMER_DEPENDENCIES += bcg729
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_G729=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_JPEG=ON
> -MEDIASTREAMER_DEPENDENCIES += jpeg
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_JPEG=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBGSM),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_GSM=ON
> -MEDIASTREAMER_DEPENDENCIES += libgsm
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_GSM=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_PCAP=ON
> -MEDIASTREAMER_DEPENDENCIES += libpcap
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_PCAP=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBSRTP),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SRTP=ON
> -MEDIASTREAMER_DEPENDENCIES += libsrtp
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SRTP=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBVPX),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_VPX=ON
> -MEDIASTREAMER_DEPENDENCIES += libvpx
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_VPX=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPUS),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_OPUS=ON
> -MEDIASTREAMER_DEPENDENCIES += opus
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_OPUS=OFF
> -endif
> -
> -# portaudio backend needs speexdsp as well
> -ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEXDSP),yy)
> -MEDIASTREAMER_CONF_OPTS += \
> -	-DENABLE_PORTAUDIO=ON \
> -	-DENABLE_SOUND=ON
> -MEDIASTREAMER_DEPENDENCIES += portaudio
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_PORTAUDIO=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> -MEDIASTREAMER_CONF_OPTS += \
> -	-DENABLE_PULSEAUDIO=ON \
> -	-DENABLE_SOUND=ON
> -MEDIASTREAMER_DEPENDENCIES += pulseaudio
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SPEEX),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_CODEC=ON
> -MEDIASTREAMER_DEPENDENCIES += speex
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_CODEC=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=ON
> -MEDIASTREAMER_DEPENDENCIES += speexdsp
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_RESAMPLE=ON
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_RESAMPLE=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_FFMPEG=ON
> -MEDIASTREAMER_DEPENDENCIES += ffmpeg
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_FFMPEG=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SDL),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SDL=ON
> -MEDIASTREAMER_DEPENDENCIES += sdl
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SDL=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_X11=ON
> -MEDIASTREAMER_DEPENDENCIES += xlib_libX11
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_X11=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_XV=ON
> -MEDIASTREAMER_DEPENDENCIES += xlib_libXv
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_XV=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_THEORA=ON
> -MEDIASTREAMER_DEPENDENCIES += libtheora
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_THEORA=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBV4L),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_V4L=ON
> -MEDIASTREAMER_DEPENDENCIES += libv4l
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_V4L=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_ZXING_CPP),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_QRCODE=ON
> -MEDIASTREAMER_DEPENDENCIES += zxing-cpp
> -else
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_QRCODE=OFF
> -endif
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
> -else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
> -else ifeq ($(BR2_SHARED_LIBS),y)
> -MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
> -endif
> -
> -$(eval $(cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
