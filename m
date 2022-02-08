Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA17FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A257D8293F;
	Tue,  8 Feb 2022 21:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxQfXcLDA1-P; Tue,  8 Feb 2022 21:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C8F81B25;
	Tue,  8 Feb 2022 21:35:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 062A71BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9CBD60ACF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMB16D1QJxHw for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:35:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 007EE60AB9
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:35:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f17so720696wrx.1
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qp5K2CS7cj5RzSzS+QwyNmJFXBMxTe1j80NlOGePIAc=;
 b=c4F5ugJZmM0aMWA+qU/wixlcAM/JkLfmlpcVhZPhn2JxQ5ZLejccgHBVwTg4jtP+Te
 grSJ4WaQfcaOONQHuiK/gQ4y873qMWTqhoQqVI7kQVQlCoBoYdO85gec23SDqdN/zRRM
 oa2kjthqgt9mfggjEydb7o/ts5ZsoI9AvWSRlvg70t/QGS+NSKTK4Zrv4R6EZJNyA3lU
 EKrfFfG5UiEHj6J2DHS+CcgwfcDKOBJLlgWGEcaMA7n4m9zf9YjFnnPcjKt9chVcszva
 +RQss+4vdR68mjbdA7oZWVs9iFmw2d+4zVyKGtbQu0iqlTSrx5mfwd55//8RdJUedawx
 6Opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qp5K2CS7cj5RzSzS+QwyNmJFXBMxTe1j80NlOGePIAc=;
 b=vAuSrSGZtodxDjmqMQYVCwXpZ0P6af8Ekyid6jaONlxVvHaRTOjk7nxQlsALTmBdXL
 p8aFw8cbG8zs34cnokP8AOxWPKa6uUgzxElW5Nr+gh7J4K8lEFi00BARMtL8RIgOll6K
 RK3TBPD5G5AWP2tZy91RoguCFcoy0hFEDEQGs3NxVQTpnMdxLEmX2UCeHRKCIZBxS/4K
 W3WdAzsMNnCK6podNYk1ldvzeurdjPv7v/xZxydEvY7HdK11rory7BNJ/Vxu9PD2jRu8
 sOrreNkCV+VIkADRcFxF6bBTW3SCrD3MgreIgRfDWuBV5YaO9t07N0J6Q8qe26pN3tAl
 mSfA==
X-Gm-Message-State: AOAM5302K89qzaFHwHdbgChIgFRiJ/VNeLB3rhq1xSnr7VfUF0D2OOHs
 a6DQhB9DMCYUYjKpzp+/ovW69bt4hYA=
X-Google-Smtp-Source: ABdhPJyr1iE0jRjB7AfrEO4010tDu16wxx3FiKIbcxFROyy6EFxId7Dtxb/Krf/fxH78XMMu5qkrcg==
X-Received: by 2002:a5d:4842:: with SMTP id n2mr3263117wrs.81.1644356123078;
 Tue, 08 Feb 2022 13:35:23 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id z3sm3836764wmp.42.2022.02.08.13.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:35:22 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:35:13 +0100
Message-Id: <20220208213514.7141-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/scripts/gen-bootlin-toolchains: add
 s390x toolchain
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x support has been added since toolchain-builder release
2021.05 [1].

[1] https://github.com/bootlin/toolchains-builder/commit/4bbb52a6a30a340a30722bc170467aa6fa4adbe6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/scripts/gen-bootlin-toolchains | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index dc173fa949..f9dd9da9a8 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -162,6 +162,10 @@ arches = {
         'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D'],
         'prefix': 'riscv64',
     },
+    's390x-z13': {
+        'conditions': ['BR2_s390x', 'BR2_s390x_z13'],
+        'prefix': 's390x',
+    },
     'sh-sh4': {
         'conditions': ['BR2_sh', 'BR2_sh4'],
         'prefix': 'sh4',
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
