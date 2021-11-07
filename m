Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2CAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6740561440
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6740561440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CFCB81CE1;
	Sun,  7 Nov 2021 02:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LnASoiRL7GS; Sun,  7 Nov 2021 02:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 890D781BC2;
	Sun,  7 Nov 2021 02:06:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6894E1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64B5F4029E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3LX0Z6a9Ijz for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52AC540295
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:21 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXXfmqPzBrIRljXXgmQwCQ; Sun, 07 Nov 2021 03:04:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250661; bh=mub2GNnj3PueH9DcK8RHHPxmynrZg3QobUMIskpdN10=;
 h=From:To:Subject:Date:MIME-Version;
 b=fXkF2pIofun+7zcu1NkTM0Kk5OSvtuO9jLAN3YKII6BQrWeETY61P7whTs8UqdtFF
 LfYukn35ftJlNojok7zLBrveqbcyT7mD7+9E7+2Zumg/JR1t22CsIhdVBOVDJl1PN+
 rC6zEBALhdLyoesaVVo9f2S2W6zoP1Vp8q2KLQHcx48X1LBIOSsALueVgsWxaZFpby
 vgSCY33/WefwelL9+Qunlio10Tw8qawNT0ZuVE4RomOcvPRw+0QmW+SlhsrgoaUTvq
 Mv8xEoby8I6M5KN/yUi0h9pmx3u1XcAZ11vAF49OPMRowfWizWF+dqE8dRG4Ret85k
 TAYZwLi9oYTjw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:04:19 +0100
Message-Id: <20211107020419.3057056-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFCtfeH7QvugezWqezKiGvKZ2R0aYssCQlCjHiwJgEtfba96ksVgy4EMNX3fsblgROh9dy1vzvEUSuAwGSX5AeMZXPmsOP4bWeR1AN41EDmX5tmKWFFB
 Q1nFpOfF3vFKfGG0xKW1IchozYMOtg6SWjwiejJJSp1eU70bARY3IazzAEtJdp9TvDmpZ713Y+USgdGeadqDSFXmm2SBmEHZjgXelEXKTbNY4oDIUZZaxuzh
 XG2mVqMVW+u/s4xNvMV/SiqSKNHfl7GyrFxLqwKrNMR0jL7y2EKAYuiE4hTsVyj7hzv3dO1L8X/RaxAnAZw3KuwGgaPJE9EeRy6xfoB9zoqnU6OBoQkQETM5
 AG2PENeR4XZnSJlOyfNHhWFR9APM2spvXaF2A71VAyS1jBkT7Mulocm6yYmod0QwmNG8FeWwwV8iI+ePK3WZjGwvsuft+/fkrv8b3MWylyw5C/bjqRUdQcWH
 /XAJD53Cyv5DnE2bWzT8I3zs95vVp9B2W8mjcjFUPzDhbeDu86zjGiFVYo0McwzVbtnqeCqugCDUuTGbZOCRVbXozO/gWxNsGDEismOnQd5+JYVQGIa3bTJs
 68BENAaGHIjZ7TGHVFTjUnYe5AiQkVquE4YaITgXVbdQACH1k2evF/8EbdJKjGdJ7JxP6EWCtQtbCHjUXkI0uHiKetJA+/oj4WhIfWtNfCqxX0LZMc2q/p4o
 nVCKr21obeR4RaGkLAGE9ldZjBR0HUoimnD8W90YRfdUX31cao7MbkrQPO7oy3tOWwhyZoPb6sfA11r9XcI8yl3Z6ZiLMI4K2ozTYXJOgLhFrdfpakQHRa1m
 urUJ5htyuE+FI+FQp3Bcl3PL6KJuvYYPFIOqg6DWHB67cbjKSyzae8wqCAKUVIG/oLtDKOhMFmxgIJCi326AqT7cWy/heqsRPgswrX6aHlqwpP15ZN5nNDy1
 7C0rQ7pf/Cz0gnc2kAb01WVZJtv9kCKtDC+yAZlSw081RQwp04i0ktt7lG0W6+lRRTg2WS1GyqYMnE58pTemLTL8sKEITUjRZfYGgtAgoHX/e8qhoPw+tVci
 lkTo2Je1wSWwXbsW1UD/YWYEHD0qP1bgBQ18Jafm3aT2P1GPYDPNAgZ+WDKzsSNgJzBT1nEADya5+Tc9jjrBhfO/ZDmH9pGroK2PAPHMnQUJUTby6Tv9eDBK
 Yk4/xLV0gsLrGbNH5mZJdyg4jnMzUpnFcYR2QjmftvvoMUAKP0V1y9ISqrpbgm6GpbBLFgd130j6IwcHkfRl0gYtkcme5DJcXquD27cfwIJsa4dsOOgBzWcL
 H/ihWMGrOtF59XmDIXeaBolc2ZtVDINMTeNfxGyrhyzzToPGopxf/nbCoFxTwQ6TOLtWXjapeWoNOb/Mpww9t1x/LvtqODc8dFy3K2F7evJUW+CVCkYMbleC
 XczgKjHwcQeReR1TswCSnR19z84mMPTAc1Q+Y3VTBm44BWZl0Gut/SyEyqPGJ+mCIuy88xJwKaIG+2CQjXvzmiINe/SGFMJ0lgmU5SQ0gqyb5SQUy5ScWQsk
 ruPpc2IYQpujIkgzzoLMSggHpBySLZJJjjmuayG2LKq2idRHw9W2is8YHcnJ7MVtNguIh148BiKvjhlTeUt8mEtJEzGoXzUMmvsTCtH1iSKA5OyLp5iTmxLd
 BIDZh1tJMTrikM5JDisA4LjzEFVDJZN/3iSGAx5OJMGg8jryz+MFLVQLSydG2ZYOu232zu3uBODKFmZHlsUIq5KG0G9E5dN9s9v2G7+ljJTaWI8sDKfn3A==
Subject: [Buildroot] [PATCH 017/102] board/beagleboardx15/genimage.cfg:
 beautify file
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
 board/beagleboardx15/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/beagleboardx15/genimage.cfg b/board/beagleboardx15/genimage.cfg
index d27eff609f..b1604105cd 100644
--- a/board/beagleboardx15/genimage.cfg
+++ b/board/beagleboardx15/genimage.cfg
@@ -5,6 +5,7 @@ image boot.vfat {
 			"u-boot.img"
 		}
 	}
+
 	size = 4M
 }
 
@@ -15,7 +16,7 @@ image sdcard.img {
 	partition u-boot {
 		partition-type = 0xC
 		bootable = "true"
-                image = "boot.vfat"
+		image = "boot.vfat"
 	}
 
 	partition rootfs {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
