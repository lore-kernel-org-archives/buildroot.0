Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537C8606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aHlIVwRp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E637405CE;
	Sun,  1 Nov 2026 16:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJNOg-elZQgq; Sun,  1 Nov 2026 16:57:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0FDC405F3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552243;
	b=lZKqQbqm9OYt2X0cwQvKeexofM6C0hBTRa42OHdNDmmy3LFlWjEKkIj8Y7VgbltNHquB
	 qy7IKG8Mio1c+wqOI2e0tnwOSAzUR3q5UdVGSi/qU5nA26LMIZIpsMx9mNfan0Tguxuqe
	 msrbDB8D0MxRyaZ7F2HLD3iMaIfGqWafL7kHtmCMPW0HQDb1C+1X/AFSVJ/U1q6QLkaSc
	 ZqW7yv4BsiQywNfWxDXuNjdW9/O/gon7+TRdNJ+pAPy+NsuM65zNeE49slHXrM9YkkmxF
	 o6qYO+kav6VTr2pDq92cYy5brcQrK1PyuPeo3zoc5z42Vaqn7tHg6bFwvMHNLHhvY8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iYpey0ok08T6pMJ6fGElOHVan1figlQoNqfNTS0/cjY=;
	b=pIANYTQMDWPbEPQ1YOywt0eT0bnYDuvSQqLBqyB5m1wHSONbxA6Gi+OexnlgUL3znK5k
	 7pHa9o2it6xAXEz/jXGcplqdJFPaOdhxN1qSDTbeckS4Y/i1WAPYwSpvVJv9lA40V3Q5H
	 qYgs6IomaxFam66sZqtN8O91/018SjkP4oCpM8Nus0ZTkMqHKzY0vQviqdwS4g9G8ngRz
	 kezjbIqXwMVJ+tjYoEhhQn/x6Xo3f7hwCkjHk1WF6/N2rn1U0BCZBwvVoIiTAy1CTlpSr
	 AMqvVSFSZ+Rzcfq2rKMLbZ6bVZw9A6wJPaLqZtQSwmnC7oLX2HKqjNF5qHniFfjH5VA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552242;
	bh=iYpey0ok08T6pMJ6fGElOHVan1figlQoNqfNTS0/cjY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aHlIVwRpg1lZz2OH58j2//z1VS8rvB1YORRfIG3GtKSvOix63EjmW08arMqmsH4+w
	 oxB7sWA/VJmwYEUYLYz996SoYVqiuoug9xtvwEKPPBUu+teITvD6UiEbmKTwFQHvhE
	 JYakL82RK8BuKdkIGo5SHbWCJ1CFbUzNiLofnhWvfZmciwcWLX+SVqp4ZvP14t2k+7
	 xR6ur77936kGBb5R/3ZamWaBdAYLueXtSPZyoDYcDRs03Iscs737ED0dOSS4OBLjLD
	 pO18ibhlKaSg7Rhq89MCnAw94u9pvvlcNi034AyViwEDxVnvWuV1FKDlsq71qEB6W8
	 PniRBWRE6Qbag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0FDC405F3;
	Sun,  1 Nov 2026 16:57:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B440EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CB5D40076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lX6E7pTSI_A for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 13B7140098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552235;
 b=OVQ1MmBFcLNy3aUQVDzBe2bGgU4FtB2mBdJ0gOiAq4gCKXgFVJ9Bev7MHSfyOPoCTm/D
 ZBys7bQsUDEfKckOI0kKxh0HgY0efkP+8regO0ydOr5Je9TYal7w8xaWB17iReSOTpkUv
 uRh7/jf9NvHNAAp4la0jBehwKAPpwOC7Kme/65Cpa4NvLLFW+3Ms5ceAiWnRelO1TCtbg
 gtQ/igJH+Dg6y0++W74ZHA0nT5gsO1v+DRlF4xSuaE8ddYDkmNw1ppRWCfPAqvdZbs1BN
 K3onDMztFtCUJ5+XiipqviwSWhdbEE67LNpWXeD3HlHIlhHf3ZFpTyPgUQqQ5M8E7eA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552235;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nqKtsftB3Kf0xug0qWMx70AjwZGkZ5Xk83Ib92MDfVo=;
 b=fgqS1m6rjgU3WGB1kHUK37AbO7b0ay+d4UwvLP5IR1d2ZAPfqp1OPoDr7C3lhrQDn8rM
 iQeZ6u6Mu/AB+X7966FvNcdxXOfgxu61yo4aReQ1oooNA/FzwkjY7gGVrct+gRySIEuND
 YUHTHnK1Wc7EYam/e2YNeyK9efXHkZmxk9lT+NGW2B+1iybINj69W87vkPZSBk7gigwyI
 4Bnlh8GmM+fKnLEtnENU33AmMFnNqDJHcTyekhnIGt76/bGYRRJhL2WVSdSFjlGR2nmxP
 zMf+sM+bOUYvWoILKeUD2rSBqC/B4CvZCWU3z49hmL8WyTVKbjpGqT9OyuLOFSWvBYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13B7140098
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D32009D496; Sun,  1 Nov 2026 16:55:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:54:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1488abeb5b9288c3ac85cec5d1b0938b08c8c2d0
X-Git-Newrev: fc6f450af082fdbf3a85b12b5e9292fdf9f4ce29
X-Patchwork-Hint: ignore
Message-Id: <20261101165545.D32009D496@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: bump version to
 1.14.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc6f450af082fdbf3a85b12b5e9292fdf9f4ce29
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This bump adds compatibility with ffmpeg 8.x while support for older
versions of ffmpeg was removed upstream:
https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65

