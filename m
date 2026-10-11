Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF06CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1336440683;
	Sun, 11 Oct 2026 13:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNZakDqLQUEL; Sun, 11 Oct 2026 13:06:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2461640663
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724019;
	b=jG/qhqLsmImgb2NszHZOU+zION5lL1Toy6zPJi/FjQqnlg7hcKnw1Z1IogogxqsQzCHc
	 LiULFrTGPtzjKgZHWiVTaWSGr1HyXIVsusNCYSro7BHKacD5KluqWL0MqrF7GRWbHxW1G
	 EgkMCb6hM6Z+ymHdlKl8T2zcf1ZNT7IqFAengmlmJthHdtmM5+Y7nHZ5WGwLkS7IncvjP
	 MNNrq4kaNd67SssHsXIt4vpmiMO1oaVtESfocknfZoA+Tisy7G872CPo7SzA+C1eKscND
	 Zu2gEYR7aph3GiJTIv1fVGg8Ipgkjmrqpw4Zn3m9VlgxoZzlwYZzEID9qqy4VgMvNvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724019;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/wvqTOJHzzadmzDP3eCuPRYvoNRqRPuUxJHk3d54lRk=;
	b=htsVXTRCuKZoTlebkEF7TMGLgG0x9xLJ++h9KH21yua+njkTki1ykd56Ewv2O2GM/s2C
	 aZTrOi24QR3alvwnAQgmLnbGuRpiBpqzwQ50UVYVb0df4NoAa9Relwjh+dBvTdBJFeyiA
	 d6ckkL+VlK6A8n1JzhJweDTTmTmP0ivk2iuXuFF9FbkMYh0smNU+v267Hn3Iv+ZUbx3rV
	 0QHJsxz7fy+IUF9IYFCps3sFJAdw/ndJlYMhjJes+Az3Qzpv6+kwXG0uDYOZUeMnBsTQz
	 U90xecl34V2Ii44ktYUcFQFv4IAeReoNcv/8TnZ5W/av2CXvnRJnj9zubM6IccU8KkQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724019;
	bh=/wvqTOJHzzadmzDP3eCuPRYvoNRqRPuUxJHk3d54lRk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qu469W6EShsFF6Dt+qWyHJcygBN0YKJPQA4wfylI7ntfYG7ODiVaOcWYb7g9e0HBV
	 goM+XjSxUSsNjXgh6qoZ5F+/zM8YFwZFJ1JJq1IdvKkBUnKNSZHygCPyUdY/Jd8sl8
	 WMzgEeWh7XHJct1zE1bkCYU7B2gTVGLVuygMrtk6ax6hh8lqyXbcq+8R+lJVytRtPO
	 +/NBkaMXeDl+/Q2iFkavE+GH0d3PFiFxm/RCU+DJHAvNmQKEQU/cg2aPv36AJc5rpa
	 TWtIAB17RVk4sfExAw/6E/6bWoEtUqX0ex1bdbCcDX11ETji+H1MREsluBVFw9vsUk
	 /4LHspVR9V2lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2461640663;
	Sun, 11 Oct 2026 13:06:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0715111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86CD780D93
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE2UBszY8KHs for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:06:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 895D780D91
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724016;
 b=jjlQFELuY8g1NUVrmhuuSGiPQaefD4/sr9gXIZsVdTzJbN/tGO77RL0EL19K0ZBNbyrz
 83h+HLCVgYfncCdSvwS8+qsSqAfVs/P8jEqbnCL/WmFZJiHDuncg5/P2h23v2tTEUK1rC
 dp6uPLU8VklTfsw/5t+lP7IO1sqG28UWzXIb9iJVyTr5umKHuF7cPg/gos4y4e9b0MWx2
 IICc2rCVtuprowveoq1SeOvF+2M2CRvdrXyKzYykL+4uHm5n+W/o381Tnr2MCIhK3duZe
 REAMul0xD36/mvarvrru3XC5Jgu07kRTZSjO4daYIjKggmNl49EAngL9zUJ+sDMbjNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724016;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=x3vfAW92qdIcoqpv6PVbL3hB5HfNKRdn5r5MN1njYy4=;
 b=SA2MviXPM0XznhffDT1A6+hEsQwVBFZGf/Wa9w3SLfxbyVpZrA1P62FsZ4VhhD+0ln5K
 RDs8xQKBvX8sD4jpPlOKx7hTBGi1Q8Dl+4kfLxFq0X9CugOtEpQwdoLwg3k++gNJx+kdL
 ZIm2caOC5gpNSokhbdQxamnMp3+cbDnbNR+9wQ7ctiew/nmqovD7e6Ezv+P6jWJymCoHX
 rpUDGM8zwTDw0SAZ+tEzXKBo4P9vux+O04pNGN+SmCJcdTWDEjQoiBRXVuRwid1YJC0Lp
 z8YmvCv0XBWqS5IBchYkn827C8YYnmh0/B7x9lAuaPpogG8NXCKwyDjmw7zeBRKBQ0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mgefphx4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mgefphx4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 895D780D91
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723663;
 bh=x3vfAW92qdIcoqpv6PVbL3hB5HfNKRdn5r5MN1njYy4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mgefphx4cSZndShZYztdu58Es12d/kE9fwYJ2V7enbfXFOwfKs4YYn2DVSe4YMlVv
 y0E/yk2hzRt3+YWxgdagbf43f2QlvzYkVEyf3iNsxq86rPTyEhnGJoZlFVCGYMY3bD
 Er3PzCLkga1aSfo/qK8EbBLNRZ+S12hOCzA2X2QBChFNFHJkX/4QYxKbKHR0fjTXt6
 vpCaK+WuIROnsEq9Y6h6L3LWg8DZAut0w8vtj5sw7I7o7d8ygXJ1ZKrqForbIizKkg
 NLM0A5tVIq+Lk7CMRwer4MGv+gmTOhPJ9hAI/zCks1lVdbsNA+bxRvyAFS/YTtnyyD
 W8vMSs65te7sA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 bUEjOlr8hgNn0anKRibwpzYJvl1bzKz1hnsfsUES705Sg0h9vYIowJEA16Ff2l//va9bHhyGuol
 WDiht16eYJemvJC4SoZ2ayLOTMQ/Dorc8C/lYllZ8rCiF/0/sLojt4JW0DPROZHQiXWZjjDVFap
 fjhomK2y8ppAmr0UVFtP7gmix/cM3wtiMeFA3gs0SrcedZF1N8w2RG4g99QFjQzwdr8V2gqKYzB
 UxLne1dv3BTZKUj1u/loUleKI5znhDcyAER13mwt4QVw4lZjmpy7FqP8htwd5u4qf+XynGVC0W0
 TW/8P0tHbB79P9OtTk55/EzVUI+QxscCCGj3G+iE3aW8ASHz3WfTfyf3JkyJYIpTwiq5TLAqcj4
 86Kb0UHVSURQsevx7jPi1LbFhDWJQX7YGgC/QsYH9IgaDFFwc6i4jpNJoyOTD/EJHRzCqa5kRe5
 sODSi32cSPiGCdrDWVzreA1mTEIsoUjoWcZ4e764xfmBCzuanGiIBS6GiJLRw6/NKGwYpMgcnAw
 rCU2OF1QDMpqbkh+GyguNbvLHtQWpyMe9Y1htwlbxpSPPsQO7kxovLhqAk9CiRXKQcFa1/qb4nk
 sT4sEbdUMSS9HGIgfBuei1pvQGBcFE5EsIPv79e0mCEqXssHqaGB2e5g5Fh2Zg==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95071A4C5872;
 Sun, 11 Oct 2026 15:01:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAk-000000007Fz-3TjQ;
 Sun, 11 Oct 2026 13:01:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Oct 2026 15:00:32 +0200
