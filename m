Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB01C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 550A060D96;
	Tue, 18 Jan 2022 10:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTySWK7ECo8s; Tue, 18 Jan 2022 10:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A007D60D8E;
	Tue, 18 Jan 2022 10:51:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A82671BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BAC440605
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUkIMxxD_Wil for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:51:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8894A40600
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:51:16 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m25na7tp; Tue, 18 Jan 2022 11:48:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502894; bh=kqfrQzD9JZq6hhF5SXNDbCsiAgY3dJLrKbakZrQdV8Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=VpO41dov1lXy+IY3RjVJPn5pRbCQhDRM4AFaayYvDC2fk5bAMbWSllSPdnCxUx2Ya
 kgtRSKR51lIVQCnaoCcaClyakZVnSwEdbJkZoFEux1Cds06K9oR5aW9TOtsnZJ+WM/
 /GEowtetcx3f2x06Drr0/E2phowPLgdMZ6esc7bS9Oet618y8i4tnN4NG1ZAF43RzL
 U01zIgpYqVG/nDoGlOEs3WJfnYYQuu8OpOcxflPWsCZZkJT3zJvK3CdIMVxpGNdrrQ
 6gCbPL+3VKQa0t0KCD95LfhLnU+exQ2Q8YFz6kDhQCv0MKB5sL9udwZL1V8nPRq/tA
 AoZXqVbnS7Z3A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:30 +0100
Message-Id: <20220118104338.2081259-21-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB9B6Zmr2FkW+3bsHK6Z7reKsd/HTm4bdxNWvwR75/uYCbThfQlHNOiwpKUFhwWXB7Vy0RNI26m2bPjDkfx/JJlyqkhLAtiLIOAzPzoXwSNzFa6mxHJb
 mztMChREEJ3B9LDcZf1SNDCVH9I2LS2zioi4OyGTs0jC5qIBiHhfSlJsGK7iJMYtD2BWX1Y68uBmudevQZeGfligga9Ku/vmAP7M6ML7Uds6pvOrK3xGC5c2
 32/VqJkHYvUEg65rvTPTcsJ7Jucaj8PCBuRe7B6KMBEBN8gnA8AoLB+6Z+/q12nZdw98zsJQrxEbPGMqfwmMLotm2UaULvujQNiY5hrZlGJ4N2c9fEPCqOKD
 8JF7iEk424889mV4kSaehrmhlEnYwWf2KdfgcNuB6/tSdGeX5C9wmBqvNKf2XaIr27J+wAYMWX85Sywci2+cXSdKpiapdX+zxpvS7rURQUI9O8sDaQLwxx9o
 OdPdUfAsH4GyTgwsLuWZ+XP/C3QboIaLn3pCMiWG8JUyJKFetKfrGaFEiowym0e2nx6rRkYMYk3YR48mdve0d6teIgxV6M7EqBQFC5e2YNwcuY9KQed9WkNz
 XSMsT1IRm3F+GIPd4gJuJKDPQ9YhVhsadvBKAUV9zgxeaMfi6pHlMDodZtaDHnL2PZqSvCdVxPnvRdA4FZFIOSPyQirnI3KJy7v6xd17dRd8pwqZATgaTXz7
 yU0AjHnuseT4L4sJ7CkW/tyrWW9hLp3I1sh/I7pDIzV4ChZT93ZNi/5+yA1PoUbhKkzI3MkkQkxOxLLOkfxceGEvKjo3u8SqrF9s2zaa0bZfNgrlnyHe5ryy
 JiQX40KO6GOjSxD/ttwB1Zb9x+cBla4JfHk2EGRDieooy5wG20C5YHSjjWpU5w==
Subject: [Buildroot] [PATCH 20/28] configs/orangepi_one_defconfig: enable
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

This board has Allwinner H3 that is a cortex-A7 and supports NEON/VFPV4
FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/orangepi_one_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 1a2772a307..c4e674a6b6 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_One"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi One"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
