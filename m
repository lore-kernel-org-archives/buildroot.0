Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2E5E8305C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 07:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA56D6070C;
	Tue,  3 Feb 2026 07:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVJWV_omPO34; Tue,  3 Feb 2026 07:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B940E60720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770104824;
	bh=8TbXw62/+IerBVphmNdQpYKBB8M9vgOmITwdzpLhe38=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XxAVlBV//O6BM9n6fb4U6Nb9Od5hguLP/lgPV1k+E88CMHnADYmJVHHdexYKTTnkm
	 sxe1VWCWyx2rWiM088iNsAySSH8g84vJVGXNB/Buscp64kz/IYvGX3sQv/w4pgn/84
	 pQcx3/GYLGWVbBmHVRrtba1/u/j2UdX4BrSXJparXvrxL9WQcLYDCvuG0wma2X/Vkv
	 e9ihzrBnrWLdPByCj9wL79eZs15lgPUNxYMnU7PByM5yacwfyn2FdD7DMdkyz8pJdw
	 xlQXQCxQFTNYhBU/fW3mSBXTmtTgjRJ7Wwb7qf+WAueqyGzyooVdsHhU6Y83SSss2b
	 T787NAIl4NDDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B940E60720;
	Tue,  3 Feb 2026 07:47:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA4FF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77DE560720
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITaRJbJidzE0 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB4336070C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB4336070C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94B4786535; Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 08:46:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cb9002e815204b993caa82d1d00d4019ae069b0
X-Git-Newrev: 53b95def9e8ebb14349e599e94c4f55c7ca010b2
X-Patchwork-Hint: ignore
Message-Id: <20260203074701.94B4786535@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix build with ffmpeg
 8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=53b95def9e8ebb14349e599e94c4f55c7ca010b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/0004-ffmpeg8.patch | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/freeswitch/0004-ffmpeg8.patch b/package/freeswitch/0004-ffmpeg8.patch
new file mode 100644
index 0000000000..486231e79c
--- /dev/null
+++ b/package/freeswitch/0004-ffmpeg8.patch
@@ -0,0 +1,52 @@
+From 0ce211af3a3ad0b1060b542d0a92a07dab5d2d59 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 23 Aug 2025 18:15:39 +0200
+Subject: [PATCH] [mod_av] Add support for FFmpeg 8.0
+
+remove deprecated FF_API_FF_PROFILE_LEVEL:
+https://github.com/FFmpeg/FFmpeg/commit/822432769868da325ba03774df1084aa78b9a5a0
+
+Upstream: https://github.com/signalwire/freeswitch/pull/2896
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mod/applications/mod_av/avcodec.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/mod/applications/mod_av/avcodec.c b/src/mod/applications/mod_av/avcodec.c
+index a9d449b562c..9962b821d53 100644
+--- a/src/mod/applications/mod_av/avcodec.c
++++ b/src/mod/applications/mod_av/avcodec.c
+@@ -530,7 +530,7 @@ static void init_profile(avcodec_profile_t *aprofile, const char *name)
+ 	aprofile->decoder_thread_count = avcodec_globals.dec_threads;
+ 
+ 	if (!strcasecmp(name, "H264")) {
+-		aprofile->ctx.profile = FF_PROFILE_H264_BASELINE;
++		aprofile->ctx.profile = AV_PROFILE_H264_BASELINE;
+ 		aprofile->ctx.level = 31;
+ #ifdef AV_CODEC_FLAG_PSNR
+ 		aprofile->ctx.flags |= AV_CODEC_FLAG_PSNR;
+@@ -2071,7 +2071,7 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
+ 
+ 	ctx = &aprofile->ctx;
+ 
+-	ctx->profile = FF_PROFILE_H264_BASELINE;
++	ctx->profile = AV_PROFILE_H264_BASELINE;
+ 	ctx->level = 31;
+ 
+ 	for (param = switch_xml_child(profile, "param"); param; param = param->next) {
+@@ -2094,11 +2094,11 @@ static void parse_profile(avcodec_profile_t *aprofile, switch_xml_t profile)
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
