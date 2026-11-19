Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF06E606A333
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GZzxWkec;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nI103MRW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47C240C78;
	Thu, 19 Nov 2026 18:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4O_yjV3UDXWd; Thu, 19 Nov 2026 18:32:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D065E40CFD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795113163;
	b=s4yyupiofzEeY/xsEdtalZk7u8J23PYUT5O36GPj+j9Vm6LtGeOjzYLoJ6tZcBQlnlZK
	 rH14GAylinz+tnUeUPr1+sGUx0DcWyBzOpQVvWjyKvWh0PyyRtGkGNEmgZ98XRzNbQYee
	 SP/J3KffCdAt3p3Ba31/8eqDD7Qm8h+FF9H3yejTwMDsN5cp7z8dK2Wva1ibu3gbDcpTY
	 9o3z/tH5fyKUkXL11I3FtlMn6NdQN3MiOpf2Bk/yXEVV98xM2pH7eu1/1kZgoHvffLRXZ
	 FHkywfpcqADtZZxzuSTq9G22xKaXHRUvCzNURVAR4lfNyzVtVSfOK4rVZLt53zJXUgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795113163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=I2C0Mc8RzrjusPwoU564gYgmSJd+oO35nnDRxg56heI=;
	b=CiF8oBwLcwltdDzI/37bsO8+1joARNMLtuNqqCcHN8UOJ2RY8NMfbzs+nG1xiU8HihmX
	 2dTkD6WVeOmDL1z0tSNzogH3ythM1PSCszv0KMQflOAWTi6q8Z+GyhYBUPUTPoNulLfQw
	 nJ5C/f7EUKWRHVs5MZRGrT8QyGAzGI1P1kL19R+lzanaOmaoeYRd+bmNrVxMcz9ASTXrG
	 cYy46cv7QQ25jcPXo76SP3AvW3tzOTqHH+n4v8Fl4hCWEKqjpq7lKPRqfkAdVPDTOi85V
	 hxXx8zfGLoZurDt7eyhmweL7JkM3OkYUK9/quhmAV8oNTRCGcm8YspwN2iQ0olqcTPg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nI103MRW;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795113162;
	bh=I2C0Mc8RzrjusPwoU564gYgmSJd+oO35nnDRxg56heI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GZzxWkecey9eqMtdA7H0UYYDLYjpntd/9qzGg4t+IIHappFpTBwH8Dm5BZs7yCBRX
	 ZggMBE0d4UHeTY6weWo7BVdnnLBU9pHMoEhg6SVzyRoNs4oMnlqEDFRl79FdI1z+kj
	 RPbIaUU9qYDl3ZiotcF7WX7fKx/DStZwaBG7I3WJyvN9U6WhJoMEDXhgIA9uoT4zup
	 6HhVAk3uWDvAQCOt3olCMfIoi0wJBMTsqIk71D+xa6cqDVSaF4NwTDvBgK9EbY2//A
	 ApYZsnmdJhvw33xyCquQAc6Ohg1nMpRyTRFZ1EFgIZT3DxSQd6cBAlV/6CM05uh586
	 5Y+BoS/vuiTlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D065E40CFD;
	Thu, 19 Nov 2026 18:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCB9222B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 18:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE4A540CE8
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 18:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pi5JPrlnof0V for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 18:32:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EBDDE40C78
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nI103MRW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBDDE40C78
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795113154;
 bh=iI+UHMe1MbZ5DpoGN1+GG8E3Y58OaJWi8TGYjigJ3bE=;
 h=From:To:Subject:Date:From;
 b=nI103MRWQw/DfVuj2poxyVaJ31SU/xOfC2akFA9RrtYAfV1YtSyBsoeISdxpAyhFl
 XTCApvCLpjtacDnd+urSKgZ+q/VvZRAepoVpAGPX7vyVyGORItLvWYySQmO5TPpkKs
 Zf/m1aRh4aQ53BIPiYWP47KKyHHa5QmV8TqBfJXlf2am9Mor+HjutkuuCgdZQQKGcx
 xxto1yqUTpayVzdl3vJ+sK77Gq8uJjNrvW5tWEniO40xxb2rd9XWcSUsQGpsMKgtl1
 D80xUNBwG8GSjtmcN2Dsd0SQFDqo++pB51deW1C6qDRpAGK1SaYW3fim17Ozj21wWd
 6rvhHl8NiMPkA==
