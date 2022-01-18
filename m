Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7641BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 325DF80B4E;
	Tue, 18 Jan 2022 10:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLE60eYW7xEY; Tue, 18 Jan 2022 10:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7401680BE2;
	Tue, 18 Jan 2022 10:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 513621BF9AC
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AF5C400A0
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8cvB11tM18Q for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:51:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CA8740900
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:51:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m2Yna8PD; Tue, 18 Jan 2022 11:48:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502923; bh=9QPaYDtfnjjmWhNyqjxo1WxJg7KxCg2oHyoaJRyWYAg=;
 h=From:To:Subject:Date:MIME-Version;
 b=HU8GxcGIPEczlHEQoc+KzH0SnOP78wLgty5ueBvwF9CGFee+f+TzxtI6QUMGB6vRM
 Z6DQ0ORd5DwuasNrdB1Sq63A0Z6mku9fbk1OI+I0mvEAhA84CD6NpjnbGizq00vAI1
 e+MP2nHFCVG6VFGZ4E7fIUEkitqorS99wSa3nv2X5jbgPADlFqbQsviT6HNifYVCx5
 g3w03Z1EfjJ613eWvGh2+cjeZ7B2UJwME8C4qVjXc+alv0r2GTliRnCu78pfRRSrIF
 TMRmb9ndXdB6e3Ey6pGk5aqkHhMPzYD2M8xbwNQ2E/+7FbK2CXk1BUk0nypqj83t9U
 A7d1ejXKD0zmg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:34 +0100
Message-Id: <20220118104338.2081259-25-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLxO6aoxLV4dwtI9aJTGAcE4Bb6PyWSZQvktleK4pzxWz2iInpS5xF66Q8Xf6lsCYSRg2SUSmjb36SzqF2d9wPQaEbW1gSwXGeuLW/NkXEjqNLDYSilb
 sonxhqpc2kYwqWC/LhLTdYXhh6XO2tAQjb+wZhwhxOk77LJ2nKXP+0qZS9aKNMLLD2nnzZ8Alwm8lPVYchzV8OYtCBGPYeoaX+qPGrTNO8wLVKGT/ddFXTn5
 ZziRBCNVweNVDduJgwbnK78Rz8UABvhU6IEL9BgdOjAlVBMpFCtAObJ//OO+7zXFN7xwgbm4qb1Hn0ntWqk5epXpV8QyJX+tgMoHBaugg8nmG+H/+o1/yBYq
 aRu5s1PcCe2l478G7x7haF1FObg5kw3+6qNsO+qNeNEv0Jg7Leg1V1zTlPmIshKHLdSR37RTxz/nNoD6kUABRfJNGu0uM2JncwKn1dtwBdIPEQvI354HeRDk
 TcQ+WoZ2nmKAeQReg+CyRPP9+qwgAKOKToxEHb9smOXFbXe1FjsJmp0dA6QYFphN5hifWDe0ZIwZvgy/NBIaEwSZHhPTKlyJnjVzaPOJHblcPu/nzDn6v7rM
 ZeymHCQeTMzVIsEq5zddNqiltYoLlHib4r1oSS3uJqq/H7c09XDAM3lGPDqOfUwRMBtLEGuV53R2IWLU/ln9UfmS6086okSvXb/HVQQpRZP3bA3lOcMeljBj
 kiqLf3jXKyKacmxngR/IgQPm3dqnfPmpgQ8wD/UJYEgY4SN77DELV+YIVJyEdAPzAX3umnDNr/3hPU10iQWoBBZGvtHXcndefNDNvQG+YipivJ0nmXBHN6Jy
 cDb0QX7zVXV5qUmZBw68V3tZrikhZar0khFnLhVJ+NHZp2LTqba3e54dqRCFLA==
Subject: [Buildroot] [PATCH 24/28] configs/orangepi_r1_defconfig: enable
 NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This board has Allwinner H2+(compatible with H3) that is a cortex-A7 and
supports NEON/VFPV4 FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/orangepi_r1_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index bad1f9400c..9fff1fa97a 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_R1"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi R1"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
