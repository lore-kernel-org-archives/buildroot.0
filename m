Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A44C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98480615E4
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98480615E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7158F8193E;
	Sun,  7 Nov 2021 02:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lN79WfzVnMAU; Sun,  7 Nov 2021 02:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA179817C3;
	Sun,  7 Nov 2021 02:09:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6E451BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 943C340295
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7O1e4Om5g5BQ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:07:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id C42BD4029E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:07:02 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXaGmqS4OrIRljXaHmQxH6; Sun, 07 Nov 2021 03:07:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250822; bh=g/TeaVOE4kAKX4MxeDnDjs/XdnrObBivDT8wmcImG34=;
 h=From:To:Subject:Date:MIME-Version;
 b=P/rb9i83Qkswmbjt+now99b4dGsw3SvsCcz+j+h6nCjM6ARxlrixQ9mbSeKLaQJOY
 13D28gThcTKfPKfa+nOkuQ8daCuqckGh4qxZMat4RdH/kOvv/uKjaD86QKlNNzFlaP
 ugaycybOITIGKxhxC+I6nOl7bkSkfbzLNYcK/YZk3PVKaWVnQkyvBJ2LX36C1o9wLu
 JbsLYqoGN7TyoqppyLmL8wAKk2UbqRQBgU0pZvb03Sl0Uyz0XZYsvZoR7+tSg0mv7l
 3pWK+cJAlsV9Z/eTfwesa1Crwp7LdPFuQZJiA4Jcv1yrXq7SzZBwbMzWnBPQBKBreJ
 gREaShIakKYhg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:07:00 +0100
Message-Id: <20211107020700.3057973-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKBVo/Dp54cdFHaJzV5Hmc4sLwBRogsJmQkDybJEWRlZJeo1kuAZvVeQGkaaYjMZ/VhC8ugjwQtIOOjnoeY8pPXx5b+DaJoj58aSZTkTaFoRBaa/JDdh
 JNe0AJjyipHHqar/Zw87pTh55jPSA4jL/R94f7/eOT2K/g1nBxz0O2ZHUE0H1hsa6J4ieJ0fW2DqfmlsN2i+iYjyXYsazH4mxJOGIzUHQIpdCiboCU57iobx
 nlIWA19p26VjvdbLO/zjyVelJBvL9ezEtX5p2lVaB5uNR6igLEXt/Ur8kCCwItPDbcrvgswOXsW6zC3wdr2dZdjHc0Kwi1bkIqQ/HFoO0KVoggXcUz4ayizt
 cYvnHhOEmNZ3oteuHaDXNe3qr5b1hYYRSgwF4Sv86Djean8lz8bRIV3TTgUYASUt/ycQWlCGjiKKAV0mAEwIyis8Cj/jfhprhdtO7z67ffgE3Huyay3haYse
 a0WtZ4tRSlWeod1lh9AHKzHGQ8hloRg6VqbLj3I+8KVvOEvY2CIMFdu3lKEbdc9PCjTK5kzD5YNX6Lch1e2vVuMIAz76E0xcJCthwPVUNJB7u+cwrplsUcym
 vhACF8rPHeWsQdOeHp6hFQsmKB0/XlzK2ma56LuX22ltD1mmWhc3wQ5rE1qQRdUH7v5LvvTTXWwJUcc1Y4G1JQ6XMKZ19KwCHwQGb5LjQsqsy8u9C2Oeo6NM
 CB8SftAM7oyjU0gp+bdO5AyQSxiMnky/fI4OQZ9MkAfX5zMThdZdrcVV1eeCmJPH71Y2i+4SDn7m8BgwIop9Boai09ZVq/MpFY18PdWrYmfzt8AZ17NYj4iW
 2mhjX6Eaa1qB9i3hyY2zwR7URv0oB4uV+RAOAur8jBeO1BAcAfwt4SbSCPGRlOss2divJJj9wAj6Qbiwt05HIVgFn/jYYOkbISUXueDZmWJ1tZuvmHcNMgOU
 0dIMk644oUaUSw8B85IhlLb6MO8nyBvXOjFpeUrpYx5BBARnGmKZt+/IPs/FpIz4SWfOzjNdbvLRvspvI6da9TCeaQBoZfFVZEPSdggZwX0ZaEmzJV7ULTQK
 rjPtHuBYqFpWmOGJEqrB29HdNYxIwhjw3ZiHLJ9WAAprTrdIPdyeXM5sk+iKreK6V3OQZEUIrXxPY1BkwZaZZyw5QNyUAEeY9omO6LkLpQm8oMHdaGMBINa3
 McAjxW+ZAWTGa/TKXT7NQ43WEq9Or5YR8WCRpMlm6FJSivP8fAjUIxntp2XN/QLi/aM3a3rmN1e2SgOE1tGo/mCab8p4cPuKN/1vfzUpcVIfZTb3YcbOKhaa
 zWVXyt1nRvkXwGBSbOVNz4Ijoj6PzY5rmgHd/QPHr7TrUgQqOQK+Dayz9YKSR6K2Pt9l8K2bdXAIseo/LRnhgMGdStIAcg8ffpvtmcL0B3aPWNZHZarYehyb
 68JTot54pQAdHdjxLBd3tS87JoXS2E5N8F9iVwRftO4Yw2PcEsX06kaRNfYFFBAW/BjRY0ugNIgmQAiNT4neBEwdToXzjsb/7r0r1mKm+GbfMSI/0omAm4xW
 El6Rgv/N3GaE+uBWpf+s4LPBA9Swc37eAigUZWpgNAK6lu+rbcWMqUSRfLC3JRvzHmO+R+zLtYgLJiBTtpCDc6fSrzBXn9xAlsZcrLonSaiOwXBJK5CGZjVF
 9xLboIuyztZ3j3bt2WCjxnOTW5iSKduozPJD1p6y52zwqz4qKbnSgF+8KkWDLyJxNQNGzhGDkVCA7u7Qhe4qAJ9HUGKsu3vP3x1a4UyO1wcE81Jrq1HKvQ==
Subject: [Buildroot] [PATCH 032/102]
 board/friendlyarm/nanopi-m1/genimage.cfg: beautify file
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
 board/friendlyarm/nanopi-m1/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-m1/genimage.cfg b/board/friendlyarm/nanopi-m1/genimage.cfg
index 23c9c7dca2..3b2b82ce96 100644
--- a/board/friendlyarm/nanopi-m1/genimage.cfg
+++ b/board/friendlyarm/nanopi-m1/genimage.cfg
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
