Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFDA606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bv3CNXqd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 368AC60725;
	Sun,  1 Nov 2026 16:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuuN5VlYg1Eq; Sun,  1 Nov 2026 16:57:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A99760711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552241;
	b=Z6i78FObxBapzZ8ZJbXjkzTdiy8eJbfbIwxMZXSysG+FkKAbJ6cKaNpYeRnCHjCp+LkY
	 4hpNfVFcgt7TvLCvbY8rXZLgr6JSJEWPiUSMn3ve2c5HW/5XGWrtfcl4B7jmdyQCFvU9u
	 355p37zHaxytquL3onQlUmt2zSirpSU11v1mOfk6NAqG1Z0prgEDnbR6Z+Ut8nv+n5OAk
	 g6DH5JuKLbCWAt9qvEwVfw+mtPTbfnVSfG8BnbE0x2pd9sMlIvL16PQOYIxAMxOv4i+MA
	 pytI/QSLA9cy0Z0VuESqDtXmsGF9o+8+KCxdbk6AbeadL/TSOKTburB2l4gwd7fDZqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Q/CBImlOHohUCup4yqWyIfdSb+ofNkQcCHJfdLG/8rI=;
	b=GGwnTTF0sygA+RWB9/qVvtxcSB1Knwx4/zIAbluirotfXTN+JobgWgGCCKwsVhv8GJYr
	 gB7q12z/fQicUnEm0uoxzJD+EkIe8rZFNrSRRYEdsKyNkUZC7/6yyFscy/3FEVvOlVqxO
	 kEsEdhQJ6cfreeTJg6PrOooOjpf5sequGTFVoQNqkCUfvN7mPoHal9mYmOQy8cL0c2/6k
	 d1hf2GaY8Fi9hkJvoyCZnR9ovK3zIO4e861XkdNAniR23ayuIm9VmXUFVaOjPPKF7sCKf
	 AWV71QZ9PtbpyPxklog+yZHXJXpjdnzQhsA7Yuqufw81irm+MVKl1etR0BZCvR0nK+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552241;
	bh=Q/CBImlOHohUCup4yqWyIfdSb+ofNkQcCHJfdLG/8rI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bv3CNXqdmg+lPyTM0bxuFX/+7vHkn0pDlJRs7zjxSMw7aqmLiAHt/jySprfF0/tmW
	 UKqKqlg/Ct88xRlIrBNlKZFYIQKE6ATjPq4k7pO0a+WfkZMFSVLNepYeWPKLq18ZOj
	 IUv4BHUCHxdq0fJYZVO4FC2JJDmWHOZjTNMIINGRDq9DITycyNSy9MymPufwcfqBGR
	 hdHU1EcpgYXTfjtGju/kKssIXSF4Aa5Rb/NlBOBkewTb2I7V8WBv/QnhHPChrp9Zl1
	 1rhO4Gjgx571zSLlsmH/zV7q2od08CFPvMfbfzZiPQzs+MHfN6L5NIVzByyblK9/LF
	 4UWJLkjJ18o0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A99760711;
	Sun,  1 Nov 2026 16:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2CF2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00504405BD
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0C-sHPNdI6Uz for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2FBA6405BF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552235;
 b=FnklqL+NYRvjHjA+iw/YFwm1S8QH5f7+c+Gm+4dkG0yy7LJkUFEkZEBTpuSv2W1fSqW5
 2+teCUZAquUOm6cK9idhsXLrvgubk2pgBwsrt6JJRKE86c264Ru3P/GQi/HrWIVJlK+zD
 1sdSQZCORSWkZAJpjUUg72pVqtutgdDuHcbK+FHi7xeYSlCMqKzIhJYmRIvClwN/ko0So
 N4tyQEOVjgZOaD2qfK7ZiPGhTiFua9Pqkix2uHDb2Mdlixha9U3RcL1oFbnI0VKO/fMK2
 gZj/eYCaNoje3V7+EpY7RfIbyYWS9xdczrbXoBjDIO8VT8mxP/9jDnisThYfxsRT1Jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552235;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KdmZMSHuNF8kgTuGZqHGj4xaiBVv5Kheb5S6reEjH00=;
 b=L+div/dw0R4Bmemom3RqF2ELw27YJf90PEalZRWPQx9Vx1ADEujN/tgYAmVCC9Y8CKa/
 qia2QrVWeU5kXctEN48T/7mnFcHHg5P/N9I2u+5BIwCAFhp6h6UyiVnjKsgDDJ8ySe75i
 Ki/uqwx2n6FAq2kc3tx8NiQw13+b1mXmiBxlSo1RTpzj9xXfvbUQtsuP9mlLi6FaO3BCQ
 P3SoG2tOWrDjgyBw/fEbfhPrjLEca9BcCo3WbJ2FQsQ+QBEWCH/nOHIbGfphRrd2ThET2
 8tek4G4c7J/GAr29OuXy0a41nO7ExV9trxMjRo98epetT0AV7jEgkDrXMgHdGg9A+kg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FBA6405BF
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E39AC9D4C1; Sun,  1 Nov 2026 16:55:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:54:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc6f450af082fdbf3a85b12b5e9292fdf9f4ce29
X-Git-Newrev: a4959082756ea1cd1feb9d74f1b4f1b365780114
X-Patchwork-Hint: ignore
Message-Id: <20261101165545.E39AC9D4C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: fix build with ffmpeg 9.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4959082756ea1cd1feb9d74f1b4f1b365780114
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...port-FFmpeg-after-AVCodec-pix_fmts-remova.patch | 58 +++++++++++++++++
 ...peg-use-avcodec_get_supported_config-for-.patch | 76 ++++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch b/package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch
