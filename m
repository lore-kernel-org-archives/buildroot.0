Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F15C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66FD61362
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B66FD61362
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9481181CE1;
	Sun,  7 Nov 2021 02:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ph9_sTIVmTG1; Sun,  7 Nov 2021 02:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E33C81BC2;
	Sun,  7 Nov 2021 02:07:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C187A1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE47181BC2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMRffMRI6uuV for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7CBD81BB2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXVomqOJhrIRljXVomQvHK; Sun, 07 Nov 2021 03:02:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250545; bh=VPBMekGAlClhqLVGB1QCtJGcizDF7ZQmptomZA0B8uU=;
 h=From:To:Subject:Date:MIME-Version;
 b=FHdNG9B8AcT/n0l1TRWlJd98Vo7Q52IoolTX7EBtlesH/OKul/8+x2S7uRuN5EKq1
 xk0qT8adutfWzUzApl3loC8jg+NiPwzjKw6e9QiaZkp5OS6UikchcJBElQIRl3sF22
 UjASNBpQrseNpV6mDwwZZqqQR39mh5V/Q63c1qzOLQnvGXc40G9wkSmDJNeRK3BuXE
 svqU/tkSQ5bBtUKRwm9AEoJPBHrqLjEfwotnbCm80ql8ZUvKdqlVc144R5kT8IYiH9
 BQFXXBQTVtVG1tAC8n1S6VXo6N8YMsQJHkUU0VaAqe8Mf1I61b9FKpvVyQhhBfOqjK
 iuBvLNNkAbIug==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:02:23 +0100
Message-Id: <20211107020223.3056586-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJFDPbIuYAYf4Qn4IOzDqNjZNkhyOlaKOg7ZKi30sQ6CmkwGZI5dA4+DkQsTLV4tV6HcZpnb1xAxyEPoQwg8kp86op5Yo6l4W+szZfPTWFErlEgeBOEM
 PYkK0VOWsL6emiB9dzFsUVd+3m2y9763GVApXeg/9yYxgcp1E1f3+DWuJe27PZFEUFqTAO7nIL438gmaGQPu7jkwwCIXXBk83ee3WCcW5769uDRZK+arZ4n0
 ko+LA0NPT7U16g80Ujy617+MSFUN6bk1ZnKH224mKNeNNgTavmJFw5KucmnnfC1jrR/mLCmM1BtrC2Q+JTSE9a7U5IWkbmSHPpKIFi2NbyZv23OubDw7TwHV
 ewZSGMHUWQUUTXPHeIRhKv8JLdF3INzmgaCvYFu/kSYh5NLszKIGrNIeluE3ODeXH6dPPmpwbmuvXBckjRv2AUKBY9cT+pUF2100eamvbl93F/aAKHVo+OWr
 tR8VlbBMS5AMk8enEij51ucoTdSrpbmdSv9Zb07eTNTWgtWKFgf6gWtmQW+p46Q7ta32X1FrOjassvuKCxJdGUK3MO+OxpDBiXKzzIo9INCRXwMcLWIXa4O8
 yrC200ZOmXTdaWP3MAw9ZyXF8weLhVMvpxOaeg1az6wmoy5qlaZrH24ceegodGM4oqh2BtXn/q2lgpfcB4fURXywd9m+moRiPrQGzPez6uNjIshvPoP3kdUn
 JuOSKPh/BXUZEtbyLzOLTR7X+aC7e9qi055rPsqzZFclq2lphYJL1Pa9q2ZOasZGS44QQcqMcRdys27W+1Ds2vFt3BbRo/bK+c0YhFProfommCGjCerGW9lg
 AjY3zpnfhiHJBRXHiDYEA8640ChakReRDY6EXC1mtqGodzN8d8luMRjhcC63r8M6rkYV0TTTPSZX4Ev9K/7wSL/U4rkc6tIU2P2lvVO13NKWgJA6DU6ALiYA
 CuwU5xQ76S/HBbn/5F+djo8yrqGOH8TnHc6ohyNT9vTPWyVNRUgMvBV9HDpdVQMdbOzGrb7kzlvsdihBokdC/wJX8P6x29pNYWT26kJZmFf66Af3hpSb2IDn
 PfQGMrYvqS9Uqzyjcx2ZkyiCcAdDAoqNwmJr2n0SNQwssk6oig2vPNpD15TWRmZioCOPX3eLdGhZdwBiGlIKaQQIOp9h1IHOk/3UY65nTTo/yA27dwTGVKAe
 CiZ8rJBJPP/rA+3d+vgHjeCgQ5ZwqUsp8wL5fKZqNNYAjTvmwOlDso+2Z0DzJHjoSr35v0JckL2UDRx4goJdz/Sof00Ow0Nl2J4nY11R6qxO+U+h1DHoIoa5
 b13bRWODsqoEl9iZH7ad0GINUDvf95EGXB6o3mirlPPg8drqEGQgLR9NwEda0i+5ZuofeRlSo/BOZF2D7ALgMk1hGUPTd5v2u4ss7D0CoHOeNbwzgYKaFHYC
 9Ea1enSn+lM5F22TjLFvrSACyXiDfEHH9SkZMgyMYTGZKHunWyOt1MZJJwn3/ssnjXj9aAdrK7ZIB7pndc5fU383dx6XABP209bJxcXLTrS7/hjG98dsmwUV
 tLtU+3w/YwOPXd5KpwH6f6Ix4SOkycLV5vvwmC+WZm0UVARLz/vrEy6WqAQ9nzsfDiLQG56Ya98k26RyLatYryx1N8wpXi2rnDFQ3lFA+SAGBjxrUZtwBx+4
 rSil9kNzEq6j9/Kxqq3Gppl5cCsbDWxth3TuFePFz8T/1Ih0btyZDQg2VPJzBJQtgkxodX33L4HLNgI/p2ntyoMootkOtauRoymXhIffl9JluP8nbZ3+WQ==
Subject: [Buildroot] [PATCH 011/102]
 board/atmel/sama5d3_xplained_mmc/genimage.cfg: beautify file
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
 board/atmel/sama5d3_xplained_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/sama5d3_xplained_mmc/genimage.cfg b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
index 1b46495128..0456e8d5a2 100644
--- a/board/atmel/sama5d3_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
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
