Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCB5C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F65615A3
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76F65615A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5190B40171;
	Sun,  7 Nov 2021 02:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OL1ru6V7iiuj; Sun,  7 Nov 2021 02:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF60C40162;
	Sun,  7 Nov 2021 02:08:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4AE1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 383204029E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oO9PTceOuaBh for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52A5140295
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:58 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXWLmqOnkrIRljXWLmQvTE; Sun, 07 Nov 2021 03:02:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250578; bh=ODob/2yVLUrpvGXyERSIUAnZPqVZ5WdYc+Y2HD7d1qc=;
 h=From:To:Subject:Date:MIME-Version;
 b=S82QFOoXk6nH45OqCzWNpKrMYO8mLKpeDBmAacYcFbpz0Giidc1Co0YGJc0i7Zpqx
 0NUKE+c61Z4+W07ZuYt1blaCVzb50XHZj6lajwQJKaP+/gitxz/zBN4QsXIDZGQYzY
 bLjRA8vv18RjGYYQzxfhSRAKqoKM9fnWtEQ4dcO/+OSlpdAWZvRpzMjy58urtOZ/QL
 gf5xNJJqSzfhk61c6e8+Hlr98MGdpmBGXGU0lgaE/1M9dF+jbsfDDMI/3vNq1/RAcp
 Ys1UnOq0XsaALO8mKfAf3yeylaCt6PgauGCQjKa2PxZNRLFQBxDYlaIm4aWsEskaQG
 LTnWkKi5Lbu5A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:02:52 +0100
Message-Id: <20211107020252.3056702-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJh5wzXjmrCrcfbyZF/01zmZIgKOYh3t67FZF9xNXAwc/qMTxUpKCptqt2aqqbM/LQlFeHGwR1+muMiCQGBl6fJZjNel2hNA2UrpXlK+GOaXcdocJd7H
 aT+FIfURAb/v8ZfkDhWE8DZPZ9yBt7lfA2OhLYJnwc8PaqfYGkx9gA/MG2lcHRBTrXRQZ3wTFvKZdSiiVP6UmWOB34nZG9UdJyxex3JSfNG8neXugpEj/3WC
 dsseDZ2VVHMRhLQVe+yk68e1woz/6rG0M7KpPytxm4WdiCbImcDB23qpp0W3QXvUpHCwbBchHEKCBHLFTDRuNtrwr6iV12ifKZGpSi4sLJBxq0ZmrHBk8VQx
 jusvVoK2miOVhwjkSRwdzycvFZE5W2AK//T9YZDH9JG0zZIW18FrXtBpJBxc8ySj6cSBHrBuQ9XiQtWU2XfI/I56LMJWgS3NPtDlc0O0rDE6sHZ2qLQgbGvC
 rtE16jYRy1wu+nOCV6a+bmTW01vZ59ugYs+09EurrZhbN4kdIagHq1HzKXeNbx/4REHQZov/TlN8xDj/bmEY+4skY/YRfT/2mgYVCkBiuV/st/xm+ObP9cVP
 qfL3bvIncN9nDEY9vCD7kfKMHkMr5uZ1x39s1R5/z0xgZBqTW0+IjZg5s7an2CY2Kifw3CfUGEiTA4m6+RmrmbyPNgUF6xKk0kvFeUmyA8mjZzc7i9GCpNTY
 EdlMq45llHTYX4JsWIKG38DxcgiPPNH4BZBhvhEd8MgvhnzJ1aqbv+rmFK6vYuAD20QjejuvxwfSkTVSGeofL2j1pBzJjXnTe4qWCLS24QzsFpaaOhsYhILf
 MAXbQX6S08OS8NgLg8efl6rdH78yCqFXNx+tlAozsiOkHwaQKFgKf6jERBNnRDVJgt7XwczpoDq1AdX5c3qit/GQsB6W9qzy8AE6K9mjabkmF6GABG2Irh6P
 aDwNWDwbgqpjBpjnhv8aloAv9SPBwvybOy4u6F3MkpRpKlcBFal3QPgCPyPA0yDdHOXSW4/v+grGGCyYQU601ddQx80jKd5YRoML8sNm0d7pMFIC7UlQ5Frz
 Vi4c37zt4+6CyLfarV07OBlzicxYfRs5q+0PtQQuKA14o7Uobr642J1hfKcgBn/RbYy3K89+2oyTfAVV6yncajCsA9At2JR1SB+DRMRyS8wNT2VgzHTYh4Yy
 oOYXXXMdfrzC/EXn2eEdwgC8MlTyezVMg2njcH6rO2bQkU+Z+t5tvgpEn5Xd3sxW01ZBibD6ESzBiWoQ0BgSKu/Yj9Xbgnnrk2UbqTPsN7dHG9Qn9ImuoXyx
 ypzbE+ih+ip70feK5qkv/eEr0hEDNDv9b6gzGLSK8qNRc+xBFUYyBNJhSdAUKxQjtTluAvmnLI9hHoNBQ0YP6P5Py4X11olqHrcJE2zdUZBVUIZN8zAuSU7c
 P1GJKV9hkjr63sbeMFRv8PheO/wjv6tRonob3yvBe43+lxZTAz0DUjiSAbi3iizQ4KKZTIcj6rqER+JCYR42Ba99Z9dcQUu3HS2OOYrIimGyxwx6CcmQg8hP
 2km2GtiqMIZutjrgukdldLYIE6ijwYQ2zV4gjkObStbI/BbfVzUnbblUeVbsFuAYxfrKVdV85DU/A69OO0bEmDggsQTFka26MYZwufol3kwCdnYnueaNAx8A
 FBmpyS+gidejFqfn/+/OwYbCRq7iCP8eliVQ9NmRRCvpwHQPv94cJL7M7PTP3QgTVoupuW+97GThYd20iU/WzA4L7ZagebentkWWJ6nyY8HzIJQ8gf5yIw==
Subject: [Buildroot] [PATCH 013/102]
 board/bananapi/bananapi-m1/genimage.cfg: beautify file
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
 board/bananapi/bananapi-m1/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/bananapi/bananapi-m1/genimage.cfg b/board/bananapi/bananapi-m1/genimage.cfg
index e2e131162d..ce62fbf712 100644
--- a/board/bananapi/bananapi-m1/genimage.cfg
+++ b/board/bananapi/bananapi-m1/genimage.cfg
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
