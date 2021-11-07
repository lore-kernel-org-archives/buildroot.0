Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD428C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:05:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF85610A8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BF85610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E81F40242;
	Sun,  7 Nov 2021 02:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6lzl2G0mYon; Sun,  7 Nov 2021 02:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5583A40241;
	Sun,  7 Nov 2021 02:05:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29CCC1BF573
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18B7C40251
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaxHSGfEEm45 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp4.osuosl.org (Postfix) with ESMTP id 292F540249
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:49 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXY8muSd3Ff01jXY8mqLgA; Sun, 07 Nov 2021 03:04:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250689; bh=VAKRqaB2ZcH+fs4cOiBuv/BigHCG2wS6TvV+aTZyFSw=;
 h=From:To:Subject:Date:MIME-Version;
 b=ejT4gIMp7KdZaPXgMz3hJRb5q73TX/ha50DnlMKc4vbYlOjm9Mf7P01gzxy9Qq96m
 c5GRAEjuOds7+I+siC2P3s8eYyMz5BbPaLB3y7joyZNYOtrwKMkS5w2tHCqIPk+17z
 Wu1hV+EECCBvDYUAtO1smg8lz86KVx0mopGW949NuEPC5lgrsN5C1Ajw0ZRECDK9+L
 jwvmDA8xwlD4EqKhiaOGAsLtSMSUgkI+fioXQRFuMsQlufbcrmQwo7wCP4Hbif3fhs
 qWhOBczDdhZ5BHXqPYZxFmSvOGNlOI8+3lSNMH9kcN7zmequ4wGLNQUNcVX+CYBBcJ
 pzKkjoTZ93y1w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:04:46 +0100
Message-Id: <20211107020446.3057233-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOXmuqyq7ffr9QFsPDrac7SXoPdYRn1kNli1Rjn9B8Zo9NPjGe9Ur8iQ+jMhrSjHAkN4RlVBPIMzdiC1099IJCUAF/sommIUlc8dVFb6lwfxBWg/nzYs
 bXBM+oECF53pOJgC3ra0DgLmbuwt6rjvBdLBCeVO66A0VVviI7OKtyYSvefKsCkplHjoKHXzq9hK7pw5L+YFuML3lxRl3rZlkt6HKL3hkVhJaaDTvbLtLpO5
 Bm/2IFEJLSFDz823M9+oC6BppHWIyN30vSZ51fKBT/D/UG1uB6BbX/co3cSAVI0zYiVzFUUDpPIaFRQfzuy5kL9eoIzPRls/Uwy9rpLWmrdEhSE/z9WS85zL
 CHHy4iMz//eQZjG+Wd2uSNVMO7WhPxSnzW+lSQ+ZaVmJTq+rdI6vM0PLXSuy8AjYY8UXQKq1EFwPF7VPdO2BVWMcjs0i/hnmvk3pXNRbnQ25oNE+FWoG1Nwg
 rGE8aTflHTU2YTomL9kcoFcTCEBnBvzl+/EIpyGLfsKTloz50g9HWpoNqYIBgbe+wgOX3EAbRLzOPGiNQu/hisuoiS20PrbKgK4btCw1+rnsJHOE48nOks5C
 sI2RmtXiuz0P0x4LFI0fpBMQuVQWFQzjM/2NvaNtcFQbd2JGnb1uH6uMGIRGoC7xVb2voX+DOHsSrPMtdTXqgjVdfecT1JlvNoRv4K5v0Bnn0EDovG0nDSx3
 YmhQbcMClvteymhFwYzQYKLo0SbA5xt3JcE9MW8/YehynnxFWmYMq6SOza6MLVldNJg4NlaJ2ViDX7JKveYCyzYuwamCLigjgONzUo4biIWdOQ92r0DGCWM/
 5o4N8iBE0iRyjk7kI0fapbf9yLgifzcTtZJZAIs0Jcq38QSMlyh+MbJFQ4qXJ7r0IcnEAejYry0EkwwxoA7ZG57AuZod+vMznECiHGrBeyJ0WkKlsNQpZGQW
 4KMeKia6SH58HbI220LEj8S3WPYAboTv904O1KsHwsIPWqR5L2xoK7vLgql854uWAGCgAFMbs+VgRYN4RnaqF7aCx1/h/nAZy3+dIPDdHGb6hx70bwSBVFmD
 G2rq/AenQaefl7o6jrIOX0qO1c5Unq11sqR29ZxdUa2GUUpplkwz9UwJLyAWXdhjItdQOj/eea9+Kiy/4tLmkApwDSEbpP6vQwCmUia8dfxLxHAFKcq6KElP
 K+XbKphBdrfrO6iJZD5goutpAw1KyhlO0qcsUvzivzPtEAXVDIWtniqn44HOnJ2i1MkRzFOzPY1LDAnwKgJChpTEBdoXRknNMO8IZ3d3zFAuOTkiFQwQmdCN
 /WKsQSsPKZTWzPoNPldr4ndkeA3Dp+ttRx3Ry5KiBxtKZDJihU7JhQsW76xcSokp+Dr22m+tcoCpNNY3+TQEclP9cgpJWTOp1Q36LFaUCyoATSU9hXiyE7H9
 P7+Ac04XkttfgB284m0LHXLsTRJAl3dwFgqy4GHJhtUhIN2bIrB1dVfaCdlXjXZS04oF8HK17IBg63AAokasYrKNE+GvgYw/YsjRE95o5gs9u9QWG505fuov
 XWT60szPtfjQKBdRjKNx1WxJ5EzKn+ATaUQKp9urfyyRUsTUEGWV1qbnm+wZUFV9gMZXZPxr+KAALHl5Jg+0GhHMPaVUfUKiexUhpHvPvVwfhNv0WDWzpIQR
 U733qeC+qp5KkbO9j9EfnXVN5ctoi9ziTdcKRwNVBlcpbuseMicuEiUPvcge+HlnGx605CHfRnRrnqHo8PDIUNeD04gYOIG7Enn/FYG7JvT5Q4XLakSw9w==
Subject: [Buildroot] [PATCH 020/102] board/beaglev/genimage.cfg: beautify
 file
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
 board/beaglev/genimage.cfg | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/board/beaglev/genimage.cfg b/board/beaglev/genimage.cfg
index f38bb7f86c..3b28e8dbb6 100644
--- a/board/beaglev/genimage.cfg
+++ b/board/beaglev/genimage.cfg
@@ -1,12 +1,12 @@
 image sdcard.img {
-  hdimage {
-    gpt = true
-  }
+	hdimage {
+		gpt = true
+	}
 
-  partition rootfs {
-    partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
-    partition-uuid = 0fef845a-c6e1-45bc-82f7-002fa720f958
-    bootable = "true"
-    image = "rootfs.ext4"
-  }
+	partition rootfs {
+		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
+		partition-uuid = 0fef845a-c6e1-45bc-82f7-002fa720f958
+		bootable = "true"
+		image = "rootfs.ext4"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
