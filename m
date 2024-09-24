Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED94FCF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 20:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855B64242A;
	Tue, 24 Sep 2024 20:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 282i5NWEgTM8; Tue, 24 Sep 2024 20:43:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE214242B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AE214242B;
	Tue, 24 Sep 2024 20:43:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2F11BF354
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 20:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01D1160DC2
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 20:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEuSdyEgM--7 for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 20:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 787F660D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 787F660D9D
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 787F660D9D
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 20:43:37 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e1a9463037cso4857299276.2
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 13:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727210616; x=1727815416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MuJ7yYsOHkm7OODbOYb55DxeGcVWSX5AV5wtiZPGrik=;
 b=Nb7wWn/F4CBdZXH7Iedtcm5sGVx8cf5BR7Q8qEfciDLX5FcCr1ieyijF+O/NRQ1YxF
 ZsvaAn20UZbHOhzepydNxubx3+whdfbJf1gRoqryuhcGbr2dsQgW15+IUmcQYcWP71c2
 iQMGYyPViezX3qmhpWAjuhMZEOEAV7NZbz7feOL01TT+6xU7OxR+ypl44+VNsB5q9N9i
 OIBg3ia32iV6VB4Fx182LUZ1mGkQiCSwD4CAyBSfM2f0Za6PnFMyVff/DoAdOuKpjjKF
 g7bIKQi4p0i/QfSJg2NHk9sARimN2G3Ci9j+XEFmvh7bQSN6DGu+DphUrCC2VdO9NO1C
 ikyA==
X-Gm-Message-State: AOJu0YxGvNPRIYYDvKmLTlaLUxFHcvvyAkVH0RC0aL24/83NMdtNHiYI
 FzDpjkEOwp5PScKUnucRsDRCkkU2PQfsXCtMsWgTrvv3jlQoj1Mb91qkCa0eDCIjZic/kIcTmhB
 Rd3iFfFyeLVyh8wSGNryRTjjHlps=
X-Google-Smtp-Source: AGHT+IHayUm1811ph6JO+5GGjhtSmSREih2egtRoxBTRvyUSkmerUj5HWLR2AK3cTDEyI15fKP1TneeudVdZl6lQiiY=
X-Received: by 2002:a25:8386:0:b0:e22:4edc:25bf with SMTP id
 3f1490d57ef6-e24da2a424fmr322081276.47.1727210615923; Tue, 24 Sep 2024
 13:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240920160500.18551-1-baxiche@gmail.com>
 <CA+R_derRe3Pf0BdL3Y8ykcWjAZewrFJ2KjihXQ3C1axbAwvi2A@mail.gmail.com>
 <CA+R_derW2J2y70+gyXuXDE3iZR=AXvyNg7QLy_kO8tURhOT34Q@mail.gmail.com>
In-Reply-To: <CA+R_derW2J2y70+gyXuXDE3iZR=AXvyNg7QLy_kO8tURhOT34Q@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Tue, 24 Sep 2024 22:43:24 +0200
Message-ID: <CA+R_dergQdmeD7WikAg_CUev-do6LV_1tnkpi9JDgo8wHnUivA@mail.gmail.com>
To: baxiche su <baxiche@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727210616; x=1727815416; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MuJ7yYsOHkm7OODbOYb55DxeGcVWSX5AV5wtiZPGrik=;
 b=Gk+ceOaebym/P6LvVpUmKzKNPmrVjD7eWmd9mCq+WucxmPQBdXbvDML84mKv+6H6G+
 NOmdktvX6HYeGlfmCPRQDBkQSnbxCLQB8Ks5BDSKLHJQKKzH5FenSkzOuu0krFE+LO0Y
 VizAmaJa8VqMshuiEyawRixUSyNM2xGugUH/NE6i+ZECy6odujjIBBsyMf1QeyIr0A65
 BQQhNiWgXi30y/eejCP955CQTmzMRZNSgf3UlE8UmwhXGmKmagFq18xFr3QkIi+YdHMs
 w3sE4EL3p8sbNHgow3DWi92B2YgQWe5cYijeOA0xCXcG117e6ibUfWGEgAn8uPO/9+/s
 Vu/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gk+ceOae
Subject: Re: [Buildroot] [PATCH v3 1/1] package/qt6: add qt6 multimedia
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8747910964535136465=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8747910964535136465==
Content-Type: multipart/alternative; boundary="00000000000036ef2b0622e38fa6"

--00000000000036ef2b0622e38fa6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi baxiche,

I also found some formatting errors:

