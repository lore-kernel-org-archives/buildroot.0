Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F11606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TSfPzf7X;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=lJYDfAU5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68A4D80EF1;
	Sun,  1 Nov 2026 10:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BJfFkqp89-O; Sun,  1 Nov 2026 10:46:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 62D0B80F39
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793529995;
	b=LsDGzAMMMn23wzgqJ9H6Kx4Ne5MwGWS27YuJlLMQDESUgB2WMpFrmhD3HrZlI5SGBeA5
	 Ip9KAF4uEUNGczKlGy/VLZs5jcYg8lPjQEcKN0jAMXkTjLPV1Bx9Vehwqo/zEPC6hSn5R
	 jsYuuWUzu2D6mktzyTmlEr2NJw5f1uLSkp1boomBnKXEws/cEYOkJxhceHMEcfw/ZO9E1
	 N5751GBntDyh0lE0rYS+/9TmghOXnI0lnw6tmfNxjBkaB9AGYD6vbdRV5HO2DE74g9ih3
	 1OJQ8xxfsAnC4suIeOZvScOfX7tCbWbyxIWCOH3ea3VcyvbV4a9r7zTQTOA4sbcaz5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793529995;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HqWy7NfaZtyCzVuffanDJKBVQCylFaH+7ubl4t0g4/0=;
	b=mgdYG6ZSFHFRm0t7XLOp+cE5NFxvm4Ja0EMLe+A10YcJnzYy1RWNCxJo+RVGmsynNYIX
	 eprEvPrUTRnoLRO8IqnDEC4ryW+DVuHAzHJHUzQtNuuR8E45YtpW4RAIFnFnKDuPuyPMw
	 KL6qZHN3yay3KNa5GwmE+y6FCX0Tvef3d9I+EcNah9ArZGw8oye8XzNT/EypKSGWhupZU
	 pa1zUtRjqQh8CD1in6DiV8rJqEltYVGqNv60J+lgcKE2p/VvCNxSK9c69rTgPD59GcrO/
	 xoPbxTR7sR9XPIqXTKXrnltxGrhyFwZqjHoG8FIJHulmYuXguGBnpNfrK5QGsfNcF4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793529995;
	bh=HqWy7NfaZtyCzVuffanDJKBVQCylFaH+7ubl4t0g4/0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TSfPzf7XKJt1ODl43pKp2qzBtfuQ81vB0YbhSrmQ2k0fNHEptiJId3/80mj81Bpkp
	 Uv8rfK0FlJqbBmlBbhMwjhenN22dElBsayz6SOIgt7m+E2piQqv1i6lgQ4COjmSjxP
	 FlX3F1hgQ+92Royv3O4My/NidfdeO3mmQTo8z1ra1u2Jmg796ATaxdGPqTozg+tauM
	 NQubzUitQTWPDNHFp8gTnuSCZDTcbOTNV7F6BfloyhuTNIgihBCXA1Wiek/A/mjgK8
	 87I4fcA551y33Z46HAVmA8/GWh9ZrIwXwP05gyFEzdYqTVZriegeE1Q1+AQehh8zXX
	 +yvmugT7tUtGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D0B80F39;
	Sun,  1 Nov 2026 10:46:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91A462AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8387440042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1Sn2uRUNL8M for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 10:46:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F33B04004D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793529992;
 b=aa0afRVzrJdtfOL1KSRTI2WkEYjF6U9G4X2StnxhCosXTc/U7da8acDaGJ79T7xhYCNG
 1XgTcl128ihsrxpW730x3gio/go+/TyZ+79zgE2BKF4iRTjG6mJqo7ZwDMHek+PxQBccA
 EdzQHB4SpwPm9pOSexxKD9zOTMET5bPru0CZAlF8WWwTN7+4+UyiD6kvUj+ZEgpxoa9Ok
 r0ciqM2M01XxFGJxLdjZ0jDjA/WMoXMSeKosJzG/sNl2wZvf2H1+iCiIAbvdgOjdK1aD1
 DI6wT4/y1mOuncBcOVfAL+vND5V8cyOV1104pStut5ef7CbHGJ5qSIgcp9TUZklVkWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793529992;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=S/iJC93LISU9/Vvey4gezulf9Fyu8l5l/mzNmdDy9DE=;
 b=SHKodHsyjJkSH2FA51vrScoDdD0QgqEYJ+Od9H338ZUMUjeXNvf+Qk2GxL+MlL9dR8pZ
 UEboWlxvP3Gz+M095/87V1meq0AcXTyJLQQUJciKhT/gX/8KaFJ4ZHYyH/j5E2orRTpky
 P4bu9aR6OL0+dnke9Vv3mY4I+MG02quFwNz+EnQHT7moOqrumRtfID3ENWCRGMrUakFeN
 qgnKlkW92AooEEC8HUVscCwaxfVNICnUGnIQ2m+fGq6tHjTEeJCXxZXxjtKSTzBeBJBcn
 3FuiGlScJZtHWHlMlpzQX8jUcJyO5rwhtJha5dagexPbJKFc7uZOhvbWxf/dGVdqykw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lJYDfAU5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lJYDfAU5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F33B04004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793529937;
 bh=S/iJC93LISU9/Vvey4gezulf9Fyu8l5l/mzNmdDy9DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lJYDfAU5Lbs+pJPoQrMZZbGh4g/BjLAaVJoVC354o5ItyROAuKcIwHiU9uXX2PGRI
 ZtX4KJEngYBV8trY7AgbKuKuf88zsn5pYzWh/IFEeffjGltkVV+HlkkWaqHSHirFrd
 LGusLq+gH+annSKEyUmaNHWCPP+Eoh+z7eAKqe96fsAhE+6NnZDT5/7ZUWOj/SDggD
 QuKTbe9257/Jkn1P1jxs0DDueubrRTMt/LygkNPhyecXdVDITVDaFOgXEETfjaCRVt
 0syLXINhprqeqhoAdRd0YqsR/2LRxSavqsux5e6YqLmQJRzFmn/NMJY5UeGvDTWqTi
 8iE+7pZCzg26Q==
