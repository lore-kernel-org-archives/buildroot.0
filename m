Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E039E8305D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 07:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0798816E1;
	Tue,  3 Feb 2026 07:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsgIXj2XBHng; Tue,  3 Feb 2026 07:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7780E81747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770104827;
	bh=PQlEFHazSW6NxyK/CGuG3R6V3x8043/H3YESXyjiNv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KepbaqhxHL4412NMRTUfRJ+Go704NUtPtLgoPbdgIBCjtbqe3w42X4f625pacAKEa
	 s4GwL6QrxPItagGCSi37CDCrpkz/jkc5T/xQqeLSgCnaHB6vxqEOPydctzk5AIE9oZ
	 vSfzRda32jLM3Zg4TRpaJzq/0kixfRS2J6CDGi9vqWcZf3TazqKoIfjN1s2EuPTX8A
	 AUKymTBSJt43cdLPbyxYk9TuE7mhx0Cmbql1dnvVdTcePc1q6AWw9LESSzHLDXyLHQ
	 frc3lCJJ6h1KbZJf9nDrgHnS6unZ2ONy4jLd48a2/ah7WDxjxNwE4oDiEkbfoc8uhZ
	 aff0bl97fcRqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7780E81747;
	Tue,  3 Feb 2026 07:47:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F30F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4FB3403FA
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unDJfXTQNXQr for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CF8540060
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CF8540060
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A34886534; Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 08:46:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8e0ccce0ad66e3ff4619fc8e52fd6190353110b
X-Git-Newrev: 5cb9002e815204b993caa82d1d00d4019ae069b0
X-Patchwork-Hint: ignore
Message-Id: <20260203074701.8A34886534@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: fix build with ffmpeg 8.0
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
Content-Type: multipart/mixed; boundary="===============0334063638244589170=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0334063638244589170==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5cb9002e815204b993caa82d1d00d4019ae069b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added four upstream patches backported from FreeRDP 3.x.

The remaining build error:

/home/bernd/buildroot/output/build/freerdp-2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0/
 channels/client/tables.c:129:22:
 error: initialization of ‘UINT (*)(void)’ {aka ‘unsigned int (*)(void)’}
 from incompatible pointer type ‘UINT (*)(void *)’ {aka ‘unsigned int (*)(void *)’}
 [-Wincompatible-pointer-types]
  129 |         { "oss", "", oss_freerdp_rdpsnd_client_subsystem_entry },

is fixed by adding -Wno-incompatible-pointer-types to CFLAGS due to
tables.c being dynamically created during the build and backporting the
supposed upstream fix
https://github.com/FreeRDP/FreeRDP/commit/fe6d861a5c21edf5341ec203a12d6f62f8a80367
is too invasive.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freerdp/0005-fix-ffmpeg-deprecations.patch | 146 +++++++++++++++++++++
 .../0006-fix-ffmpeg-deprecation-warning.patch      |  34 +++++
 .../freerdp/0007-FF_PROFILE-Depreciation-Fix.patch |  31 +++++
 .../freerdp/0008-ignore-EAGAIN-for-FFMPEG.patch    |  44 +++++++
 package/freerdp/freerdp.mk                         |   4 +-
 5 files changed, 258 insertions(+), 1 deletion(-)

