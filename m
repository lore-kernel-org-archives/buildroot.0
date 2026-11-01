Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2536A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qOBi2CAQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZfferyWj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A6980F6A;
	Sun,  1 Nov 2026 10:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08cJ-n9zpRMB; Sun,  1 Nov 2026 10:45:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0319980F39
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793529957;
	b=S2AqvQpE7E+VMPAcd0O8EcZduBo9GMRwVT/zhQt48irH9Cic0B7Xx6w64WvyMwz4veVm
	 R63Q/FRbqf48M73fysFSsqH2rQzayirSbbWam/SD+mvNpSkPbVgf0OmUn0HB2VNSiaPAC
	 htRN/pafIIRWnc8tlGHYpVOIIfLMKQoMRBWJ3eDagjH95/F6e6W4n7PoyiHWUROEvtOoZ
	 S310R/XGgtr3GGvU2glhKmi9JPwgmMIbOtB0w1JyM/fYYnqMv4MiVDyTXGuUFifT4sfNE
	 XWz8CkO4E+9WuboIzDt2wasIV9Pf19eR/N0peTN/6mzApgHllD1k0+prxLmTWGW1skQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793529957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HpLu6qIQTTz8oQYmPKOL19IQmODiap5FbvBCEVAnYJ0=;
	b=b08wigh1r5B4T4hg+QEJNIZ5ViTONqD5qKWNXjROULM8lyCSs2ldOggn1WjD2OiD81gD
	 A6kolUzxHsqWMd8njV0SsJvNS3tWTsfwawk79PFTqsNA+zorb4tiKkS/6h9m8baL/gyca
	 3+6lrv12kZstn0RFAh8wienTC6xGv6xyUHzSEYG2MmpVEugXiWbuSsI05F6wNeODyGmvX
	 AIUHTdbG/+ff/b1c1cX69PjOh2COWcCNW2a2aQfzd7Av21kRPSrndG2mFUwSq2kvmKw2W
	 KlW4Rv27DgUl0neudx/HHQYk5UtOHUGNRQa0bNX+gFsBv+ddLTx6KhEg3zNVgkPmM5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793529957;
	bh=HpLu6qIQTTz8oQYmPKOL19IQmODiap5FbvBCEVAnYJ0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOBi2CAQ06oyB7CD4B9iBk1Zw8GGSdKrx/VT1FqpJm6yWIY307r7hRqf7X+Hm+cR6
	 wssUxmEjbgH2wbEGHkxbizyh3m975SpokXcgIJYqRx41CxLrCJTCVJVYCnzY6IqeOx
	 YtuRFNBpKYnt4Fc3/wNp/837rFF+VYbKTsbB/diZiDnerSdM7Y7TmnQAge69mTu89D
	 iblK+IvPLL+FTwZyov2rmv2TV5jBVQO6/KqZpW8UxmN5XKFdwt0OWef+oEKFF2hEiO
	 08tAll13nLReyMhR49UGCKAliyp2dcWdEG99GjwXjpXe0yDmd3hEdIl2yv0NQGu0Mv
	 Bm3QitHj6OuvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0319980F39;
	Sun,  1 Nov 2026 10:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DAF72AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FAE86061B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWPz0tIcAb1v for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 10:45:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0AD91605FA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793529954;
 b=Pk5SOCt4e1GA/FwaUkMI9JecmkeGwzFlxJEO8P8YFEx9mWwZe7WOnQn3aQNLE7fKj3fG
 KU5wAtzFLzV/PqdzARmcawqs787XvsYfXW9X7Fjjl+b6ST9VWrJ1mrapohFuPTZ+D1Qs4
 ctuLPnoNb9OsTe3LXoELPECKCjSsW3vjXjDZbHJeLOxquWX3J/It439WQXR5IbIIE2dx9
 bjXhvHuzyaQJaScGUdZSEZQNAFSa57BEiEC5xpRI/3EASUhaz6PoYrCS+VRzZ9Elvluww
 98kXNIdLOQl340Jbz3olOJqKtA9p2N6d+mwnCjTJmyodsl3Adr9WdUOP3nyX2466yLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793529954;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Oq9SJMDbHuGn8rf5kcHVz/511Rf1KJHQnSAfFaeIeAo=;
 b=LO+tqaF9YGPXUsTDD4psoOjMf4iyBkaS7mHjoOxOUvc/alvNTNHAwDhUNi82fkcFqJSg
 0aUUygZZkX+N3qTKZlMNKK9Wrj2tdg/gTobpAZ3RNE/oLi1BAEXpwH5FB21LMKzE37x9r
 w6Tw7alWIkvuV96Ed1nvzLzA5W1Z5HIO8BqR8AX3Mkj8chqNNGGuY0EAzNGwcwwz68NuU
 oFpX3mJPqfGP4OnBBAsOtQLk0iEpkf6au6OljQG3iHiZDNT/Ewb+NLVJ0nwmLYYwlkyOR
 djmPr9HrOtREN7gxXrC+FOj95LFhOQSuCZh0KdT3KEtOzTL12/lhjguIZoHdGbpqIsg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZfferyWj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZfferyWj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AD91605FA
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793529936;
 bh=Oq9SJMDbHuGn8rf5kcHVz/511Rf1KJHQnSAfFaeIeAo=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ZfferyWj13vgAPYdtgi6TVlDj6OEvG701HOFNeSQsgBA55d9slYJ1BEQKthf6g0AS
 ObBb7uDPDbzJy6I2JHAlhqwjeohCK6HZqAznSwkS3JNupMdYxRGZ8GK3Ld5rKiznXq
 hGE18jddjKzY8VQf4QLu/VaAF8rVqETh6H+dc9iXUAze2hoPT7Q6blSULOzhvs49Sx
 awda1T9mg2uyt51uMHlFLzYvtNYBWcf26prOMbyZ4tTC3C+ufhDB1IRqDrYal0Sl/C
 8wcF/gB4J/yH3QzSctEdmk5wM+//Or1nBfQHT0g4SETgBV0/PqBFRNEHwFxHb20Nzl
 8wrjSVTiP5gfw==
