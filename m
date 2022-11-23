Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF43C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 349EB81FB4;
	Wed, 23 Nov 2022 19:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 349EB81FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9z1gay8nP26; Wed, 23 Nov 2022 19:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F4481A6F;
	Wed, 23 Nov 2022 19:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F4481A6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD42C1BF95E
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B681781FB4
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B681781FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPbW_zEoIGXR for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1987F81FAE
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1987F81FAE
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:27 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id r18so17603495pgr.12
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5GP60bmQD1JWSrM4plp+TvYnpgE0DekOKAkyMSWaGU=;
 b=qf/SRnsdRwQqWOOKw9CrtM1bUnZ0t9/pmcbNwEjUnxmZT9OsrgVuz45c6KOtjvCv0L
 IO5G7qotF/EbfY2irNn7eBZHzz7qn19V2czq626IB8LB0/H01AA7jkCRqY6Xqg5VsuD3
 OHWorMfEV3F1As4oMxcHZYAyTXu2gup+f1GFUv+fhXyNkUKjV2sYoBq/rWFw6CwLRLtu
 km/aio5E14O+LC1E28YhG6nS4sexv1dNvN/w90XdcCR7Xks7rNYmjI6D7abEzXg2tCCI
 AmQsEzyfcPnuE4DwHO4CJtjN0WyoRpdiYIzQB0R0uiJqJzcNTQWoHaKoyjV0g0NJbpvK
 2njw==
X-Gm-Message-State: ANoB5pksJMU2QR+1S4bwxq6fjVL+K5yZEyj6N7RXeQTA2lOBHymEt0kp
 fsU2LWdTQ3M2ltm9oyyjbWRVNGHXv/EySw==
X-Google-Smtp-Source: AA0mqf5Rh8UA8OhFb1Kup2EMIhAaMC2EDxw6/8jK0ujMTH0T2sKv+BE9AnjlH1LwYvBbdY+jY8kp0w==
X-Received: by 2002:a63:4708:0:b0:461:4039:88d1 with SMTP id
 u8-20020a634708000000b00461403988d1mr8362778pga.568.1669233206376; 
 Wed, 23 Nov 2022 11:53:26 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:25 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:53:00 -0800
Message-Id: <20221123195304.1582783-10-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5GP60bmQD1JWSrM4plp+TvYnpgE0DekOKAkyMSWaGU=;
 b=gKISnfE5PdKwZQ5EAc5dplvmAHq6DSZ3BUwYMgHKz6Gc1EyghOa1JaPo5oJDmn7BT4
 x4ny4G6nENMKdndfGNXzM3Zq6432MBnqqmeH1pMEoefxFMX73ABNEAecsqk4RI7u4qZU
 fDtVGbGePYfVNO13QyNwL5159QvZO89HaPveA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=gKISnfE5
Subject: [Buildroot] [PATCH 3/7] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.3.p4.4
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 5.15.52-2.1.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v39.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 312eeb6f82..a0e6345b7a 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1324b1aaf190110b80ad9a6f6533f4f50dce9e9ab8d49d8503f59764b151d219  imx-gpu-viv-6.4.3.p2.0-aarch32.bin
-sha256  003c30baefb1655790b475c3cdfa5cefbf81ea89ef37c6649b64f151dd23a52e  imx-gpu-viv-6.4.3.p2.0-aarch64.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  5b9dd02cb2dfa564903872576cd6586fbf4a02abdb8e180978bd84205ab302a7  imx-gpu-viv-6.4.3.p4.4-aarch32.bin
+sha256  5c52bd15146c24d449638c6276c07103949c8efbc53d002518541bc37c57e424  imx-gpu-viv-6.4.3.p4.4-aarch64.bin
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 3c88b8b11e..06fbbc7343 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch64
+IMX_GPU_VIV_VERSION = 6.4.3.p4.4-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch32
+IMX_GPU_VIV_VERSION = 6.4.3.p4.4-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
