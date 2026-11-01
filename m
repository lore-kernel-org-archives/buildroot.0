Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JOu++HGE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FAFC80CB9;
	Sun,  1 Nov 2026 16:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2Uuv1nQ62Ul; Sun,  1 Nov 2026 16:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CEB9E80CBF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552239;
	b=YXTAtM2DgYX1KJ7pCnjhJ/Ugk57d9pPb4qysxtraPP2TELTtKAmrPlSw/j/S4pMXSMLE
	 BFDZ+LmZVlb5JISQC8wQsnyxN9dz+nguVIU0kDRkvgQUzM6/nJL2KX1Fxpnyf3gOAXBoI
	 rzz7VCmg307QoHTKyTrM4yV9yE7yz98uP54zam5GOe9DejAQKujC60JdyegTfFnlANsbI
	 WpnQoxRXm/WfdQymysRwXCRkkDT87GFaXUoty3JwYa2C2AvotoqbWM6x3K1b98JKjwDFM
	 yS84Q6xHZHJYggO2+YDZLG9QWXpN/ggnfu8WD/UUaKKTIiN16Xus7KoBtlhDUhWRxKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552239;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s2gT3R2Njo0oG9Ejz4EQ3AgHPDsG7x45cpamy4f8/5Y=;
	b=P4MIb6QqjAC1AKhPWwmKL6qEjmnzGTowkE6jeGK9FhzwpMWfUCFvJhPJ3ZtoJERKBEoz
	 muk9q9+WnpIb0Ch6SbSKjpfOxyO36VSEr2xzkin0STlAgPmClSv3EhUbq6FrBUUXGNL60
	 bMe8SW2cPa1JqvlJdkzDzjMRD39e+G51fmy4NNBmSyoYpdINyLg5KxDX+2gv9P69R0/Yg
	 /UTGqQBsuHFxdRPPIeg1WOhElcVAt+pejNzvyoX4kbcFf4G09g5YPRJdeCqvQT6BPQjNV
	 0wMYSv19o3PdUwRHZTmkIlwu1VSxfygeIhWeM9swZaYqPxAqQNYK9cxB+a3TRJGULmQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552239;
	bh=s2gT3R2Njo0oG9Ejz4EQ3AgHPDsG7x45cpamy4f8/5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JOu++HGE6m8lvJUmdIqOifj41pm5HvE7PxY6eib+FO155wi3auXIarkLms8YupB0G
	 TWFC6hvKMnrii08fDqIWiBiyS3g3+T3o6paNsyKbQxxBCp0dgkR3ruwpr6H7U9Dtqg
	 uv3cAAqim29Ok6JcbH0XPdIHR6PNvP6BV04Kay1YGBb3sG0D8yRlxdxR66TYxR+Z6P
	 2/deBYcZyr66X/PGZCeifusCVMbnSttd7E/90nc6OExx/zjACTli17jwjAlQqJkD2J
	 qVrymBxcONTYfDm1Bzwb/I+ebvTI40YWs2OZSsWF27lf3jh/4St0ehoh2F+qWvZlX3
	 bxPy/C8sj0W+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB9E80CBF;
	Sun,  1 Nov 2026 16:57:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D21D0EF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEB036061B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovXvvPMr_NbV for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:57:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D23826060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552234;
 b=BspxUtKXpsY7L0dnNgrA+uHCEUuy9osY2xgEa0B/pU1be8aMKjly086+iy0gG3t3jB7n
 Il0xyp7tX8/axN43CjywrRIEOge8858HWH9pINAZlWzxyuzkVvWMfyf1RhhCyEdf9dXjE
 OWLsXY7WEKyjYpsRZpffFJh+I2IFVej75u/pGni0HWjn3n5Imt5sl/cTPkiL6nxOsFGEF
 eDnGp0E79FrXvkAKoNBxwGWdduNmAA0ChwrtsVq/+xxMRi1N/BVZRG/iAgro/dLm0hgSl
 g9dphG2KlyOsllgPWtivG5h1j7faJWgwhJMylJXrBhJhtbiFVf1ceO4aLX1YwA/v9Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552234;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4bCZAVeWkxeZs0C7Vrwr8KRcqKK5R2NMwBhK29mII6s=;
 b=aGby0Vxzl97OtpaALKl+ReJqkLtvTJtqGnsnrWs8vHP+4DGatom+x/EWPrBEuPIvi34Z
 rNtsXUbfrMjFfyJP98EvsPf8QxJxOfY6pw4nJxtAy32aGkMIh/SCxLAnqU+v/5yeSwFI3
 xFnrgn2eKhdNAYsoiah8FF+vrcO8KE1WrccrRn9W8cjjMH9Yf+/f/W418g5JDllcGqEL8
 oKzK+dyZqCLD1XtP5okbzPaBpYECOfv8bD63wewRqHFmcbj29oaCT7jTiyLwzGb7CPYQg
 ZVWDrHB+ZOkYbksMvpg0aPLLKGFcUPqLZF4PfTgJmm/GsVXdIgG3eAFxg/wU8RVwxIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D23826060C
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DA619D496; Sun,  1 Nov 2026 16:55:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:44:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fabeb8ac213ddbeb182644c8f4324d75b35ddf9a
X-Git-Newrev: 79179682ce13540dcc06164f182d5292a6a3a7e5
X-Patchwork-Hint: ignore
Message-Id: <20261101165545.8DA619D496@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix build with ffmpeg
 8.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79179682ce13540dcc06164f182d5292a6a3a7e5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replaced patch 0002 with new upstream commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/0002-ffmpeg8.patch              |  52 -------
 ...0002-mod_av-Add-support-for-FFmpeg-8-3250.patch | 157 +++++++++++++++++++++
 2 files changed, 157 insertions(+), 52 deletions(-)

