Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B30DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342A4615A2
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 342A4615A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 018804022C;
	Sun,  7 Nov 2021 02:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxZOc43lWvJh; Sun,  7 Nov 2021 02:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 203DA4022E;
	Sun,  7 Nov 2021 02:08:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF5F81BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF32981BE3
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6gch7Xu6RXf1 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:06:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C3A081BC2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:06:05 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXZMmuTE7Ff01jXZMmqLwb; Sun, 07 Nov 2021 03:06:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250765; bh=tk2PPcDkyUHdo+2H2y7T/gIlvb33a7dzp1Y6ZVfpCa4=;
 h=From:To:Subject:Date:MIME-Version;
 b=enqGIawsDieKRWWJLE6mhJpMOV6mynyaAaAV632dYD1jQTiITOWt0Snp9S99CEmGZ
 Q6+10R/sGnzXcTmJ/NUYM16WI/ePSgwIuAxEq9rn778+K0jriyZArwIHSFJhy6SuLY
 8ZEYlSw5pvNz3Kb1CYjEN3Wk64Xwunn0WfWDNyrUicUMbD4OyyK/hogLSvIm/cGQve
 rnhcpceBr3a+ZOReLbCZ4OMrlRr939N+3RmthiEyNoixqXA13iZ1B+xirfx1FBEm4l
 WM94R43xyaxeA8dZupb87XtP2tWGRWQITy9z7dOmtEnC56iDGqPXZ+Px+uNA5oRdPV
 drCWxXXAz9imQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:06:03 +0100
Message-Id: <20211107020603.3057686-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAVQkhZ2Pc/uePh7ldaUBwZaaQDkrn7EnSS8iQqr4RY1DuMh9Iq1RFHo6NABuPyOpnFKhPD3ngrEjlUQ673G9sqleU9mOy/67G5Szd0Bqn0+DA+WOtCw
 OJxWgPdWR5paO2unDxO3ykKHiNdPeqXbwDjFgPcRwpxww9bSuGi9629tD0zjMAIC/wkqkK+oOmDYdisQliPKKoY9n9XMT2bzBsyyX1jJ1xz4hTDek4MW1/Wv
 ylcMkLrFaJqZJhGSLao2gl59HmvYp6KNWz0BKQ6qIoK3qACupeCnY+GWsZdCuv3cLX6Z/qnb+cj1ZPhjErwibWg5LDd+JNqfYAZvAlBt5oC2BUwO7LBVTGJx
 +AC+HAog/MxiSB/HnNWQUgXX6OKjorxbvOR9M2ryF4pC8Be3NuFL9d6xLzzwMaRYToqrSJ/SAzqZojQTHZkF00enwBneArUzYci3AdW/6QiF4gC55XE+uIK2
 xGBoRGYwgrrRyd4mif2pqUYhHS/f6C/KK/mM7/zx4fbklinxrDzTGr4v7Gd0PcWNrYb66Mxe0yn1cXu1w6Ex5KxmKbKQG0x+mmMKw0iTqdJ9PTJC1mANNBs9
 zv96XIu5JXsihY14rSJcLdSVcEkd2SfUhEPwXOYD9SAIv7+Z3p27h1IVoCq5I91Ku1DrZpDW42PHErhz4Poh8Tsh0KCb5U6bVsRhkXbg8miafO1LBgBn3gBd
 pz4ReHgtlOBj2tTdb4zlePkanRvM2Pj5mwl53M7Jg3bD6sya+3XZcaM+L80LJsPgoZfccl40TrTGFx8wuXvb0DKGbh/OW3D4tzQGs6rD/fkIFjQqNyzfeKqH
 lzy3Odzu/uZNcx4LkvflIdruOj5hQZjTD2vgMdBibmIulqXZznc/SeC5cSH63tSqNVfUv+UjVXKEKXYSaL7ZRt0jbTVfrRyuVOkuSejaDoWzsVovcRf/PmMA
 xZYW2WXWSE+l+10GdCo9bLd6Z57VDgYiy1PMK/r6FD5WeKduyi63shuTOci5gIedm+ZeyY0dFr+MyslgE2/Y1+l1Z8RDjQqif8hLqTv43cdgC+zEzzWBhr2J
 E7Rv7IZuHDogZaaSXOIRerVc+vCRSHwSz/dCXHSX32LUmGo3/Xsb0wyecfiqoeZZmcakjOERNI+V4WgaYb+LSiIQ5/vPCHrAcIp1v+U4+tpQoBizWQtmyyhD
 vwHjrJ8coJ1vK4qYEfJUwuq+0I8+uv1T+t18GfnEpQvBpAj15dyNSuqTtaRVXZNRelar230uRDvC+uMyM005EkHS3LWrkxFfh74kavXgRNysP1FPdK+Q3PAk
 0IHTZohni8k+wkhABkSf9hLkMZg74Cxbe3oGdqbLFp56VYh/xRqZSZfKyVvqtWnJBQL+qRCASnIuWfSUu+Z2JvEEx1sYv4F0iH8htetOlpWBaHbNciwHBST5
 N52J1A3MLQQRW9dfw7v/715jf/mtOtYijpv1PrvfRNmOczonZ7mnWzgYhU9X9WtsRVG8SA8ml+H4gb6ey8yIef1Ysm7uRaXciPhKYoSPubCkAuf5cYuXx9+R
 Og/tY0x+f14cW5DmYWC9JTCYw8YhdV6YhbmhU4TM4p0AIT48Uy847YOXfFc86+eSlm3gvpyiawlf1DaT1np3DK5FG6nJZ/ccIkPLBFr94f5tu4ZdPrddktGe
 lKMFE8VsXuz42TkjagG08+6G6FdJeZqAYGIxFciSLoWqpIjFhH+s9RF+zVlOoMjT+d6uE/F9MJzXM4myhMY/woN2TCAKFrcEoh3YkuOBrsEUzIgCSYdWeg==
Subject: [Buildroot] [PATCH 027/102] board/engicam/icorem6_rqs/genimage.cfg:
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
 board/engicam/icorem6_rqs/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/engicam/icorem6_rqs/genimage.cfg b/board/engicam/icorem6_rqs/genimage.cfg
index 967d10b18a..d6936f8109 100644
--- a/board/engicam/icorem6_rqs/genimage.cfg
+++ b/board/engicam/icorem6_rqs/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"imx6q-icore-rqs.dtb"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,7 +17,7 @@ image sdcard.img {
 	partition SPL {
 		in-partition-table = "no"
 		image = "SPL"
-		offset = 1024
+		offset = 1K
 	}
 
 	partition u-boot-dtb {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
