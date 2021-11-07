Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C590EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B029610A8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B029610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BA1402AD;
	Sun,  7 Nov 2021 02:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lRNfN5KBOsq; Sun,  7 Nov 2021 02:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFD3F4029E;
	Sun,  7 Nov 2021 02:06:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 466BD1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4146C4022F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUwAoluDjYzG for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp2.osuosl.org (Postfix) with ESMTP id 462194022E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:06 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXVUmqO15rIRljXVUmQv7B; Sun, 07 Nov 2021 03:02:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250525; bh=KFvax393t4SfQJkHT1fDNUrSkyNFualVZo6elBc1e8E=;
 h=From:To:Subject:Date:MIME-Version;
 b=FKEMzrHPyu2WwTQyHOnlZ1swuBceTIc+LxRN+K9R4lloBDDf+DmtugLswaP4KKl3d
 Z9A5E+vsCPWAfCK6tNqYHvwRTrMnhKrBFknsy6PXjTWtT3IhSQLJ+/BLxgSZGcJ6z4
 79vEKCXGJu7oh2xdlMzYAUFPRdZ6jOwCO9W7q66IfiiGFyUkkU9NtPQVOOHxMTAabr
 glibbyN7KOTAigoVYD0aY3wNyTRyi9Uo258fm9Fr6n0H0pB9/pffJKDtpjxerK26Wx
 ortSdGzkEswF8eB+o0qymwDpxE7EQZJNEBLWZ31tllnfyqKZ6aVuYuyxmkkmowGqhG
 Yj77fCptwqU9g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:02:03 +0100
Message-Id: <20211107020203.3056474-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIbL+XsC4DR7ddt99d5g1vszJKkvhIwEckgttuXwsPd/DmcJF8NXdhQmM9SicdEvtsbFBZNAMSA+zGWPOhXCTdbiYGddurXKmCGBoxAOD2ilO0hzg9Wk
 V3GPwZTKF0ayUOOSwXyYCAIXQ1oyMozcQ4Vuj0Sjsh13xwEDY5uk0k6VGmS/6Uq3EoybVRcTuIA+k1gltaJLKyjmbdsj8Y/hEJtCEuZuf2OV701eAKTPTKjq
 uwf53wx49NHxRyCtBDEWI/C6ysaAWsVGmW107xTG01ak+9x3qF811GJkvHRmt+P/1pnoaQgBq8x1ekg8OOvNSTY0MHS1yNQEG8jDBIjVfPWtK8RBnVad5d5B
 HUcj0+Xv4csBLMWshz1Rtx47fr+6Xv7n7Cx1A2LfhWHajE1nlqOuAMn119tHjBq8wr2ZdG5vUq4OSkD+SRSkhf3Cf2Vb4beVa3Lg8lPcciHsEdvD7RNA763r
 ZKQMwAUKRS1S1ObKLUpAQJpkDHKm8Mqjwidpu35qi7yS1Wu7gJtYMVVmAgRgFZ8FFFNjlKutWuJ7YktEYKQzx5po5Ygsy86Cro4eR5jNYPKAyWwy6+teotWh
 43MuSbgvlGyaWDVm8GN3Dkb3qrJNdJPXE7gQQE0XoBc9mavvVUccy871mgwilD91TqCCw+LVWJvomFkQ7F2G71kXjA5rKmNirhvajt4YJRANe4cEyqiM5PNY
 3xhfdROCznmolcg4ugT+kqJ8aiVY/Fx+pdt36kixDbeU7AGpylE+5dDfXrbVyXVTonJzEyq8YTW1wBb2VUWSN6A0Q8sGWQPv6cuM3dUDHBTkYBfrB2zUI7Eo
 2dxRmYWXADw+cfJKw+tgT6/SHXqA31ojlC+EUCLYiCkrmVCIdC232nhbrderoewyR56XsPz1g8BZgN+hmaqQWrysp1gA7U5bFHZbXzVL1O5eF+3qHPySStui
 5U42WzK50ciAnPI7ebUEKgibeiSPO+Zhg0MLHFCFnYnGz9EeOYLF7psq5dM5sru3kAKgM/zJF0btesJoK4ufkArWffjD00jgEk1HluxfYG8Mrufe40BfBp3y
 gdrXTrbZ2e1fTbUnNp2B5cdfffFD+T/26Yu//1WJou2hBIIPyUMYeUuPI2ieSZjWf3OU5cVlP0vXlFKSLH6kPzUe7suckg0ksB7WHBHvDWR51U3BlMsgojro
 HobwO9Q6EecAOHcsCN7Nfb1LmwTvfWWrTxaostCsfTU9KsaFqTcysskguNCQ5isixjxOz9G7AazjilEkpH7DhmeuQPchp32fng6bHW95w8gyiQky3g4Y88dy
 w7n4S0tmjzMXb1LzLNDPK7icyVihyMrKkyv9CCey8d715PVuCNLA+UNtw0GnpebEV0rf3CCWuqp5HQ3MO6rdqtbQMI4kI+u7z/6om1zyVlK2NekzA0txuI5K
 TjdInZeGHNd5d+XShpDM+DwIaBwVtpTOUsWjUZfrrqW1Ps7Oc4yGEq3VlOahc3arSxBsDkrzAq4gKR2xXKGJ1YlUCleM+F2GuC5RCmLRNMy8cn/d9zBu9v9R
 jiK9F+wUNhzHQwFOvjiiM5sTuiwogAN4/X2mXokWJCxq++yRVDpErKSihh8SqjGrDGF4rKtjbzUenGHf/CH3sAsWRCIgw0LYtjunZTGOjm/i2MUZoks8XvhR
 9VQFpZeKvqQ04VLEli4yYdbP45d41NuIWd3kDCGrPw6stF5VVcD/QUrUe3MxdF89vTvrWQ1P+ZC+f78YmviwMiVjcRDhXwYDBlDpALi88HezDnKHUpyQkg==
Subject: [Buildroot] [PATCH 009/102]
 board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg: beautify file
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Theo Debrouwere <t.debrouwere@televic.com>,
 Nicholas Sielicki <sielicki@yandex.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Mike Harmony <mike.harmony@snapav.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dagg Stompler <daggs@gmx.com>,
 Biagio Montaruli <biagio.hkr@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Jan Kraval <jan.kraval@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 David Lechner <david@lechnology.com>, Davide Viti <zinosat@gmail.com>,
 Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Crokaert <pct@crookies.net>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lothar Felten <lothar.felten@gmail.com>, Luca Ceresoli <luca@lucaceresoli.net>,
 Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg b/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg
index dce32524e9..cf55f46fc7 100644
--- a/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg
+++ b/board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
 			"u-boot.bin"
 		}
 	}
+
 	size = 16M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
