Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967A6C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F0CD8453F;
	Wed, 31 Jan 2024 20:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F0CD8453F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YhXzKWDxVVX; Wed, 31 Jan 2024 20:08:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C840484537;
	Wed, 31 Jan 2024 20:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C840484537
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5251BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 152E384537
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 152E384537
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8N-Wdt_fZ1f1 for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:08:00 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40DCC8452E
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40DCC8452E
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so1827355e9.2
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 12:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706731678; x=1707336478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3zbO1kRLqkkln43ijSLP1IIFwYh1SdHUD1zbPl9+rGw=;
 b=JcfGuvHtvTl6h+pvKXCQGQ3GdY1amJHdKS2A3ffolqD+YcWSJ55yYmc+lDDc51TtME
 WOP33tW6bjV+13vlDEPklQvbvEmTFIgSvxLCqzexSrXwrikg0Os9AlphRY8G+jqOkUQ9
 qPXgUZ4UFfs2wi5BbK+xtHNR6uvprRXWvMkIN/zK05xxs9/waissaIY+Rp/jTggHCE5l
 S8QorfIgveXHIZ83Ti1vH7enAmWLnANdjfsfNnfejLx4f5rTkZdYiVjU1ZDu7BknAPFZ
 UtITkQAMu3WZ95qg0x4eFDViElrWMvHZ2a0EK8qRdZgLnnRvWIM/0oTGkhaCUr9nnCiA
 gWww==
X-Gm-Message-State: AOJu0YyZaojRdf+R78nZjaqyIL8RoqpscqcMKOQKV8st1fNcx+SEziGa
 bJ47hW456hZDr8RN8iPaHRle2hDqyUzL8KJKRSS5wuRUO+vL1bBIzhJXvR7aq7E=
X-Google-Smtp-Source: AGHT+IEQHb9UtysiUZCcMeRUSCBOayBuOXHAZXlmh+LV7Ais5pNONAXyderkomSy1PzlisRJl9ZzMQ==
X-Received: by 2002:a05:600c:2943:b0:40f:b456:6877 with SMTP id
 n3-20020a05600c294300b0040fb4566877mr2042683wmd.18.1706731677570; 
 Wed, 31 Jan 2024 12:07:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv18-20020a05600c549200b0040e76b60235sm2477764wmb.8.2024.01.31.12.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 12:07:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 21:07:54 +0100
Message-ID: <20240131200754.1784621-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706731678; x=1707336478; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3zbO1kRLqkkln43ijSLP1IIFwYh1SdHUD1zbPl9+rGw=;
 b=Xh4IrFjow6DGly5YTK5M75i0q6VpWG7pj1W16UdSfQ7VRKve/9Rq5KwM38rYwsuEak
 SB9qk9vjD8ddG18Tk4gJEQ2CdRAq/Dvvr3DIKxgWlkp6KFU7i2yvrSOwHIFr4+KsAy84
 yvALYH9oImGMqjpvJ4dakLOZ3VOSuKcjwUB9FFH/e9FoktK0iPI6Mb+g5nmfxn+8C024
 TWx+cHAjg/YlZq7kSRzk+rPlEXhsV7t2rqEGHNbasPEDgwK0vSwcEsflidzL0sUbTfsQ
 w1VbYsitkSkR3Qir2kegPKAOu95jMRX0egCy7vUrkwkgDLI1m/5cZhyHtIgGAYWQkSW5
 LJgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xh4IrFjo
Subject: [Buildroot] [PATCH 1/1] package/libheif: add jpeg-turbo support
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

jpeg support is not limited to libjpeg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libheif/libheif.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index bd307deb7b..908e2ce068 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -51,9 +51,9 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBJPEG),y)
+ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON
-LIBHEIF_DEPENDENCIES += libjpeg
+LIBHEIF_DEPENDENCIES += jpeg
 else
 LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
