Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C69E8305F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 07:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F7340B00;
	Tue,  3 Feb 2026 07:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Mpw8cqQgSHg; Tue,  3 Feb 2026 07:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7286140B03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770104826;
	bh=gXvZPukIXmrJi5VtRyN7UWHkcDo+eWaUHpgYacT78Us=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HfzCygt/oOn0smWcf5HjF8cKQD7juYeH1JRaVzsbOp2CrRGES0z8tyutrmYgj6Fls
	 ofQRCmwcHyN2u1MoloSDEaOMgKtM6XmaAJpla/H7SZaOXJqqdqC8Z5Q4NiX8nporg3
	 /J09+efGcpucGAhsCX9qETsJTALeHf15V8rjr4Zm+wLyo92VoZbDDNvctZ7MXHyrP4
	 4JMdGQNRWTqa4qG8h17Q2OsjUfOtY65YesHYMGK7qFbVbLGfPgFJrvSF+lkT3VLAep
	 bUa8RnwEuad+zOx4Z0d1AO4M3QhMa72QjhmbZiuBTOeUrRgKgzGDByWK2cc+O1HO29
	 71/aIttdWaffA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7286140B03;
	Tue,  3 Feb 2026 07:47:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6C2634C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8463481747
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwQnk-zvEB7m for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BD8816E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6BD8816E1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A094F86537; Tue,  3 Feb 2026 07:47:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 08:46:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53b95def9e8ebb14349e599e94c4f55c7ca010b2
X-Git-Newrev: d35664ad35e9ade271e1358b92f700c1b7a78558
X-Patchwork-Hint: ignore
Message-Id: <20260203074701.A094F86537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6multimedia: fix build with
 ffmpeg 8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d35664ad35e9ade271e1358b92f700c1b7a78558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6multimedia/0001-ffmpeg8.patch | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/qt6/qt6multimedia/0001-ffmpeg8.patch b/package/qt6/qt6multimedia/0001-ffmpeg8.patch
new file mode 100644
index 0000000000..9bbeb9e135
--- /dev/null
+++ b/package/qt6/qt6multimedia/0001-ffmpeg8.patch
@@ -0,0 +1,39 @@
+From 9670d9e5eb7acb9efb0f2f1a798a09baace53d82 Mon Sep 17 00:00:00 2001
+From: Tim Blechmann <tim.blechmann@qt.io>
+Date: Mon, 2 Jun 2025 09:56:57 +0800
+Subject: FFmpeg: 7.2 compile fix
+
+AV_CODEC_CAP_SUBFRAMES was deprecated without replacement and removed.
+
+Pick-to: 6.8 6.5
+Change-Id: I45ac1d0d603f88701bdb727a7a472cfea8f32d5d
+Reviewed-by: Pavel Dubsky <pavel.dubsky@qt.io>
+Reviewed-by: Tim Blechmann <tim.blechmann@qt.io>
+(cherry picked from commit 65b11b9f97632101041134e04713697b17819884)
+Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
+(cherry picked from commit ef866d101e58832f0bf86150ed8328e2d3ec9c49)
+
+Upstream: https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?h=6.9.2&id=9670d9e5eb7acb9efb0f2f1a798a09baace53d82
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp b/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
+index c154fd835..360a33909 100644
+--- a/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
++++ b/src/plugins/multimedia/ffmpeg/qffmpegcodecstorage.cpp
+@@ -99,7 +99,9 @@ void dumpCodecInfo(const Codec &codec)
+         { AV_CODEC_CAP_DR1, "DRAW_HORIZ_DR1" },
+         { AV_CODEC_CAP_DELAY, "DELAY" },
+         { AV_CODEC_CAP_SMALL_LAST_FRAME, "SMALL_LAST_FRAME" },
++#ifdef AV_CODEC_CAP_SUBFRAMES
+         { AV_CODEC_CAP_SUBFRAMES, "SUBFRAMES" },
++#endif
+         { AV_CODEC_CAP_EXPERIMENTAL, "EXPERIMENTAL" },
+         { AV_CODEC_CAP_CHANNEL_CONF, "CHANNEL_CONF" },
+         { AV_CODEC_CAP_FRAME_THREADS, "FRAME_THREADS" },
+-- 
+cgit v1.2.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