X-KAS-Sym: v3:f51bdf72230551df:TSa8ieJ6irfK5U2/mm+eNW56BaMP2cR0NeR84UaenMjjz
 EQMgGhFMTusJ5s+1xm6+3atORt1fF7XvbEkS7Cz+UWa0Nlqfkeef99MyHMGPwZIDO8lp/7lG3V7
 nkWDnINeWC4cRlqIz7FJTMLqD+Q8WrjbjFrq6LMRAQI/oSL0IuFkm0GJ1qxBzphbiTj5bUVE2SZ
 xkKUgSdIl3OVVRCOlHhFVVte6nppg0VTrcdOIEQv5R3wlkSLq/VScGWYsx/9LohT87XOG4iDpkz
 mnAWV5zL2q43C1UBK1K7QyncDpxwMmLx8nbCS6aewe4F+sjQ0kBG+5+VOELZks6XYg913sqg==:
 l3kf9naj6TFjkpiXhrSM371zTsriwW0kitxa6m40okX/Azjj3U1Aj5S1dc54993+MZbSW6GVhj/
 zqb4eXMlLTQChVyqY3PZNvNaAFmSpqHi3MGm1Zx17ZyFvQqhnz6uu8iq0SQefFzZ45aWTZG5ahu
 BHp69pBKq/tjZrxy/RFNsyTCCDQHctLotl8jEx+Yqnnc8THY4/SRI3W5ub5ZcVoZDnDtPYJOysa
 o0aXyn2PsHBOGlPC4glKGWSdjV+MwpCqLSNEPBv23NxSR8xxylr0TPlmVMPrRfmAuqWEPAQUn5h
 2nnE3GU4tRCPriqlDEHXkryyve5oX8UNCAHncE9eX1019xZshDfGqrLcx33Sty2p68x9xbDYrLI
 e8JbOzxwHF23RcpTp5O/cjSeFqVXHRMVIiJzvThaGWSHEZS6VLsvKhKSjoDfS8+Z5da3WyDPWLt
 /uVgw3mljULm5JhbvgODEvD8IVc+6N+7yqA+hzwZfxaZ0S1JPX50rWuAJN2qx3q2XEY4qh08Nvh
 cM0ZYED7MFk8G4tZhVwqho3tt6AnBSPU4IVgni3PD+PTGb0Hc8LBJfb+9SkS+iBGR7zLvM54DNB
 ZBMD7g==
Received: from fli4l.lan.fli4l (p5b3a08f3.dip0.t-ipconnect.de [91.58.8.243])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13C2BA4C4D37
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 19:32:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45442)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xU6vw-000000002d5-2Mqz
 for buildroot@buildroot.org; Thu, 19 Nov 2026 18:32:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 19:32:32 +0100
Message-ID: <20261119183232.3819338-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: security bump version
 to 1.11.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/signalwire/freeswitch/releases/tag/v1.11.4
"This is an important release containing critical security fixes [...]"

Removed patch which are included in this release.

Added dependencies to libminiupnpc & libnatpmp due to upstream commits:
https://github.com/signalwire/freeswitch/commit/7481baed1886ed6505227e23a184ec85ed55d201
https://github.com/signalwire/freeswitch/commit/f7ec023dc1a1694f34cd72ee6e670197abf136e6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/83983ac3717a07ead12bebda6dd5f40cea9f8610

