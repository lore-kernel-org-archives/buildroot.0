Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294DCE82CAE
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 16:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B952E428E0;
	Wed, 27 Sep 2023 16:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B952E428E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFT-j_1Ls1GO; Wed, 27 Sep 2023 16:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF0D428E6;
	Wed, 27 Sep 2023 16:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF0D428E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1B91BF280
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 516B5428DE
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516B5428DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TeRCqANszgaS for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 16:47:15 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDC16428E0
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 16:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC16428E0
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-69101d33315so9677738b3a.3
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 09:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833234; x=1696438034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nm3bagarfElUh/SLdYf7gGnsl8GBgm5KlZq2jRl9dGc=;
 b=l3dmECjxgEc5sQ0nMnGSX7KWFuFvgZS+o2DgoH668Pe5jwrQgKbsvre8Ctihj82lNb
 /BsGMsaMq5OiAu41P3qMzfKxPbeZB0+snZzG0iWBK8tJJgxLrzvt7RefzIaJMuOWychl
 k4TaZa7WRJZGrdEOXsyKA5jmr0nIhojW2VYa/c2phE9tdgMJxyZoLvyU/ayZYOGWr3TU
 pdEO7txji88ZDNBlCby3KIuwvH0nhRvxgW8Huc6mS2dyp1kF+Lk/1OjMuDgU59zWNv06
 wQIHPAgur+bp9vcmfBHVqdGfFnflIWSus9i1rn7CFDY1Z9WoKfjiiTuoc85FlJZ7WAMQ
 O3iw==
X-Gm-Message-State: AOJu0Ywj+mxQNE9dBmorJDbt0OtzDCbR+HaAHnJV81xO4U/ADxaiCOfy
 ZVx0hPORIFNgr6khsBYhXavkrjGdGuBcUGwf
X-Google-Smtp-Source: AGHT+IGh8fV2vE1LAjLCqp+5FVDKZVS+mPMwKjhMXNckvt4/2QhcVVdahsSLMvd1AmSg3LcbIZuoCw==
X-Received: by 2002:a05:6a00:1385:b0:68a:2272:23e9 with SMTP id
 t5-20020a056a00138500b0068a227223e9mr2963370pfg.17.1695833234030; 
 Wed, 27 Sep 2023 09:47:14 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a62e402000000b0068fe9f23bf4sm11999270pfh.103.2023.09.27.09.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 09:47:13 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 09:46:39 -0700
Message-Id: <20230927164640.67592-5-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927164640.67592-1-cdimich2188@gmail.com>
References: <20230927164640.67592-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695833234; x=1696438034; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nm3bagarfElUh/SLdYf7gGnsl8GBgm5KlZq2jRl9dGc=;
 b=CfgUs1cpG1zMYInqOFbHEMzRPWQtmMtorydt9F4kPqVKWHTrTBKZoYgMFbBgDzii2/
 Cbs89gjqXdE5HnaKldCK+YT1NfsFRf+lAuimYccghs72qjqZS5b8Xi3AGMgyQEQYHOT5
 ZZft6kXbgETdX21Xy9SEtcvPtRC/4huAo0Co5xKRS6YId2ckukdvTkEi1T96nMcvV5XF
 XVNym/Gj3/DrGcPTw7dZetyHnsgg39svj3Rskbs1QlpOW8lil6iElwebN0SbSVrK19kE
 kTBXAbKsaWLlCVK0d69jHc7s003zJW0vkq8Pe6uEiudK7SpE8CYMxE2dgpB/uv84XsEb
 O5DQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CfgUs1cp
Subject: [Buildroot] [PATCH 4/5] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.29.0
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
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash | 6 +++---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
index 637d7898cf..879b82f7bd 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  7e9bcdbd067ce66a1247373cbf088945346feb0027deb61af541ebc1256277c3  imx-vpu-hantro-1.27.0.bin
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  2fc836e0ca9a5994c6237ee20b91ccc327fb2529a4ea057e4aedbce3326b6c97  imx-vpu-hantro-1.29.0.bin
+sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
+sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index 4cfc8f41ff..0987551c42 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VERSION = 1.27.0
+IMX_VPU_HANTRO_VERSION = 1.29.0
 IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
 IMX_VPU_HANTRO_DEPENDENCIES = linux
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