Switched to tarball provided by upstream.

Rebased patch 0001.
Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...te-checks-for-disable_rpi_features-option.patch |  9 ++--
 ...002-core-Switch-libcamera-string-controls.patch | 46 ---------------------
 ...003-encoder-libav-Updates-for-ffmpeg-v7.1.patch | 48 ----------------------
 ...4-encoder-libav-fix-build-with-ffmpeg-7.0.patch | 37 -----------------
 package/libcamera-apps/libcamera-apps.hash         |  3 +-
 package/libcamera-apps/libcamera-apps.mk           |  5 ++-
 6 files changed, 10 insertions(+), 138 deletions(-)

diff --git a/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch b/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
index 1aba972d13..6c0469b249 100644
--- a/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
+++ b/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
@@ -20,8 +20,9 @@ Fixes:
   673 |                         controls_.set(controls::rpi::ScalerCrops, libcamera::Span<const Rectangle>(crops.data(), crops.size()));
       |                                                 ^~~
 
-Upstream: https://github.com/raspberrypi/rpicam-apps/pull/827
+Upstream: https://github.com/raspberrypi/rpicam-apps/pull/827 (rejected)
 
+[Bernd: rebased for 1.14.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  core/rpicam_app.cpp | 2 ++
@@ -31,7 +32,7 @@ diff --git a/core/rpicam_app.cpp b/core/rpicam_app.cpp
 index bed69c0..1db784f 100644
 --- a/core/rpicam_app.cpp
 +++ b/core/rpicam_app.cpp
-@@ -637,6 +637,7 @@ void RPiCamApp::StartCamera()
+@@ -640,6 +640,7 @@ void RPiCamApp::StartCamera()
  	// This makes all the Request objects that we shall need.
  	makeRequests();
  
@@ -39,9 +40,9 @@ index bed69c0..1db784f 100644
  	// Build a list of initial controls that we must set in the camera before starting it.
  	// We don't overwrite anything the application may have set before calling us.
  	if (!controls_.get(controls::ScalerCrop) && !controls_.get(controls::rpi::ScalerCrops))
-@@ -672,6 +673,7 @@ void RPiCamApp::StartCamera()
+@@ -675,6 +676,7 @@ void RPiCamApp::StartCamera()
  		else
- 			controls_.set(controls::rpi::ScalerCrops, libcamera::Span<const Rectangle>(crops.data(), crops.size()));
+ 			controls_.set(controls::rpi::ScalerCrops, std::span<const Rectangle>(crops.data(), crops.size()));
  	}
 +#endif
  
