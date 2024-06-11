Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43C1C27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1522060AFF;
	Tue, 11 Jun 2024 18:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGSKLGCTapH1; Tue, 11 Jun 2024 18:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2D360A8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2D360A8B;
	Tue, 11 Jun 2024 18:00:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F9361BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CE8381F8E
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sntFxsWRAIbZ for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9E6D81F65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9E6D81F65
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9E6D81F65
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:45 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-70109d34a16so5558201b3a.2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128845; x=1718733645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TnC7DJUnU++TkP4OY4ujXBI5dAOnArOeVvPCOiPdWU8=;
 b=rrbXCcXbpSBt/kZjMynLeRgfTKH+ifXvShhXem+Es29IabtSaxJlqLOi/zIbLRngWh
 9AfiwWSRJc2nw0OufFPfbqu3l1sg5sewcjjENef/e+rqxI/q1AApbf/w9zf76pf7MtGu
 8wup+tNElPJULu1W/dBBW1oKYs4u5pOgfRESLOaogAZhKGo0VVQFwW8eatKLYKjGZlgQ
 KJwDvFDzM8EnMXJsK6i50HqHbYc834vopDtGov07zAkNvef3+zIKXemZPuWpKtkILinL
 VODpBo7YQJpWDBbmimMtkcjuw+z8uJdbhVuaT0fYUum1HJXLz3ELRiaHN4t5lssTsp99
 d+Zg==
X-Gm-Message-State: AOJu0YytsCU6l/AOzhhjDz4NGDgPoUin1lhoIqnZJD2A8kH1m1jDdtpC
 pksW5+ezhDwTSwWfXvPtzuy5IuJC1NDCtLoMGdpbrG5W3u/b/+Rn8tIP1xZ1
X-Google-Smtp-Source: AGHT+IFP6nZekFC7J5cf7b02At5m2VmAU0XedIFEclG64vc+ICa5IotSaFDCs7Can4g9w5SM5bzbvw==
X-Received: by 2002:a05:6a00:4650:b0:6f3:ea4b:d235 with SMTP id
 d2e1a72fcca58-7040c4ba8e0mr16059139b3a.0.1718128844339; 
 Tue, 11 Jun 2024 11:00:44 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:43 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 10:59:59 -0700
Message-ID: <20240611180007.2127244-5-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128845; x=1718733645; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TnC7DJUnU++TkP4OY4ujXBI5dAOnArOeVvPCOiPdWU8=;
 b=OEdXXNaoezzMmaTy+Xw1p+apYxgPfDvx7eRfYpAU8KBaYCREdReWxHPQQe+fNbxYD7
 O5UA7/0ZMMYEN4JnQtJ+MXjfuvh+pzfOI7U9zCbG2VvIAvgmGG86qaoWPaW6hT57QOjS
 SWf/q+p+EK5BhiugfYJvySYljyJSqKvEmpDde8TPCrCIL2W+UiVrKUKQxJEuVTXpVv1s
 Zp2m6sFZFalNoPUu/2sD8hOXgLULH2TwRWR65njSvm1G8bAd5Ov27TMrVPDhFRdkvzLG
 9NaiwGIwe8jNqisbAn2MCIMXT3bYZXenWojdIe/2YJMTzvPNJOsjCrklr4ahcOuA37jq
 HubQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OEdXXNao
Subject: [Buildroot] [PATCH 04/12] package/freescale-imx/imx-gpu-viv: bump
 to version 6.4.11.p2.2
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

- To match NXP 6.1.55-2.2.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index a380e1b712..b350443a51 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  491ac012d691e27856769296e2334ad1b6f45e31ffe7313fcdb028c75b3b69ae  imx-gpu-viv-6.4.11.p1.2-aarch32-1e0c396.bin
-sha256  d5904cbbe33a3c1160e9cd15c44d78df25d0dbd7b251add796673af53d3046f6  imx-gpu-viv-6.4.11.p1.2-aarch64-1e0c396.bin
-sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
-sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
+sha256  15efe6da5d4bac2a6067c2a898190be8754df6f14128c3db4756cff59c6da049  imx-gpu-viv-6.4.11.p2.2-aarch32-fd0148d.bin
+sha256  6e34f3718925ba37c362cd09a3228cc56d03cfad323ebae0932f64449dbaeb2e  imx-gpu-viv-6.4.11.p2.2-aarch64-fd0148d.bin
+sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
+sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 5a13419e3e..3cfbfe3ccc 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.11.p1.2-aarch64-1e0c396
+IMX_GPU_VIV_VERSION = 6.4.11.p2.2-aarch64-fd0148d
 else
-IMX_GPU_VIV_VERSION = 6.4.11.p1.2-aarch32-1e0c396
+IMX_GPU_VIV_VERSION = 6.4.11.p2.2-aarch32-fd0148d
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
