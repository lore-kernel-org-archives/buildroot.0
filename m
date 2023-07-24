Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0DAEB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D536441854;
	Mon, 24 Jul 2023 19:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D536441854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gE4PnG7xQ5JR; Mon, 24 Jul 2023 19:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F7BD41856;
	Mon, 24 Jul 2023 19:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F7BD41856
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5568E1BF3C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A80F41854
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A80F41854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s83cy352_pjV for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 19:16:43 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A6D641835
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 19:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6D641835
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso4327839f8f.3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 12:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690226201; x=1690831001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evU+T+WKbhkBoEWvO/60imqYKcKPv0urPpUh7UONqls=;
 b=Y4SojFbJskNoE5l5R5xd/vglq01yE1OllPgJUsPtVFEW44tOh2Ye4km7cQXCdGvsQp
 SgHF1u4c/mbabynXTZSO4wezJYdljL52qGgDtAfHPgEpkIVvtEqYODjvnYIYJmhEDGBz
 UHyR4nB6a083CVm9oGQV4Tba0SOLjpk7gehIjTO4UYM6OyeRCmfjGBXh23l1NUAE5za+
 OpderAb8ge763ANX661YQK4EdbKSH2aB3+dLIGKbK2gHgAEptl2ScngDbNgut7kTlFQU
 aILNlQ2Y+SaETAaG0bGo4keD1J8jpfIPx1ZT5V5545ZQlalsxvkmERpjDwErV+BSE0Ci
 3B5w==
X-Gm-Message-State: ABy/qLaBqvkgrLZACSzz5I2vv5JVYEl6P5mUsnwByK0UROYUDC9uGe/G
 lwiJSUnhPUseAVO0LsSRi3rtd6bTXmy7Pg==
X-Google-Smtp-Source: APBJJlFMUPdujjBQJO4IXaai7joHYDid6Ro9iWCF0kPpje9E6eHijgxHqlHHX7Gfn/AqkEUi4YD91w==
X-Received: by 2002:a5d:45c1:0:b0:30a:ec3b:58d8 with SMTP id
 b1-20020a5d45c1000000b0030aec3b58d8mr8038315wrs.3.1690226200723; 
 Mon, 24 Jul 2023 12:16:40 -0700 (PDT)
Received: from effi.fritz.box
 (p200300d197289500922b34fffe35b24f.dip0.t-ipconnect.de.
 [2003:d1:9728:9500:922b:34ff:fe35:b24f])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003fa973e6612sm13652513wml.44.2023.07.24.12.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 12:16:40 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 21:16:34 +0200
Message-ID: <20230724191638.637054-2-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
References: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690226201; x=1690831001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=evU+T+WKbhkBoEWvO/60imqYKcKPv0urPpUh7UONqls=;
 b=RR+OF1eOEtCgFm0c3zq52eR178m1R5CMlVM/Jlip5OhJUtw0PFr4rcg5VarWRkwofA
 9A8EHVdPzSH/3EKpesGT8h+Rw2sxZh9OTFeYPhvXPyy2CVtoWiujlnYS7Keg/vPS2VeH
 BHb/UzloRptvpGkgKsbLXc0xROPvYsq+CnURjJzxPqgmBlMh46aoXllN4aDZZN881rHe
 wj3cFF1HwTNaz0cSKsNXHoveNv6IoxqcNyh5SkPhIQK1jxz36P6jdq4M1jRjlg7U02AL
 W/CZ4uz5BsP+LOYx/WRNmwPpt7keOQ2MFx7sT53YE6JP7lzwbO0sFfZovO66F9Pwu9Iw
 8a/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RR+OF1eO
Subject: [Buildroot] [PATCH v2 1/5] package/freescale-imx/firmware-imx: bump
 version to 8.20
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
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>, Charles Hardin <ckhardin@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index eb0c387a..0b3561a9 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08deb3  firmware-imx-8.15.bin
-sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
-sha256  30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4  EULA
+sha256  f6dc6a5c8fd9b913a15360d3ccd53d188db05a08a8594c518e57622478c72383  firmware-imx-8.20.bin
+sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
+sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
 sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 4cceb670..66ef8c39 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.15
+FIRMWARE_IMX_VERSION = 8.20
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
