Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D0C606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A8E/NTJq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D44F405BD;
	Sun,  1 Nov 2026 16:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_li_KeWTWkg; Sun,  1 Nov 2026 16:57:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 52EF5405BF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552238;
	b=n8ArTgsHvfF6oCxwlPext411KH+AQehY4odUJv4nWpJLziVsTC21R9B7UzatJQe5DGhf
	 5m6UrllddTsLV2KixVkiAqsxX3R400fa7QdnOVVXBhKf0BwwXHwAXcsfwJON4AE//MCpS
	 jZZlHkAlXXLaEsD4WnMmlAxA3LN10xqIAnttlyepNRDtbCC+MACUWqbHLmqMPauq3fs9y
	 KDkCVY8NpyWoTvQ4moYM1/fqwCaG/0xZ2/3+e4pBoHT56SXnnHhwQAd4/TRfrDetHiVmd
	 CB9MhjiDxqZJ7Gt2tX1auAKF9FH+6tUHabM+TMRaB4yLjD92dMTPWcjpQhC11iBqT1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552238;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F4HEK1kyaxq43wmQX2tVS3EabAB7xcGsY+sU3smFIAA=;
	b=aWzYh9N2e/b9Wo/33VPzQRePfOCUopWr5xGQHkb8Su9Fzp8/rwteUY0Y8xbR6pcg3p9d
	 5i3T/0N+YU+wwu/3Z9GECc4J8rndeQVEXAaYK70TDJKnvZAGbqYbO48jNEkSGXdshrIdS
	 wlVTBhFwGzCnYOo3tJaykTr/FYHCaguJZc7ame8iMiK0oSaUwXSiXFRqEf1x9Aso+T59b
	 GDuFBE4nTqDSWID9IGmnvz2KmQzPHO4Zow7Mt6Mjzrdlb7PogX+9OTWPCPI594JZjzGpg
	 j41KKimPLZ5V3Att9o5nCGvKaAJjzLFafxKXasE06S29Y+OMXBS12ro91d2CCwo7sFA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552238;
	bh=F4HEK1kyaxq43wmQX2tVS3EabAB7xcGsY+sU3smFIAA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A8E/NTJq5M9Ll1TwEEzlpUgGamh1X91F/FbZypd47Rwu5j0N8j4f+gRiVo4ZJafU0
	 P+7dl7GGBkNprY/Tcx7dLwmAZoQpUlpNafxkUDQAFWvXjN7wr0Z584OAHnf9oufMF0
	 UUMfhCbkDjRopCYaE9U/vToeBUz4Qo9kb8lskwOOAkamU2lNrGJtW6oA3zAL75FH6a
	 9gA2nDxsxb/RrPZnq+c6/1KisyRh6s/q7Yf6dfbcZXdfH8fBxkVRM0PY3UWccUFkoY
	 WGxjU03U2GVLG6wF8c5p1XBJTAOFXKDx2tHrZeNZ2imr+WPO+iyjwU4GjhzRJEEWbj
	 cDsLEgKw1t5ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52EF5405BF;
	Sun,  1 Nov 2026 16:57:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C70EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2EF0405C2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6v9C9bC9RHiY for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BDCB405BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552235;
 b=iFkdGnnwoX67FiIJ6DEfSDhZS+YpRx/s8sX50dhilVGA9HquyBFSN+xCiqkPuSWPWj84
 MSkOU5uf20EFKKN/q8daUJZIZReDT4747lJDMtWodSMqizrCsmRI8mqVJoFjXAG7usTiN
 0c1uZd/Xp8ydk/Bp4MQ9VVmMV03KIbiVm8qQmajn6BIbN+I4YcrpTK/GiCqEsVI+uZfxf
 QXQNxwBjl474JHiaxfUywuf/fuXcYKHi8DsSrva/65CiAZXdgytvBA8OIbZa2ZC0IzLZR
 dSoGgRxdMB+Q2RSjs6OT6Ud5ucBQ458wOthYzbPLlK0cOYwS4P/Ca0mQf2E2mj3Viqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552235;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7EhIfYTCjI5Q1mlJc2YD0+dZgTZvfxw3EqVle0yLSjE=;
 b=qj1tKr/n0tDZ8cTcWG5asItwBr39xtr4jFG/dwB07Tr/qRdeKxXDhbcx3E3FSIz02V2c
 ZC2UaTDNDW0kFmu+yWo68R/LW7iGqpd36cSZQSH6GutXFUfemqwKFSEBiY/CY47YxOd/1
 fg7+VuwqKnmyYiAsFWsgkMxp0QWzfYGJyXbyODqLZkaZpPm/Ex1iB1g4y4i44nEXNMdFd
 aWZgs92YoEOkZPl8kxzwFcfNtnw9YiSDAO65wQgQ4a3IlJuhRyY5WWS7vxM33u4QsHk/v
 UwdtaOHx95dy21gl+rbHYNk305wdwScNsOFkz2+2ynbMqvk59zldB9YIJzIwif4zYIQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BDCB405BD
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A96B9D4C6; Sun,  1 Nov 2026 16:55:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:53:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79179682ce13540dcc06164f182d5292a6a3a7e5
X-Git-Newrev: 9c4f14c9d65ce61f22277be0844c12af9c6b4913
X-Patchwork-Hint: ignore
Message-Id: <20261101165545.9A96B9D4C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-libav: fix build
 with ffmpeg 9.x
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c4f14c9d65ce61f22277be0844c12af9c6b4913
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-libav-Fix-build-failure-with-FFmpeg-9.0.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch
new file mode 100644
index 0000000000..31899e0a48
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch
@@ -0,0 +1,72 @@
+From be9bdb67f4fc868977f1f74e95b6ebe19ef792ec Mon Sep 17 00:00:00 2001
+From: Reilly Brogan <reilly@reillybrogan.com>
+Date: Tue, 4 Aug 2026 12:09:11 -0500
+Subject: [PATCH] gst-libav: Fix build failure with FFmpeg 9.0
+
+Closes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5251
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/12217>
+
+Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/be9bdb67f4fc868977f1f74e95b6ebe19ef792ec
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ext/libav/gstavviddec.c | 15 +++++++++------
+ ext/libav/gstavvidenc.c | 15 +++++++++------
+ 2 files changed, 18 insertions(+), 12 deletions(-)
+
+diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
+index e21f3e1558..39335d98b1 100644
+--- a/ext/libav/gstavviddec.c
++++ b/ext/libav/gstavviddec.c
+@@ -2677,12 +2677,15 @@ gst_ffmpegviddec_register (GstPlugin * plugin)
+       continue;
+ 
+     /* no quasi codecs, please */
+-    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO ||
+-        in_plugin->id == AV_CODEC_ID_V210 ||
+-        in_plugin->id == AV_CODEC_ID_V210X ||
+-        in_plugin->id == AV_CODEC_ID_V308 ||
+-        in_plugin->id == AV_CODEC_ID_V408 ||
+-        in_plugin->id == AV_CODEC_ID_V410 || in_plugin->id == AV_CODEC_ID_R210
++    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO
++        || in_plugin->id == AV_CODEC_ID_V210
++        || in_plugin->id == AV_CODEC_ID_V210X
++        || in_plugin->id == AV_CODEC_ID_R210
++#if LIBAVCODEC_VERSION_MAJOR < 63
++        || in_plugin->id == AV_CODEC_ID_V308
++        || in_plugin->id == AV_CODEC_ID_V408
++        || in_plugin->id == AV_CODEC_ID_V410
++#endif
+ #if LIBAVCODEC_VERSION_MAJOR < 61
+         || in_plugin->id == AV_CODEC_ID_AYUV
+ #endif
+diff --git a/ext/libav/gstavvidenc.c b/ext/libav/gstavvidenc.c
+index 2ae6a1b451..b8e010e70c 100644
+--- a/ext/libav/gstavvidenc.c
++++ b/ext/libav/gstavvidenc.c
+@@ -1025,12 +1025,15 @@ gst_ffmpegvidenc_register (GstPlugin * plugin)
+       continue;
+ 
+     /* no quasi codecs, please */
+-    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO ||
+-        in_plugin->id == AV_CODEC_ID_V210 ||
+-        in_plugin->id == AV_CODEC_ID_V210X ||
+-        in_plugin->id == AV_CODEC_ID_V308 ||
+-        in_plugin->id == AV_CODEC_ID_V408 ||
+-        in_plugin->id == AV_CODEC_ID_V410 || in_plugin->id == AV_CODEC_ID_R210
++    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO
++        || in_plugin->id == AV_CODEC_ID_V210
++        || in_plugin->id == AV_CODEC_ID_V210X
++        || in_plugin->id == AV_CODEC_ID_R210
++#if LIBAVCODEC_VERSION_MAJOR < 63
++        || in_plugin->id == AV_CODEC_ID_V308
++        || in_plugin->id == AV_CODEC_ID_V408
++        || in_plugin->id == AV_CODEC_ID_V410
++#endif
+ #if LIBAVCODEC_VERSION_MAJOR < 61
+         || in_plugin->id == AV_CODEC_ID_AYUV
+ #endif
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
