Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF23FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9AF9617E5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9AF9617E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D584402AD;
	Sun,  7 Nov 2021 02:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fItQeQYu736l; Sun,  7 Nov 2021 02:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE5C402A7;
	Sun,  7 Nov 2021 02:10:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8B01BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62FE681BB2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pd1b-MWj6nTk for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:07:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D73781BE3
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:07:41 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXaumuTw8Ff01jXaumqM9v; Sun, 07 Nov 2021 03:07:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250861; bh=S1cQ6c+/CfApkJQ3unFnruw5FyMUV3QmR3diKGhkUuQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=Qraueatlikv0ss3a2qyzOrYpI+btqZoGvnUHBgllPUW2Q6h7uHaWj3jSBOJ3YNLVb
 lmKAKBT5/E/keyFMLH2AqGYIvtUe9nOgCL3Eq8T4ziOmDY3WpOIR9MWDBm8cEHg7N/
 kXKABqcuuir6Siti88mlUPd09IAyhfiLCLGLom/M8RtntUALMsrWQieVarfy98nmNs
 iut/KkJB5ABa/ni/i41Ug76z2Ko/xk5n0xQXaQzqgIo6badA/b8tTz1HgYvWH88Hzu
 e6dT3dptDPmdkZMTDryMzT/VvZhkV1wapwLlot8RRhGnvn4y7lNRxFQohG0TqHEdU2
 nqLWmteWqRe2A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:07:38 +0100
Message-Id: <20211107020738.3058258-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHQg0FvogGYEbMS/c5ygLkSv5mL+ycds0lf4NVfLDI0NHdOo20I33PsHIZUMKNZp6+fveDXqnbNksCEnvlnJHZKm44OOauB7pGbPMwq2JylBYqgEUMIq
 h0LUdYFnp6Vzxw5TLIAAGAFPDfy6khRUujXPI8t68eNwOSEvCYjVVpeES8LpsCLN4ugI7QKlWh14AyxV57OsBGRqqewPHYilcnFqcFsL89IYVR+Kc6F8TPnw
 3pQyuN+RC4OxbkSekp93G7ZafdnCza33Z1VwQYGvec4BSh/vSWZzCBsXiblyejir1sZyY1roVD4VVBdXwGVjTnWRFj0UeR71WkVIlxKmdH0y4FoetI5WLysK
 mKuwqUBM3Px/62hCgCvtVYfHtJmbijZ0qkI9JbyWx9F7uq00QNER50jThAHOWDhnSC1F3pZsx3U/KsMTZ37eciwLaymrhXBhIPTQ8nZ2z/m9oxEKCPSxNiiB
 SaE+jLwvdwyfjZNsQ92pZxbd7j0GLhSgX8b4Fwkv77hBGbVQO2Rx2vFaPgDIjuMuKPab5P1SCzB02IPd38tzf6ZN0Xlrs75i1HLAQotKI1/9A2TCC9OMH5g0
 Kzvjqh3uddVzjGDYusZd2+CVxOQ0vAS2HUndmTamQXeZ4XZaFx4fjQJjhidXmjKjHoAYRT6bzgpwVJP2WlpaHastXtVpmkZHOEgnXlcqIktCXuI6JQWXy2xL
 asiGWLV/4x/Oy3GzhWZAMaKuWdGo9wRxGubGD2GDGJqAKQhLl3RNJfQ64rvC0wINdlIlr7uWwrZLo2tgbJA1rsMC8YD69LSVHsnFUOKhWTOaV67+M4mzlhTI
 fCkqOCyX/Z1eqKDMBK8ANJ06Tkyz9avmnrss6G3QNv0rXIImNZdKjuhWG7PvB9C98swEWXAgZPpltt6KtznOLaXmMD4Q19gO5FdDelGb5qwkv2FpMQs/Zqr0
 OZfZZB7pNqRjW952A7zmjW7+OTuttmZl3S4nOltUIOLQ5aHSnqVtcEOta112gDcDrIPhSgXqMFgQ/6RXO5+1iZ4Zy//OXcTOgx0FjwJmbxEDK+y3DZV5Vu7u
 56uWZqR5cf04U4uTP+mqEHLFGpQXX02Cny/G4ZLg0KaUlP2Tjsn+9DmlaF7B33uEp+baqJYkQcOOK91/QuWnMaS46h/se1R+7OsJe5xEiV2M7MxUd1qeBYZ8
 o1fBJx3LZMDQO7pG0UVJIsiE93e6C3oKX7EGNbgGjBioM/NNy/z6pjy1lVYsEmu9B+NuLyqVjfvEHTloDWnCoH/zGPCF1j2nd1/BS9F1/EWk/aJmosFLvObO
 WJJm2jrWkoKPgeDKo0QKsVNtOtbC7fJstRK9VFyzx179pavXSAip07TRdZtzN4uxtQWCdUU57PKk8a+iAzskKp0BczQrXr/0Sf8Iwf2ik4XzYRwQHr5lMzfB
 ul9XA8nfnw8fBZtKwqMZBBUDy9J7a/iXzdVBNpdaa0+fN9HRxPhSADAhDGE6ViWutky9kQD9QP7rTwUGmNc+fK2Y1G50Evd2e7S4vmFmGax4j0XnvK2Lp6Vi
 kJtJFLa0xbMjbGL31OCLy/cm7VNCxBH9GgQeHmqsC9wjEXYyOVe2QdIKysrVlgn0r7ww0GbKwslEva4sH+gJK9zuShdjzf6HGl+fxWwEoYU9rWr1q/N9/TCp
 oX7piBPziTGH8UegLGk/ljh6jKVAr1NMi9hUsCBL7t4ebkDWRkyB1bv9kD9ype24ywIIH4aBS1MNtO6cfRLJ0+WRPXE4oaANYz3y3iRHHNwo/C75GhYNoQ==
Subject: [Buildroot] [PATCH 037/102]
 board/friendlyarm/nanopi-r1/genimage.cfg: beautify file
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
 board/friendlyarm/nanopi-r1/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-r1/genimage.cfg b/board/friendlyarm/nanopi-r1/genimage.cfg
index 6f5f35dcd5..a180311cae 100644
--- a/board/friendlyarm/nanopi-r1/genimage.cfg
+++ b/board/friendlyarm/nanopi-r1/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -18,8 +19,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
