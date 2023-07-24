Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4C2C001B0
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 19:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEFC04185F;
	Mon, 24 Jul 2023 19:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEFC04185F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRX3uJPWUZzW; Mon, 24 Jul 2023 19:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D2964185D;
	Mon, 24 Jul 2023 19:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D2964185D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC9171BF3C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5F4E6103E
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F4E6103E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gt901zKvZi0b for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 19:16:45 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACBA960AB3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 19:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACBA960AB3
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8deso46390395e9.0
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 12:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690226202; x=1690831002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AE7oQha0Nq3/lkW6lyqko20LDrrGoW7UCdh+9/jhOew=;
 b=U5Jj1/yEOXZdBHxej7QOEDH6MOYI8sKABb0jffXJadxGBvK9iKwuUO1HZmNezwF/v9
 wcnaqHturt34cYHqbDnL9uDF5QsbK89WB+ofFmefSY57yQuOPkrZEooneRl19vqZMV7s
 3EhhqqQ2hN4H4Wy6OmWZDcSMejoOFwKBYgu+JH4tiq87HedsUiNwfDSUDpAK78kdbS+e
 pUENc/scdp6ME79Wbm/CFXsu/oBVHzck1fXBkEfCfpJ3NEULOfjpgexWgfQLXgHMIVNV
 1mzZxTIaLlIn6iJTnfxi6IOUW93A0wuIhKjhSjHwOtwV+XU00Ye5TzXpG1wd8XJ3f6np
 4bBg==
X-Gm-Message-State: ABy/qLaxjmgc2X3uoCigCVFUmEQ2bUJPzjxF90+U/GES9mZrGZOoayGl
 usCzH8RIqM1md54046Emd/tjP7F+SiNl3g==
X-Google-Smtp-Source: APBJJlHSIWn5ZtoK2FwrKR2tPJiEPLKfE/nRmtRXk7w0b4gwqYA8PMOE3o3xRcRjCWe0u0dAwGjmTA==
X-Received: by 2002:a7b:cb85:0:b0:3fb:b005:99d6 with SMTP id
 m5-20020a7bcb85000000b003fbb00599d6mr8124399wmi.2.1690226202233; 
 Mon, 24 Jul 2023 12:16:42 -0700 (PDT)
Received: from effi.fritz.box
 (p200300d197289500922b34fffe35b24f.dip0.t-ipconnect.de.
 [2003:d1:9728:9500:922b:34ff:fe35:b24f])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003fa973e6612sm13652513wml.44.2023.07.24.12.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 12:16:41 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 21:16:36 +0200
Message-ID: <20230724191638.637054-4-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
References: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690226202; x=1690831002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AE7oQha0Nq3/lkW6lyqko20LDrrGoW7UCdh+9/jhOew=;
 b=MZTSMjjSq4eAKzV828MclqXZmiW8DWTFhm4ugyGIVnO4UkgMUqXLqfXp6Vgk2wlNbi
 cqh0xuwRL6s9nBArfe4TJyFt2AB3/OYbH5UpOpq9OD4/cdyv0jfPiqpwMmpyTFkH1LNL
 SA0fOaOjrOeZutALOzOntln9fSNZ0koHfgCZMIoohhgAicr2VcgKFLusdw+KiN+jlJ01
 iejTEG1KuGxqakGg88Uah1O05cDsv1Fx/0M4doaLFMA3W7c7TcGSQAMo6kv5TuUDXoqp
 lq9uUy3WX54sDyKmM/TaS4k4ASI3p2hBNIlZkRDqsapDtizDb0P/+g7tS7u3kDle2GmH
 YKWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MZTSMjjS
Subject: [Buildroot] [PATCH v2 3/5] package/freescale-imx/imx-sc-firmware:
 bump version to 1.15.0
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
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index ed83e757..a5bbe112 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  24a647237c0077ce0172563d67fcbc5e8f231bad7cf55a2436848c89579c5a06  imx-sc-firmware-1.8.0.bin
-sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
-sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
+sha256  1272ac5c31a88017ef548721f3acf930a7eda6ac73aa9f41b5f0cade9d5c0e5f  imx-sc-firmware-1.15.0.bin
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index 6a304c0c..3452e8b0 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.8.0
+IMX_SC_FIRMWARE_VERSION = 1.15.0
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