diff --git a/package/freerdp/0005-fix-ffmpeg-deprecations.patch b/package/freerdp/0005-fix-ffmpeg-deprecations.patch
new file mode 100644
index 0000000000..bf7206090e
--- /dev/null
+++ b/package/freerdp/0005-fix-ffmpeg-deprecations.patch
@@ -0,0 +1,146 @@
+From 83bda60872d2f8f4230de53a645112d8239b67ba Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Wed, 7 Jun 2023 11:46:07 +0200
+Subject: [PATCH] fix ffmpeg deprecations
+
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/d0c5b1ae4289c7f3cde3fbc031cb4a3160df05ff
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libfreerdp/codec/dsp_ffmpeg.c | 54 +++++++++++++++++++++++++++--------
+ 1 file changed, 42 insertions(+), 12 deletions(-)
+
+diff --git a/libfreerdp/codec/dsp_ffmpeg.c b/libfreerdp/codec/dsp_ffmpeg.c
+index 80df18833..22d6ce215 100644
+--- a/libfreerdp/codec/dsp_ffmpeg.c
++++ b/libfreerdp/codec/dsp_ffmpeg.c
+@@ -225,18 +225,17 @@ static void ffmpeg_close_context(FREERDP_DSP_CONTEXT* context)
+ static BOOL ffmpeg_open_context(FREERDP_DSP_CONTEXT* context)
+ {
+ 	int ret;
+-	int layout;
+-	const AUDIO_FORMAT* format;
+ 
+ 	if (!context || context->isOpen)
+ 		return FALSE;
+ 
+-	format = &context->format;
++	const AUDIO_FORMAT* format = &context->format;
+ 
+ 	if (!format)
+ 		return FALSE;
+-
+-	layout = av_get_default_channel_layout(format->nChannels);
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
++	const int layout = av_get_default_channel_layout(format->nChannels);
++#endif
+ 	context->id = ffmpeg_get_avcodec(format);
+ 
+ 	if (ffmpeg_codec_is_filtered(context->id, context->encoder))
+@@ -270,8 +269,12 @@ static BOOL ffmpeg_open_context(FREERDP_DSP_CONTEXT* context)
+ 			break;
+ 	}
+ 
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
+ 	context->context->channels = format->nChannels;
+ 	context->context->channel_layout = layout;
++#else
++	av_channel_layout_default(&context->context->ch_layout, format->nChannels);
++#endif
+ 	context->context->sample_rate = format->nSamplesPerSec;
+ 	context->context->block_align = format->nBlockAlign;
+ 	context->context->bit_rate = format->nAvgBytesPerSec * 8;
+@@ -314,8 +317,12 @@ static BOOL ffmpeg_open_context(FREERDP_DSP_CONTEXT* context)
+ 	if (!context->rcontext)
+ 		goto fail;
+ 
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
+ 	context->frame->channel_layout = layout;
+ 	context->frame->channels = format->nChannels;
++#else
++	av_channel_layout_default(&context->frame->ch_layout, format->nChannels);
++#endif
+ 	context->frame->sample_rate = format->nSamplesPerSec;
+ 	context->frame->format = AV_SAMPLE_FMT_S16;
+ 
+@@ -330,13 +337,21 @@ static BOOL ffmpeg_open_context(FREERDP_DSP_CONTEXT* context)
+ 		context->resampled->sample_rate = format->nSamplesPerSec;
+ 	}
+ 
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
+ 	context->resampled->channel_layout = layout;
+ 	context->resampled->channels = format->nChannels;
++#else
++	av_channel_layout_default(&context->resampled->ch_layout, format->nChannels);
++#endif
+ 
+ 	if (context->context->frame_size > 0)
+ 	{
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
+ 		context->buffered->channel_layout = context->resampled->channel_layout;
+ 		context->buffered->channels = context->resampled->channels;
++#else
++		av_channel_layout_copy(&context->buffered->ch_layout, &context->resampled->ch_layout);
++#endif
+ 		context->buffered->format = context->resampled->format;
+ 		context->buffered->nb_samples = context->context->frame_size;
+ 
+@@ -477,14 +492,20 @@ static BOOL ffmpeg_fill_frame(AVFrame* frame, const AUDIO_FORMAT* inputFormat, c
+                               size_t size)
+ {
+ 	int ret, bpp;
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
+ 	frame->channels = inputFormat->nChannels;
++	frame->channel_layout = av_get_default_channel_layout(frame->channels);
++#else
++	av_channel_layout_default(&frame->ch_layout, inputFormat->nChannels);
++#endif
+ 	frame->sample_rate = inputFormat->nSamplesPerSec;
+ 	frame->format = ffmpeg_sample_format(inputFormat);
+-	frame->channel_layout = av_get_default_channel_layout(frame->channels);
++
+ 	bpp = av_get_bytes_per_sample(frame->format);
+ 	frame->nb_samples = size / inputFormat->nChannels / bpp;
+ 
+-	if ((ret = avcodec_fill_audio_frame(frame, frame->channels, frame->format, data, size, 1)) < 0)
++	if ((ret = avcodec_fill_audio_frame(frame, inputFormat->nChannels, frame->format, data, size,
++	                                    1)) < 0)
+ 	{
+ 		const char* err = av_err2str(ret);
+ 		WLog_ERR(TAG, "Error during audio frame fill %s [%d]", err, ret);
+@@ -566,7 +587,12 @@ static BOOL ffmpeg_decode(AVCodecContext* dec_ctx, AVPacket* pkt, AVFrame* frame
+ 		}
+ 
+ 		{
+-			const size_t data_size = resampled->channels * resampled->nb_samples * 2;
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
++			const size_t channels = resampled->channels;
++#else
++			const size_t channels = resampled->ch_layout.nb_channels;
++#endif
++			const size_t data_size = channels * resampled->nb_samples * 2;
+ 			Stream_EnsureRemainingCapacity(out, data_size);
+ 			Stream_Write(out, resampled->data[0], data_size);
+ 		}
+@@ -661,10 +687,14 @@ BOOL freerdp_dsp_ffmpeg_encode(FREERDP_DSP_CONTEXT* context, const AUDIO_FORMAT*
+ 			if (inSamples + (int)context->bufferedSamples > context->context->frame_size)
+ 				inSamples = context->context->frame_size - (int)context->bufferedSamples;
+ 
+-			rc =
+-			    av_samples_copy(context->buffered->extended_data, context->resampled->extended_data,
+-			                    (int)context->bufferedSamples, copied, inSamples,
+-			                    context->context->channels, context->context->sample_fmt);
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
++			const int channels = context->context->channels;
++#else
++			const int channels = context->context->ch_layout.nb_channels;
++#endif
++			rc = av_samples_copy(context->buffered->extended_data,
++			                     context->resampled->extended_data, (int)context->bufferedSamples,
++			                     copied, inSamples, channels, context->context->sample_fmt);
+ 			rest -= inSamples;
+ 			copied += inSamples;
+ 			context->bufferedSamples += (UINT32)inSamples;
+-- 
+2.47.3
+
diff --git a/package/freerdp/0006-fix-ffmpeg-deprecation-warning.patch b/package/freerdp/0006-fix-ffmpeg-deprecation-warning.patch
new file mode 100644
index 0000000000..b0f56c4e80
--- /dev/null
+++ b/package/freerdp/0006-fix-ffmpeg-deprecation-warning.patch
@@ -0,0 +1,34 @@
+From 83ba6817093ad1546053878c2e720d13f29f9126 Mon Sep 17 00:00:00 2001
+From: Armin Novak <anovak@thincast.com>
+Date: Fri, 24 Nov 2023 19:40:52 +0100
+Subject: [PATCH] fix ffmpeg deprecation warning
+
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/1ef7b9e3e06ef69e5145c6f11cc330078abaa9ea
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libfreerdp/codec/dsp_ffmpeg.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/dsp_ffmpeg.c b/libfreerdp/codec/dsp_ffmpeg.c
+index 22d6ce215..5c89af6b1 100644
+--- a/libfreerdp/codec/dsp_ffmpeg.c
++++ b/libfreerdp/codec/dsp_ffmpeg.c
+@@ -436,7 +436,13 @@ static BOOL ffmpeg_encode_frame(AVCodecContext* context, AVFrame* in, AVPacket*
+ 	if (in->format == AV_SAMPLE_FMT_FLTP)
+ 	{
+ 		uint8_t** pp = in->extended_data;
+-		for (int y = 0; y < in->channels; y++)
++#if LIBAVUTIL_VERSION_INT < AV_VERSION_INT(57, 28, 100)
++		const int nr_channels = in->channels;
++#else
++		const int nr_channels = in->ch_layout.nb_channels;
++#endif
++
++		for (int y = 0; y < nr_channels; y++)
+ 		{
+ 			float* data = (float*)pp[y];
+ 			for (int x = 0; x < in->nb_samples; x++)
+-- 
+2.47.3
+
diff --git a/package/freerdp/0007-FF_PROFILE-Depreciation-Fix.patch b/package/freerdp/0007-FF_PROFILE-Depreciation-Fix.patch
new file mode 100644
index 0000000000..4a85d91ee0
--- /dev/null
+++ b/package/freerdp/0007-FF_PROFILE-Depreciation-Fix.patch
@@ -0,0 +1,31 @@
+From 9360089dfbcb6ee97a6b8f40c85f61e4108c80e4 Mon Sep 17 00:00:00 2001
+From: endlesseden <endlesseden@users.noreply.github.com>
+Date: Tue, 29 Apr 2025 16:11:03 +1000
+Subject: [PATCH] FF_PROFILE Depreciation Fix
+
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/af45cb37e3b2d81a11637c4b2dfe82e8947c41ea
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libfreerdp/codec/dsp_ffmpeg.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libfreerdp/codec/dsp_ffmpeg.c b/libfreerdp/codec/dsp_ffmpeg.c
+index 5c89af6b1..8955e894d 100644
+--- a/libfreerdp/codec/dsp_ffmpeg.c
++++ b/libfreerdp/codec/dsp_ffmpeg.c
+@@ -262,7 +262,11 @@ static BOOL ffmpeg_open_context(FREERDP_DSP_CONTEXT* context)
+ 			break;
+ 
+ 		case AV_CODEC_ID_AAC:
++#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(60, 31, 102)
+ 			context->context->profile = FF_PROFILE_AAC_MAIN;
++#else
++			context->context->profile = AV_PROFILE_AAC_MAIN;
++#endif
+ 			break;
+ 
+ 		default:
+-- 
+2.47.3
+
diff --git a/package/freerdp/0008-ignore-EAGAIN-for-FFMPEG.patch b/package/freerdp/0008-ignore-EAGAIN-for-FFMPEG.patch
new file mode 100644
index 0000000000..4a4c2c80c9
--- /dev/null
+++ b/package/freerdp/0008-ignore-EAGAIN-for-FFMPEG.patch
@@ -0,0 +1,44 @@
+From dcc8f415866e348ae86cfe85fde3c2d9285a7208 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 28 Jan 2025 20:25:17 +0100
+Subject: [PATCH] ignore EAGAIN for FFMPEG
+
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/726add2a982bfdf4cffef3cc95395c9a4b49385b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[partially backported to stable-2.0 branch]
+---
+ libfreerdp/codec/h264_ffmpeg.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/h264_ffmpeg.c b/libfreerdp/codec/h264_ffmpeg.c
+index 9c445b825..da6bed08e 100644
+--- a/libfreerdp/codec/h264_ffmpeg.c
++++ b/libfreerdp/codec/h264_ffmpeg.c
+@@ -100,10 +100,10 @@ static void libavcodec_destroy_encoder(H264_CONTEXT* h264)
+ 
+ 	if (sys->codecEncoderContext)
+ 	{
+-		avcodec_close(sys->codecEncoderContext);
+ #if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(55, 69, 100)
+ 		avcodec_free_context(&sys->codecEncoderContext);
+ #else
++		avcodec_close(sys->codecEncoderContext);
+ 		av_free(sys->codecEncoderContext);
+ #endif
+ 	}
+@@ -430,10 +430,10 @@ static void libavcodec_uninit(H264_CONTEXT* h264)
+ 
+ 	if (sys->codecDecoderContext)
+ 	{
+-		avcodec_close(sys->codecDecoderContext);
+ #if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(55, 69, 100)
+ 		avcodec_free_context(&sys->codecDecoderContext);
+ #else
++		avcodec_close(sys->codecDecoderContext);
+ 		av_free(sys->codecDecoderContext);
+ #endif
+ 	}
+-- 
+2.47.3
+
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 3a1ba61621..eb17c80e4f 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -15,7 +15,9 @@ FREERDP_CPE_ID_VENDOR = freerdp
 
 FREERDP_INSTALL_STAGING = YES
 
-FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
+FREERDP_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -Wno-incompatible-pointer-types" \
+	-DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
 
 ifeq ($(BR2_PACKAGE_FREERDP_GSTREAMER1),y)
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER_1_0=ON

--===============0334063638244589170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0334063638244589170==--