X-KAS-Sym: v3:f51bdf72230551df:ucr7yDXRooWdslSDRqcvcYDSgJhetnl3KDrZuVM6Kywq4
 vP2bL/whU08maPRhLd+FSCef9vnSZC35lHpFL2dy21u4T2gVVboWp98rCs80jHag6st+EioXS7x
 fp1tdFDXbDtnJ8UXvra5BJnUbhuXqz+tTX11gLYv3vjqRDHfVO4gddIYzgUm5doC+RyhT4S553c
 gX7leJ6pvw5lR1uI23sElMEqtBgPRpmIqDE3uej1DHjNW/WV+lJfjXj1EqVcMS5k4/qyOz8UK3z
 idTcP8d8stTEAOnneIvM6kNfsA3Jvuz1xX9hDulWnvZzK+fxs2O8TfNboe1TVIItYWk7tWDA==:
 PPRCQovlR/QUqut22oSxbaYbA2+ET4+xfgSqMhbVN0NFMUFHaQa1Ycdb4GNOKedjm/+lt6s9TlO
 doPcg8vOt8o0O2vkEJk+jULziqL1Qysms1C6S3pvny9ZIvlktYOhUagkZ/EwcI7mpoQ9TLIMQcT
 rtggL4/xkbvwmq8TTo70Zp7n4F77v2eKpmpkW/quOi/NxcQJiJuka8zpDO2k3tj1PY9qvzfbEmr
 +kv7ZhV/TzFyeuoD3DxwYn9ma7X+5M2yt7roiMrWAB/EBAc0NEnwOSHVni59k5+o8nkPQ92MxJY
 SK3igQRfs1y4zs9/3bj9Nc4BdOKtvKGcBVIqJ8mHjpyj2zqtnQwf8WV1L6MrUrnNZCOUWYBH2VM
 GGHeIm9jli0ZPfzShH9Dp438Q2nNVhQBkfCJax1LtdK2PZ8ZzJW9tfj/3FjQC2zWEDo5BU15mGv
 LOFZ3STh98tXizIOebMUpQmG70OheYamhKN2cUo159JLV1WqfK9I8K8fd2OLBUEKCYc3Pk/wIk6
 h+qzAT/3x/hbKtn7G3EpNoCO/q+gnzEzrbmN5gzz/8z3ApyU7jrkiB2M/Ww+cSm7WgavnxAfx4l
 w8u1R9vE9hAwKVzR+XG0AWB2VLMHGx+yym1QEcPSPfwPsjb2r8RfDeCwcaNeGwU=
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DDFC0A4C0D2A;
 Sun,  1 Nov 2026 11:45:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47698)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNT4D-000000004Gs-2tAF;
 Sun, 01 Nov 2026 10:45:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun,  1 Nov 2026 11:45:33 +0100
Message-ID: <20261101104535.1696412-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101104535.1696412-1-bernd@kuhls.net>
References: <20261101104535.1696412-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 5/6] package/opencv4: fix build with ffmpeg 9.x
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 ...FFmpeg-after-AVCodec-pix_fmts-remova.patch | 58 ++++++++++++++
 ...se-avcodec_get_supported_config-for-.patch | 76 +++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 package/opencv4/0001-videoio-support-FFmpeg-after-AVCodec-pix_fmts-remova.patch
 create mode 100644 package/opencv4/0002-videoio-ffmpeg-use-avcodec_get_supported_config-for-.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
