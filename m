Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CD6C27C75
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7FB060AF5;
	Tue, 11 Jun 2024 18:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gt48kmpZY3UT; Tue, 11 Jun 2024 18:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E5860B0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E5860B0F;
	Tue, 11 Jun 2024 18:00:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13C011BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 084D260A69
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIDB7-Q_Vx3e for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F01460875
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F01460875
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F01460875
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:44 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-703ed15b273so4553575b3a.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128841; x=1718733641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fjTWVfGqElUaci6U3lVQgmQwcMS7MsEqgfCyloI5Nr8=;
 b=X2fhTbDeyZXGeptMmjaNZ/g6IKWkN85nkb13HZtP/FZxb2gGFlPWXS5gulmEdcgTZ8
 bFktrXKrpzn5cwZpIgF5U8QkMmZ85z2qe56hS/Ifbt6FuViGOn65/M8lE/qt8ZIK63Bz
 dr4XnDGYppu81vH7nD4+0KXEJ9JpS5vbDwlFg5rQSHVzlq68kt9GAwK4qvt3qHfW0f2O
 ySIFQZNG6GkAygGjM0ECz4BIHVHCYFX55qk4MWGOYMW9vzM+n6HMZK5Dh3g96GKuvFdq
 InAtYRsH8D3va4/3e+n05ggyzMt+Kt3sn8lX05e8aP69tjDo48cdO5EyGhLbnxdAYoGP
 R1dw==
X-Gm-Message-State: AOJu0Yz2veWa35WwUvA4tbsKyCKO67hUsogYu3liH9onAqHmj84d/HQS
 ZlLgpfLyKyldnop2AMAXjnem7b/te0ZNsichqINP0IOHXPkeSHZK4iM4M9Mv
X-Google-Smtp-Source: AGHT+IHSLaHWQSTZFTtAiXYoFOonhtl3+06ijNdxzlvS+LElkitZuqGOjhgRbh+ARdZWxDNGa3crpw==
X-Received: by 2002:a05:6a21:9991:b0:1b4:772d:2893 with SMTP id
 adf61e73a8af0-1b4772d2a0emr12211499637.43.1718128840282; 
 Tue, 11 Jun 2024 11:00:40 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:39 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 10:59:56 -0700
Message-ID: <20240611180007.2127244-2-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128841; x=1718733641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fjTWVfGqElUaci6U3lVQgmQwcMS7MsEqgfCyloI5Nr8=;
 b=lZysIZbrdQfRY56cAsGHy0I+IPVjF21OGvQAkUx46rezqwFWLsyZInzp3tpFyziCYu
 kjDPo4P8COMb6F0KKxLVZRr0+f+UT7EjLFzxQ9msBMzY40Cm8htJO5Zy6RqNCx8RsJQq
 4Gd/2JEeDo556RsC3KU7Sk1hco9qX0TChj8gF+/T4J5fimYdZfpAlEhXrqYyMgn9E4Ui
 t9bAPxifaoqeDdT5sunTj7GkCQ8W0spyi6eyake7wKl/nZdWQ2CytANChHvE171JMzSh
 1k8OW2dHfItumfoCa6iJzX8ZOWjgGK/vahAQT+vzRSj9N14PThfhqXjv9xqehOu5w1/w
 XuhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lZysIZbr
Subject: [Buildroot] [PATCH 01/12] package/freescale-imx/firmware-imx: bump
 to version 8.22
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
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 0b3561a927..d9443374c5 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f6dc6a5c8fd9b913a15360d3ccd53d188db05a08a8594c518e57622478c72383  firmware-imx-8.20.bin
-sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
-sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
+sha256  94c8bceac56ec503c232e614f77d6bbd8e17c7daa71d4e651ea8fd5034c30350  firmware-imx-8.22.bin
+sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
+sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
 sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 2a74f58aa6..c131558c37 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.20
+FIRMWARE_IMX_VERSION = 8.22
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
