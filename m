Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334D0E82CB1
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 16:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3FE1428DE;
	Wed, 27 Sep 2023 16:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3FE1428DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3XIhL7-0OBe; Wed, 27 Sep 2023 16:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88AB2428EE;
	Wed, 27 Sep 2023 16:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88AB2428EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E0601BF280
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44EC14011D
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44EC14011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_6rGCyd8sfn for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 16:47:12 +0000 (UTC)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89684400D9
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 16:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89684400D9
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6c4bf619b57so5712529a34.1
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 09:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833231; x=1696438031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0fQ8QOJVY3QPfsS/b+e2bHaGtyxP57uwCb0gPhYy5Y=;
 b=AKlSSXdWlo0cGFzNX7VnFdOffTx6d5Y9SggvmGGmAYnlLwPfS29I1rOynqluwSSAHn
 KRjjV4YYT+IjtqjEHu5Q+fjgppE/TiPzwxML6hSKcN9hKy3lHpLUW4gWJ1YmF94OiGFT
 mq1u4TSKixWjL0YyBt16ORrVtYRHceLs62aXMeBf1kDawnUqgyB19GSsEgE1H+HeTxmD
 xA2P6NZ7925qL0BSPofMfhTmgtfFRCgdCkIlD8Hs1jtEOI8z7cdxx/aAM0leYik+YSRJ
 W0TAiVnMWSrCSDgPn5cgu7M8vfnTt0fS0SLCYzIf146Cq5IOXqeD9l+wwLD5NmvYZJ4L
 3NFw==
X-Gm-Message-State: AOJu0YxK0rGPw5rvGLM9kUUc3pp7JaEzMbOUKJz2Up3ScwDPfDOfP75V
 mPrnWnS4QB/O5x01wTwBXMXL8GXb+ouDCSHo
X-Google-Smtp-Source: AGHT+IGsX3Nhe/xhShLHhrwz9SRMUEZortjdo1zcBoUEdzTsGne0UHp5bufeel5HBdkOAeJhre9A0A==
X-Received: by 2002:a05:6830:1e85:b0:6bd:b5f7:187a with SMTP id
 n5-20020a0568301e8500b006bdb5f7187amr2697536otr.20.1695833231314; 
 Wed, 27 Sep 2023 09:47:11 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a62e402000000b0068fe9f23bf4sm11999270pfh.103.2023.09.27.09.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 09:47:10 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 09:46:37 -0700
Message-Id: <20230927164640.67592-3-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927164640.67592-1-cdimich2188@gmail.com>
References: <20230927164640.67592-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695833231; x=1696438031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0fQ8QOJVY3QPfsS/b+e2bHaGtyxP57uwCb0gPhYy5Y=;
 b=ROGB7Ebsd9YAP0cId7DmTgEdUaAJ7KpEosNFUfLgw0XayV7pd2l31LG8aXkBOrszVC
 HVUCsLXfcd5gCgCC8tc/ypJsX9trHxhfYCQL/aYcln22K+oGhaQGKaBcPBUjis2t+eda
 Vh4VVEv++2bk5mSvNkVKRNMbN/DrFeEBk79Ivt4k2SZU84qS2Lw4xovX5lKO4Xet7mYJ
 bl+go1ezxcUIAO+uH4lcM8JaNkNUWWrGCY7x5+qZy3xHjVTeINrma2f2dgDVAMPXDQxV
 lsTgx29SjlPEEhIUOvNe5c7rfRXDfiKV5B4VihX8Alw/hdZUsue3/YMX+zzPY2TDslsc
 j1LQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ROGB7Ebs
Subject: [Buildroot] [PATCH 2/5] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.11.p1.2
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 6.1.22-2.0.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v45.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 8f5708898d..a380e1b712 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6e2f3fb43d16c30fd0b23027f5205818e9d4c74d4903f1c63f265ccf8269f01d  imx-gpu-viv-6.4.11.p1.0-aarch32.bin
-sha256  4a5f2235500dc4bdfaaeaffa0e4c13cdd28436cc0d859e5be222bce990fda461  imx-gpu-viv-6.4.11.p1.0-aarch64.bin
-sha256  e17419ff1c87b5754282227f651745bd7b3986aed983e2d494505828022db4a8  COPYING
-sha256  eff6daec54c4f86eb4682eeecd3dd24ffe90398c9460c2e573dd4141bcd28652  EULA
+sha256  491ac012d691e27856769296e2334ad1b6f45e31ffe7313fcdb028c75b3b69ae  imx-gpu-viv-6.4.11.p1.2-aarch32-1e0c396.bin
+sha256  d5904cbbe33a3c1160e9cd15c44d78df25d0dbd7b251add796673af53d3046f6  imx-gpu-viv-6.4.11.p1.2-aarch64-1e0c396.bin
+sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
+sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 57a6a90d6d..5a13419e3e 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.11.p1.0-aarch64
+IMX_GPU_VIV_VERSION = 6.4.11.p1.2-aarch64-1e0c396
 else
-IMX_GPU_VIV_VERSION = 6.4.11.p1.0-aarch32
+IMX_GPU_VIV_VERSION = 6.4.11.p1.2-aarch32-1e0c396
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