diff --git a/package/freeswitch/0002-ffmpeg8.patch b/package/freeswitch/0002-ffmpeg8.patch
deleted file mode 100644
index 486231e79c..0000000000
--- a/package/freeswitch/0002-ffmpeg8.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0ce211af3a3ad0b1060b542d0a92a07dab5d2d59 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 23 Aug 2025 18:15:39 +0200
-Subject: [PATCH] [mod_av] Add support for FFmpeg 8.0
-
-remove deprecated FF_API_FF_PROFILE_LEVEL:
-https://github.com/FFmpeg/FFmpeg/commit/822432769868da325ba03774df1084aa78b9a5a0
-
-Upstream: https://github.com/signalwire/freeswitch/pull/2896
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/mod/applications/mod_av/avcodec.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/mod/applications/mod_av/avcodec.c b/src/mod/applications/mod_av/avcodec.c
-index a9d449b562c..9962b821d53 100644
---- a/src/mod/applications/mod_av/avcodec.c
-+++ b/src/mod/applications/mod_av/avcodec.c
-@@ -530,7 +530,7 @@ static void init_profile(avcodec_profile_t *aprofile, const char *name)
- 	aprofile->decoder_thread_count = avcodec_globals.dec_threads;
- 
- 	if (!strcasecmp(name, "H264")) {
--		aprofile->ctx.profile = FF_PROFILE_H264_BASELINE;
-+		aprofile->ctx.profile = AV_PROFILE_H264_BASELINE;
- 		aprofile->ctx.level = 31;
- #ifdef AV_CODEC_FLAG_PSNR
- 		aprofile->ctx.flags |= AV_CODEC_FLAG_PSNR;
-@@ -2071,7 +2071,7 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
- 
- 	ctx = &aprofile->ctx;
- 
--	ctx->profile = FF_PROFILE_H264_BASELINE;
-+	ctx->profile = AV_PROFILE_H264_BASELINE;
- 	ctx->level = 31;
- 
- 	for (param = switch_xml_child(profile, "param"); param; param = param->next) {
-@@ -2094,11 +2094,11 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
- 
- 			if (ctx->profile == 0 && !strcasecmp(aprofile->name, "H264")) {
- 				if (!strcasecmp(value, "baseline")) {
--					ctx->profile = FF_PROFILE_H264_BASELINE;
-+					ctx->profile = AV_PROFILE_H264_BASELINE;
- 				} else if (!strcasecmp(value, "main")) {
--					ctx->profile = FF_PROFILE_H264_MAIN;
-+					ctx->profile = AV_PROFILE_H264_MAIN;
- 				} else if (!strcasecmp(value, "high")) {
--					ctx->profile = FF_PROFILE_H264_HIGH;
-+					ctx->profile = AV_PROFILE_H264_HIGH;
- 				}
- 			}
- 		} else if (!strcmp(name, "level")) {
diff --git a/package/freeswitch/0002-mod_av-Add-support-for-FFmpeg-8-3250.patch b/package/freeswitch/0002-mod_av-Add-support-for-FFmpeg-8-3250.patch
new file mode 100644
index 0000000000..5596f834e5
--- /dev/null
+++ b/package/freeswitch/0002-mod_av-Add-support-for-FFmpeg-8-3250.patch
@@ -0,0 +1,157 @@
+From 9fdd2cdfaf3662740fbac6a406cc7c451c7ec0b4 Mon Sep 17 00:00:00 2001
+From: Andrey Volk <andywolk@gmail.com>
+Date: Wed, 28 Oct 2026 18:27:37 +0300
+Subject: [PATCH] [mod_av] Add support for FFmpeg 8 (#3250)
+
+Upstream: https://github.com/signalwire/freeswitch/commit/9fdd2cdfaf3662740fbac6a406cc7c451c7ec0b4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mod/applications/mod_av/avcodec.c  | 17 ++++++++++----
+ src/mod/applications/mod_av/avformat.c | 32 ++++++++++++++++++--------
+ src/mod/applications/mod_av/mod_av.h   |  1 +
+ 3 files changed, 36 insertions(+), 14 deletions(-)
+
+diff --git a/src/mod/applications/mod_av/avcodec.c b/src/mod/applications/mod_av/avcodec.c
+index a9d449b562..20f9abe719 100644
+--- a/src/mod/applications/mod_av/avcodec.c
++++ b/src/mod/applications/mod_av/avcodec.c
+@@ -42,6 +42,13 @@
+ #include <libavutil/opt.h>
+ #include <libavutil/imgutils.h>
+ 
++/* AV_PROFILE_* replaced FF_PROFILE_* in FFmpeg 6.1, FFmpeg 8 removed the latter */
++#ifndef AV_PROFILE_H264_BASELINE
++#define AV_PROFILE_H264_BASELINE FF_PROFILE_H264_BASELINE
++#define AV_PROFILE_H264_MAIN FF_PROFILE_H264_MAIN
++#define AV_PROFILE_H264_HIGH FF_PROFILE_H264_HIGH
++#endif
++
+ int SLICE_SIZE = (SWITCH_DEFAULT_VIDEO_SIZE + 100);
+ 
+ #define H264_NALU_BUFFER_SIZE 65536
+@@ -530,7 +537,7 @@ static void init_profile(avcodec_profile_t *aprofile, const char *name)
+ 	aprofile->decoder_thread_count = avcodec_globals.dec_threads;
+ 
+ 	if (!strcasecmp(name, "H264")) {
+-		aprofile->ctx.profile = FF_PROFILE_H264_BASELINE;
++		aprofile->ctx.profile = AV_PROFILE_H264_BASELINE;
+ 		aprofile->ctx.level = 31;
+ #ifdef AV_CODEC_FLAG_PSNR
+ 		aprofile->ctx.flags |= AV_CODEC_FLAG_PSNR;
+@@ -2071,7 +2078,7 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
+ 
+ 	ctx = &aprofile->ctx;
+ 
+-	ctx->profile = FF_PROFILE_H264_BASELINE;
++	ctx->profile = AV_PROFILE_H264_BASELINE;
+ 	ctx->level = 31;
+ 
+ 	for (param = switch_xml_child(profile, "param"); param; param = param->next) {
+@@ -2094,11 +2101,11 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
+ 
+ 			if (ctx->profile == 0 && !strcasecmp(aprofile->name, "H264")) {
+ 				if (!strcasecmp(value, "baseline")) {
+-					ctx->profile = FF_PROFILE_H264_BASELINE;
++					ctx->profile = AV_PROFILE_H264_BASELINE;
+ 				} else if (!strcasecmp(value, "main")) {
+-					ctx->profile = FF_PROFILE_H264_MAIN;
++					ctx->profile = AV_PROFILE_H264_MAIN;
+ 				} else if (!strcasecmp(value, "high")) {
+-					ctx->profile = FF_PROFILE_H264_HIGH;
++					ctx->profile = AV_PROFILE_H264_HIGH;
+ 				}
+ 			}
+ 		} else if (!strcmp(name, "level")) {
+diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
+index d617a52dfe..92ec9ed9cf 100644
+--- a/src/mod/applications/mod_av/avformat.c
++++ b/src/mod/applications/mod_av/avformat.c
+@@ -281,6 +281,24 @@ GCC_DIAG_ON(deprecated-declarations)
+ #endif
+ }
+ 
++static inline int av_get_ticks_per_frame(AVCodecContext *c)
++{
++#if (LIBAVCODEC_VERSION_MAJOR < LIBAVCODEC_8_V)
++	int ticks;
++
++GCC_DIAG_OFF(deprecated-declarations)
++	ticks = c->ticks_per_frame;
++GCC_DIAG_ON(deprecated-declarations)
++
++	return ticks;
++#else
++	/* FFmpeg 8 removed ticks_per_frame, which decoders of field based codecs set to 2 */
++	const AVCodecDescriptor *desc = avcodec_descriptor_get(c->codec_id);
++
++	return (desc && (desc->props & AV_CODEC_PROP_FIELDS)) ? 2 : 1;
++#endif
++}
++
+ static char *const get_error_text(const int error, char *error_buffer, switch_size_t error_buflen)
+ {
+ 	av_strerror(error, error_buffer, error_buflen);
+@@ -637,12 +655,14 @@ static switch_status_t add_stream(av_file_context_t *context, MediaStream *mst,
+ 		c->rc_initial_buffer_occupancy = buffer_bytes * 8;
+ 
+ 		if (codec_id == AV_CODEC_ID_H264) {
++#if (LIBAVCODEC_VERSION_MAJOR < LIBAVCODEC_8_V) /* FFmpeg 8 removed ticks_per_frame */
+ #if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
+ GCC_DIAG_OFF(deprecated-declarations)
+ #endif
+ 			c->ticks_per_frame = 2;
+ #if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
+ GCC_DIAG_ON(deprecated-declarations)
++#endif
+ #endif
+ 
+ 			c->flags|=AV_CODEC_FLAG_LOOP_FILTER;   // flags=+loop
+@@ -1431,7 +1451,7 @@ static switch_status_t open_input_file(av_file_context_t *context, switch_file_h
+ 		switch_goto_status(SWITCH_STATUS_FALSE, err);
+ 	}
+ 
+-#if (LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
++#if (LIBAVFORMAT_VERSION_MAJOR >= LIBAVFORMAT_7_V)
+ 	handle->seekable = !(context->fc->iformat->flags & AVFMT_NOTIMESTAMPS);
+ #else
+ 	handle->seekable = context->fc->iformat->read_seek2 ? 1 : (context->fc->iformat->read_seek ? 1 : 0);
+@@ -3240,21 +3260,15 @@ static switch_status_t av_file_read_video(switch_file_handle_t *handle, switch_f
+ 
+ 	if ((c = av_get_codec_context(mst)) && c->time_base.num) {
+ 		cp = av_stream_get_parser(st);
+-#if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
+-GCC_DIAG_OFF(deprecated-declarations)
+-#endif
+-		ticks = cp ? cp->repeat_pict + 1 : c->ticks_per_frame;
++		ticks = cp ? cp->repeat_pict + 1 : av_get_ticks_per_frame(c);
+ 		// mst->next_pts += ((int64_t)AV_TIME_BASE * st->codec->time_base.num * ticks) / st->codec->time_base.den;
+ 	}
+ 
+ 	if (!context->video_start_time) {
+ 		switch_log_printf(SWITCH_CHANNEL_LOG, SWITCH_LOG_DEBUG1, "start: %" SWITCH_INT64_T_FMT " ticks: %d ticks_per_frame: %d st num:%d st den:%d codec num:%d codec den:%d start: %" SWITCH_TIME_T_FMT ", duration:%" SWITCH_INT64_T_FMT " nb_frames:%" SWITCH_INT64_T_FMT " q2d:%f\n",
+-			context->video_start_time, ticks, c ? c->ticks_per_frame : -1, st->time_base.num, st->time_base.den, c ? c->time_base.num : -1, c ? c->time_base.den : -1,
++			context->video_start_time, ticks, c ? av_get_ticks_per_frame(c) : -1, st->time_base.num, st->time_base.den, c ? c->time_base.num : -1, c ? c->time_base.den : -1,
+ 			st->start_time, st->duration == AV_NOPTS_VALUE ? context->fc->duration / AV_TIME_BASE * 1000 : st->duration, st->nb_frames, av_q2d(st->time_base));
+ 	}
+-#if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
+-GCC_DIAG_ON(deprecated-declarations)
+-#endif
+ 
+  again:
+ 
+diff --git a/src/mod/applications/mod_av/mod_av.h b/src/mod/applications/mod_av/mod_av.h
+index 8152a77a81..92a6caaaa3 100644
+--- a/src/mod/applications/mod_av/mod_av.h
++++ b/src/mod/applications/mod_av/mod_av.h
+@@ -43,6 +43,7 @@
+ #define LIBAVCODEC_V 59 /* FFmpeg version >= 5.1 */
+ #define LIBAVCODEC_6_V 60 /* FFmpeg version >= 6.0 */
+ #define LIBAVCODEC_7_V 61 /* FFmpeg version >= 7.0 */
++#define LIBAVCODEC_8_V 62 /* FFmpeg version >= 8.0 */
+ #define LIBAVCODEC_61_V 31 /* FFmpeg version >= 6.1 */
+ #define LIBAVFORMAT_V 59 /* FFmpeg version >= 5.1 */
+ #define LIBAVFORMAT_6_V 60 /* FFmpeg version >= 6.0 */
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
