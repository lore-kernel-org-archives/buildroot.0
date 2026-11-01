Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B11606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CA3Coe0X;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=EJsXD/Ee
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D42380F40;
	Sun,  1 Nov 2026 10:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxmETUX1ojGw; Sun,  1 Nov 2026 10:45:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9262C80F39
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793529943;
	b=GVEzHhQQCp9/MUWOdF8J55xlIk2j1QWuqIkNMpR7EbiCw7O8EyJH5DgfJV0eFG7DVDfy
	 VIH4NsHWZpcTCeIE4SuRX0qVQdM6FejwM3GsvD9/18IUVc1qGmWnKgRPaVYjmhWv2pE28
	 Nz/1Bjl4b60xo2odYtmZ1Du03QJtkU/B82OpBpngCC9ItOXEyN29KAwhjtc+PsMRdW8D+
	 a8mzaNXi7fcFLwx0YhbfNTR3gEfTEoHPN0o6v9MjS+cf8htbw3eyUIO88pJUjMB9b6MUg
	 LMZnJQzLhR/Bpvbd2sZPSOhTbrpZCjddNOcXQt2fz/RxjmzzGs9GW1MlX0aQkqhpEDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793529943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9W4L7c6lmF51j0W58WRneV3agnQ7B5sRv+mQcv+IzBY=;
	b=WBM2uHNvhjcpzJ5hsq0dixWzt1xc/p9cjtES0yIw2n7PG1YefFTVVO6YO3r2/8h+p+Lp
	 Hu6KSAiOhxX1sBJEcGHjcUJ7SqRdDgrqK+NZ9y1ivF42fY2TmHlos0lHh7RwJQbYEWSHu
	 n1hgeGAF1jBF03p0YWRIF1sIHSaYUAqCS60uBbajQYL+tAZaqUvRN8LF5JgkU0YD/TPNB
	 j4VW+5DF8Q5w3nbQaGDKEDMdYIRIDzyuuye50f9kWrM9hr0CzYQ4peXRTxnbfEcyfYr8t
	 m7mNhbf++QbrqCXvENmMsJxbE6gAKSCOkUxvhROsdkrTFtb9xRCnA+HZnn6KrV4FR1A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793529943;
	bh=9W4L7c6lmF51j0W58WRneV3agnQ7B5sRv+mQcv+IzBY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CA3Coe0XAUmPe/XcvhOM0CilZkglaw9LIXBBo0iV4fH+CcSUgXjc1yYaZ64peSWOK
	 bbx9pEFWzv3AWkHFbobff5Xwt2mIKwJGrc5Ps15E0PZIhfh4OzD+eybxgYStF+tv5x
	 IC1c59xgJ6E2mq1sqyzsqRSaaHSIaS64UDyW4zlzLOoJb/NwYjTuo8XHAOJXKNFv8G
	 3KEA5+3RVicKpLFu21hQVVG2qvt7tAJQVBG+Cluzhx6Hneir83E5gTVpxqwwbC9Z87
	 kV7wkiz7xMPywXeZ5UznGn93rOUQto478fl771kTeMW//++TdBVLUwo+ZqFgpI0MLz
	 nQ8/C1uNa29RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9262C80F39;
	Sun,  1 Nov 2026 10:45:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A071323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FBEE6061B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LExQ57_TCXTN for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 10:45:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B372B605E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793529941;
 b=QXPG48ExUOZXJorJnHaP1kK0I5pbHKQnooXdovdhmtfbIISBoI0c8KOV9WnNYQImh/e4
 +XbfF9tnIEoGTT4qMT19TJkda8MgxCZgHyQqzEuBZKQSXi8kJmKXayOW2xc4K8EWMEuNR
 vkao249Gl0H0/2zBSay53xC9bUTJLo2sFOL+nW2CjDjk+IVYzs1UKRTXMJ8gm6RXrVubF
 f07P0bqP1FyTeLfNUHlKJsJjsv0lri1GyKQQ7XSpaf/K6kogQeEdVavYrK05TrO/koDvD
 PCBNJ8I/DnPsWnjFxEPAP8Qn5L0TB8df4sBLWMU+kEWT/oEB6213TS4ACsUbalfO/IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793529941;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=kzvR63E7nHII+rL+w1FgdRZigg9D3PG7cnBJFtftvCA=;
 b=KUauKZwdbHbQVAw+9LYEKxJrFES13u3r1sABQVksKcrnO1uGvdm+3GGIKyJZrtlCQd8c
 Fc8t/M27eqwayddEROhBm7+hAk5QO1gCnZgSQF1wIHuHbcQdEYXWj562pBBMQ8GY1aQWP
 6WLBiC9psWaZyZ5XdMxGBHO+5SZecAKCrGr2t6Q8jk6YQw8e/cGimJPc8feKa59Johd81
 d4bVH++8kCFUsaSJra+8yoD+pF8OWdPZVBTjNqFVsVkY3FDYA3TpHJzxQQnFkmbHYitjW
 PGaTFi3fv8mPm9gi0PwcaadFNr1M9tez2dK10kXVBsZ93IqZJA+DB18bzhwoxAxfmrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="EJsXD/Ee"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EJsXD/Ee
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B372B605E3
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793529936;
 bh=kzvR63E7nHII+rL+w1FgdRZigg9D3PG7cnBJFtftvCA=;
 h=From:To:Subject:Date:From;
 b=EJsXD/EesM411As4P+2o7lmJtYh/LgZnp2LExbaGqN+rPsJQo4KCIVgywB58t0tgd
 NkZcVKESCMJ0HmEvBKF48MJOuiVGPrYCYS2xW+br2EYgVSk1GNNqdDJlWaIGQ1zL/s
 cDchAmckNtd1MxAjqFTvuA+2usP9g/1i+xG55W5r3cl1I2bQt1MTmQ6FE/omsl3e1d
 7f3hbS5ucMhxhAXaPVKnn/dMXEmBYv2rCQC7vFDPukOfFBzeQfDx5a/H/D3TquSrCG
 UI7rb5JTiQFe3tsNVNLW8QKmkvJTg1r6v1CLKCJlyCnpGjeNfOY9t8mrI02cpug2Pg
 nTQ4xH87/eETA==
