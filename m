Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA953C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 17:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A644159D;
	Wed, 28 Feb 2024 17:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEFOKfftsLVT; Wed, 28 Feb 2024 17:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79165415AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79165415AB;
	Wed, 28 Feb 2024 17:47:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D02771BF841
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 17:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD1E6826C7
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 17:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIybFtRw7DHK for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 17:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70E57826C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70E57826C1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70E57826C1
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 17:47:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d01faf711so45950f8f.1
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 09:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709142445; x=1709747245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+AxYDwfdtIbTHWwkxQSfQL4aQ+M4j3yzR9/yrdP9BbA=;
 b=LlXQRCgJlBWTUsESz+WC9lDfw21ZVyCVQmh9YUVJkawpwug0ECEpGWgc0bpQpE6U8r
 VycJg9W8P6Nn91p5uDQ7rJj2pawKWXJEkO+CZ22KFl5IXNdwovFOmumx4fIFkiSFImob
 t24utiIgJnWK4h+4ofnkc1ZYMobrTlWSBxPw5GAgWU/WVIpXRSdqfUFOt4RBSM33Bh9E
 qllHMfRkr64qKuIunEZo0GvcyGpO5269G1enmlfCkHWuxc/Z7MVcY44H5+aHtWcBiu1R
 UDRMCCgS05/QB6BZJG8UatxiKPiVpaBtMVNHgfbH6NQKhKln+OVt7s4noj7olrVJEOBr
 sDiA==
X-Gm-Message-State: AOJu0Yx97VUM2E1LoeM0JPxROYkIIUlHwA+aPd98fPK9NKYg5NTHtCnX
 WMjfI6yhcOCMGLORhRSh3uftEQhvSlHEs9XmkzZkgQPyDEAPuz50LCaBiYVI
X-Google-Smtp-Source: AGHT+IFEZyXJvTVFa2y1B9SHYrOppWSH+VZImX3cRqeegdIPO4Nshblro7xp6Z18zOheLXZAjV5hGA==
X-Received: by 2002:a5d:6249:0:b0:33d:839b:113b with SMTP id
 m9-20020a5d6249000000b0033d839b113bmr192323wrv.15.1709142445272; 
 Wed, 28 Feb 2024 09:47:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bo14-20020a056000068e00b0033d6bc17d0esm15990841wrb.74.2024.02.28.09.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 09:47:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 18:47:21 +0100
Message-ID: <20240228174721.1141838-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709142445; x=1709747245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+AxYDwfdtIbTHWwkxQSfQL4aQ+M4j3yzR9/yrdP9BbA=;
 b=kuUFk10L3dH/v9HulVPlyOEXv7UCS62EBvUQWOth1bJwozt2Pn6QtpwXb8VqGoH14T
 +gk2LApGLk7kftaH1CahqgT++daV0Di3TgSQ1eJGbrJQOlqKtkassD1y2UDGVMoleL9V
 Ru28bdasF5Y66TbYbNGmNh2c2t8IAEOJ+m6zdgbGsY9fJ77NLs2hcmfmVqsBia+mAOWe
 eXX3kEX1hNU9eobhqPBWbC7fQWhoQ7VPTsqplMFsjyW0R7tQ9/Fo0rMcSXs1PA/mxS5V
 ChV0dDxFIOlw6/4l0nfqbv1jBshxeli5BOJ34qqllUsMUOW9h7C+PE0JwS/tH4tZ+s1/
 vs6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kuUFk10L
Subject: [Buildroot] [PATCH 1/1] package/libheif: fix libjpeg build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libheif raises the following build failure with libjpeg since bump to
version 1.17.5 in commit 5714126edac88e3adc043a482b262b319a907dd3 and
https://github.com/strukturag/libheif/commit/ebd13a20b8b7f1964939642b08b662ef7e483f39

/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc: In function 'heif_error jpeg_encode_image(void*, const heif_image*, heif_image_input_class)':
/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc:366:37: error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka 'unsigned int*'} [-fpermissive]
  366 |   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
      |                                     ^~~~~~~~~~
      |                                     |
      |                                     long unsigned int*

Fixes:
 - http://autobuild.buildroot.org/results/8ca909564c8dabe28ad08c96ebbc04b25592e727

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ns-encoder_jpeg.cc-fix-libjpeg-build.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch

diff --git a/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch b/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch
new file mode 100644
index 0000000000..5245327fe7
--- /dev/null
+++ b/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch
@@ -0,0 +1,47 @@
+From 33eb948240365434c845b618854403e82a229012 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 31 Jan 2024 21:04:37 +0100
+Subject: [PATCH] libheif/plugins/encoder_jpeg.cc: fix libjpeg build
+
+Fix the following libjpeg build failure raised since version 1.17.0 and
+https://github.com/strukturag/libheif/commit/ebd13a20b8b7f1964939642b08b662ef7e483f39
+because third argument of jpeg_mem_dest is defined as size_t* on libjpeg
+instead of unsigned long* on jpeg-turbo:
+
+/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc: In function 'heif_error jpeg_encode_image(void*, const heif_image*, heif_image_input_class)':
+/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc:366:37: error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka 'unsigned int*'} [-fpermissive]
+  366 |   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
+      |                                     ^~~~~~~~~~
+      |                                     |
+      |                                     long unsigned int*
+
+Fix #1008 and #1086
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8ca909564c8dabe28ad08c96ebbc04b25592e727
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/strukturag/libheif/pull/1120
+---
+ libheif/plugins/encoder_jpeg.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libheif/plugins/encoder_jpeg.cc b/libheif/plugins/encoder_jpeg.cc
+index d6c7854..21a5541 100644
+--- a/libheif/plugins/encoder_jpeg.cc
++++ b/libheif/plugins/encoder_jpeg.cc
+@@ -360,7 +360,11 @@ struct heif_error jpeg_encode_image(void* encoder_raw, const struct heif_image*
+   }
+ 
+   uint8_t* outbuffer = nullptr;
++#ifdef LIBJPEG_TURBO_VERSION
+   unsigned long outlength = 0;
++#else
++  size_t outlength = 0;
++#endif
+ 
+   jpeg_create_compress(&cinfo);
+   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
