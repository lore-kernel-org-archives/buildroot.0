Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31ADFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9EE615A3
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA9EE615A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A69823FF;
	Sun,  7 Nov 2021 02:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgzZx5mVpprP; Sun,  7 Nov 2021 02:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 198AB82422;
	Sun,  7 Nov 2021 02:08:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA221BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED86402A3
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Euw0Ikjkua7 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id 584664029E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXZ9mqRBCrIRljXZAmQwri; Sun, 07 Nov 2021 03:05:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250753; bh=Gf7fwUkeNzby2z4G+K3eh6M1LpC6kTaBaxV9I1ume4Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=fZnaKX7Kg7LsHbLkDCutdiN1Qxe3igELLEM+UxJP18iAKzc8sRCUGe6mfyRWDjdoS
 ZuVS+owbCcmb/C00XCXeLtI1ao96vREsO/o7KGT3drNHpXYo+Qzl0o02n4r2O8JN3T
 zS1YzYLTCCWVUJbhXdxRNHC6hsh31rwu1JX9TmiqmYfco5qjz5UvDJhe8RZ7DFDR2V
 JVAZIVF5O2f3flvzO/wLZJF9W4Xxriisu1wylRAU2PV605ns317UtTAmsUCkWgEzUD
 GUmeMVzGmWvuK6aOyxfSRzvVwdL35E4ZLuUHzpscp9bbVdkm5O97z4dM49eFX7MFn5
 gxhnupH8+1uyg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:05:50 +0100
Message-Id: <20211107020550.3057627-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPl84w0FK8OF5c1WPb08JQfJmuta6vb56IFn/dJ4S3DoOdtMvKfz00GQcqh095XkBz/6yEwdEh42eWrcQqhasSmuVZKA3A9vFKmYETCDM28WHa13177A
 zqRv98EVPOb1c3XGrKb/VW29reh2KP45YiZM28AMpZE/Le6XHGR+DSLifA20h4+g6qcMGqebR+YhzkYyMkbrYe5L+2bu3cJeDodGSdUfVce8P/1IkYOVAFYE
 o08xZ0+DDr0Y1yW1D/50GnJIASTB40fKdD6aJd1mNEPQfhLmnh+E2bD32t+R+Y38SB8mTypTGBOD/GmqG2aIMtALtQfAc0FNd3FARrkK6JKyiU2FMS0VFftu
 EMvNih4tyC3Tsyg3IrUZvHmmJRcfaBb9jPPZqdFDRo4/RORTJ7dtL33H2t1m/AFk90UrgsYJB1Q3OM+jHa/uqMVxUk5nsAaQx5Iar7uz7XdXYxMm14B1VE3w
 sVe/EOxP0WpO7xXFRbqZ3sDR3zXyQxkeiwkdlnjcxaQ5a2805rE7ghNMV1TAklsP3PfY2HZI+2ljGGoinRG9PB39uU8jSV80TXSN4aOeNApf18dAwiPgr+iT
 dqcbQI9mJewK/RNHnsbVf+wyOHCyO98R4WSAOhl+lfhsn7jM3heljzrY/JsFQ7CrieWZKyrIGHa8g8O8byAw8GvZK9PPJ5LssfHCYeh+2BaEcVwUri95OWwH
 +nIYHKSrrfz+ZJOzu575IzTqFNMqY+Uj1cYRkkb7v64X1M5Rim7/CA9iHBLDmil7a4cNDSjUf/BCXSh0Qm/zldfiU4LBDhDGsffiN1UiRM/kLyXEvZmhB+8Y
 qIW5lu76CvIBpVVzS1qsi9SQ8qX3B/71Be2PIFOjSPvuQXDf4OwSvLmPyTZ8PdBcQCMPZxkzmO/ceO7AtMN7GTyF/a4eH7yBdtkjWKgzgXFeB3cdArSKUkt7
 lmTqdr4IdhA6UlV/8kFfHye7RP+SthwVFWRwZO1u5uoq3gTw1qAtCSp7ziGMmUtzBGUrsg+LJNrZmoAEwcCtvalQ07FP+DeIUMMJvfimWv/28NLtpo6NcIyg
 1uQWqt4oUOi25giOtEQuPXX75nMM1epW7JhYNH9FgsipysH0WtKfGyvoqmL+IpK4AmP6Cbm9/X6DOwAgXvLqsaDx6u927/kap/CSzv8kq8Aqc7FctRmj47Jx
 dd0mHUE9jSfAnX1iInOlR1YHEJ5K8x8FjLOYnEmmgJkMYokR0ysEEdccAXxTA7ozwwCCaqoZA9li5RvQKhOjmYl0ZH9NlpEgHUdiKCX4pNLrnhQDk/6RzJf7
 dp9TmscH1/jzTm26uvcdtXX6JtIlbBS7Z6sKReco5rb+OMYPC4OQ8fSjk9tClXNAFaV07SO4ezJ9usmC0EQVIxRz7xWGkzs3KQfqsvwy95no/i4wPCHSNm6R
 6uxigylr4CvM/qES1tgBWUtCHfjrViMMJCumqk+LpB/VyhVwx4lvcffU0jUFAHI1a4gzxE8ghQHw/BAzFsk2mVE27pfIeY2rK1JkuEkmeIYmv0K3UTIwZoD4
 Wb6x4tESfroMsToWj1zocv//HotLCzb1TrO0JSDiTnIDkDNLHsc9qKdjLtBJ1FEeeAuXLwaODSLHsZXQVCU6ipqP1PizskhrcYIqmwoCCr0KvA6jb4sTvq+W
 V3LgVh4wHL36ABX6ZhTMookWhryHOqQ+I6PSmJsSVj5pfYCA3WYYF2Ti1JsnfOsVlzA1q7vWOAprk473yxnDAQ0x633Tcs/tGaeX8pU+woF3JHsh4vKc+A==
Subject: [Buildroot] [PATCH 026/102] board/engicam/icorem6/genimage.cfg:
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
 board/engicam/icorem6/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/engicam/icorem6/genimage.cfg b/board/engicam/icorem6/genimage.cfg
index 835d905869..985d9e5de1 100644
--- a/board/engicam/icorem6/genimage.cfg
+++ b/board/engicam/icorem6/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"imx6q-icore-ofcap12.dtb"
 		}
 	}
+
 	size = 64M
 }
 
@@ -18,7 +19,7 @@ image sdcard.img {
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
