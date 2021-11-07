Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C2DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC3F615A2
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BC3F615A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23E5940250;
	Sun,  7 Nov 2021 02:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2uMWmXmGfh5; Sun,  7 Nov 2021 02:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D8AC40235;
	Sun,  7 Nov 2021 02:09:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF2C1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B03740295
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyK4_xObqi4n for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:06:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4543F402A7
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:06:29 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXWqmqPElrIRljXWqmQvhn; Sun, 07 Nov 2021 03:03:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250609; bh=Jl3MPXnHwISvAi0+r9HOIWD2IcdgYme8jD9x2EsCn60=;
 h=From:To:Subject:Date:MIME-Version;
 b=F8O45ZyfClIvj+X5I3uMMu+wK6AMfbkcBYnc1TDnr5JVNrEvQ6fWzkrtWB6Hwl+GJ
 cunIycb4zCRQkZRAWnTTszOdmpsB9zLe6RGMGLZ42CpeezvB/rINyUw/GjnvIQqcSj
 V0dwYpIyx2Nie5QpH7NvyVoMxrKNqLxFcwDh2yc8yF9KTYy6I8gHGvDI0sgjGFCogc
 bEC+Pf7craRUFpgXQNRSwvcFIe3QAIwM862/xSaLEk2DXZ+mkSOSjr+lFo/KZZZMFw
 7BJm22J8OgzQL3TZLlanpSSBk5danp+2kaFVZuqj6W2eJTdz+iyob/dNIBsnKJvUFj
 9sL87KPXvoLnQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:03:27 +0100
Message-Id: <20211107020327.3056830-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMhQukROqzFBr3rZlc7xDKoM98ITpHPGgdGPIKexF6dNpTYIqKnHw92r2Avj4Nw2kixWO4macrHi37YiPqa8U7WPPXhmBY9MSThUMuWkypTggRysT+Bw
 I+r7bDUOslIH3lEIVH7mc7q6wAI291z5lEp0wG490FodLwp0Z+3uX/XGcNb5irUgJe2DfYmFwymb/dhtiLA+RZ0MOk4WV1mWW6JQQ5/iPU7IruZLBb+Og9u8
 BUbFquzNsFRtcsmSwZodBou+LHUX91LzObm9rSETtJyzBfr6L3uTvszMhkaUb4EOzOc3vR4ZzmBuuETDWI9UEQzoyZRkroyXEXz7Y6H+By9UMf4Brk1UFRk/
 J+qY+xPDXfbMhYZ8UJfQ8Fm3ALcp/ggKxgKqz5twuOyHHlKPFq+Awl9utuyvVgfX5vgcwFRRyrlfDxU4f+WIhpyNL6ziZnF0iwHDl0oEMTwdC3MKfN9TeCa0
 cY/t7VjMJKcinif9un//ohnF0oSFTZUn2TF4zn0pJV2K9WAGkOUdy4SrQ8cCMiwZv741dTD0DlT3VXgfMI2K5tWq+qJ5X8xcbjDbxveZSwVNvQkktr0ZRbqc
 kDDJAUr57TK7WXA8VGhZvHH1LpkCaNOfNdB5osEzkufmdlwoxYGRBtQ24NHAOjKBnRadaaq3eOFvghwi0Zc1ohOmv+2TFxOsR13JfASwFAsiSc0ioIkDmsBG
 01W1PkjKuy11k2SFDLIw0zW3g1iDpyAt8Vk7f+Lj1HAUOqyojfl344d/hYFW7j4IjQdXHf1WRAzCAuflruqUaEPjbadXJ1qm7EctEVyUnK3yi0REeNNgHmgS
 3SNaU3zpB4/j/SL395iGL6TV8tdQ243K9z6YM0lSVWuXh6R6ErSDRbOnshpzHU8dGoR/L8x6uOdcVLivzhr4/ZMn7zp7+G93VMbV8D5+qzFjOwla8GpJzI7t
 ME3X5oJgvm+47j32Q5iNd2oxu1n4N4nVEIHgYgdt0TCyBMAn0+FrYJLGV6fZ1D/pWxCZPNjs9a+nDNeNHkJKA4k3qo1f60d5PU1223F2MFBPYq7y2KIQptgI
 T1RRablOg6Qxp03inXsgBNW3WKR3If2qM7H8r1KICn+GhP6R54vr8zapvZlgaQ1TWLLvsEtOsORP6I3ieVoTBRhoTa2rioBN3Ld06gr0AxONwx+4z1HoVWqw
 Y+1Nw8G528eqkg5iasjEBVUEsT7H8glozZFPFYWmW2P2/DKCwjZe+sM8ohUXm6Gs2b70R9xRUk9QdPpbBg8iw94YZk4EWbmjBACJfvnJeEU0Y8esoxur2wjo
 sd+OsYl20BtfyOMtHsDYw5+OOT4+EA5LvhzQqU6gBYt5aX8myA7eWhRv/cav58cGF8JRosD3m+aTOHB9t6oZjEegdKEJFNJjkOi3yiaDAzOfiobaqlOJDpG9
 TxYFv2DqB4UhorQKRCr+GnH9K1Z16saqIPcHBofANPO1VHW4+4H74CBpN/fLxyD20CO+s3EsGx7PF1zY+fUGk5u+4AJvxAL0NXhJC8McHDSgdxVnSqMcIwit
 lG8oaAP7GrMu2kVEZs8mrWQHCKhtdNCXEaSAewjlT1iLi9SCe0vPtxQthhQperfErF5oGHSYDtWyE4IyxpzuW881WJIHh1jRCTjIJCpI1Tt4lpWTPfB79qFt
 EAyf+mZJ9RE+KinMS4333OEDHKPKNIbmZyQAjuqah6FaqkS7wzlLMd2IhfAOo94be0diFDbQY48dvXYggjnDHD57/NGw9xtoA5p0xRBb83KxKrn4YKQW/w==
Subject: [Buildroot] [PATCH 015/102]
 board/bananapi/bananapi-m2-zero/genimage.cfg: beautify file
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
 board/bananapi/bananapi-m2-zero/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/bananapi/bananapi-m2-zero/genimage.cfg b/board/bananapi/bananapi-m2-zero/genimage.cfg
index e41f1f9392..1f565b5238 100644
--- a/board/bananapi/bananapi-m2-zero/genimage.cfg
+++ b/board/bananapi/bananapi-m2-zero/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,8 +17,8 @@ image sdcard.img {
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
