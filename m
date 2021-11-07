Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAC4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A68A61440
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A68A61440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66AAD4022E;
	Sun,  7 Nov 2021 02:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPNIIa3AIYsJ; Sun,  7 Nov 2021 02:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A21974023A;
	Sun,  7 Nov 2021 02:04:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 443EA1BF578
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D4FF4023A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ziq4LY9q2fgZ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4045140232
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:07 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXWTmuRoYFf01jXWTmqLQq; Sun, 07 Nov 2021 03:03:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250586; bh=+Vjkn9b5pMNmmNLM513frzN54Tib4SeLLFbitNRyBJw=;
 h=From:To:Subject:Date:MIME-Version;
 b=TTYj656446PL5smi6+Q/g70bcychEsqtl5IhBvtAani31SC3RnAPnA/MpVKDghn8X
 2faO8mmfAFfZZIA7cvQagnVhAZ+DjLxpPhQymXT6QSxiJtvVxabBe6XShtLFO2ZXHz
 eEJ25TMB6TAH19WtZfI7vXwpCW2nYSDC7B/aCFPkste7fii9mkfV+2Vs99x1mbcuAg
 GI3ZNSeKQgASzqhjF2f4Ny8kB0HXH8xI0/IfmHvuG5sTtQKBSdD3wy9hh2lylL+0fW
 8/J/lPoDwtyxr7PCcmxUzKAXi4Uj1pbi1gFvpLh7FOIwqsoOjANAwUORHqovF9+B3d
 DwGGK4eheHY5Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:03:04 +0100
Message-Id: <20211107020304.3056759-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKHmSgwxws9LKpwUtuubIjNqvjMc9q6mUoesgOCe4y4stHS6zZ6vbeWJ4jGPdE9xTCf0IuIcwcjnZZotC2VqTVfrXf/5D+S/ooTczdB88KgoG4qUA8tI
 rKCNqRNQDz5YfF4NSJntHnn8ECLbNtO7OZMoN5NUnSu/LGYwsgN9vh40pfpjbKOiYfJ6mKQWJ5JTlQnau/BvZt4OAMyJxL1xd+tUftImXRDK77bUqxWUnm6K
 1HHfU8sqQ/J/mQI9C4LyPM+lv77YguslccG9n9mGdB9DhjAbCTxkb8KOHR1tysL5q8uxBqNiDr7EonkHCg807yD9vxY2shyyDiJguzhOiz3birmvB5ObpFvq
 fbd6ahJBExTFF5WFvAG2sdKy0ZxH7UwWgmAccgror3bVhKtOi4S8Oakvqn0NS4tgmyARECdQUlGuRCIdov7SiLYJ4EHPn8GEOtWPRIODxJ8vkDRmsTs0yq4G
 2i6Aa3ATzHeVpX+c6knz4pyOziuL+Qy9PEFaHAbLMNuaqh4Mcr3hMX4oQFD9baezGgS/3fnh2PJ0FdxrnOgNTv2kY0VtJi9UdjLWA0JOSeUTD8d2T3QKMBL4
 rCe87R3irVMB3e0P1Kk0IwTRlo4dFCVtVgucbl1gMPJVk+YTGCv4pHpyUTS18os6VClrw92T8+E9LeMtf4BgoY2nDmBZkVb5WW+dDc1DnaLq+ZnJyY/26EGM
 yojJ6Xde2BnwZ9Tpij+UQsTkrAcTuL9xcIeFV30TlAO2LJfDXuIbXC8TjRuGtALJS9+6wnJAqGWLLtkUD2C2lKWhyXhq56GV8rpjQKcahcCJoV2MlQJll/Sh
 7R4ZAKhKA1JF6VMG/A7VUqvp85gW4EbpD/Zbb33j/c+InqPshD8Fmf5QIbOMEeXhpp+M/uVITDBlLkUgRnky8kRu7qZwm64EZnFaegai5Eb0FPFNNg6VZArV
 70V6OegsEOr1kH/x8F1SODXHJ4lPDkhOvATTgE3Vg9WnJFOdNMh9ui4DPFrq/xZvfh4RELF/7TDwNV9mvD8bJNY0tiq3n23a/Dy3mYhEYgO1RjyXmHq8CBdE
 9s8OVxXG/LtUwDBX69BEG4GNzC9TLq5xDthgQ7QvCDZ7ZGNptn4OkrCVM7i8/4VIIcL9W/9UecqHmLHCRjcSzusNzFvbT5mZnqx5UlN5IWz2IKul3zk6Zp1A
 fyKG6d2vIikXvKKDmwNO4eZAvdHmLy7jUcS9dZ/nAVdzeEhnXbBGCd/0OHYlj7YfXigU0ki821eWhVphV5YfVt57n9x89CFqC5WhJ9r2vGQhLa+/Q5No2uHm
 FXQFdOXcZzHQx2D+7AULvEMubmmS7PWymRMJaa2wX8HdHJlWXGZYbs7IEU4fcMkWo1r+WolSLfRPk0mvMzkaIJxvz3aNKUexGr2CGYjYfiHoEkHTRjjVsTdQ
 SW35jizQELXRJ3n0JoKjQ9U/hsOmFux9Jycvq/hMxvWwTk4A9G3yNowSYJVM6wwRhTkbQU4nNMvxLZNZVu7E2gfKaUoJkYMbratWfRjonWuHPSXXKOIGDst6
 D5Yxlk++G4Q04pUVs3/QTtAGczvZ91u8gsIuHMK8hJ+kZ8+0j83xwwQAyGo8UUgNL0GSaDIX1EhsRfQGqmj73tpu0SirGfJKnFsEAQ+AUSHw6td64UnP8tMd
 EMeT4YynoAmuRkBA2riBHad7pG3WLvtS2eDL16MEvbHNaAQ1YfEqW5MXfkReziFu8/yOot5DMKBSx3SYWqhfB22PueUUFHj8em/9A/q73YfhXYhyJ19oWw==
Subject: [Buildroot] [PATCH 014/102]
 board/bananapi/bananapi-m2-ultra/genimage.cfg: beautify file
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
 board/bananapi/bananapi-m2-ultra/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/bananapi/bananapi-m2-ultra/genimage.cfg b/board/bananapi/bananapi-m2-ultra/genimage.cfg
index 675253af23..88324f1f24 100644
--- a/board/bananapi/bananapi-m2-ultra/genimage.cfg
+++ b/board/bananapi/bananapi-m2-ultra/genimage.cfg
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
