Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33257C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD0586152A
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD0586152A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D874032E;
	Sun,  7 Nov 2021 02:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLuBV2WJR3nI; Sun,  7 Nov 2021 02:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F47F4031B;
	Sun,  7 Nov 2021 02:07:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9C21BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56F7981BC2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fzkg0m59dAV8 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8240B81BB2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:44 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXZ0muT2aFf01jXZ1mqLts; Sun, 07 Nov 2021 03:05:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250744; bh=O2cSneJQwIrZnHLhOkPwuFeJUdBdLD1RBNqhbJBUTCI=;
 h=From:To:Subject:Date:MIME-Version;
 b=S0AQldUVsNTunHHVbw9mYOFSqrRIwPYenhWsgsZLJ9q25ZpTSlID8wK4M1ZylAowR
 SAXr8U+zbUQPKVmZoFBBetX6/BiUtV12lbtQAo9HC/G7o1bUfb+KBZTAKuv1gQlUsi
 OVqYcqi0T5Kn9Yv0Uk3g1lsTBIZN+U5wXRHoaRjVmqs5GY/14Q19IvLWsmDnPaorUQ
 bnklItcrN/Hw5e9TpFlQrqto+ISx9THi+Yc9Il46wowZ9tn19pOi7M5vGRGBFN++kz
 Gw3Q5UIHH0CE7ReT3rzquz8reFT4Xl+YbkZeleXCuWi0iKUlbIXlndYcZVASwP+tzB
 3TtJySDYggS8A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:05:42 +0100
Message-Id: <20211107020542.3057573-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOMnxK+7KLcwKRSkhXF2D51YFmbOqwTr11PvZEb1o9MIe1M5nkRPaaBPWSk3Pr0ECTfbJIZZn563i2mbtdAEdbZYfAz07Rpt1i8EzMgtCNrXKkO67/WX
 Txu+aTBoHXslAJtmI2QUGXjI3XPCHRLHbiUT1RQsFdNmBpk9+k69opZcMdIsUmjfE1hVfLOSLRwl1T9+q5BxVzl9xYrr1FGPV240BxoZwE1e8HuUrefdZv6R
 Meb9xN3Z31Ic4jOVhI/jStB3dvbPzeSdfPxON5TH5S0TvcJnz+b5xpHFfeTiRJpmakPOCdZPlRcvWKznYWQE8xg6Bt64xgwRgBCe4N+u3K4ayqBp4kZqHRPi
 eh/GEorkP108T+SwP44U7DZDe+ZzAuaj8EJc5sZsdk8whkYX4fDgJfE4bxY21oksO9Vq5Gjhh3NgCOeUIHz5eyF5prNQgNT/bZI7KzNELyMFRwZqmTCrKRlm
 1EULfrrXIVPMbaS0CqqK7BVTc4FhfgfBu2Qb2oTe7oJvMqMizPxOfUdt7XS4bENO6UBAPKV67xmaVQvC3TsUnaXgt705z0Rtd2+m3e39Wfj9hwSl5glvTSKc
 y6qRwG8uelzvNSQqm0bbwpskRGcR3nE915yBNTn7aad606a2tE8E9vzruCNmT3Wld4Digi7PXkY5lnShZq9ziQs7LAznQhviolWXbb4u0nGAeRjfSWzmVuZX
 H1PZ0QHlcwDgrtRqHGigcafNefAUyTIKSWKBXlbSOve6UFJ3uCKNwBvVepWYHKLy0JKCjQ/owch07iOXmpx+UFwUOK6aLkJvRPBtUXO1n/j9fQohL8+bw5qh
 TW/HsSi9n/lDz8/eTG8IHkKahaVAPy/KWFrD48cMqi53EwioeH4Ch2dzNF1giHy/7qzg5qcO2EVCgtxJO3nfY+i93b2x1KaokUc/+B1/FUsFzXPz862p4pAw
 RBOwLbIuNgwa/2d7AbZdAHbFRZwdPKNH9D4tCMUEQ1weq3HRyukymMODRs4um7bze+dce/UurbSmU6dRqV3a+35yoiMYFs57NvmDyrQlODywPeDuApLjZimZ
 T8oYP5FqEqwU7Zy5r2uM5V7QMvIpeF5NudUCxi7LiK5DAdntoKXHhWfEvJBc2Xsnjk6RJQev+Br/pqS2x9Yn+2m4NjpvyZnYtq/WBXfxWZYyDKWcwL+BCCnk
 LQX6xet5w3qaqakaF07VeTbW3BY0XqVhdx9Xc4cNSeOV+wefsYN2/6athh7qgUnfotJU1ETjHu1m7K1zUpUm5U0KZUehLwQb1YYOEhGF6E2zycVXY+EAlYai
 b6O97f1YHfuE3WWoiNzfo0wjgeT915xJAdsuEZwTCGSDVaRPF9i+aOheD/ybVapfVCm34rouWKQ8rHdDKGFuZIBY1h7abSCSuHWzVjMkXvzMA/CNgbaCoNYK
 U/BezGzSSp651X/0RD9q8nEy6Lx0kSptf0i4HHNy9zJO8Dw9NEdLWt23FTKLg+/X/J6ugZyzzGLQosF7srDJphIlsLgb4Q0TPjB0UbeWsdw9A6juIWVQyAsJ
 WZ0ew6bQJnoLuSSnFEtyhlFzvfgkwq0peeHmOprT/7tTlIL2QRAu9Ij/P2zOl7iFXrkpmlNIGQdwcqJDCeol78wDxgG9esPIL419W1K2be/BBp87QY4I4bZC
 YRIpYgH41jZ/98Un3e4PTHW9Y19rNFRvye9gthpanggnq8YpBlDqNJkbeZdRiyjmhM4kgiBZk4KgvykWjFF4ttnvH8IEhciB7bC9MXLHRNYXInG0R5we+A==
Subject: [Buildroot] [PATCH 025/102] board/engicam/geam6ul/genimage.cfg:
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
 board/engicam/geam6ul/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/engicam/geam6ul/genimage.cfg b/board/engicam/geam6ul/genimage.cfg
index fcca6e1739..3d290b2ea6 100644
--- a/board/engicam/geam6ul/genimage.cfg
+++ b/board/engicam/geam6ul/genimage.cfg
@@ -5,6 +5,7 @@ image boot.vfat {
 			"imx6ul-geam-kit.dtb"
 		}
 	}
+
 	size = 64M
 }
 
@@ -15,7 +16,7 @@ image sdcard.img {
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