Message-ID: <20261011130058.3443432-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 27/52] package/gerbera: fix build with ffmpeg
 7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-transcode-fix-build-with-ffmpeg-7.0.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch

diff --git a/package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch b/package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch
new file mode 100644
index 0000000000..903987ede1
--- /dev/null
+++ b/package/gerbera/0001-transcode-fix-build-with-ffmpeg-7.0.patch
@@ -0,0 +1,60 @@
+From 56bb6e877794c1209e1930e851b8b8642b4b26ba Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 10 Oct 2026 23:37:15 +0200
+Subject: [PATCH] transcode: fix build with ffmpeg 7.0
+
+Fixes build error with ffmpeg 7.0.3:
+
+src/transcoding/transcode_int_util.cc: In member function
+ 'int StreamContext::createEncoder(AVStream*, AVFormatContext*)':
+src/transcoding/transcode_int_util.cc:608:17: error:
+ 'AV_CODEC_CONFIG_PIX_FORMAT' was not declared in this scope
+src/transcoding/transcode_int_util.cc:607:19: error:
+ 'avcodec_get_supported_config' was not declared in this scope;
+ did you mean 'avcodec_get_hw_config'?
+src/transcoding/transcode_int_util.cc:638:17: error:
+ 'AV_CODEC_CONFIG_SAMPLE_FORMAT' was not declared in this scope
+src/transcoding/transcode_int_util.cc:637:19: error:
+ 'avcodec_get_supported_config' was not declared in this scope;
+ did you mean 'avcodec_get_hw_config'?
+
+Adjust the version check according to ffmpeg docs:
+
+https://code.ffmpeg.org/FFmpeg/FFmpeg/src/tag/n9.0.2/doc/APIchanges#L446
+"2024-09-08 - 3305767560a - lavc 61.13.100 - avcodec.h
+  Add avcodec_get_supported_config() and enum AVCodecConfig; deprecate
+  AVCodec.pix_fmts, AVCodec.sample_fmts, AVCodec.supported_framerates,
+  AVCodec.supported_samplerates and AVCodec.ch_layouts."
+
+Upstream: https://github.com/gerbera/gerbera/commit/73fa1638958fae7db0579b694983164b10946b8d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/transcoding/transcode_int_util.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/transcoding/transcode_int_util.cc b/src/transcoding/transcode_int_util.cc
+index 014942ab9..89964615c 100644
+--- a/src/transcoding/transcode_int_util.cc
++++ b/src/transcoding/transcode_int_util.cc
+@@ -619,7 +619,7 @@ int StreamContext::createEncoder(
+             enc_ctx->sample_aspect_ratio = settings.aspectRatio;
+ 
+             // Set first supported pixel format
+-#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 0, 0))
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 13, 100))
+             /* take first format from list of supported formats */
+             if (encoder->pix_fmts)
+                 enc_ctx->pix_fmt = encoder->pix_fmts[0];
+@@ -652,7 +652,7 @@ int StreamContext::createEncoder(
+ #endif
+ 
+             // Set first supported sample format
+-#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 0, 0))
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 13, 100))
+             if (encoder->sample_fmts)
+                 enc_ctx->sample_fmt = encoder->sample_fmts[0];
+ #else
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