X-KAS-Sym: v3:f51bdf72230551df:ucr7yDXRooWdslSDRqcvcYDSgJhetnl3KDrZuVM6Kywq4
 vP2bL/whU08maPRhLd+FSCef9vnSZC35lHpFL2dy21u4T2gVVboWp98rCs80jHag6st+EioXS7x
 fp1tdFDXbDtnJ8UXvra5BJnUbhuXqz+tTX11gLYv3vjqRDHfVO4gddIYzgUm5doC+RyhT4S553c
 gX7leJ6pvw5lR1uI23sElMEqtBgPRpmIqDE3uej1DHjNW/WV+lJfjXj1EqVcMS5k4/qyOz8UK3z
 idTcP8d8stTEAOnneIvM6kNfsA3Jvuz1xX9hDulWnvZzK+fxs2O8TfNboe1TVIItYWk7tWDA==:
 Z5mKqcoOiiPNp53A2QT3f+WqEuWqXsUw/j9EySCwfyLN76L+THBi2k+aspQXKFwBkctzI6sCGw2
 /7OL9wlVU8vTsKks3Ezw6RjuF6nNa0SydTLUoIIOxlq5hIKlAw8pcl7FfcmPJ+H7k6Whb9NJQus
 JbuIpe+yzRJN9umstQ1uAOD8br4G9OZZGvIowsq3GJag5u1dXdlB4Sp9AKbZBxqnrLkgSwbBEWc
 WoNloI6IKBNzZd2bNSvX0vLVORioQdyePq1CkT3mAHwLy/w7P/IMaRxwypX6YGROE7+2jDyBo5d
 zNT12CKLXB5iPNXhBRxzFlxDwBBy988P3PQIua3mFHQa+svkxDC69PejCOq7UM20vBa3H6MjvvS
 QEviftQTqGEEvvHdJ78PXbBkV0ujGGlVTABDpeuOq6M2aPK8Nteb+saXQB9rMa4HuGEZXekkVvr
 JOi8kx0z9SEXYblRlFmzT8pfitceBdm94jqR0tRiTW2y+JgkS4gI/cjwFf8I3aihL9d3o/7UpTj
 iXouQwIfiYjCLwIKhOmwhmamqTUBBG+iXeBIUrIBw7yoykAbp7hWzZTElg9Av2z1KJN9UXQETPC
 CFXqog==
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6193A4C00C6
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:45:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47698)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNT4B-000000004Gs-3K5H
 for buildroot@buildroot.org; Sun, 01 Nov 2026 10:45:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 11:45:30 +0100
Message-ID: <20261101104535.1696412-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101104535.1696412-1-bernd@kuhls.net>
References: <20261101104535.1696412-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/6] package/gstreamer1/gst1-libav: fix build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...av-Fix-build-failure-with-FFmpeg-9.0.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
