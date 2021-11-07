Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3A4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3154660FC1
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3154660FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1D74032F;
	Sun,  7 Nov 2021 02:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQGoXhDHX3Tc; Sun,  7 Nov 2021 02:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BAF140329;
	Sun,  7 Nov 2021 02:10:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 772F01BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6685E4012E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blVO-1_jpMtn for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:07:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F577400A3
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:07:51 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXb3mqSjzrIRljXb4mQxeZ; Sun, 07 Nov 2021 03:07:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250871; bh=yeG7MK2nlvqmQZRO2Dphdxuq7GzpChPZaZMETZIGJHg=;
 h=From:To:Subject:Date:MIME-Version;
 b=jza0O9YFtgrnduVk2e5wNqxG2z0bScd1kcbjkcYOqQRU2OPNNbhNOoJdwYIyphfbT
 gPbOh+Z+rZDPEx86jpkD2rb/WkFYWbYpsHmsQMuIm20QtikrTSXylwKqPm7Z00Vw18
 i/Pzuhul2Wop4SEPh2gEYZMGAsnMhqT9LN7auLu+5ALftIPyCBv3jhtRehWDCdR440
 Aa3UG6mcqy6gD7OZdTRYzWfJPnP7sUKFIOdnnOklk5kwT8PzZqzLjZPfRUKqq2h/eZ
 wgJAv8059JEtCDW3GmTkd4qBdX5Dn8cZhuVbdWwWF9A+r2rssQdnO6rL26QUnelx/U
 8MuX6es8fPn6w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:07:49 +0100
Message-Id: <20211107020749.3058335-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLOWv5tWcM6WCDmliPqrYRxrPMBn7y4pcFKLpDfl3sbe+YkN9xDT2oIGGvz6HgG2ceHT6YzOAcN4YPoOagL2f9i9An6tdc+XEsnfgxIq0wylUsoaGyg3
 TPRAEwTLaQK68w0tcSmfdtCSuEZ4JqzOgx74Hm/d+dUuRoz+wTNT2g0gPRpNVELbUYBVfTP28iuzaxmJd/m5RpWP6dd8e7k1hVFYcw1t+WEGIq2qS8yVpXSY
 OTIJ+dO91jzKOWlIQr5YCbXLnLjWewsYtJrWELeW1L0xp39Kq2d8EDadA7jx+Q1H3ovT6gEOkyIVFf+vR9kADPOrOr2NR9hFlMfGwOX06kLODuKMMjxdR1LY
 tDpn+UoEeg8QEpfa0848QvGKeVx4JodtG0+Gu+4gVhtzImLvmNEMbXIFg1aowLp5JE1KVc+T6eq1cbBuTVZ+R0PjbcwpmS+6asem5c33+Zo+kSi2YGVO9MqB
 BhDVfNkjjheRupKSwZoRM4uqnigL2fUTblQSt2iFzD7tOiWVInP5pCGP8XugS5qukoBSiYLQTS/LRsV0WhvI/ARk7JxSK3K+E6cvnCNj5rDoIfK6gfJ6jEbu
 trDIyvtXq5ZmjWMWO3CQ4UgzVyH/cB6SHb88CDQuqX6azkr7PObp0TK2x5Ka6/yzgV7LvO/wvNWNdV5WVRkfzYkHoZTv7EWL2r1zd5knZ+KwtQOSHjq97EEx
 ZJKBn/+fKDTLromNe4TqcwyBoqJEJPA++m1iFYl69skrX9CuIPQXo0Qk6ctqkuzE+wpNxTEkliZiESN2m2n/4b2yOlhKmPejYqreEVJvfmvglwuSR0yjGhYV
 kJiXH8kgL6Zlp76icsigOqGtlY5rjQxclkq/LellAx1YyMoHn+rNWbJgbL2pI/qB1PF9yC6QM/bN8jBvdxWE7liMiCSts8nPS20b269N0JpI4Wi+V5J+DhuK
 NAnbBFwebZ6NdFGiDv3NgZsYA9aWmhtu0ztnXAqcB8dZEWjzZZtEmx3q2IBCipfeEd5IqXStyY7XmlFRMKUkwpp5Tr3LlBhqOP/LeFk4oKh3xaRR4NL6qPw9
 ny9CxHqxSseE3QycC6TbjUwsdrPOEm9Yv10ahtkeL/dlQPuVLB8zBAqWjBd14L1EoVTGo1uiC2zkFhv33uf6yACevVoNVFnmM1A3+Jt+Ho4xp/FyeqfVCh9U
 C/8LeXK5isMjBIHBvCCz0OvzIVCVYmDmH8suxE1TqbQEPZnexMFL81ll+6OsQz/6qEXz0lwhVY/lxp8zIAh9GZaqfG/J96M76YF6zWTqIFjKtkeaK1fl7jCC
 Ye+iJnynFZzzNn0UtI/VWdErdlfEIxQTwTsEvqV4Th93zPrIVLDpcJcPdKV6UwEj0tCFRmtttvq3wygsNRewRc9+N5cSa5xs7FWGlkVUVAXzVPYnURG3sJHT
 ohaZOXJh5DkIyMPLiT//qI1rH86qgOhx6i1Yywf/OlkDXjZ331UTzh3oP/n2YU7Fm8/i3MYECPZhnzY701xqNO0Qf2+toljZb6Rnpcg8ZiZlVzLGsp3LTSvm
 FFYaNz4ipWIbHb3K8wb3HWrtATqSfpgiLXnLGYrINqIlTt2JlKVrnPOZigbZzcP6SVVcYrQ4MyUfLkTmZlC++Xas8h45cWgXCI90WTY7ynmvAg3DqgRzW4G3
 GxKu8BqxvgOY0aaOZ1qRWGAzoWLm0A4CB/PBYvFuBXJUyDT7ws9LdX0lUSvMfqFg/wI4KZdJajceNeDo8XKAUfWyh4taDKr9k3Ob5q+s6gA3Z/GW2Q6vzQ==
Subject: [Buildroot] [PATCH 038/102] board/grinn/chiliboard/genimage.cfg:
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
 board/grinn/chiliboard/genimage.cfg | 43 +++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/board/grinn/chiliboard/genimage.cfg b/board/grinn/chiliboard/genimage.cfg
index ffe027e7ab..f335d7de4e 100644
--- a/board/grinn/chiliboard/genimage.cfg
+++ b/board/grinn/chiliboard/genimage.cfg
@@ -2,30 +2,31 @@
 #
 
 image boot.vfat {
-  vfat {
-    files = {
-      "MLO",
-      "u-boot.img",
-      "am335x-chiliboard.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"am335x-chiliboard.dtb",
+			"zImage"
+		}
+	}
+
+	size = 16M
 }
 
 image sdcard.img {
-  hdimage {
-  }
+	hdimage {
+	}
 
-  partition u-boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 1M
-  }
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 1M
+	}
 
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
