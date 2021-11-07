Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1B4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 01:59:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EEF161411
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 01:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EEF161411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7649A60666;
	Sun,  7 Nov 2021 01:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FLelq5dChYiz; Sun,  7 Nov 2021 01:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF6D6066C;
	Sun,  7 Nov 2021 01:59:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE69C1BF286
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 01:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE1CA80D3D
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 01:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-YvMmPJLQAI for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 01:59:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE6FD80D38
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 01:59:32 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXSymqLUsrIRljXT0mQtwk; Sun, 07 Nov 2021 02:59:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250371; bh=T4x6kIAamWMhO81+yaEqLD8QJoSbNjjVGAJXo5aqXPM=;
 h=From:To:Subject:Date:MIME-Version;
 b=ToUJHGwpT8KMs9pmYsdnrJsGHuAIZvkiShIkl2UFm8Ffz9m4xGi/QauNxetkk9QSt
 aTdfvLaa44HjSSnBHt0xvbBuvhyekUNpzjL3/4FPlZdSdJn12i59yX6QrY6eEnh9pM
 FTsBA5zfIHUwM6RoY+QAFIPMKqc8E6KaTEQa/QGrHzppO7VT4qrD7SFVb7VAXyJqZb
 cbcLT7NCtFUOMfQ07Kat/DhCxdHKnI4EhGl0hZ6LIaD7avLcRwuHR+K2yVQT+Sy/oE
 a/tE0jg8PASIcED5hLGsZZS6oztAeRX/gSEpqrH2KFtzV3RQe2MfpvDNGCkpb5E8E8
 jKHi5beXCUkBw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 02:59:16 +0100
Message-Id: <20211107015927.3056054-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107015927.3056054-1-giulio.benetti@benettiengineering.com>
References: <20211107015927.3056054-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNMmgkFG2AbSwx0ChyIl1O/AOiPmOa9sTSjoi96USop5qVLKi12kBZg9fW/TX1WHmiTeeg0dOUYqzUdyfeKQUshzRsozrbY5Q1Ep+nTtBhtGgNL6JCpn
 q8+NVJpkLwoBPPRvaaTxqu40kNDDQHjUZFoqgct061OAjlRwLTjnkVvW+eJN8Bwt0/7dD9B+1UPzi2qsO03LE98rxiU6BFzNzKtAr21oN0uQ9SxD9wwz2EAR
 R5f21/3JakrOGNGdnBI6uv91eNJie+iCHHqbF8s1+1ADcLQWbWjgXfGWjewjjaZUfou0q1W7er6fLQ5jQAqDGrU1rbGPA4tra79fERx0iNnxbqMGPbZnrL6B
 vHSxvBbWlkFX6w+X1Aq59DXO9jm6Lj6af2CeO9XFXwlrEjMzfV+7qpqVJkFqzBfO2NDPjCbQlAyVzcD3B1m4R/mDk7mE38PQwF7IPldwpojqwFgYIzshyawf
 R9xFioU/Tg6BAVUCawxib5Rg0lppjhUMPNX3s0Ud2pWnMzEXBGTi/DBC7DzSDSClFU1c3jBP2FiFlB8+S6J/t0cNnoi5hsKSxtjcjpByxZnh7mSLP43y3CIV
 kN/Fnaqn+Jx4XWtmxKx7PMiFtIUPxqnZvSFvYwKupEpcE92h1jALCqmHs8ujdtmU2pXXDvNOMhoOdPMuoFWH1rWEvah5xLQBTQw9RrIgN937e8SJqgVUHako
 aWM69RTqHqSdOheVkzo37/HN5p27e21AwYNhkv+Lf3q27Ep/+/Dbrb/UMXTjlOSQsuHgStRYcCBZ8DhPE7wtCBhGhEOyud6I1AZoBUNOdDnAI4IjTt7dfhSJ
 Tyd7ExqdmO8gwMsBf7DnvxEtcqzIuKAK+gVMLqz+nMS/WXfj2Ifu3WWYyZOQhkf9YF/Br0uNzQL/ytiOZGfKcOLzyG2b4YZs3EdDMt5TRm5NEXQMwNK4YO3e
 EVQBz1Jow0WGMoNYl3n4rvyTfXXxKmIBoj325Ina76oDBV7U6dDlyF8D7VTEQSqdz60A2P3IkZE3e0jUvZVSxZzaCU1Bt1J1iTacnmlQxTmGM3oCiVhYKbb4
 rZGSEyRRLEL5OKM1s2tmPoq2+jG5fQ/KaKnPY2PU0HSEJ7QI7RisIMc4+SkRiWFX/nbmLhfp1V0yzUsMHUmxg96SznDwirzyIL534WoWI4UulLiQxM0mpHmq
 nl7G6T4a60zH2u+Rb5vqny9OXYg/TQ4nN8vZFvIzyVvQJ/Z3Cm42COkC8YZZS7bJ2a3niRfYxUhpS1k7KsVvizWTm9VR4DH6l/d1aOj0nzVILOEkxbDsw4sx
 yJ/dr3NSMgjBUpmT2NXU/+MVVElTZrqmKicTlYxpoiIoiQdJwOBA1ztVoRSvo/94SWAv4omDH1lG6MCrmhN+GRBfRQ/nnWsUPPFYvCLt3fDDTviejY//Ns6X
 0DljyujGtaqMnGoDlXy4yMLTOu2Zm/5tvn9GQ53DdXXfmze+Oz7Wt0yNO++4lE2M0CmHxX4kZrhpNAlQZY5TwIpFA1m215m2Z9Mbk4Z/cKAdwqwin0a/yaFx
 aXUII5gp7D+kxzJywwEf6pqV2HEDmxWkEaxYsblYthV7lZZtQiOTdcs+475cTWKuOCzCVm1bIj3OCfsVGdqFK24O9+1UFX8jc/YVB82AuZoMWe/OtzIxgP+A
 aLbstZqWZrAoo0VtV6okymn8PG7zCDhprabLJ6MozcrB6VbcST/HJoLyfBAmqY3UphdxJKAWqR2DLQnmqj/ZI2yU4zLscTPkyvKxMOCc2Fv3QjU+xbQYKw==
Subject: [Buildroot] [PATCH 003/102]
 board/acmesystems/aria-g25/genimage.cfg: beautify file
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
 board/acmesystems/aria-g25/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
index fd7b9557c6..29dc697153 100644
--- a/board/acmesystems/aria-g25/genimage.cfg
+++ b/board/acmesystems/aria-g25/genimage.cfg
@@ -14,6 +14,7 @@ image boot.vfat {
 			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.10.3.bin"
 		}
 	}
+
 	size = 16M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
