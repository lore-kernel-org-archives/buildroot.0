Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FA5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:05:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7CCC610A8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7CCC610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BD9E4022F;
	Sun,  7 Nov 2021 02:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PGNzHSwQEseu; Sun,  7 Nov 2021 02:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAF6440232;
	Sun,  7 Nov 2021 02:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 681051BF573
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56FCB40236
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YAZIadEskbX for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52A9B400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:41 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXV6mqNZtrIRljXV6mQuwQ; Sun, 07 Nov 2021 03:01:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250501; bh=XXwQvzH9STvgkFNOQF7+qL8NV2dMVfQIoM5eXN7XJdk=;
 h=From:To:Subject:Date:MIME-Version;
 b=kqnw+GoiUsiZqe6OkDxU90wwPzDo9mo1L55K6kZDOLKjxuUw3QY4QmtS/py3dYGn5
 NTt1ih0PszYWCPvpO056Pp6Zt/xAJgMQwuyhTjQVGGkIwIs5HZlfSIv/JaCjVJad3g
 GSwaz3SwT/8ltc/it6tw1GFkW4/l8MxyuDCbPU5ZlIAjBI55bVzEbhcSqi129BLOAA
 8Bit20QQBwjSGDV5TpWHvAlmlcU4RhZx649WCLmEYXrgsKxYkw+2SYjG5j2oi7IcvU
 /vvxYYGMmixnlPQ5eEGOTRpV7vXmo/gwowUr/UATqOOfoJm+mwkAw+0CFxUUk5vBqF
 qO8uqVInLivMw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:01:37 +0100
Message-Id: <20211107020137.3056349-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH1LptAS8INS0r8BzcgZbhb7s/kfuCilufw0zZbeGyIiOtwjjfOxdmo3lW8V8ZYU4/i3vIQtIQxTCLkTmfzmSlyjH9/rEf9TuevoXzSzcmNbJ1sTpQAS
 oWQNT2qHH72W32fMCytxoP1Up/2GmygLTokcFhnfZXIItMHwsiwSVowzGcrAFaoR02dWF2aZl3Hdsj4Z/h2AwSam3KIqV/HSLxQCOtlCYdyAQpMugQIQbCKA
 vYRPRDaBco0AkyiFYrj6f7BCl+VlzioB85yjaYns+fA8c/pv2rVp7flxp6QioUXvcOnctxdCWw6Yn7iFR2WTXbI56GODjw0VTa2N/yI0CniVIcu9wE+m4yTo
 UvVGOq4CbckGs5Fbx9GHkHsNO+KxYoUVtF+vEVOmanYUEjND9g04p5IO0ldybbjfx71Ak9vL8QvlN55TF2rrF17x6cFzmGdHtboVrtUYXHMeH4XTMGk+F47x
 1o4/THzGcEeNvzLp/dX8yJU44iJWqePsy2vxL3o0bQ+ktouy9zGlEYMrDShMTHTu21ZBsYNdnP71iuIAiPpknCvu8QDAjP+gfjUdGZGm+pSvxv/1b7gyk+yh
 Th0iR592lJCsRtWosj1IsZ9Y39roFOOdvLc3jAuxYo/V/nDp5AHvRzmtaAZSpCblFru41lnwehzKLKBi0eZGEh5mOUPSJSkSHeNeLG6vH/PM/3ASMf1octQQ
 Inf0t563nNs1pne+L/etEemxIIZhka9r+N19ks6ag9w9a4869PNbjouG0iKCMcmVTscZZt96mCbdMLOfR6spz2c8ASH7YmdvcXbMSSa5XzVGAp6RQ25vIcG/
 iq9ilQIOCgCh+PN2D0IeRYGEZsdvQCF2x3zyI32667iopDqWn3jk0gr9UdDp7HxCQAwmuT3VlWQhbZMwDgZLd0/PWmS8fO5eYaQSco3D0DI8j3fgIGT171iU
 7viY4jnz8bX1C1N1wywhA8nyXOYSepmcfIajGEaLKvc42lj8w/fvW5roJL5LkQ1CznsGadh3D/5RUylsvVDI9Y7Zmj52AZGd50uctC8H1M+LKIsns1+F1khT
 RejPzvXWSoPzkiv7kGEdD1h90eYlFCn9cUhKYeVTuOXcsU9w19bEfu8GTfKvpsgtzyQY7tHmvovCVafmNSte3ZWZ9ZRIAUuxbNiWiMezeDNWr6Z5dm+RSRRC
 fz4l2YLz0/w3rUfiNGE3M1HtSJa9wrv2oB/2z4rRuTLcIgxqiSGZKuTRSKGCK/Uu7rGkvL0iVJ9P4fRFNb7VwxKxCRVIanu8SsLcdyKXR1FSe1yl2HfKQs1E
 Hee4Tsc7pothS6N1JV6Krpa8FeqWOxsWuNXt9PooUQv+okQxgRErZ6tVLRHEIAJbnhtApBn/qZKSjpLhqOIKhurBNQlIfie/cEVSi8YzwwW60z227SfaDp1T
 RQLdhbxHXpBtJQznb72B8WCXLRYUTa6uxN22iNkq+7H0NPYOG8zVFyAOTYrJzsZ7m2w5Pej+qeXi5CTsyS8GaHZiqYu+bvizT+kv+/23R8+6AQO591yKDHeO
 lYgnAXeCmmrgTQNtwUZPohTJc9jzMm/y89O7O8PT77d/3WUvogEUpKysKhqCfEY71eGuIfV933B1k1IT5FRORcM8XGqhJ7YnCV1Dq5mNYU9c9HlFPweqoZUQ
 Jl7dSw2u0B0hMWzZREKQ6DWUGDsCezkACCDBkMaqLN7IDTx2To7VXChmUF5uz/VTam9j3FrMmFCPh3PM52WiZexRdbbbTOZcqSa2nlN2E1R2nUmHEWV8kA==
Subject: [Buildroot] [PATCH 007/102]
 board/atmel/at91sam9x5ek_mmc/genimage.cfg: beautify file
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
 board/atmel/at91sam9x5ek_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/at91sam9x5ek_mmc/genimage.cfg b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
index 7a552665f3..d99ebd26be 100644
--- a/board/atmel/at91sam9x5ek_mmc/genimage.cfg
+++ b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
@@ -17,6 +17,7 @@ image boot.vfat {
 			image = "uboot-env.bin"
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