with the exception of bootlin-aarch64-glibc-old:
https://gitlab.com/bkuhls/buildroot/-/jobs/18194623942

  ./.libs/libfreeswitch.so: undefined reference to `getentropy'

Freeswitch added the usage of getentropy in version 1.11.0:
https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b

getentropy was added in glibc 2.25
https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116

causing a build error with bootlin-aarch64-glibc-old which is based on
glibc 2.24. I found no way to disable freeswitch for this toolchain.

 ...ld.patch => 0002-apr-fix-musl-build.patch} |   0
 ...mod_av-Add-support-for-FFmpeg-8-3250.patch | 157 ------------------
 ...obe-TLS_method-to-detect-libssl-Ope.patch} |   0
 ...tem-Fix-build-against-OpenSSL-4-3185.patch |  67 --------
 package/freeswitch/Config.in                  |   6 +-
 package/freeswitch/freeswitch.hash            |   4 +-
 package/freeswitch/freeswitch.mk              |   4 +-
 7 files changed, 10 insertions(+), 228 deletions(-)
 rename package/freeswitch/{0003-apr-fix-musl-build.patch => 0002-apr-fix-musl-build.patch} (100%)
 delete mode 100644 package/freeswitch/0002-mod_av-Add-support-for-FFmpeg-8-3250.patch
 rename package/freeswitch/{0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch => 0003-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch} (100%)
 delete mode 100644 package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch

diff --git a/package/freeswitch/0003-apr-fix-musl-build.patch b/package/freeswitch/0002-apr-fix-musl-build.patch
similarity index 100%
rename from package/freeswitch/0003-apr-fix-musl-build.patch
rename to package/freeswitch/0002-apr-fix-musl-build.patch
diff --git a/package/freeswitch/0002-mod_av-Add-support-for-FFmpeg-8-3250.patch b/package/freeswitch/0002-mod_av-Add-support-for-FFmpeg-8-3250.patch
deleted file mode 100644
index 5596f834e5..0000000000
--- a/package/freeswitch/0002-mod_av-Add-support-for-FFmpeg-8-3250.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From 9fdd2cdfaf3662740fbac6a406cc7c451c7ec0b4 Mon Sep 17 00:00:00 2001
-From: Andrey Volk <andywolk@gmail.com>
-Date: Wed, 28 Oct 2026 18:27:37 +0300
-Subject: [PATCH] [mod_av] Add support for FFmpeg 8 (#3250)
-
-Upstream: https://github.com/signalwire/freeswitch/commit/9fdd2cdfaf3662740fbac6a406cc7c451c7ec0b4
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/mod/applications/mod_av/avcodec.c  | 17 ++++++++++----
- src/mod/applications/mod_av/avformat.c | 32 ++++++++++++++++++--------
- src/mod/applications/mod_av/mod_av.h   |  1 +
- 3 files changed, 36 insertions(+), 14 deletions(-)
-
-diff --git a/src/mod/applications/mod_av/avcodec.c b/src/mod/applications/mod_av/avcodec.c
-index a9d449b562..20f9abe719 100644
---- a/src/mod/applications/mod_av/avcodec.c
-+++ b/src/mod/applications/mod_av/avcodec.c
-@@ -42,6 +42,13 @@
- #include <libavutil/opt.h>
- #include <libavutil/imgutils.h>
- 
-+/* AV_PROFILE_* replaced FF_PROFILE_* in FFmpeg 6.1, FFmpeg 8 removed the latter */
-+#ifndef AV_PROFILE_H264_BASELINE
-+#define AV_PROFILE_H264_BASELINE FF_PROFILE_H264_BASELINE
-+#define AV_PROFILE_H264_MAIN FF_PROFILE_H264_MAIN
-+#define AV_PROFILE_H264_HIGH FF_PROFILE_H264_HIGH
-+#endif
-+
- int SLICE_SIZE = (SWITCH_DEFAULT_VIDEO_SIZE + 100);
- 
- #define H264_NALU_BUFFER_SIZE 65536
-@@ -530,7 +537,7 @@ static void init_profile(avcodec_profile_t *aprofile, const char *name)
- 	aprofile->decoder_thread_count = avcodec_globals.dec_threads;
- 
- 	if (!strcasecmp(name, "H264")) {
--		aprofile->ctx.profile = FF_PROFILE_H264_BASELINE;
-+		aprofile->ctx.profile = AV_PROFILE_H264_BASELINE;
- 		aprofile->ctx.level = 31;
- #ifdef AV_CODEC_FLAG_PSNR
- 		aprofile->ctx.flags |= AV_CODEC_FLAG_PSNR;
-@@ -2071,7 +2078,7 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
- 
- 	ctx = &aprofile->ctx;
- 
--	ctx->profile = FF_PROFILE_H264_BASELINE;
-+	ctx->profile = AV_PROFILE_H264_BASELINE;
- 	ctx->level = 31;
- 
- 	for (param = switch_xml_child(profile, "param"); param; param = param->next) {
-@@ -2094,11 +2101,11 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
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
-diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
-index d617a52dfe..92ec9ed9cf 100644
---- a/src/mod/applications/mod_av/avformat.c
-+++ b/src/mod/applications/mod_av/avformat.c
-@@ -281,6 +281,24 @@ GCC_DIAG_ON(deprecated-declarations)
- #endif
- }
- 
-+static inline int av_get_ticks_per_frame(AVCodecContext *c)
-+{
-+#if (LIBAVCODEC_VERSION_MAJOR < LIBAVCODEC_8_V)
-+	int ticks;
-+
-+GCC_DIAG_OFF(deprecated-declarations)
-+	ticks = c->ticks_per_frame;
-+GCC_DIAG_ON(deprecated-declarations)
-+
-+	return ticks;
-+#else
-+	/* FFmpeg 8 removed ticks_per_frame, which decoders of field based codecs set to 2 */
-+	const AVCodecDescriptor *desc = avcodec_descriptor_get(c->codec_id);
-+
-+	return (desc && (desc->props & AV_CODEC_PROP_FIELDS)) ? 2 : 1;
-+#endif
-+}
-+
- static char *const get_error_text(const int error, char *error_buffer, switch_size_t error_buflen)
- {
- 	av_strerror(error, error_buffer, error_buflen);
-@@ -637,12 +655,14 @@ static switch_status_t add_stream(av_file_context_t *context, MediaStream *mst,
- 		c->rc_initial_buffer_occupancy = buffer_bytes * 8;
- 
- 		if (codec_id == AV_CODEC_ID_H264) {
-+#if (LIBAVCODEC_VERSION_MAJOR < LIBAVCODEC_8_V) /* FFmpeg 8 removed ticks_per_frame */
- #if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
- GCC_DIAG_OFF(deprecated-declarations)
- #endif
- 			c->ticks_per_frame = 2;
- #if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
- GCC_DIAG_ON(deprecated-declarations)
-+#endif
- #endif
- 
- 			c->flags|=AV_CODEC_FLAG_LOOP_FILTER;   // flags=+loop
-@@ -1431,7 +1451,7 @@ static switch_status_t open_input_file(av_file_context_t *context, switch_file_h
- 		switch_goto_status(SWITCH_STATUS_FALSE, err);
- 	}
- 
--#if (LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
-+#if (LIBAVFORMAT_VERSION_MAJOR >= LIBAVFORMAT_7_V)
- 	handle->seekable = !(context->fc->iformat->flags & AVFMT_NOTIMESTAMPS);
- #else
- 	handle->seekable = context->fc->iformat->read_seek2 ? 1 : (context->fc->iformat->read_seek ? 1 : 0);
-@@ -3240,21 +3260,15 @@ static switch_status_t av_file_read_video(switch_file_handle_t *handle, switch_f
- 
- 	if ((c = av_get_codec_context(mst)) && c->time_base.num) {
- 		cp = av_stream_get_parser(st);
--#if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
--GCC_DIAG_OFF(deprecated-declarations)
--#endif
--		ticks = cp ? cp->repeat_pict + 1 : c->ticks_per_frame;
-+		ticks = cp ? cp->repeat_pict + 1 : av_get_ticks_per_frame(c);
- 		// mst->next_pts += ((int64_t)AV_TIME_BASE * st->codec->time_base.num * ticks) / st->codec->time_base.den;
- 	}
- 
- 	if (!context->video_start_time) {
- 		switch_log_printf(SWITCH_CHANNEL_LOG, SWITCH_LOG_DEBUG1, "start: %" SWITCH_INT64_T_FMT " ticks: %d ticks_per_frame: %d st num:%d st den:%d codec num:%d codec den:%d start: %" SWITCH_TIME_T_FMT ", duration:%" SWITCH_INT64_T_FMT " nb_frames:%" SWITCH_INT64_T_FMT " q2d:%f\n",
--			context->video_start_time, ticks, c ? c->ticks_per_frame : -1, st->time_base.num, st->time_base.den, c ? c->time_base.num : -1, c ? c->time_base.den : -1,
-+			context->video_start_time, ticks, c ? av_get_ticks_per_frame(c) : -1, st->time_base.num, st->time_base.den, c ? c->time_base.num : -1, c ? c->time_base.den : -1,
- 			st->start_time, st->duration == AV_NOPTS_VALUE ? context->fc->duration / AV_TIME_BASE * 1000 : st->duration, st->nb_frames, av_q2d(st->time_base));
- 	}
--#if ((LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_6_V && LIBAVFORMAT_VERSION_MINOR >= LIBAVFORMAT_61_V) || LIBAVFORMAT_VERSION_MAJOR == LIBAVFORMAT_7_V)
--GCC_DIAG_ON(deprecated-declarations)
--#endif
- 
-  again:
- 
-diff --git a/src/mod/applications/mod_av/mod_av.h b/src/mod/applications/mod_av/mod_av.h
-index 8152a77a81..92a6caaaa3 100644
---- a/src/mod/applications/mod_av/mod_av.h
-+++ b/src/mod/applications/mod_av/mod_av.h
-@@ -43,6 +43,7 @@
- #define LIBAVCODEC_V 59 /* FFmpeg version >= 5.1 */
- #define LIBAVCODEC_6_V 60 /* FFmpeg version >= 6.0 */
- #define LIBAVCODEC_7_V 61 /* FFmpeg version >= 7.0 */
-+#define LIBAVCODEC_8_V 62 /* FFmpeg version >= 8.0 */
- #define LIBAVCODEC_61_V 31 /* FFmpeg version >= 6.1 */
- #define LIBAVFORMAT_V 59 /* FFmpeg version >= 5.1 */
- #define LIBAVFORMAT_6_V 60 /* FFmpeg version >= 6.0 */
--- 
-2.47.3
-
diff --git a/package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch b/package/freeswitch/0003-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
similarity index 100%
rename from package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
rename to package/freeswitch/0003-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
diff --git a/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch b/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
deleted file mode 100644
index 63e15ff3c0..0000000000
--- a/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Andrey Volk <andywolk@gmail.com>
-Date: Thu, 24 Sep 2026 00:31:38 +0300
-Subject: [PATCH] [Build-System] Fix build against OpenSSL 4 (#3185)
-
-Upstream: https://github.com/signalwire/freeswitch/commit/fd1cab5117cd4c711293439354885a559ef783bb
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- configure.ac           |  6 +++++-
- src/switch_core_cert.c | 13 ++++++++++---
- 2 files changed, 15 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ae42b22f6f..16af18ce2d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1726,7 +1726,11 @@ if test x$HAVE_OPENSSL = x1; then
- 	openssl_CFLAGS="$openssl_CFLAGS -DHAVE_OPENSSL";
- 	APR_ADDTO(SWITCH_AM_CFLAGS, -DHAVE_OPENSSL)
- 	AC_CHECK_LIB(ssl, SSL_CTX_set_tlsext_use_srtp, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS_SRTP, 1, HAVE_OPENSSL_DTLS_SRTP), AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated developement headers required]))
--	AC_CHECK_LIB(ssl, DTLSv1_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS), AC_MSG_ERROR([OpenSSL >= 1.0.1e and associaed developement headers required]))
-+	dnl DTLS_method is what the code calls from OpenSSL 1.1.0 on; DTLSv1_method is
-+	dnl the pre 1.1.0 spelling, deprecated since and gone from OpenSSL 4.
-+	AC_CHECK_LIB(ssl, DTLS_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS),
-+		[AC_CHECK_LIB(ssl, DTLSv1_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS),
-+			AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated development headers required]))])
- 	AC_CHECK_LIB(ssl, DTLSv1_2_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLSv1_2_method, 1, [DTLS version 1.2 is available]))
- else
- 	AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated developement headers required])
-diff --git a/src/switch_core_cert.c b/src/switch_core_cert.c
-index 218016e63b..174a2b1809 100644
---- a/src/switch_core_cert.c
-+++ b/src/switch_core_cert.c
-@@ -496,7 +496,12 @@ static int mkcert(X509 **x509p, EVP_PKEY **pkeyp, int bits, int serial, int days
- 	X509_gmtime_adj(X509_get_notAfter(x), (long)60*60*24*days);
- 	X509_set_pubkey(x, pk);
- 
--	name = X509_get_subject_name(x);
-+	/* OpenSSL 4 hands out the certificate's own name as const, so build one
-+	 * here and set it instead of filling in the one inside the certificate.
-+	 */
-+	if ((name = X509_NAME_new()) == NULL) {
-+		goto err;
-+	}
- 
- 	/* This function creates and adds the entry, working out the
- 	 * correct string type and performing checks on its length.
-@@ -505,11 +510,13 @@ static int mkcert(X509 **x509p, EVP_PKEY **pkeyp, int bits, int serial, int days
- 	X509_NAME_add_entry_by_txt(name, "C", MBSTRING_ASC, (unsigned char *)"US", -1, -1, 0);
- 	X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, (unsigned char *)"FreeSWITCH", -1, -1, 0);
- 
--
- 	/* Its self signed so set the issuer name to be the same as the
-- 	 * subject.
-+	 * subject. Both calls copy the name, so ours is ours to free.
- 	 */
-+	X509_set_subject_name(x, name);
- 	X509_set_issuer_name(x, name);
-+	X509_NAME_free(name);
-+	name = NULL;
- 
- #if OPENSSL_VERSION_NUMBER >= 0x30000000
- 	if (!X509_sign(x, pk, EVP_sha256())) {
--- 
-2.47.3
-
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index ad54efc0cb..f31c0c310d 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -1,12 +1,15 @@
 config BR2_PACKAGE_FREESWITCH
 	bool "freeswitch"
+	depends on !BR2_BINFMT_FLAT # libnatpmp
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
+	depends on !BR2_STATIC_LIBS # apr (included in freeswitch source), libnatpmp
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr, included in freeswitch source
 	depends on BR2_USE_WCHAR # uses wchar_t
 	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBMINIUPNPC
+	select BR2_PACKAGE_LIBNATPMP
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_OPENSSL
@@ -42,6 +45,7 @@ config BR2_PACKAGE_FREESWITCH_OPENCV4
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 
 comment "freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar"
+	depends on !BR2_BINFMT_FLAT
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index eb7cfc32de..790b12d920 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.3.-release.tar.xz.sha256
-sha256  4c93cbce869cf928bc9e8b3a48fe40337199b348ab668def77e3f739796a3852  freeswitch-1.11.3.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.4.-release.tar.xz.sha256
+sha256  3169209deedc4e5675c97a7c0334ccfdd4cf27fba7f73f8d17f1329b150da90b  freeswitch-1.11.4.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 6d46cbed23..909d1208c6 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.11.3
+FREESWITCH_VERSION = 1.11.4
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # 0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
@@ -29,6 +29,8 @@ FREESWITCH_DEPENDENCIES = \
 	host-pkgconf \
 	jpeg \
 	libcurl \
+	libminiupnpc \
+	libnatpmp \
 	openssl \
 	pcre2 \
 	spandsp \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