[roy@precision7530-arch-roy buildroot]$ ./utils/docker-run make
check-package
package/qt6/qt6multimedia/Config.in:8: help text: <tab><2 spaces><62 chars>
(https://nightly.buildroot.org/#writing-rules-config-in)
package/qt6/qt6multimedia/Config.in:8: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:9: help text: <tab><2 spaces><62 chars>
(https://nightly.buildroot.org/#writing-rules-config-in)
package/qt6/qt6multimedia/Config.in:9: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:10: help text: <tab><2 spaces><62
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
package/qt6/qt6multimedia/Config.in:10: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:11: help text: <tab><2 spaces><62
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
package/qt6/qt6multimedia/Config.in:11: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:12: help text: <tab><2 spaces><62
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
package/qt6/qt6multimedia/Config.in:12: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:13: help text: <tab><2 spaces><62
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
package/qt6/qt6multimedia/Config.in:13: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:14: help text: <tab><2 spaces><62
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
package/qt6/qt6multimedia/Config.in:25: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:29: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:34: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:41: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:55: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:61: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:66: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:95: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:98: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:103: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:109: line contains trailing whitespace
package/qt6/qt6multimedia/Config.in:114: line contains trailing whitespace
package/qt6/qt6multimedia/qt6multimedia.mk:15: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:16: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:17: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:18: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:19: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:22: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:23: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:24: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:25: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:26: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:27: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:27: remove trailing backslash
package/qt6/qt6multimedia/qt6multimedia.mk:30: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:31: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:34: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:35: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:36: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:37: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:38: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:39: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:40: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:41: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:42: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:43: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:44: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:45: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:46: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:47: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:48: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:49: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:65: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:66: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:67: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:68: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:70: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:71: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:72: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:73: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:74: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:75: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:76: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:77: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:78: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:83: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:84: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:85: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:85: line contains trailing
whitespace
package/qt6/qt6multimedia/qt6multimedia.mk:112: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:113: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:114: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:116: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:117: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:118: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:119: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:120: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:121: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:122: expected indent with tabs
package/qt6/qt6multimedia/qt6multimedia.mk:123: expected indent with tabs

426759 lines processed
83 warnings generated
make: *** [Makefile:1263: check-package] Error 1

tir. 24. sep. 2024 kl. 22:34 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> Hi baxiche,
>
> I did some testing.
>
> The buildfailed when i tried to enable everything except for alsa:
>
> >>> qt6multimedia 6.7.2 Configuring
> (mkdir -p
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2//buildroot-build
> && cd
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2//buildroot-build
> && rm -f CMakeCache.txt &&
> PATH=3D"/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/=
bin:/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/sbin:/=
home/roy/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/home/roy/.loca=
l/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/defau=
lt/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/depo=
t_tools:/home/roy/.gem/ruby/3.0.0/bin:/home/roy/.local/bin"
>  /usr/bin/cmake
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2/
> -G"Ninja"
> -DCMAKE_MAKE_PROGRAM=3D"/home/roy/hymatek/connexi-touchpanel-firmware/ex7=
xxm/output/host/bin/ninja"
> -DCMAKE_TOOLCHAIN_FILE=3D"/home/roy/hymatek/connexi-touchpanel-firmware/e=
x7xxm/output/host/share/buildroot/toolchainfile.cmake"
> -DCMAKE_INSTALL_PREFIX=3D"/usr" -DCMAKE_INSTALL_RUNSTATEDIR=3D"/run"
> -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD_DOCS=3DOFF
> -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF -DBUILD_T=
ESTS=3DOFF
> -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON
>  -DQT_HOST_PATH=3D/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/ou=
tput/host
> -DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_alsa=3DOFF
> -DFEATURE_ffmpeg=3DOFF -DFEATURE_gstreamer=3DOFF -DFEATURE_gstreamer_1_0=
=3DOFF
> -DFEATURE_gstreamer_app=3DOFF -DFEATURE_gstreamer_gl=3DOFF
> -DFEATURE_gstreamer_photography=3DOFF -DFEATURE_linux_dmabuf=3DOFF
> -DFEATURE_linux_v4l=3DOFF -DFEATURE_pulseaudio=3DOFF -DFEATURE_spatialaud=
io=3DOFF
> -DFEATURE_spatialaudio_quick3d=3DOFF -DFEATURE_vaapi=3DOFF -DFEATURE_ffmp=
eg=3DON
> -DFEATURE_gstreamer=3DON -DFEATURE_gstreamer_1_0=3DON
> -DFEATURE_gstreamer_app=3DON  -DFEATURE_linux_dmabuf=3DON
> -DFEATURE_linux_v4l=3DON -DFEATURE_pulseaudio=3DON -DFEATURE_spatialaudio=
=3DON
> -DFEATURE_vaapi=3DON )
> -- The CXX compiler identification is GNU 13.3.0
> -- The C compiler identification is GNU 13.3.0
> -- Detecting CXX compiler ABI info
> -- Detecting CXX compiler ABI info - done
> -- Check for working CXX compiler:
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/bin/aarc=
h64-buildroot-linux-gnu-g++
> - skipped
> -- Detecting CXX compile features
> -- Detecting CXX compile features - done
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - done
> -- Check for working C compiler:
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/bin/aarc=
h64-buildroot-linux-gnu-gcc
> - skipped
> -- Detecting C compile features
> -- Detecting C compile features - done
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
> -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
> -- Found Threads: TRUE
> -- Performing Test HAVE_STDATOMIC
> -- Performing Test HAVE_STDATOMIC - Success
> -- Found WrapAtomic: TRUE
> -- Performing Test HAVE_EGL
> -- Performing Test HAVE_EGL - Success
> -- Found EGL:
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include
> (found version "1.5")
> -- Performing Test HAVE_GLESv2
> -- Performing Test HAVE_GLESv2 - Success
> CMake Warning at
> src/plugins/multimedia/ffmpeg/cmake/QtAddFFmpegStubs.cmake:38 (message):
>   QT_FEATURE_vaapi is ON but FFmpeg includes VAAPI and dynamic symbols
>   resolve is enabled.
> Call Stack (most recent call first):
>   src/plugins/multimedia/ffmpeg/cmake/QtAddFFmpegStubs.cmake:182
> (qt_internal_multimedia_check_ffmpeg_stubs_configuration)
>   src/plugins/multimedia/ffmpeg/CMakeLists.txt:95
> (qt_internal_multimedia_add_ffmpeg_stubs)
>
>
>
> -- Configuration summary shown below. It has also been written to
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2/buildroot-build/config.summary
> -- Configure with --log-level=3DSTATUS or higher to increase CMake's mess=
age
> verbosity. The log level does not persist across reconfigurations.
>
> -- Configure summary:
>
> Qt Multimedia:
>   Spatial Audio .......................... yes
>   Spatial Audio (Quick3D) ................ no
>   Low level Audio Backend:
>     ALSA (experimental) .................. no
>     PulseAudio ........................... yes
>     MMRenderer ........................... no
>     CoreAudio ............................ no
>     Windows Media SDK .................... no
>     Open SLES (Android) .................. no
>     Web Assembly ......................... no
>   Plugin:
>     GStreamer 1.0 ........................ yes
>     FFmpeg ............................... yes
>     MMRenderer ........................... no
>     AVFoundation ......................... no
>     Windows Media Foundation ............. no
>   Hardware acceleration and features:
>     Video for Linux ...................... yes
>     VAAPI support ........................ yes
>     Linux DMA buffer support ............. yes
>     VideoToolbox ......................... no
>
>
> -- Configuring done (3.7s)
> -- Generating done (0.2s)
> CMake Warning:
>   Manually-specified variables were not used by the project:
>
>     BUILD_DOC
>     BUILD_DOCS
>     BUILD_EXAMPLE
>     BUILD_EXAMPLES
>     BUILD_TEST
>     BUILD_TESTS
>     CMAKE_COLOR_MAKEFILE
>
>
> -- Build files have been written to:
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2/buildroot-build
> >>> qt6multimedia 6.7.2 Building
> GIT_DIR=3D.
> PATH=3D"/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/=
bin:/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/sbin:/=
home/roy/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/home/roy/.loca=
l/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/defau=
lt/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/depo=
t_tools:/home/roy/.gem/ruby/3.0.0/bin:/home/roy/.local/bin"
>  /usr/bin/cmake --build
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2//buildroot-build
> -j13
> [77/204] Building CXX object
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosource.cpp=
.o
> FAILED:
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosource.cpp=
.o
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/bin/aarc=
h64-buildroot-linux-gnu-g++
> --sysroot=3D/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/h=
ost/aarch64-buildroot-linux-gnu/sysroot
> -DMultimedia_EXPORTS -DQT_ASCII_CAST_WARNINGS -DQT_BUILDING_QT
> -DQT_BUILD_MULTIMEDIA_LIB -DQT_CORE_LIB -DQT_DEPRECATED_WARNINGS
> -DQT_DISABLE_DEPRECATED_UP_TO=3D0x050000
> -DQT_EXPLICIT_QFILE_CONSTRUCTION_FROM_PATH -DQT_GUI_LIB -DQT_MOC_COMPAT
> -DQT_NETWORK_LIB -DQT_NO_AS_CONST -DQT_NO_AS_CONST=3D1 -DQT_NO_CAST_TO_AS=
CII
> -DQT_NO_CONTEXTLESS_CONNECT=3D1 -DQT_NO_DEBUG -DQT_NO_EXCEPTIONS
> -DQT_NO_FOREACH -DQT_NO_FOREACH=3D1 -DQT_NO_JAVA_STYLE_ITERATORS
> -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_NO_QEXCHANGE
> -DQT_USE_QSTRINGBUILDER -DQT_WARN_DEPRECATED_UP_TO=3D0x070000
> -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/src/multimedia/Multimedia_autogen/include
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/include
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/include/QtMultimedia
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/src/multimedia
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/audio
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/camera
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/controls
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/platform
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/playback
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/recording
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/video
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/include/QtMultimedia/6.7.2
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/include/QtMultimedia/6.7.2/QtMultimedia
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/pulseaudio
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtCore
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/mkspecs/linux-g++
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtGui
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtNetwork
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtCore/6.7.2
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtCore/6.7.2/QtCore
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtGui/6.7.2
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtGui/6.7.2/QtGui
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -O2 -g=
0
> -D_FORTIFY_SOURCE=3D1 -DNDEBUG -O2 -std=3Dc++17 -fPIC -fvisibility=3Dhidd=
en
> -fvisibility-inlines-hidden -Wall -Wextra -fno-exceptions
> -Wsuggest-override -MD -MT
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosource.cpp=
.o
> -MF
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosource.cpp=
.o.d
> -o
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosource.cpp=
.o
> -c
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2/src/multimedia/pulseaudio/qpulseaudiosource.cpp
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2/src/multimedia/pulseaudio/qpulseaudiosource.cpp:566:10:
> fatal error: moc_qpulseaudiosource_p.cpp: Ingen slik fil eller filkatalog
>   566 | #include "moc_qpulseaudiosource_p.cpp"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> [78/204] Building CXX object
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosink.cpp.o
> FAILED:
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosink.cpp.o
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/bin/aarc=
h64-buildroot-linux-gnu-g++
> --sysroot=3D/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/h=
ost/aarch64-buildroot-linux-gnu/sysroot
> -DMultimedia_EXPORTS -DQT_ASCII_CAST_WARNINGS -DQT_BUILDING_QT
> -DQT_BUILD_MULTIMEDIA_LIB -DQT_CORE_LIB -DQT_DEPRECATED_WARNINGS
> -DQT_DISABLE_DEPRECATED_UP_TO=3D0x050000
> -DQT_EXPLICIT_QFILE_CONSTRUCTION_FROM_PATH -DQT_GUI_LIB -DQT_MOC_COMPAT
> -DQT_NETWORK_LIB -DQT_NO_AS_CONST -DQT_NO_AS_CONST=3D1 -DQT_NO_CAST_TO_AS=
CII
> -DQT_NO_CONTEXTLESS_CONNECT=3D1 -DQT_NO_DEBUG -DQT_NO_EXCEPTIONS
> -DQT_NO_FOREACH -DQT_NO_FOREACH=3D1 -DQT_NO_JAVA_STYLE_ITERATORS
> -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_NO_QEXCHANGE
> -DQT_USE_QSTRINGBUILDER -DQT_WARN_DEPRECATED_UP_TO=3D0x070000
> -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/src/multimedia/Multimedia_autogen/include
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/include
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/include/QtMultimedia
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/src/multimedia
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/audio
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/camera
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/controls
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/platform
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/playback
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/recording
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/video
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/include/QtMultimedia/6.7.2
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/buildroot-build/include/QtMultimedia/6.7.2/QtMultimedia
> -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mu=
ltimedia-6.7.2/src/multimedia/pulseaudio
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtCore
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/mkspecs/linux-g++
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtGui
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtNetwork
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtCore/6.7.2
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtCore/6.7.2/QtCore
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtGui/6.7.2
> -isystem
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtGui/6.7.2/QtGui
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -O2 -g=
0
> -D_FORTIFY_SOURCE=3D1 -DNDEBUG -O2 -std=3Dc++17 -fPIC -fvisibility=3Dhidd=
en
> -fvisibility-inlines-hidden -Wall -Wextra -fno-exceptions
> -Wsuggest-override -MD -MT
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosink.cpp.o
> -MF
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosink.cpp.o=
.d
> -o
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosink.cpp.o
> -c
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2/src/multimedia/pulseaudio/qpulseaudiosink.cpp
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2/src/multimedia/pulseaudio/qpulseaudiosink.cpp:749:10:
> fatal error: moc_qpulseaudiosink_p.cpp: Ingen slik fil eller filkatalog
>   749 | #include "moc_qpulseaudiosink_p.cpp"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> [89/203] Building CXX object
> src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qaudioengine_pulse.cp=
p.o
> ninja: build stopped: subcommand failed.
> make[2]: *** [package/pkg-generic.mk:289:
> /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6mult=
imedia-6.7.2/.stamp_built]
> Error 1
> make[1]: *** [Makefile:83: _all] Error 2
> make[1]: Leaving directory
> '/home/roy/hymatek/connexi-touchpanel-firmware/buildroot'
> make: *** [Makefile:86: ex7xxm/qt6multimedia-reconfigure] Error 2
>
> s=C3=B8n. 22. sep. 2024 kl. 11:21 skrev Roy Kollen Svendsen <
> roykollensvendsen@gmail.com>:
>
>> Hi Baxiche, Hi Thomas,
>>
>> Baxiche, good to see you are working on getting this module upstream!
>> I'll do some testing and dig deeper into the details later.
>>
>> I'm a but unsure about the non-qt dependencies, especially the kernel
>> feature dependencies.
>>
>> You can also probably drop more of the license information, that does no=
t
>> apply to things that don't end up on target.
>>
>> I think it would be nice to be able to enable the examples for testing.
>> The same goes for the other Qt6 packages. Have you looked into that?
>>
>> What do you think about adding options to enable the tests, Thomas?
>>
>> But until I get the time to do some testing and checking, here are some
>> things I noticed while reading through your patch:
>>
>> fre. 20. sep. 2024 kl. 18:06 skrev baxiche su <baxiche@gmail.com>:
>>
>>> Signed-off-by: baxiche su <baxiche@gmail.com>
>>> ---
>>>  DEVELOPERS                                   |   3 +
>>>  package/qt6/Config.in                        |   1 +
>>>  package/qt6/qt6multimedia/Config.in          | 117 ++++++++++++++++
>>>  package/qt6/qt6multimedia/qt6multimedia.hash |  26 ++++
>>>  package/qt6/qt6multimedia/qt6multimedia.mk   | 137 +++++++++++++++++++
>>>  5 files changed, 284 insertions(+)
>>>  create mode 100644 package/qt6/qt6multimedia/Config.in
>>>  create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash
>>>  create mode 100644 package/qt6/qt6multimedia/qt6multimedia.mk
>>>
>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>> index ea4ee3377f..5b6f60444d 100644
>>> --- a/DEVELOPERS
>>> +++ b/DEVELOPERS
>>> @@ -343,6 +343,9 @@ F:  package/tcpdump/
>>>  F:     package/ti-uim/
>>>  F:     package/uhubctl/
>>>
>>> +N:     Baxiche Su <baxiche@gmail.com>
>>> +F:     package/qt6/qt6multimedia
>>>
>>
>> The common pattern is to use a slash at the end of a directory entry:
>>
>> package/qt6/qt6multimedia/
>>
>>
>>> +
>>>  N:     Ben Boeckel <mathstuf@gmail.com>
>>>  F:     package/taskd/
>>>
>>> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
>>> index 4cbb60322c..debf4f4733 100644
>>> --- a/package/qt6/Config.in
>>> +++ b/package/qt6/Config.in
>>> @@ -48,6 +48,7 @@ source "package/qt6/qt6core5compat/Config.in"
>>>  source "package/qt6/qt6declarative/Config.in"
>>>  source "package/qt6/qt6languageserver/Config.in"
>>>  source "package/qt6/qt6mqtt/Config.in"
>>> +source "package/qt6/qt6multimedia/Config.in"
>>>  source "package/qt6/qt6opcua/Config.in"
>>>  source "package/qt6/qt6scxml/Config.in"
>>>  source "package/qt6/qt6serialbus/Config.in"
>>> diff --git a/package/qt6/qt6multimedia/Config.in
>>> b/package/qt6/qt6multimedia/Config.in
>>> new file mode 100644
>>> index 0000000000..1aebef840d
>>> --- /dev/null
>>> +++ b/package/qt6/qt6multimedia/Config.in
>>> @@ -0,0 +1,117 @@
>>> +config BR2_PACKAGE_QT6MULTIMEDIA
>>> +       bool "qt6multimedia"
>>> +       select BR2_PACKAGE_QT6BASE_GUI
>>> +       select BR2_PACKAGE_QT6BASE_NETWORK
>>> +       select BR2_PACKAGE_QT6SHADERTOOLS
>>> +
>>> +       help
>>> +         Qt Multimedia is an add-on module that provides
>>> +         a rich set of QML types and C++ classes to handle
>>> +         multimedia content. It contains an easy to use API
>>> +         for playing back audio and video files and rendering
>>> +         those on screen, as well as a comprehensive API for
>>> +         recording audio and video from the system's cameras
>>> +         and microphones.
>>>
>>
>> You wrap the help text at 62 characters i think. I think it is better to
>> wrap it at 62 + 2 + tab(8 chars). See manual.
>>
>>> +
>>> +         https://doc.qt.io/qt-6/qtmultimedia-index.html
>>> +
>>> +if BR2_PACKAGE_QT6MULTIMEDIA
>>> +
>>> +comment "alsa support requires disabling pulseaudio"
>>> +       depends on BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
>>> +       bool "alsa support"
>>> +       # qt6-multimedia audio backend requires selection
>>> +       # of either PulseAudio or ALSA.
>>>
>>
>> Maybe this could be reflected in a choice instead?
>>
>>
>>> +       depends on !BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
>>> +       select BR2_PACKAGE_ALSA_LIB
>>> +       help
>>> +         This option select Alsa as audio backend.
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
>>> +       bool "ffmpeg plugin"
>>>
>>
>> Does it make sense to make this a choice between ffmpeg and gstreamer
>> instead?
>>
>>
>>> +       # qt6-multimedia ffmpeg plugin needs
>>> +       # qt6base-concurrent, PulseAudio and ffmpeg-swcale.
>>>
>>
>> I think this comment just repeats the info bellow. Can we drop it?
>>
>>
>>> +       select BR2_PACKAGE_QT6BASE_CONCURRENT
>>> +       select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
>>> +       select BR2_PACKAGE_FFMPEG
>>> +       select BR2_PACKAGE_FFMPEG_SWSCALE
>>> +       select BR2_PACKAGE_PULSEAUDIO
>>>
>>
>> I also like when the select statements are sorted alphabetically. Have
>> you ordered them this way intentionally?
>>
>>
>>> +       help
>>> +         This option enables ffmpeg media backend
>>> +
>>> +if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
>>> +
>>> +comment "VAAPI support needs Linux DMA buffer feature"
>>> +       depends on !BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
>>> +
>>>
>>
>>
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_VAAPI
>>> +       bool "vaapi support"
>>> +       depends on BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
>>>
>> +       select BR2_PACKAGE_LIBVA
>>> +       # ffmpeg-vaapi support needs qt6base-opengl
>>> +       select BR2_PACKAGE_QT6BASE_OPENGL
>>> +       help
>>> +         This option enables the vaapi support.
>>> +endif
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
>>> +       bool "gstreamer plugin"
>>> +       # gstreamer 1.x and gst-plugins-base-app are required
>>> +       # for gstreamer support in qt6-multimedia
>>> +       select BR2_PACKAGE_GSTREAMER1
>>> +       select BR2_PACKAGE_GST1_PLUGINS_BASE
>>> +       select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
>>> +       help
>>> +         This option enables gstreamer media backend
>>> +
>>> +if BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
>>> +
>>> +comment "GStreamer OpenGL support needs an OpenGL-capable backend"
>>> +       depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_OPENGL
>>> +       bool "opengl support"
>>> +       depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
>>> +       select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
>>> +       help
>>> +         This option enables gstreamer-opengl support
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_PHOTOGRAPHY
>>> +       bool "photography support"
>>> +       select BR2_PACKAGE_GST1_PLUGINS_BAD
>>> +       help
>>> +         This option enables gstreamer-photography support
>>> +
>>> +endif
>>> +
>>> +comment "Linux DMA buffer support needs DMA buffer feature of libgbm"
>>> +       depends on !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
>>> +       bool "linux dma buffer support"
>>> +       depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
>>>
>> +       # qt6 configure script needs EGL to check
>>> +       # for linux dma buffer support
>>> +       depends on BR2_PACKAGE_HAS_LIBEGL
>>> +       help
>>> +         This option enables the linux dma buffer support
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L
>>> +       bool "v4l support"
>>> +       help
>>> +         This option enables the video for linux support
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
>>>
>> +       bool "pulseaudio support"
>>> +       select BR2_PACKAGE_PULSEAUDIO
>>> +       help
>>> +         This option select PulseAudio as audio backend.
>>> +
>>> +config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
>>> +       bool "spatial audio module"
>>> +       help
>>> +         This option enables the Qt6SpatialAudio library.
>>> +
>>> +endif
>>> diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash
>>> b/package/qt6/qt6multimedia/qt6multimedia.hash
>>> new file mode 100644
>>> index 0000000000..b63aedc1d9
>>> --- /dev/null
>>> +++ b/package/qt6/qt6multimedia/qt6multimedia.hash
>>> @@ -0,0 +1,26 @@
>>> +# Hash from:
>>> https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmult=
imedia-everywhere-src-6.7.2.tar.xz.sha256
>>> +sha256
>>> <https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmul=
timedia-everywhere-src-6.7.2.tar.xz.sha256+sha256>
>>> 8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a7765651d3
>>> qtmultimedia-everywhere-src-6.7.2.tar.xz
>>> +
>>> +# Hashes for license files
>>> +sha256
>>> f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df
>>> LICENSES/BSD-2-Clause.txt
>>> +sha256
>>> 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
>>> LICENSES/BSD-3-Clause.txt
>>> +sha256
>>> 1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b1c0
>>> LICENSES/BSD-Source-Code.txt
>>> +sha256
>>> 84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f
>>> LICENSES/BSL-1.0.txt
>>> +sha256
>>> 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
>>> LICENSES/GFDL-1.3-no-invariants-only.txt
>>> +sha256
>>> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
>>> LICENSES/GPL-2.0-only.txt
>>> +sha256
>>> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
>>> LICENSES/GPL-3.0-only.txt
>>> +sha256
>>> 7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc62511a
>>> LICENSES/IJG.txt
>>> +sha256
>>> f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9
>>> LICENSES/ISC.txt
>>> +sha256
>>> fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb
>>> LICENSES/LGPL-2.1-or-later.txt
>>> +sha256
>>> da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
>>> LICENSES/LGPL-3.0-only.txt
>>> +sha256
>>> b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0
>>> LICENSES/MIT.txt
>>> +sha256
>>> 66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172
>>> LICENSES/MPL-2.0.txt
>>> +sha256
>>> 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
>>> LICENSES/Qt-GPL-exception-1.0.txt
>>> +sha256
>>> bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d
>>> LICENSES/Zlib.txt
>>> +sha256
>>> 85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e51e
>>> src/3rdparty/eigen/COPYING.BSD
>>> +sha256
>>> fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85
>>> src/3rdparty/eigen/COPYING.MPL2
>>> +sha256
>>> 8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4
>>> src/3rdparty/eigen/COPYRIGHTS
>>> +sha256
>>> b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289934
>>> src/3rdparty/pffft/COPYRIGHTS
>>> +sha256
>>> a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88
>>> src/3rdparty/pffft/LICENSE
>>> +sha256
>>> 2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f7ac
>>> src/3rdparty/resonance-audio/COPYRIGHTS
>>> +sha256
>>> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30
>>> src/3rdparty/resonance-audio/LICENSE
>>> diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk
>>> b/package/qt6/qt6multimedia/qt6multimedia.mk
>>> new file mode 100644
>>> index 0000000000..ec81abc1de
>>> --- /dev/null
>>> +++ b/package/qt6/qt6multimedia/qt6multimedia.mk
>>> @@ -0,0 +1,137 @@
>>>
>>> +######################################################################=
##########
>>> +#
>>> +# qt6multimedia
>>> +#
>>>
>>> +######################################################################=
##########
>>> +
>>> +QT6MULTIMEDIA_VERSION =3D $(QT6_VERSION)
>>> +QT6MULTIMEDIA_SITE =3D $(QT6_SITE)
>>> +QT6MULTIMEDIA_SOURCE =3D
>>> qtmultimedia-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6MULTIMEDIA_VERSION).tar.=
xz
>>> +QT6MULTIMEDIA_INSTALL_STAGING =3D YES
>>> +QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD =3D NO
>>> +QT6MULTIMEDIA_CMAKE_BACKEND =3D ninja
>>> +
>>> +QT6MULTIMEDIA_LICENSE =3D \
>>> +    BSD-3-Clause (buildsystem, examples, pfft,  snippets), \
>>> +    GFDL-1.3-no-invariants (docs), \
>>> +    GPL-3.0 (tests), \
>>> +    GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
>>> +    LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
>>> +
>>> +QT6MULTIMEDIA_LICENSE_FILES =3D \
>>> +    LICENSES/BSD-3-Clause.txt \
>>> +    LICENSES/GFDL-1.3-no-invariants-only.txt \
>>> +    LICENSES/GPL-2.0-only.txt \
>>> +    LICENSES/GPL-3.0-only.txt \
>>> +    LICENSES/LGPL-3.0-only.txt \
>>> +    LICENSES/Qt-GPL-exception-1.0.txt \
>>> +
>>> +QT6MULTIMEDIA_DEPENDENCIES =3D \
>>> +    qt6base \
>>> +    qt6shadertools
>>> +
>>> +QT6MULTIMEDIA_CONF_OPTS =3D \
>>> +    -DQT_HOST_PATH=3D$(HOST_DIR) \
>>> +    -DQT_BUILD_EXAMPLES=3DOFF \
>>> +    -DQT_BUILD_TESTS=3DOFF \
>>>
>> +    -DFEATURE_alsa=3DOFF \
>>>
>>
>> I think is better to gather all code related to one option in one place.
>> So this should be moved down into the ifeq-statement for alsa.
>> The same goes for the other options.
>>
>> +    -DFEATURE_ffmpeg=3DOFF \
>>> +    -DFEATURE_gstreamer=3DOFF \
>>> +    -DFEATURE_gstreamer_1_0=3DOFF \
>>> +    -DFEATURE_gstreamer_app=3DOFF \
>>> +    -DFEATURE_gstreamer_gl=3DOFF \
>>> +    -DFEATURE_gstreamer_photography=3DOFF \
>>> +    -DFEATURE_linux_dmabuf=3DOFF \
>>> +    -DFEATURE_linux_v4l=3DOFF \
>>> +    -DFEATURE_pulseaudio=3DOFF \
>>> +    -DFEATURE_spatialaudio=3DOFF \
>>> +    -DFEATURE_spatialaudio_quick3d=3DOFF \
>>> +    -DFEATURE_vaapi=3DOFF
>>> +
>>> +# for multimedia quick module
>>> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D qt6declarative
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_ALSA),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_alsa=3DON
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D alsa-lib
>>>
>>
>> Gather all code related to the alsa option here:
>>
>> else
>> QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_alsa=3DOFF
>>
>>
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_ffmpeg=3DON
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D ffmpeg
>>> +QT6MULTIMEDIA_LICENSE +=3D , \
>>> +    BSL-1.0 (ffmpeg-boost), \
>>> +    IJG (ffmpeg-libjpeg), \
>>> +    LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code an=
d
>>> ISC and MIT and MPL-2.0 (ffmpeg), \
>>> +    Zlib (ffmpeg-zlib)
>>> +QT6MULTIMEDIA_LICENSE_FILES +=3D \
>>> +    LICENSES/BSD-2-Clause.txt \
>>> +    LICENSES/BSD-Source-Code.txt \
>>> +    LICENSES/BSL-1.0.txt \
>>> +    LICENSES/IJG.txt \
>>> +    LICENSES/ISC.txt \
>>> +    LICENSES/LGPL-2.1-or-later.txt \
>>> +    LICENSES/MIT.txt \
>>> +    LICENSES/MPL-2.0.txt \
>>> +    LICENSES/Zlib.txt
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D \
>>> +    -DFEATURE_gstreamer=3DON \
>>> +    -DFEATURE_gstreamer_1_0=3DON \
>>> +    -DFEATURE_gstreamer_app=3DON
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D gstreamer1 gst1-plugins-base
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GST_PLUGINS_PHOTOGRAPHY),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_gstreamer_photography=3DON
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D gst1-plugins-bad
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_linux_dmabuf=3DON
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D libgbm libegl
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_linux_v4l=3DON
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D linux
>>>
>>
>> I was probably wrong here in my last comment, I don't think the
>> dependency on linux is necessary... I have no experience with dependenci=
es
>> on kernel config, so you should ask Thomas or someone else about how
>> dependencies on linux config options are handled. Maybe this is relevant=
?:
>>
>> https://www.marcusfolkesson.se/til/buildroot-libfoo-linux-config-fixup/
>>
>>
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_pulseaudio=3DON
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D pulseaudio
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_spatialaudio=3DON
>>> +QT6MULTIMEDIA_LICENSE +=3D , \
>>> +    Apache-2.0 (resonance-audio, eigen), \
>>> +    LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio,
>>> spatialaudioquick3d), \
>>> +    MPL-2.0 and BSD-3-Clause (eigen)
>>> +QT6MULTIMEDIA_LICENSE_FILES +=3D \
>>> +    LICENSES/MPL-2.0.txt \
>>> +    src/3rdparty/eigen/COPYING.BSD \
>>> +    src/3rdparty/eigen/COPYING.MPL2 \
>>> +    src/3rdparty/eigen/COPYRIGHTS \
>>> +    src/3rdparty/pffft/COPYRIGHTS \
>>> +    src/3rdparty/pffft/LICENSE \
>>> +    src/3rdparty/resonance-audio/COPYRIGHTS \
>>> +    src/3rdparty/resonance-audio/LICENSE
>>> +
>>> +# for spatialaudio quick3d module
>>> +ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D qt6quick3d
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_spatialaudio_quick3d=3DON
>>> +endif
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_VAAPI),y)
>>> +QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_vaapi=3DON
>>> +QT6MULTIMEDIA_DEPENDENCIES +=3D libva
>>> +endif
>>> +
>>> +$(eval $(cmake-package))
>>> --
>>> 2.34.1
>>>
>>>