new file mode 100644
index 0000000000..fabb364441
--- /dev/null
+++ b/package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch
@@ -0,0 +1,58 @@
+From 700cd32ffd59ed3c6f6aec1919867653d8b125ea Mon Sep 17 00:00:00 2001
+From: Aadhu23 <aadhavansalthivel5@gmail.com>
+Date: Thu, 16 Jul 2026 09:21:37 +0000
+Subject: [PATCH] videoio: support FFmpeg after AVCodec::pix_fmts removal
+
+Upstream: https://github.com/opencv/opencv/commit/700cd32ffd59ed3c6f6aec1919867653d8b125ea
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/videoio/src/cap_ffmpeg_hw.hpp | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_hw.hpp b/modules/videoio/src/cap_ffmpeg_hw.hpp
+index 65045a2bc7..bb5e4c1088 100644
+--- a/modules/videoio/src/cap_ffmpeg_hw.hpp
++++ b/modules/videoio/src/cap_ffmpeg_hw.hpp
+@@ -757,6 +757,30 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+ #endif
+             if (hw_type == AV_HWDEVICE_TYPE_CUDA) // CUDA encoders don't support avcodec_get_hw_config()
+                 hw_native_fmt = AV_PIX_FMT_CUDA;
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++            if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE) {
++                const AVPixelFormat *pix_fmts = NULL;
++                int num_pix_fmts = 0;
++
++                int ret = avcodec_get_supported_config(
++                    NULL,
++                    c,
++                    AV_CODEC_CONFIG_PIX_FORMAT,
++                    0,
++                    (const void **)&pix_fmts,
++                    &num_pix_fmts);
++
++            if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
++                    for (int i = 0; i < num_pix_fmts; i++) {
++                        if (pix_fmts[i] == hw_native_fmt) {
++                            *hw_pix_fmt = hw_native_fmt;
++                            if (hw_check_codec(c, hw_type, disabled_codecs))
++                                return c;
++                        }
++                    }
++                }
++            }
++#else
+             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE && c->pix_fmts) {
+                 for (int i = 0; c->pix_fmts[i] != AV_PIX_FMT_NONE; i++) {
+                     if (c->pix_fmts[i] == hw_native_fmt) {
+@@ -766,6 +790,7 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+                     }
+                 }
+             }
++#endif
+             for (int i = 0;; i++) {
+                 const AVCodecHWConfig *hw_config = avcodec_get_hw_config(c, i);
+                 if (!hw_config)
+-- 
+2.47.3
+
diff --git a/package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch b/package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch
new file mode 100644
index 0000000000..e87876ae40
--- /dev/null
+++ b/package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch
@@ -0,0 +1,76 @@
+From 83ed22ca2800267050a4a9a94afab605c990c0e0 Mon Sep 17 00:00:00 2001
+From: Arnesh Banerjee <linkrinku13@gmail.com>
+Date: Tue, 4 Aug 2026 19:49:11 +0530
+Subject: [PATCH] videoio(ffmpeg): use avcodec_get_supported_config for
+ framerates on FFmpeg 9
+
+AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
+FFmpeg 9, so direct field access no longer builds against FFmpeg 9.
+
+Read the supported frame rate list through avcodec_get_supported_config()
+when building against libavcodec 61.13.100 or newer. That call returns the
+same list plus its entry count, so the loop iterates by count instead of the
+old sentinel terminator. Older FFmpeg keeps the previous field access.
+
+Upstream: https://github.com/opencv/opencv/commit/83ed22ca2800267050a4a9a94afab605c990c0e0
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 34 +++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index a7fb1eda9a..d5b950392c 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -2627,6 +2627,39 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+     c->time_base.den = frame_rate;
+     c->time_base.num = frame_rate_base;
+     /* adjust time base for supported framerates */
++    // AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
++    // FFmpeg 9. avcodec_get_supported_config() returns the same list together
++    // with its entry count, so use it when available.
++#if LIBAVCODEC_BUILD >= CALC_FFMPEG_VERSION(61, 13, 100)
++    const AVRational *supported_framerates = NULL;
++    int num_supported_framerates = 0;
++    if (codec)
++        avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
++                                     (const void **)&supported_framerates, &num_supported_framerates);
++    if (supported_framerates && num_supported_framerates > 0){
++        AVRational req = {frame_rate, frame_rate_base};
++        const AVRational *best=NULL;
++        AVRational best_error= {INT_MAX, 1};
++        for(int i = 0; i < num_supported_framerates; i++){
++            const AVRational *p = &supported_framerates[i];
++            AVRational error= av_sub_q(req, *p);
++            if(error.num <0) error.num *= -1;
++            if(av_cmp_q(error, best_error) < 0){
++                best_error= error;
++                best= p;
++            }
++        }
++        if (best == NULL)
++        {
++#ifdef CV_FFMPEG_CODECPAR
++            avcodec_free_context(&c);
++#endif
++            return NULL;
++        }
++        c->time_base.den= best->num;
++        c->time_base.num= best->den;
++    }
++#else
+     if(codec && codec->supported_framerates){
+         const AVRational *p= codec->supported_framerates;
+         AVRational req = {frame_rate, frame_rate_base};
+@@ -2650,6 +2683,7 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+         c->time_base.den= best->num;
+         c->time_base.num= best->den;
+     }
++#endif
+ 
+     c->gop_size = 12; /* emit one intra frame every twelve frames at most */
+     c->pix_fmt = pixel_format;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