diff --git a/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch b/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
deleted file mode 100644
index fcebffe3da..0000000000
--- a/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f3011b5fae183a463630b4168626dfefe9b4c74e Mon Sep 17 00:00:00 2001
-From: Naushir Patuck <naush@raspberrypi.com>
-Date: Thu, 16 Oct 2025 14:45:33 +0100
-Subject: [PATCH] core: Switch libcamera string controls to use
- std::string_view
-
-This is a change to the libcamera API, switch to std::string_view from
-std::string.
-
-Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
-
-Upstream: https://github.com/raspberrypi/rpicam-apps/commit/f3011b5fae183a463630b4168626dfefe9b4c74e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- core/options.cpp    | 2 +-
- core/rpicam_app.cpp | 3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/core/options.cpp b/core/options.cpp
-index cf704c2a..d3296548 100644
---- a/core/options.cpp
-+++ b/core/options.cpp
-@@ -418,7 +418,7 @@ bool OptsInternal::Parse(boost::program_options::variables_map &vm, RPiCamApp *a
- 	std::vector<std::shared_ptr<libcamera::Camera>> cameras = app->GetCameras();
- 	if (camera < cameras.size())
- 	{
--		const std::string cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
-+		const std::string_view cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
- 
- 		if (cam_id.find("imx708") != std::string::npos)
- 		{
-diff --git a/core/rpicam_app.cpp b/core/rpicam_app.cpp
-index 9e5a2d0c..0f0b5ffa 100644
---- a/core/rpicam_app.cpp
-+++ b/core/rpicam_app.cpp
-@@ -128,8 +128,7 @@ std::string const &RPiCamApp::CameraId() const
- 
- std::string RPiCamApp::CameraModel() const
- {
--	auto model = camera_->properties().get(properties::Model);
--	return model ? *model : camera_->id();
-+	return std::string(camera_->properties().get(properties::Model).value_or(camera_->id()));
- }
- 
- void RPiCamApp::OpenCamera()
diff --git a/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch b/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
deleted file mode 100644
index 3b92ac3592..0000000000
--- a/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d67bc17a420b6c3519d4cfa24b4b4e5c7293165b Mon Sep 17 00:00:00 2001
-From: Naushir Patuck <naush@raspberrypi.com>
-Date: Wed, 8 Oct 2025 10:51:46 +0100
-Subject: [PATCH] encoder: libav: Updates for ffmpeg v7.1
-
-Fix some API breakages change for ffmpeg v7.1 packaged with Trixie.
-
-Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
-
-Upstream: https://github.com/raspberrypi/rpicam-apps/commit/d67bc17a420b6c3519d4cfa24b4b4e5c7293165b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- encoder/libav_encoder.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/encoder/libav_encoder.cpp b/encoder/libav_encoder.cpp
-index 10c00e0..ba8b9fe 100644
---- a/encoder/libav_encoder.cpp
-+++ b/encoder/libav_encoder.cpp
-@@ -337,13 +337,13 @@ void LibAvEncoder::initAudioOutCodec(VideoOptions const *options, StreamInfo con
- #if LIBAVCODEC_VERSION_MAJOR < 61
- 	codec_ctx_[AudioOut]->sample_fmt = codec->sample_fmts[0];
- #else
--	enum AVSampleFormat **sample_fmts = nullptr;
-+	const enum AVSampleFormat *sample_fmts = nullptr;
- 	avcodec_get_supported_config(codec_ctx_[AudioOut], codec, AV_CODEC_CONFIG_SAMPLE_FORMAT, 0,
- 								 (const void **)&sample_fmts, nullptr);
- 	if (!sample_fmts)
- 		throw std::runtime_error("libav: no supported sample formats for audio codec");
- 	else
--		codec_ctx_[AudioOut]->sample_fmt = (*sample_fmts)[0];
-+		codec_ctx_[AudioOut]->sample_fmt = sample_fmts[0];
- #endif
- 
- 	codec_ctx_[AudioOut]->bit_rate = options->Get().audio_bitrate.bps();
-@@ -652,7 +652,7 @@ void LibAvEncoder::audioThread()
- 	uint32_t out_channels = codec_ctx_[AudioOut]->ch_layout.nb_channels;
- #endif
- 
--	SwrContext *conv;
-+	SwrContext *conv = nullptr;
- 	AVAudioFifo *fifo;
- 
- #if LIBAVUTIL_VERSION_MAJOR < 57
--- 
-2.47.3
-
diff --git a/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch b/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch
deleted file mode 100644
index ae525b77d2..0000000000
--- a/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1a4860f36cffe167965351b7a59be46d7a7ae5ec Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 10 Oct 2026 23:58:02 +0200
-Subject: [PATCH] encoder: libav: fix build with ffmpeg 7.0
-
-Adjust the version check according to ffmpeg docs:
-
-https://code.ffmpeg.org/FFmpeg/FFmpeg/src/tag/n9.0.2/doc/APIchanges#L446
-"2024-09-08 - 3305767560a - lavc 61.13.100 - avcodec.h
-  Add avcodec_get_supported_config() and enum AVCodecConfig; deprecate
-  AVCodec.pix_fmts, AVCodec.sample_fmts, AVCodec.supported_framerates,
-  AVCodec.supported_samplerates and AVCodec.ch_layouts."
-
-Upstream: not applicable, support for older ffmpeg versions was removed:
-https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- encoder/libav_encoder.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/encoder/libav_encoder.cpp b/encoder/libav_encoder.cpp
-index 31f5e55..8e24e7d 100644
---- a/encoder/libav_encoder.cpp
-+++ b/encoder/libav_encoder.cpp
-@@ -321,7 +321,7 @@ void LibAvEncoder::initAudioOutCodec(VideoOptions const *options, StreamInfo con
- 
- 	codec_ctx_[AudioOut]->sample_rate = options->Get().audio_samplerate ? options->Get().audio_samplerate
- 																  : stream_[AudioIn]->codecpar->sample_rate;
--#if LIBAVCODEC_VERSION_MAJOR < 61
-+#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 13, 100))
- 	codec_ctx_[AudioOut]->sample_fmt = codec->sample_fmts[0];
- #else
- 	const enum AVSampleFormat *sample_fmts = nullptr;
--- 
-2.47.3
-
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index b11ea7fe67..615d033b1d 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,4 @@
+# From https://github.com/raspberrypi/rpicam-apps/releases/tag/v1.14.0
+sha256  f0c2315515faa47be2eec4492f5ffe9409f1993b66f3b9bc79c2fc653155611d  rpicam-apps_1.14.0.orig.tar.xz
 # Locally computed
-sha256  b5535933ebc398616fd1b261fa9e3755dfb419e10ee7866078a8a8d99f54a59a  libcamera-apps-v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index df7be41496..af30ea2158 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a
-LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_VERSION = 1.14.0
+LIBCAMERA_APPS_SITE = https://github.com/raspberrypi/rpicam-apps/releases/download/v$(LIBCAMERA_APPS_VERSION)
+LIBCAMERA_APPS_SOURCE =  rpicam-apps_$(LIBCAMERA_APPS_VERSION).orig.tar.xz
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
 LIBCAMERA_APPS_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