--00000000000036ef2b0622e38fa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi baxiche,</div><div><br></div><div>I also found som=
e formatting errors:<br></div><div><br></div><div>[roy@precision7530-arch-r=
oy buildroot]$ ./utils/docker-run make check-package <br>package/qt6/qt6mul=
timedia/Config.in:8: help text: &lt;tab&gt;&lt;2 spaces&gt;&lt;62 chars&gt;=
 (<a href=3D"https://nightly.buildroot.org/#writing-rules-config-in">https:=
//nightly.buildroot.org/#writing-rules-config-in</a>)<br>package/qt6/qt6mul=
timedia/Config.in:8: line contains trailing whitespace<br>package/qt6/qt6mu=
ltimedia/Config.in:9: help text: &lt;tab&gt;&lt;2 spaces&gt;&lt;62 chars&gt=
; (<a href=3D"https://nightly.buildroot.org/#writing-rules-config-in">https=
://nightly.buildroot.org/#writing-rules-config-in</a>)<br>package/qt6/qt6mu=
ltimedia/Config.in:9: line contains trailing whitespace<br>package/qt6/qt6m=
ultimedia/Config.in:10: help text: &lt;tab&gt;&lt;2 spaces&gt;&lt;62 chars&=
gt; (<a href=3D"https://nightly.buildroot.org/#writing-rules-config-in">htt=
ps://nightly.buildroot.org/#writing-rules-config-in</a>)<br>package/qt6/qt6=
multimedia/Config.in:10: line contains trailing whitespace<br>package/qt6/q=
t6multimedia/Config.in:11: help text: &lt;tab&gt;&lt;2 spaces&gt;&lt;62 cha=
rs&gt; (<a href=3D"https://nightly.buildroot.org/#writing-rules-config-in">=
https://nightly.buildroot.org/#writing-rules-config-in</a>)<br>package/qt6/=
qt6multimedia/Config.in:11: line contains trailing whitespace<br>package/qt=
6/qt6multimedia/Config.in:12: help text: &lt;tab&gt;&lt;2 spaces&gt;&lt;62 =
chars&gt; (<a href=3D"https://nightly.buildroot.org/#writing-rules-config-i=
n">https://nightly.buildroot.org/#writing-rules-config-in</a>)<br>package/q=
t6/qt6multimedia/Config.in:12: line contains trailing whitespace<br>package=
/qt6/qt6multimedia/Config.in:13: help text: &lt;tab&gt;&lt;2 spaces&gt;&lt;=
62 chars&gt; (<a href=3D"https://nightly.buildroot.org/#writing-rules-confi=
g-in">https://nightly.buildroot.org/#writing-rules-config-in</a>)<br>packag=
e/qt6/qt6multimedia/Config.in:13: line contains trailing whitespace<br>pack=
age/qt6/qt6multimedia/Config.in:14: help text: &lt;tab&gt;&lt;2 spaces&gt;&=
lt;62 chars&gt; (<a href=3D"https://nightly.buildroot.org/#writing-rules-co=
nfig-in">https://nightly.buildroot.org/#writing-rules-config-in</a>)<br>pac=
kage/qt6/qt6multimedia/Config.in:25: line contains trailing whitespace<br>p=
ackage/qt6/qt6multimedia/Config.in:29: line contains trailing whitespace<br=
>package/qt6/qt6multimedia/Config.in:34: line contains trailing whitespace<=
br>package/qt6/qt6multimedia/Config.in:41: line contains trailing whitespac=
e<br>package/qt6/qt6multimedia/Config.in:55: line contains trailing whitesp=
ace<br>package/qt6/qt6multimedia/Config.in:61: line contains trailing white=
space<br>package/qt6/qt6multimedia/Config.in:66: line contains trailing whi=
tespace<br>package/qt6/qt6multimedia/Config.in:95: line contains trailing w=
hitespace<br>package/qt6/qt6multimedia/Config.in:98: line contains trailing=
 whitespace<br>package/qt6/qt6multimedia/Config.in:103: line contains trail=
ing whitespace<br>package/qt6/qt6multimedia/Config.in:109: line contains tr=
ailing whitespace<br>package/qt6/qt6multimedia/Config.in:114: line contains=
 trailing whitespace<br>package/qt6/qt6multimedia/<a href=3D"http://qt6mult=
imedia.mk:15">qt6multimedia.mk:15</a>: expected indent with tabs<br>package=
/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:16">qt6multimedia.mk:=
16</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"h=
ttp://qt6multimedia.mk:17">qt6multimedia.mk:17</a>: expected indent with ta=
bs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:18">qt6m=
ultimedia.mk:18</a>: expected indent with tabs<br>package/qt6/qt6multimedia=
/<a href=3D"http://qt6multimedia.mk:19">qt6multimedia.mk:19</a>: expected i=
ndent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedi=
a.mk:22">qt6multimedia.mk:22</a>: expected indent with tabs<br>package/qt6/=
qt6multimedia/<a href=3D"http://qt6multimedia.mk:23">qt6multimedia.mk:23</a=
>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http:/=
/qt6multimedia.mk:24">qt6multimedia.mk:24</a>: expected indent with tabs<br=
>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:25">qt6multim=
edia.mk:25</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a h=
ref=3D"http://qt6multimedia.mk:26">qt6multimedia.mk:26</a>: expected indent=
 with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:=
27">qt6multimedia.mk:27</a>: expected indent with tabs<br>package/qt6/qt6mu=
ltimedia/<a href=3D"http://qt6multimedia.mk:27">qt6multimedia.mk:27</a>: re=
move trailing backslash<br>package/qt6/qt6multimedia/<a href=3D"http://qt6m=
ultimedia.mk:30">qt6multimedia.mk:30</a>: expected indent with tabs<br>pack=
age/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:31">qt6multimedia.=
mk:31</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=
=3D"http://qt6multimedia.mk:34">qt6multimedia.mk:34</a>: expected indent wi=
th tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:35"=
>qt6multimedia.mk:35</a>: expected indent with tabs<br>package/qt6/qt6multi=
media/<a href=3D"http://qt6multimedia.mk:36">qt6multimedia.mk:36</a>: expec=
ted indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6mult=
imedia.mk:37">qt6multimedia.mk:37</a>: expected indent with tabs<br>package=
/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:38">qt6multimedia.mk:=
38</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"h=
ttp://qt6multimedia.mk:39">qt6multimedia.mk:39</a>: expected indent with ta=
bs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:40">qt6m=
ultimedia.mk:40</a>: expected indent with tabs<br>package/qt6/qt6multimedia=
/<a href=3D"http://qt6multimedia.mk:41">qt6multimedia.mk:41</a>: expected i=
ndent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedi=
a.mk:42">qt6multimedia.mk:42</a>: expected indent with tabs<br>package/qt6/=
qt6multimedia/<a href=3D"http://qt6multimedia.mk:43">qt6multimedia.mk:43</a=
>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http:/=
/qt6multimedia.mk:44">qt6multimedia.mk:44</a>: expected indent with tabs<br=
>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:45">qt6multim=
edia.mk:45</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a h=
ref=3D"http://qt6multimedia.mk:46">qt6multimedia.mk:46</a>: expected indent=
 with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:=
47">qt6multimedia.mk:47</a>: expected indent with tabs<br>package/qt6/qt6mu=
ltimedia/<a href=3D"http://qt6multimedia.mk:48">qt6multimedia.mk:48</a>: ex=
pected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6m=
ultimedia.mk:49">qt6multimedia.mk:49</a>: expected indent with tabs<br>pack=
age/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:65">qt6multimedia.=
mk:65</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=
=3D"http://qt6multimedia.mk:66">qt6multimedia.mk:66</a>: expected indent wi=
th tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:67"=
>qt6multimedia.mk:67</a>: expected indent with tabs<br>package/qt6/qt6multi=
media/<a href=3D"http://qt6multimedia.mk:68">qt6multimedia.mk:68</a>: expec=
ted indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6mult=
imedia.mk:70">qt6multimedia.mk:70</a>: expected indent with tabs<br>package=
/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:71">qt6multimedia.mk:=
71</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"h=
ttp://qt6multimedia.mk:72">qt6multimedia.mk:72</a>: expected indent with ta=
bs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:73">qt6m=
ultimedia.mk:73</a>: expected indent with tabs<br>package/qt6/qt6multimedia=
/<a href=3D"http://qt6multimedia.mk:74">qt6multimedia.mk:74</a>: expected i=
ndent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedi=
a.mk:75">qt6multimedia.mk:75</a>: expected indent with tabs<br>package/qt6/=
qt6multimedia/<a href=3D"http://qt6multimedia.mk:76">qt6multimedia.mk:76</a=
>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http:/=
/qt6multimedia.mk:77">qt6multimedia.mk:77</a>: expected indent with tabs<br=
>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:78">qt6multim=
edia.mk:78</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a h=
ref=3D"http://qt6multimedia.mk:83">qt6multimedia.mk:83</a>: expected indent=
 with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:=
84">qt6multimedia.mk:84</a>: expected indent with tabs<br>package/qt6/qt6mu=
ltimedia/<a href=3D"http://qt6multimedia.mk:85">qt6multimedia.mk:85</a>: ex=
pected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6m=
ultimedia.mk:85">qt6multimedia.mk:85</a>: line contains trailing whitespace=
<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:112">qt6mu=
ltimedia.mk:112</a>: expected indent with tabs<br>package/qt6/qt6multimedia=
/<a href=3D"http://qt6multimedia.mk:113">qt6multimedia.mk:113</a>: expected=
 indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multime=
dia.mk:114">qt6multimedia.mk:114</a>: expected indent with tabs<br>package/=
qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:116">qt6multimedia.mk:=
116</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"=
http://qt6multimedia.mk:117">qt6multimedia.mk:117</a>: expected indent with=
 tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:118">=
qt6multimedia.mk:118</a>: expected indent with tabs<br>package/qt6/qt6multi=
media/<a href=3D"http://qt6multimedia.mk:119">qt6multimedia.mk:119</a>: exp=
ected indent with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6mu=
ltimedia.mk:120">qt6multimedia.mk:120</a>: expected indent with tabs<br>pac=
kage/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:121">qt6multimedi=
a.mk:121</a>: expected indent with tabs<br>package/qt6/qt6multimedia/<a hre=
f=3D"http://qt6multimedia.mk:122">qt6multimedia.mk:122</a>: expected indent=
 with tabs<br>package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk:=
123">qt6multimedia.mk:123</a>: expected indent with tabs<br><br>426759 line=
s processed<br>83 warnings generated<br>make: *** [Makefile:1263: check-pac=
kage] Error 1<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">tir. 24. sep. 2024 kl. 22:34 skrev Roy Kollen Svends=
en &lt;<a href=3D"mailto:roykollensvendsen@gmail.com">roykollensvendsen@gma=
il.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi baxiche,</div><div><br></div><div=
>I did some testing.<br></div><div><br></div><div>The buildfailed when i tr=
ied to enable everything except for alsa:</div><div><br></div><div>&gt;&gt;=
&gt; qt6multimedia 6.7.2 Configuring<br>(mkdir -p /home/roy/hymatek/connexi=
-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2//buildroot-bui=
ld &amp;&amp; cd /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/outpu=
t/build/qt6multimedia-6.7.2//buildroot-build &amp;&amp; rm -f CMakeCache.tx=
t &amp;&amp; PATH=3D&quot;/home/roy/hymatek/connexi-touchpanel-firmware/ex7=
xxm/output/host/bin:/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/ou=
tput/host/sbin:/home/roy/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin=
:/home/roy/.local/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin:/u=
sr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/cor=
e_perl:/opt/depot_tools:/home/roy/.gem/ruby/3.0.0/bin:/home/roy/.local/bin&=
quot; =C2=A0/usr/bin/cmake /home/roy/hymatek/connexi-touchpanel-firmware/ex=
7xxm/output/build/qt6multimedia-6.7.2/ -G&quot;Ninja&quot; -DCMAKE_MAKE_PRO=
GRAM=3D&quot;/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/ho=
st/bin/ninja&quot; -DCMAKE_TOOLCHAIN_FILE=3D&quot;/home/roy/hymatek/connexi=
-touchpanel-firmware/ex7xxm/output/host/share/buildroot/toolchainfile.cmake=
&quot; -DCMAKE_INSTALL_PREFIX=3D&quot;/usr&quot; -DCMAKE_INSTALL_RUNSTATEDI=
R=3D&quot;/run&quot; -DCMAKE_COLOR_MAKEFILE=3DOFF -DBUILD_DOC=3DOFF -DBUILD=
_DOCS=3DOFF -DBUILD_EXAMPLE=3DOFF -DBUILD_EXAMPLES=3DOFF -DBUILD_TEST=3DOFF=
 -DBUILD_TESTS=3DOFF -DBUILD_TESTING=3DOFF -DBUILD_SHARED_LIBS=3DON =C2=A0-=
DQT_HOST_PATH=3D/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output=
/host -DQT_BUILD_EXAMPLES=3DOFF -DQT_BUILD_TESTS=3DOFF -DFEATURE_alsa=3DOFF=
 -DFEATURE_ffmpeg=3DOFF -DFEATURE_gstreamer=3DOFF -DFEATURE_gstreamer_1_0=
=3DOFF -DFEATURE_gstreamer_app=3DOFF -DFEATURE_gstreamer_gl=3DOFF -DFEATURE=
_gstreamer_photography=3DOFF -DFEATURE_linux_dmabuf=3DOFF -DFEATURE_linux_v=
4l=3DOFF -DFEATURE_pulseaudio=3DOFF -DFEATURE_spatialaudio=3DOFF -DFEATURE_=
spatialaudio_quick3d=3DOFF -DFEATURE_vaapi=3DOFF -DFEATURE_ffmpeg=3DON -DFE=
ATURE_gstreamer=3DON -DFEATURE_gstreamer_1_0=3DON -DFEATURE_gstreamer_app=
=3DON =C2=A0-DFEATURE_linux_dmabuf=3DON -DFEATURE_linux_v4l=3DON -DFEATURE_=
pulseaudio=3DON -DFEATURE_spatialaudio=3DON -DFEATURE_vaapi=3DON )<br>-- Th=
e CXX compiler identification is GNU 13.3.0<br>-- The C compiler identifica=
tion is GNU 13.3.0<br>-- Detecting CXX compiler ABI info<br>-- Detecting CX=
X compiler ABI info - done<br>-- Check for working CXX compiler: /home/roy/=
hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/bin/aarch64-buildroo=
t-linux-gnu-g++ - skipped<br>-- Detecting CXX compile features<br>-- Detect=
ing CXX compile features - done<br>-- Detecting C compiler ABI info<br>-- D=
etecting C compiler ABI info - done<br>-- Check for working C compiler: /ho=
me/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/bin/aarch64-b=
uildroot-linux-gnu-gcc - skipped<br>-- Detecting C compile features<br>-- D=
etecting C compile features - done<br>-- Performing Test CMAKE_HAVE_LIBC_PT=
HREAD<br>-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success<br>-- Found T=
hreads: TRUE<br>-- Performing Test HAVE_STDATOMIC<br>-- Performing Test HAV=
E_STDATOMIC - Success<br>-- Found WrapAtomic: TRUE<br>-- Performing Test HA=
VE_EGL<br>-- Performing Test HAVE_EGL - Success<br>-- Found EGL: /home/roy/=
hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-li=
nux-gnu/sysroot/usr/include (found version &quot;1.5&quot;)<br>-- Performin=
g Test HAVE_GLESv2<br>-- Performing Test HAVE_GLESv2 - Success<br>CMake War=
ning at src/plugins/multimedia/ffmpeg/cmake/QtAddFFmpegStubs.cmake:38 (mess=
age):<br>=C2=A0 QT_FEATURE_vaapi is ON but FFmpeg includes VAAPI and dynami=
c symbols<br>=C2=A0 resolve is enabled.<br>Call Stack (most recent call fir=
st):<br>=C2=A0 src/plugins/multimedia/ffmpeg/cmake/QtAddFFmpegStubs.cmake:1=
82 (qt_internal_multimedia_check_ffmpeg_stubs_configuration)<br>=C2=A0 src/=
plugins/multimedia/ffmpeg/CMakeLists.txt:95 (qt_internal_multimedia_add_ffm=
peg_stubs)<br><br><br><br>-- Configuration summary shown below. It has also=
 been written to /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/outpu=
t/build/qt6multimedia-6.7.2/buildroot-build/config.summary<br>-- Configure =
with --log-level=3DSTATUS or higher to increase CMake&#39;s message verbosi=
ty. The log level does not persist across reconfigurations.<br>=C2=A0<br>--=
 Configure summary:<br><br>Qt Multimedia:<br>=C2=A0 Spatial Audio .........=
................. yes<br>=C2=A0 Spatial Audio (Quick3D) ................ no=
<br>=C2=A0 Low level Audio Backend:<br>=C2=A0 =C2=A0 ALSA (experimental) ..=
................ no<br>=C2=A0 =C2=A0 PulseAudio ...........................=
 yes<br>=C2=A0 =C2=A0 MMRenderer ........................... no<br>=C2=A0 =
=C2=A0 CoreAudio ............................ no<br>=C2=A0 =C2=A0 Windows M=
edia SDK .................... no<br>=C2=A0 =C2=A0 Open SLES (Android) .....=
............. no<br>=C2=A0 =C2=A0 Web Assembly ......................... no=
<br>=C2=A0 Plugin:<br>=C2=A0 =C2=A0 GStreamer 1.0 ........................ =
yes<br>=C2=A0 =C2=A0 FFmpeg ............................... yes<br>=C2=A0 =
=C2=A0 MMRenderer ........................... no<br>=C2=A0 =C2=A0 AVFoundat=
ion ......................... no<br>=C2=A0 =C2=A0 Windows Media Foundation =
............. no<br>=C2=A0 Hardware acceleration and features:<br>=C2=A0 =
=C2=A0 Video for Linux ...................... yes<br>=C2=A0 =C2=A0 VAAPI su=
pport ........................ yes<br>=C2=A0 =C2=A0 Linux DMA buffer suppor=
t ............. yes<br>=C2=A0 =C2=A0 VideoToolbox .........................=
 no<br>=C2=A0<br><br>-- Configuring done (3.7s)<br>-- Generating done (0.2s=
)<br>CMake Warning:<br>=C2=A0 Manually-specified variables were not used by=
 the project:<br><br>=C2=A0 =C2=A0 BUILD_DOC<br>=C2=A0 =C2=A0 BUILD_DOCS<br=
>=C2=A0 =C2=A0 BUILD_EXAMPLE<br>=C2=A0 =C2=A0 BUILD_EXAMPLES<br>=C2=A0 =C2=
=A0 BUILD_TEST<br>=C2=A0 =C2=A0 BUILD_TESTS<br>=C2=A0 =C2=A0 CMAKE_COLOR_MA=
KEFILE<br><br><br>-- Build files have been written to: /home/roy/hymatek/co=
nnexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/buildroot=
-build<br>&gt;&gt;&gt; qt6multimedia 6.7.2 Building<br>GIT_DIR=3D. PATH=3D&=
quot;/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/bin:/=
home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/sbin:/home/=
roy/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/home/roy/.local/sha=
re/flatpak/exports/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bi=
n:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/depot_too=
ls:/home/roy/.gem/ruby/3.0.0/bin:/home/roy/.local/bin&quot; =C2=A0/usr/bin/=
cmake --build /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/b=
uild/qt6multimedia-6.7.2//buildroot-build -j13 <br>[77/204] Building CXX ob=
ject src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosource.=
cpp.o<br>FAILED: src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulse=
audiosource.cpp.o <br>/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/=
output/host/bin/aarch64-buildroot-linux-gnu-g++ --sysroot=3D/home/roy/hymat=
ek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-linux-g=
nu/sysroot -DMultimedia_EXPORTS -DQT_ASCII_CAST_WARNINGS -DQT_BUILDING_QT -=
DQT_BUILD_MULTIMEDIA_LIB -DQT_CORE_LIB -DQT_DEPRECATED_WARNINGS -DQT_DISABL=
E_DEPRECATED_UP_TO=3D0x050000 -DQT_EXPLICIT_QFILE_CONSTRUCTION_FROM_PATH -D=
QT_GUI_LIB -DQT_MOC_COMPAT -DQT_NETWORK_LIB -DQT_NO_AS_CONST -DQT_NO_AS_CON=
ST=3D1 -DQT_NO_CAST_TO_ASCII -DQT_NO_CONTEXTLESS_CONNECT=3D1 -DQT_NO_DEBUG =
-DQT_NO_EXCEPTIONS -DQT_NO_FOREACH -DQT_NO_FOREACH=3D1 -DQT_NO_JAVA_STYLE_I=
TERATORS -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_NO_QEXCHANGE -DQT_US=
E_QSTRINGBUILDER -DQT_WARN_DEPRECATED_UP_TO=3D0x070000 -D_LARGEFILE64_SOURC=
E -D_LARGEFILE_SOURCE -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xx=
m/output/build/qt6multimedia-6.7.2/buildroot-build/src/multimedia/Multimedi=
a_autogen/include -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/ou=
tput/build/qt6multimedia-6.7.2/buildroot-build/include -I/home/roy/hymatek/=
connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/buildro=
ot-build/include/QtMultimedia -I/home/roy/hymatek/connexi-touchpanel-firmwa=
re/ex7xxm/output/build/qt6multimedia-6.7.2/src/multimedia -I/home/roy/hymat=
ek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/buil=
droot-build/src/multimedia -I/home/roy/hymatek/connexi-touchpanel-firmware/=
ex7xxm/output/build/qt6multimedia-6.7.2/src/multimedia/audio -I/home/roy/hy=
matek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/s=
rc/multimedia/camera -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm=
/output/build/qt6multimedia-6.7.2/src/multimedia/controls -I/home/roy/hymat=
ek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/src/=
multimedia/platform -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/=
output/build/qt6multimedia-6.7.2/src/multimedia/playback -I/home/roy/hymate=
k/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/src/m=
ultimedia/recording -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/=
output/build/qt6multimedia-6.7.2/src/multimedia/video -I/home/roy/hymatek/c=
onnexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/buildroo=
t-build/include/QtMultimedia/6.7.2 -I/home/roy/hymatek/connexi-touchpanel-f=
irmware/ex7xxm/output/build/qt6multimedia-6.7.2/buildroot-build/include/QtM=
ultimedia/6.7.2/QtMultimedia -I/home/roy/hymatek/connexi-touchpanel-firmwar=
e/ex7xxm/output/build/qt6multimedia-6.7.2/src/multimedia/pulseaudio -isyste=
m /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-=
buildroot-linux-gnu/sysroot/usr/include/QtCore -isystem /home/roy/hymatek/c=
onnexi-touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-linux-gnu/s=
ysroot/usr/mkspecs/linux-g++ -isystem /home/roy/hymatek/connexi-touchpanel-=
firmware/ex7xxm/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include=
/QtGui -isystem /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output=
/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/QtNetwork -isystem /h=
ome/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-buil=
droot-linux-gnu/sysroot/usr/include/QtCore/6.7.2 -isystem /home/roy/hymatek=
/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-linux-gnu=
/sysroot/usr/include/QtCore/6.7.2/QtCore -isystem /home/roy/hymatek/connexi=
-touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-linux-gnu/sysroot=
/usr/include/QtGui/6.7.2 -isystem /home/roy/hymatek/connexi-touchpanel-firm=
ware/ex7xxm/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/QtG=
ui/6.7.2/QtGui -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BIT=
S=3D64 -O2 -g0 -D_FORTIFY_SOURCE=3D1 -DNDEBUG -O2 -std=3Dc++17 -fPIC -fvisi=
bility=3Dhidden -fvisibility-inlines-hidden -Wall -Wextra -fno-exceptions -=
Wsuggest-override -MD -MT src/multimedia/CMakeFiles/Multimedia.dir/pulseaud=
io/qpulseaudiosource.cpp.o -MF src/multimedia/CMakeFiles/Multimedia.dir/pul=
seaudio/qpulseaudiosource.cpp.o.d -o src/multimedia/CMakeFiles/Multimedia.d=
ir/pulseaudio/qpulseaudiosource.cpp.o -c /home/roy/hymatek/connexi-touchpan=
el-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/src/multimedia/pulseaud=
io/qpulseaudiosource.cpp<br>/home/roy/hymatek/connexi-touchpanel-firmware/e=
x7xxm/output/build/qt6multimedia-6.7.2/src/multimedia/pulseaudio/qpulseaudi=
osource.cpp:566:10: fatal error: moc_qpulseaudiosource_p.cpp: Ingen slik fi=
l eller filkatalog<br>=C2=A0 566 | #include &quot;moc_qpulseaudiosource_p.c=
pp&quot;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~<br>compilation terminated.<br>[78/204] Building CXX=
 object src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpulseaudiosink=
.cpp.o<br>FAILED: src/multimedia/CMakeFiles/Multimedia.dir/pulseaudio/qpuls=
eaudiosink.cpp.o <br>/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/o=
utput/host/bin/aarch64-buildroot-linux-gnu-g++ --sysroot=3D/home/roy/hymate=
k/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-linux-gn=
u/sysroot -DMultimedia_EXPORTS -DQT_ASCII_CAST_WARNINGS -DQT_BUILDING_QT -D=
QT_BUILD_MULTIMEDIA_LIB -DQT_CORE_LIB -DQT_DEPRECATED_WARNINGS -DQT_DISABLE=
_DEPRECATED_UP_TO=3D0x050000 -DQT_EXPLICIT_QFILE_CONSTRUCTION_FROM_PATH -DQ=
T_GUI_LIB -DQT_MOC_COMPAT -DQT_NETWORK_LIB -DQT_NO_AS_CONST -DQT_NO_AS_CONS=
T=3D1 -DQT_NO_CAST_TO_ASCII -DQT_NO_CONTEXTLESS_CONNECT=3D1 -DQT_NO_DEBUG -=
DQT_NO_EXCEPTIONS -DQT_NO_FOREACH -DQT_NO_FOREACH=3D1 -DQT_NO_JAVA_STYLE_IT=
ERATORS -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_NO_QEXCHANGE -DQT_USE=
_QSTRINGBUILDER -DQT_WARN_DEPRECATED_UP_TO=3D0x070000 -D_LARGEFILE64_SOURCE=
 -D_LARGEFILE_SOURCE -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm=
/output/build/qt6multimedia-6.7.2/buildroot-build/src/multimedia/Multimedia=
_autogen/include -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/out=
put/build/qt6multimedia-6.7.2/buildroot-build/include -I/home/roy/hymatek/c=
onnexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/buildroo=
t-build/include/QtMultimedia -I/home/roy/hymatek/connexi-touchpanel-firmwar=
e/ex7xxm/output/build/qt6multimedia-6.7.2/src/multimedia -I/home/roy/hymate=
k/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/build=
root-build/src/multimedia -I/home/roy/hymatek/connexi-touchpanel-firmware/e=
x7xxm/output/build/qt6multimedia-6.7.2/src/multimedia/audio -I/home/roy/hym=
atek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/sr=
c/multimedia/camera -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/=
output/build/qt6multimedia-6.7.2/src/multimedia/controls -I/home/roy/hymate=
k/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/src/m=
ultimedia/platform -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/o=
utput/build/qt6multimedia-6.7.2/src/multimedia/playback -I/home/roy/hymatek=
/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/src/mu=
ltimedia/recording -I/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/o=
utput/build/qt6multimedia-6.7.2/src/multimedia/video -I/home/roy/hymatek/co=
nnexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7.2/buildroot=
-build/include/QtMultimedia/6.7.2 -I/home/roy/hymatek/connexi-touchpanel-fi=
rmware/ex7xxm/output/build/qt6multimedia-6.7.2/buildroot-build/include/QtMu=
ltimedia/6.7.2/QtMultimedia -I/home/roy/hymatek/connexi-touchpanel-firmware=
/ex7xxm/output/build/qt6multimedia-6.7.2/src/multimedia/pulseaudio -isystem=
 /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-b=
uildroot-linux-gnu/sysroot/usr/include/QtCore -isystem /home/roy/hymatek/co=
nnexi-touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-linux-gnu/sy=
sroot/usr/mkspecs/linux-g++ -isystem /home/roy/hymatek/connexi-touchpanel-f=
irmware/ex7xxm/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/=
QtGui -isystem /home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/=
host/aarch64-buildroot-linux-gnu/sysroot/usr/include/QtNetwork -isystem /ho=
me/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-build=
root-linux-gnu/sysroot/usr/include/QtCore/6.7.2 -isystem /home/roy/hymatek/=
connexi-touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-linux-gnu/=
sysroot/usr/include/QtCore/6.7.2/QtCore -isystem /home/roy/hymatek/connexi-=
touchpanel-firmware/ex7xxm/output/host/aarch64-buildroot-linux-gnu/sysroot/=
usr/include/QtGui/6.7.2 -isystem /home/roy/hymatek/connexi-touchpanel-firmw=
are/ex7xxm/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/QtGu=
i/6.7.2/QtGui -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
=3D64 -O2 -g0 -D_FORTIFY_SOURCE=3D1 -DNDEBUG -O2 -std=3Dc++17 -fPIC -fvisib=
ility=3Dhidden -fvisibility-inlines-hidden -Wall -Wextra -fno-exceptions -W=
suggest-override -MD -MT src/multimedia/CMakeFiles/Multimedia.dir/pulseaudi=
o/qpulseaudiosink.cpp.o -MF src/multimedia/CMakeFiles/Multimedia.dir/pulsea=
udio/qpulseaudiosink.cpp.o.d -o src/multimedia/CMakeFiles/Multimedia.dir/pu=
lseaudio/qpulseaudiosink.cpp.o -c /home/roy/hymatek/connexi-touchpanel-firm=
ware/ex7xxm/output/build/qt6multimedia-6.7.2/src/multimedia/pulseaudio/qpul=
seaudiosink.cpp<br>/home/roy/hymatek/connexi-touchpanel-firmware/ex7xxm/out=
put/build/qt6multimedia-6.7.2/src/multimedia/pulseaudio/qpulseaudiosink.cpp=
:749:10: fatal error: moc_qpulseaudiosink_p.cpp: Ingen slik fil eller filka=
talog<br>=C2=A0 749 | #include &quot;moc_qpulseaudiosink_p.cpp&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~=
~~~~~~<br>compilation terminated.<br>[89/203] Building CXX object src/multi=
media/CMakeFiles/Multimedia.dir/pulseaudio/qaudioengine_pulse.cpp.o<br>ninj=
a: build stopped: subcommand failed.<br>make[2]: *** [package/<a href=3D"ht=
tp://pkg-generic.mk:289" target=3D"_blank">pkg-generic.mk:289</a>: /home/ro=
y/hymatek/connexi-touchpanel-firmware/ex7xxm/output/build/qt6multimedia-6.7=
.2/.stamp_built] Error 1<br>make[1]: *** [Makefile:83: _all] Error 2<br>mak=
e[1]: Leaving directory &#39;/home/roy/hymatek/connexi-touchpanel-firmware/=
buildroot&#39;<br>make: *** [Makefile:86: ex7xxm/qt6multimedia-reconfigure]=
 Error 2<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">s=C3=B8n. 22. sep. 2024 kl. 11:21 skrev Roy Kollen Svends=
en &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" target=3D"_blank">roy=
kollensvendsen@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div>Hi Baxiche, Hi Thomas,<br></div><di=
v><br></div><div>Baxiche, good to see you are working on getting this modul=
e upstream! I&#39;ll do some testing and dig deeper into the details later.=
<br></div><div><br></div><div>I&#39;m a but unsure about the non-qt depende=
ncies, especially the kernel feature dependencies.</div><div><br></div><div=
>You can also probably drop more of the license information, that does not =
apply to things that don&#39;t end up on target.</div><div><br></div><div>I=
 think it would be nice to be able to enable the examples for testing. The =
same goes for the other Qt6 packages. Have you looked into that?<br></div><=
div><br></div><div>What do you think about adding options to enable the tes=
ts, Thomas?</div><div><br></div><div>But until I get the time to do some te=
sting and checking, here are some things I noticed while reading through yo=
ur patch:<br></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">fre. 20. sep. 2024 kl. 18:06 skrev baxiche su &lt;<=
a href=3D"mailto:baxiche@gmail.com" target=3D"_blank">baxiche@gmail.com</a>=
&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off=
-by: baxiche su &lt;<a href=3D"mailto:baxiche@gmail.com" target=3D"_blank">=
baxiche@gmail.com</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +<br>
=C2=A0package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0package/qt6/qt6multimedia/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 117 ++++++++++++++++<br>
=C2=A0package/qt6/qt6multimedia/qt6multimedia.hash |=C2=A0 26 ++++<br>
=C2=A0package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6multimedia.mk</a>=C2=A0 =C2=A0| 137 ++++++=
+++++++++++++<br>
=C2=A05 files changed, 284 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/Config.in<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/qt6multimedia.hash<br>
=C2=A0create mode 100644 package/qt6/qt6multimedia/<a href=3D"http://qt6mul=
timedia.mk" rel=3D"noreferrer" target=3D"_blank">qt6multimedia.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index ea4ee3377f..5b6f60444d 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -343,6 +343,9 @@ F:=C2=A0 package/tcpdump/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/ti-uim/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/uhubctl/<br>
<br>
+N:=C2=A0 =C2=A0 =C2=A0Baxiche Su &lt;<a href=3D"mailto:baxiche@gmail.com" =
target=3D"_blank">baxiche@gmail.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0package/qt6/qt6multimedia<br></blockquote><div><br><=
/div><div>The common pattern is to use a slash at the end of a directory en=
try:</div><div><br></div><div>package/qt6/qt6multimedia/</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Ben Boeckel &lt;<a href=3D"mailto:mathstuf@gmai=
l.com" target=3D"_blank">mathstuf@gmail.com</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/taskd/<br>
<br>
diff --git a/package/qt6/Config.in b/package/qt6/Config.in<br>
index 4cbb60322c..debf4f4733 100644<br>
--- a/package/qt6/Config.in<br>
+++ b/package/qt6/Config.in<br>
@@ -48,6 +48,7 @@ source &quot;package/qt6/qt6core5compat/Config.in&quot;<b=
r>
=C2=A0source &quot;package/qt6/qt6declarative/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6languageserver/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6mqtt/Config.in&quot;<br>
+source &quot;package/qt6/qt6multimedia/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6opcua/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6scxml/Config.in&quot;<br>
=C2=A0source &quot;package/qt6/qt6serialbus/Config.in&quot;<br>
diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedi=
a/Config.in<br>
new file mode 100644<br>
index 0000000000..1aebef840d<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/Config.in<br>
@@ -0,0 +1,117 @@<br>
+config BR2_PACKAGE_QT6MULTIMEDIA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;qt6multimedia&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_GUI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_NETWORK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6SHADERTOOLS<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Qt Multimedia is an add-on module that p=
rovides <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a rich set of QML types and C++ classes =
to handle <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0multimedia content. It contains an easy =
to use API <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for playing back audio and video files a=
nd rendering <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0those on screen, as well as a comprehens=
ive API for <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recording audio and video from the syste=
m&#39;s cameras <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and microphones.<br></blockquote><div><b=
r></div><div>You wrap the help text at 62 characters i think. I think it is=
 better to wrap it at 62=C2=A0+ 2=C2=A0+ tab(8 chars). See manual. <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://doc.qt.io/qt-6/qtmult=
imedia-index.html" rel=3D"noreferrer" target=3D"_blank">https://doc.qt.io/q=
t-6/qtmultimedia-index.html</a><br>
+<br>
+if BR2_PACKAGE_QT6MULTIMEDIA<br>
+<br>
+comment &quot;alsa support requires disabling pulseaudio&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO=
<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_ALSA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;alsa support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# qt6-multimedia audio backend requires selecti=
on <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# of either PulseAudio or ALSA.<br>
</blockquote><div><br></div><div>Maybe this could be reflected in a choice =
instead?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_QT6MULTIMEDI=
A_PULSEAUDIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_ALSA_LIB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option select Alsa as audio backend=
.<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ffmpeg plugin&quot;<br></blockquote>=
<div><br></div><div>Does it make sense to make this a choice between ffmpeg=
 and gstreamer instead?<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# qt6-multimedia ffmpeg plugin needs <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# qt6base-concurrent, PulseAudio and ffmpeg-swc=
ale.<br></blockquote><div><br></div><div>I think this comment just repeats =
the info bellow. Can we drop it?<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_CONCURRENT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_FFMPEG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_FFMPEG_SWSCALE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PULSEAUDIO<br></blockquote><=
div><br></div><div>I also like when the select statements are sorted alphab=
etically. Have you ordered them this way intentionally?<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables ffmpeg media backend=
<br>
+<br>
+if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG<br>
+<br>
+comment &quot;VAAPI support needs Linux DMA buffer feature&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA=
_BUF<br>
+<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+config BR2_PACKAGE_QT6MULTIMEDIA_VAAPI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;vaapi support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_=
BUF <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBVA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# ffmpeg-vaapi support needs qt6base-opengl<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_QT6BASE_OPENGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the vaapi support.<b=
r>
+endif<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;gstreamer plugin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# gstreamer 1.x and gst-plugins-base-app are re=
quired <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# for gstreamer support in qt6-multimedia<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GSTREAMER1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GST1_PLUGINS_BASE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables gstreamer media back=
end<br>
+<br>
+if BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER<br>
+<br>
+comment &quot;GStreamer OpenGL support needs an OpenGL-capable backend&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_HAS_LIBGL &amp;&amp; !B=
R2_PACKAGE_HAS_LIBGLES<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_OPENGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;opengl support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE=
_HAS_LIBGLES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables gstreamer-opengl sup=
port<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_PHOTOGRAPHY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;photography support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GST1_PLUGINS_BAD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables gstreamer-photograph=
y support<br>
+<br>
+endif<br>
+<br>
+comment &quot;Linux DMA buffer support needs DMA buffer feature of libgbm&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_=
BUF<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;linux dma buffer support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_B=
UF <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# qt6 configure script needs EGL to check <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# for linux dma buffer support<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBEGL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the linux dma buffer=
 support<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;v4l support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the video for linux =
support<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO <br></blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;pulseaudio support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PULSEAUDIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option select PulseAudio as audio b=
ackend.<br>
+<br>
+config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;spatial audio module&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the Qt6SpatialAudio =
library.<br>
+<br>
+endif<br>
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6=
multimedia/qt6multimedia.hash<br>
new file mode 100644<br>
index 0000000000..b63aedc1d9<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash<br>
@@ -0,0 +1,26 @@<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256<br>
+sha256</a>=C2=A0 8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a77=
65651d3=C2=A0 qtmultimedia-everywhere-src-6.7.2.tar.xz<br>
+<br>
+# Hashes for license files<br>
+sha256=C2=A0 f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec=
1df=C2=A0 LICENSES/BSD-2-Clause.txt<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b=
1c0=C2=A0 LICENSES/BSD-Source-Code.txt<br>
+sha256=C2=A0 84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380=
a8f=C2=A0 LICENSES/BSL-1.0.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc625=
11a=C2=A0 LICENSES/IJG.txt<br>
+sha256=C2=A0 f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299=
be9=C2=A0 LICENSES/ISC.txt<br>
+sha256=C2=A0 fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f5=
8fb=C2=A0 LICENSES/LGPL-2.1-or-later.txt<br>
+sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
+sha256=C2=A0 b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0=
cc0=C2=A0 LICENSES/MIT.txt<br>
+sha256=C2=A0 66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5=
172=C2=A0 LICENSES/MPL-2.0.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
+sha256=C2=A0 bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c=
03d=C2=A0 LICENSES/Zlib.txt<br>
+sha256=C2=A0 85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e=
51e=C2=A0 src/3rdparty/eigen/COPYING.BSD<br>
+sha256=C2=A0 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863=
e85=C2=A0 src/3rdparty/eigen/COPYING.MPL2<br>
+sha256=C2=A0 8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc=
3c4=C2=A0 src/3rdparty/eigen/COPYRIGHTS<br>
+sha256=C2=A0 b522f821df94da3bad917e98ef04817b3af421c3b8c23e8247ae7e517b289=
934=C2=A0 src/3rdparty/pffft/COPYRIGHTS<br>
+sha256=C2=A0 a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3=
d88=C2=A0 src/3rdparty/pffft/LICENSE<br>
+sha256=C2=A0 2513c5ad87ce9e7feed2c9a159d336f0a0d12ff93adcd411f7a15a1ab678f=
7ac=C2=A0 src/3rdparty/resonance-audio/COPYRIGHTS<br>
+sha256=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523=
d30=C2=A0 src/3rdparty/resonance-audio/LICENSE<br>
diff --git a/package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" =
rel=3D"noreferrer" target=3D"_blank">qt6multimedia.mk</a> b/package/qt6/qt6=
multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"noreferrer" target=3D=
"_blank">qt6multimedia.mk</a><br>
new file mode 100644<br>
index 0000000000..ec81abc1de<br>
--- /dev/null<br>
+++ b/package/qt6/qt6multimedia/<a href=3D"http://qt6multimedia.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6multimedia.mk</a><br>
@@ -0,0 +1,137 @@<br>
+##########################################################################=
######<br>
+#<br>
+# qt6multimedia<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+QT6MULTIMEDIA_VERSION =3D $(QT6_VERSION)<br>
+QT6MULTIMEDIA_SITE =3D $(QT6_SITE)<br>
+QT6MULTIMEDIA_SOURCE =3D qtmultimedia-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6MU=
LTIMEDIA_VERSION).tar.xz<br>
+QT6MULTIMEDIA_INSTALL_STAGING =3D YES<br>
+QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+QT6MULTIMEDIA_CMAKE_BACKEND =3D ninja<br>
+<br>
+QT6MULTIMEDIA_LICENSE =3D \<br>
+=C2=A0 =C2=A0 BSD-3-Clause (buildsystem, examples, pfft,=C2=A0 snippets), =
\<br>
+=C2=A0 =C2=A0 GFDL-1.3-no-invariants (docs), \<br>
+=C2=A0 =C2=A0 GPL-3.0 (tests), \<br>
+=C2=A0 =C2=A0 GPL-3.0 with Qt-GPL-exception-1.0 (utils), \<br>
+=C2=A0 =C2=A0 LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)<br>
+<br>
+QT6MULTIMEDIA_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-3-Clause.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GPL-2.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/GPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/LGPL-3.0-only.txt \<br>
+=C2=A0 =C2=A0 LICENSES/Qt-GPL-exception-1.0.txt \<br>
+<br>
+QT6MULTIMEDIA_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 qt6base \<br>
+=C2=A0 =C2=A0 qt6shadertools<br>
+<br>
+QT6MULTIMEDIA_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 -DQT_HOST_PATH=3D$(HOST_DIR) \<br>
+=C2=A0 =C2=A0 -DQT_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 -DQT_BUILD_TESTS=3DOFF \ <br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 -DFEATURE_alsa=3DOFF \<br>
</blockquote><div><br></div>I think is better to gather all code related to=
 one option in one place. So this should be moved down into the ifeq-statem=
ent for alsa.</div><div class=3D"gmail_quote">The same goes for the other o=
ptions.<br></div><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">+=C2=A0 =C2=A0 -DFEATURE_ffmpeg=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_1_0=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_app=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_gl=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_photography=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_linux_dmabuf=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_linux_v4l=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_pulseaudio=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_spatialaudio=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_spatialaudio_quick3d=3DOFF \<br>
+=C2=A0 =C2=A0 -DFEATURE_vaapi=3DOFF<br>
+<br>
+# for multimedia quick module<br>
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D qt6declarative<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_ALSA),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_alsa=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D alsa-lib<br>
</blockquote><div><br></div><div>Gather all code related to the alsa option=
 here:</div><div><br></div><div>else</div><div>QT6MULTIMEDIA_CONF_OPTS +=3D=
 -DFEATURE_alsa=3DOFF<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_ffmpeg=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D ffmpeg<br>
+QT6MULTIMEDIA_LICENSE +=3D , \<br>
+=C2=A0 =C2=A0 BSL-1.0 (ffmpeg-boost), \<br>
+=C2=A0 =C2=A0 IJG (ffmpeg-libjpeg), \<br>
+=C2=A0 =C2=A0 LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-C=
ode and ISC and MIT and MPL-2.0 (ffmpeg), \<br>
+=C2=A0 =C2=A0 Zlib (ffmpeg-zlib)<br>
+QT6MULTIMEDIA_LICENSE_FILES +=3D \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-2-Clause.txt \<br>
+=C2=A0 =C2=A0 LICENSES/BSD-Source-Code.txt \<br>
+=C2=A0 =C2=A0 LICENSES/BSL-1.0.txt \<br>
+=C2=A0 =C2=A0 LICENSES/IJG.txt \<br>
+=C2=A0 =C2=A0 LICENSES/ISC.txt \<br>
+=C2=A0 =C2=A0 LICENSES/LGPL-2.1-or-later.txt \<br>
+=C2=A0 =C2=A0 LICENSES/MIT.txt \<br>
+=C2=A0 =C2=A0 LICENSES/MPL-2.0.txt \<br>
+=C2=A0 =C2=A0 LICENSES/Zlib.txt<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer=3DON \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_1_0=3DON \<br>
+=C2=A0 =C2=A0 -DFEATURE_gstreamer_app=3DON <br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D gstreamer1 gst1-plugins-base<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GST_PLUGINS_PHOTOGRAPHY),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_gstreamer_photography=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D gst1-plugins-bad<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_linux_dmabuf=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D libgbm libegl<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_linux_v4l=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D linux<br></blockquote><div><br></div><div>=
I was probably wrong here in my last comment, I don&#39;t think the depende=
ncy on linux is necessary... I have no experience with dependencies on kern=
el config, so you should ask Thomas or someone else about how dependencies =
on linux config options are handled. Maybe this is relevant?:</div><div><br=
></div><div><a href=3D"https://www.marcusfolkesson.se/til/buildroot-libfoo-=
linux-config-fixup/" target=3D"_blank">https://www.marcusfolkesson.se/til/b=
uildroot-libfoo-linux-config-fixup/</a></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_pulseaudio=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D pulseaudio<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_spatialaudio=3DON<br>
+QT6MULTIMEDIA_LICENSE +=3D , \<br>
+=C2=A0 =C2=A0 Apache-2.0 (resonance-audio, eigen), \<br>
+=C2=A0 =C2=A0 LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio, spatiala=
udioquick3d), \<br>
+=C2=A0 =C2=A0 MPL-2.0 and BSD-3-Clause (eigen)<br>
+QT6MULTIMEDIA_LICENSE_FILES +=3D \<br>
+=C2=A0 =C2=A0 LICENSES/MPL-2.0.txt \<br>
+=C2=A0 =C2=A0 src/3rdparty/eigen/COPYING.BSD \<br>
+=C2=A0 =C2=A0 src/3rdparty/eigen/COPYING.MPL2 \<br>
+=C2=A0 =C2=A0 src/3rdparty/eigen/COPYRIGHTS \<br>
+=C2=A0 =C2=A0 src/3rdparty/pffft/COPYRIGHTS \<br>
+=C2=A0 =C2=A0 src/3rdparty/pffft/LICENSE \<br>
+=C2=A0 =C2=A0 src/3rdparty/resonance-audio/COPYRIGHTS \<br>
+=C2=A0 =C2=A0 src/3rdparty/resonance-audio/LICENSE<br>
+<br>
+# for spatialaudio quick3d module<br>
+ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D qt6quick3d<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_spatialaudio_quick3d=3DON<br>
+endif<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_VAAPI),y)<br>
+QT6MULTIMEDIA_CONF_OPTS +=3D -DFEATURE_vaapi=3DON<br>
+QT6MULTIMEDIA_DEPENDENCIES +=3D libva<br>
+endif<br>
+<br>
+$(eval $(cmake-package))<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div>

--00000000000036ef2b0622e38fa6--

--===============8747910964535136465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8747910964535136465==--