X-KAS-Sym: v3:f51bdf72230551df:ucr7yDXRooWdslSDRqcvcYDSgJhetnl3KDrZuVM6Kywq4
 vP2bL/whU08maPRhLd+FSCef9vnSZC35lHpFL2dy21u4T2gVVboWp98rCs80jHag6st+EioXS7x
 fp1tdFDXbDtnJ8UXvra5BJnUbhuXqz+tTX11gLYv3vjqRDHfVO4gddIYzgUm5doC+RyhT4S553c
 gX7leJ6pvw5lR1uI23sElMEqtBgPRpmIqDE3uej1DHjNW/WV+lJfjXj1EqVcMS5k4/qyOz8UK3z
 idTcP8d8stTEAOnneIvM6kNfsA3Jvuz1xX9hDulWnvZzK+fxs2O8TfNboe1TVIItYWk7tWDA==:
 rF/K/YQZYhX31iBW3TdlT4vSYk8e2enXCFw0QQvC0Ne+GJRSZM3M6ymPlkLUeLuJmgqu+OtAni7
 WpqlAlYvWNRL9dFQKzPqIrmAkJe8sVNySGIMLCO5dwDyv34g0jSHRmkKz6UwHEQ3Js0pMmYJ6iM
 T/smhgCoOLhTFHySxWzOGeI9L5QY42A4VPeIyQa0bKGvmcZ4Vl9qGFRSkhuN2ERSskwkml6DHQW
 0XTkq/t6OTsAox9/RfYfET7vLSbRMaZ/XqyLFv3kwWR2hyPKsKYd3rTkvn4TDP21JQHl3RRk0yp
 m/EonFeasH1dHsQs3wsGGuJ3XNHzrBKA30SYDVMUXgrE5OI/McnzyMvM9mLC2qJG9tZW4brrOnj
 GS3+32L4lcDt3B0c1xtsCSUM/UixqED551IIhJF0mSTD4I4WJCOOwi+k4TYFPQZ+0tnpOeH52jG
 vS8UV9b4tXTKZypCeQhxQ6yijT6fhfsCps6sX2JIU7eiFmBUXUKtHORzgt1/X5G3Pjjyn0XILSo
 /sk4D7/Su+cVv4zIhH/SGuDB6amx2vP5uAj1wRpciZESYIU+ASP1Vl83baVnhaSGxFizYDnrNEQ
 /SswFg==
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D05C0A4C00B5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:45:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47698)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNT4B-000000004Gs-2WqG
 for buildroot@buildroot.org; Sun, 01 Nov 2026 10:45:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 11:45:29 +0100
Message-ID: <20261101104535.1696412-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/6] package/freeswitch: fix build with ffmpeg
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

Replaced patch 0002 with new upstream commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/0002-ffmpeg8.patch         |  52 ------
 ...mod_av-Add-support-for-FFmpeg-8-3250.patch | 157 ++++++++++++++++++
 2 files changed, 157 insertions(+), 52 deletions(-)
 delete mode 100644 package/freeswitch/0002-ffmpeg8.patch
 create mode 100644 package/freeswitch/0002-mod_av-Add-support-for-FFmpeg-8-3250.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
