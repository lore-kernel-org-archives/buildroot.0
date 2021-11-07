Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83295C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD3E61440
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CD3E61440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A66C400DB;
	Sun,  7 Nov 2021 02:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5W8ybDhqWJi; Sun,  7 Nov 2021 02:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBC6F40250;
	Sun,  7 Nov 2021 02:06:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75B8D1BF573
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7035E4022E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtJ4_vFlcZVc for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D049400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:58 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXYGmqQOxrIRljXYHmQwVL; Sun, 07 Nov 2021 03:04:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250698; bh=/q1CXEQU0O5Y0+TRTnlR+TnIdfbuo8vdBK2Cb64cw18=;
 h=From:To:Subject:Date:MIME-Version;
 b=buez1J8yovtEW7X2fmTlseAbCQh3ksuSerdQi06KOch5mes80AYczAWIdaPKC8QYl
 lnqnhQXBD5S9dtD3B2c0cnVuNaOd9LDbCbJfGisS/roSumK/hznFQhX6BUdZuuB4qE
 UdXJzcYmd4l8jCNePAMwq1mX7yLDYJ4m3z8ZiFGu5dYmkzC2A54tk3XJkw0Gld3miu
 5EiN8Gt2y7a+N8mQHRYIja+klL75DSB85tcA7sIvlWeo0YyvH5DGt2KQn996CvczbU
 qgfj22B0XMJ7soHuJt6Hkkvi8ZzRYpc/hmkJDzD+R3qMVMDEtME8zBilMFT0aJMW6Q
 Zo4sPS+YoFsfA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:04:55 +0100
Message-Id: <20211107020455.3057289-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPgh7z7FmyUbkkpguQxd7Wwnwpr9CIRdgH8pD3GiNaqrzsOriPV0K93uDu55aGqTv0aFT5zAflCfkiew7dDmsgi/TXgQ+2+igxWpX8vsZi651IilfF8v
 xsJsBVh64UeMj8mH54iWL3jSHrMRPuCqLzj8zhFr2oF5OA7qt9JwawCR64do8jNAmmqGesTZx+cOxqhJ3ty5hlR9CFLMZIsACGdxviTDHirDK7XtCMKVj31z
 skTydw6Jx5qbOgrH39CR/H2/ISYgl4Me5G5nhCGKjk2m9z6cCyJf5D6g1NYDWpvR7UGp8T7WvgrVQTLKou4L9Pe4AzTQM+XwDg92KeLGDB51apOY42bTxe6t
 mIbYcfV2l+CyFY53zYrqhPdKkTZLLCjFvo0ONbI2/Yfi6rqB32UYhJwucELfuLGDdRShg241y6uid+MCCWgz/hdGuts0ZyfaTWJmfqmRFtq3FLij2rGm1c2E
 jfQ+37WPzy67fwPNkDNWS3JPOsLdLeq91P+U2+hqXDqYFngvm/UCS65HqQNR/1tf8KYdNshqtRU8DhZOdaBQcAsgsDQX0e0f04uPlAdkxQhz7JpseCmYfzzt
 qCw+qaVv3ODm7EN0UEIXadA5A0VcBBniLMl6IVM7yiyJCV/ePqnc0F8Gh8m6zRvkceRTMTAgwqLON+xSQ4YKwbzSs4YKFJWzZeMMkHD4UyA03M9VooAhAclL
 2Zn0UTa9MqaxGUsxh8d3xyYwExEfddCIyPflWjx2Q+XYzQ7KslCt7vOtLyxRH7ZlzZSpkmMXbdjCozbgsH6MKKfE00Ce68lrLSkkmAiWl9485xs/vdNwCRS8
 O4PRlagtCFD/XY2YTQKoDA7JY/nrdNThMmqUWJCfpJAwmmkOSOrzUl/xj9DHivQWRqkz/5QHf4iLlzx5RcSBkUMeSBzVsx7rnUOUSpNhPBHa6tO6do07Qexv
 RupJz2qm9rAhGtLepWuhnj2HIHKW1Cg+Ntm8N7fl2upAne61SX8O4ZYWUpKzTJL8O5LTmi3cz9fjuyM9Q+PYxnA3StLM3s9uLDvAqybD6jW6ZsKb06shckHA
 U10cXP/G0Q62IzNA/r33eKP3ENdbMt6wCjSeXSWhWc6VsEzn9MxfbzW0oR9O8ocyn12/xyE15xpS9HVrnzfeomNhX/iMDrJ/HSbXHShTUohh6TWRCgW9zn01
 bAMtiIJCntxCrsc4ZnXxA53wj0PyGGF+0ELlh64ddWwYGDtkry8BCVy4tPCK9/EO0yDtszRKf9uS++uwQMpCdHw/+2Hr9CaP/YEg8upRjGBNJ3cfwp8NMfqg
 /gfz7wk4f2LeRfbLc+9Jca86TG92UvD/LIf6/oNInkJWQtLYkvn9MMIwpfKZuXUkOwGiWAmqO3eKIgAKc4v+ubM45+6CRiyG4iK9UbwhKiRLzsRf+uHNN7VQ
 kXflS9aJqeAdVkqr4rW7ivPe2e5w3zlMsGa0imBG0NEJvTEaxOAjk4e31hwxHQeGLe6p9R8xqYnMnZxj/salMPrBqczb3Xa1bj1rELtq/Nn3SNWRPq5z9Oo3
 Fw4KK3I6SCO9553ezDYFmLK32hKcK2e6KbDg7Jqneoo2JwhM5K06T3of7CjoYGGjuoF4q2RGxYgM38RI342LSyJKnzRlgLJvL7u0rwQsJGaeJIwGxM98LRZm
 DyEf+Cma8FQqGWiiZ2eDWm0xkFqhzyScvppM7BaQ2ExNxVdjPhFAfbriPyFyMoBA4QsgO21q3YOn7/foodef48ECjy7aW/AmWEh1hHXgeLf+KcLRQAcSKQ==
Subject: [Buildroot] [PATCH 021/102] board/beelink/gs1/genimage.cfg:
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
 board/beelink/gs1/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/beelink/gs1/genimage.cfg b/board/beelink/gs1/genimage.cfg
index 88bbd26594..71578743ec 100644
--- a/board/beelink/gs1/genimage.cfg
+++ b/board/beelink/gs1/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"extlinux"
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
