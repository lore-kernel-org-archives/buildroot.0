Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B26C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8ED60FC1
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F8ED60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A01D606AA;
	Sun,  7 Nov 2021 02:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Eet4yG3P3zZ; Sun,  7 Nov 2021 02:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ACF26070D;
	Sun,  7 Nov 2021 02:10:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40C441BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A51D402A7
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJnYUw7w1pws for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:07:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id 174564029E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:07:33 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXammqSUErIRljXammQxXe; Sun, 07 Nov 2021 03:07:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250853; bh=CVdyZp1xfQTXdQwznLjfzhH1mA3YesgWUMlrWFp8RSw=;
 h=From:To:Subject:Date:MIME-Version;
 b=kIdG7ViK4PKgP/D5nh41irmTpCc6Xat7KcTO1rGHGaZvHjRqwUopLI8fVQXjZfXQn
 50RUIVmxD171morWaJoHY7Z/3/X86Kezv8cxIwMPPLVFm8YDO+C/RYIk8/iWuFeCvJ
 TgiFuji0GkqKmQTET1yp3dzc6fPiFZMRx5nTUhNKHa5MKxG69DDk8EwlFfbEKkWwBn
 +i5PUeDiFPbHSmhFZzeBuxDDjT1iWkesgt0CO7tqk1sdxa0BvgJc0sC9SiRYLUvXkg
 LPZI7IOV9Iaz3XizXopxhwtHleZheBkCQhapKazJBADUItVvyfcNqLsHGuDu77ITer
 h271PFd57obpw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:07:31 +0100
Message-Id: <20211107020731.3058202-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJupjq0ZB9c+csnT8VNOiY2dEkVF8SHG99GaeCYDKInJyJAv3f4BZjQC00qTL7SH/zpcT4KxFTW2U49EDxRp4ORSNlmTO77Degl/umQwlo+8Ut1ulDo/
 MKAYRalc6PLG3Cr73qf1tAqnT535RCo62dwD9Fp0urAbhMZLRf46Vj2FUHzN4AyLXSehvv/kHZhHwHEDgZVyNcoWcngUkQh8/aBVm6fm7O5D0VlmXQxxMM8m
 m+WZTsi5n4cYBVRYj67UTnsQYyxGrDtKWJP0kpRJ14Qe4PIbP2kPadMGxxlMFsYewBUNnMOXpwVkbSfKFSH0e7O4y6z7EllpsmEybf6T0LfCQ6OoH6YHhPxM
 wv62BIH7Ix8YgLclVhGL81V7f1LP6BXRr2rA+xeRyxEqaiavIuSWHa2J+DXYUtbzsd06dtKM6MZbgYCQaQi3CL4a92Eezl+p9fv0KIe9Xjz7z6Zg00vf7NUG
 rGxQP94HsY6576WWXh8HCcual0TOgCGt4H4W0bs6DSbD8cCDHIITzxY++Cice4pTDKxAUfTdVINph6HpNsyDFhvMR15vSjHNxrc4a4Ywfxi6h57JUHuA3lxM
 QUmIEDQW691oBdulUEci5mdWLdY7TfXVbp3sx7DXpmemb+Pguxpcf7dT9vx2j0JuvxEGR+oEfkXvd4+jt/UoN3w5XtT13xCyrHuBYuKt23ELEhXs5ypPRHx+
 zE5DFmi1RwEaTwTiLoPPmVWm+8/he1QfIS4WLlp8EKVsXe5mzbW3xDNiguphwLKDNZAQts2jY3r5zqbnse6Qk7qYt/JDR+P6TZzTlijhleuBkNzm/WM8PD85
 1RB3Z/HXWuJD3eHn4CsmqVxNgfhtEjZOZhr60WTGBGkGCy2SAPMgiOSswS4AR2fRnVpCKoNydB/2AI6Wf+oqN2LiwK7veZmxXbh8yOOygQ23cm6/o/C6XyxZ
 oWXPQyPb1hDo4UBCMmTIzFDURFNkbj1ao22EhbuMV9x1wGUTOlw0tUPKqa5HLBwVlKavr/N17fUmMqY6bjz1uJuP8LCetorBEvWv4enXNRfCIqKFyLRjKb56
 yXFHzKE+tbPCwqBGv9ZEC9Osuwudyyz4b/oX+saWEPXKDC2Cwd+jHIDwjsCVvgK81LWJt1drj3dicvVT78NDtXaBKVC0IEi3h63ZcBZ1dmIUzLdca7gzOofE
 zcYuLKZNvrngkzXWS6BBZIGB6n1gql4zHrID+K5SWn56PMn+JbSt2qn4oHN8aZjUrwc9IG+SbHZ2gLQ47vgEy/+7ZtLvvjsfHD8eNS1/bR1wnZN5Rfvi2T/U
 teqYDVwrbFdJ047MozLIkxT8axwYZ9kqbebNH20lLdnWTesUAeCw5gwOHE0N3A257MGLtm7q6XXl23jfJPPmSvHBUrwPA/zoJxdFZk1ILijPkqY6PIAC9ltP
 2bpd/vgdDAL9PFxo+MQ1JUkcgAugEk++wP8RKxk9mAyZLQkLMfF0VW0scjXVnrSJyuolWelgEKUBI5+vhsfoAxOZCJrhHGNhKXYEv2BcnXDN5erjBERfS7n3
 /sOqtWVrytLZNpSHwF3xA10GCKR06J9mUCZavBo9zKRurHpy0CQzeXsMZXLjkSOEp+q8oK0/cka0F9Zr67DQUyE7p0RGojfEmD/dS0+ljPCFuihcEALksTGe
 y9LVcklG5scD8rRiz/BHm5mSuV2F+7QTOjV2ICb1kZb1yjNm7taajyZ4psGwFGdoz8x07dFszSLN4anlYd+oJCu/a84nwoRpF1LzUoG00X7e2I92AO3RkQ==
Subject: [Buildroot] [PATCH 036/102]
 board/friendlyarm/nanopi-neo2/genimage.cfg: beautify file
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
 board/friendlyarm/nanopi-neo2/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
index ebe123b758..15667d68c8 100644
--- a/board/friendlyarm/nanopi-neo2/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo2/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,14 +17,14 @@ image sdcard.img {
 	partition spl {
 		in-partition-table = "no"
 		image = "sunxi-spl.bin"
-		offset = 8192
+		offset = 8K
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 984K # 1MB - 40K
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
