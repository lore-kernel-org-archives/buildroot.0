Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11B7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:05:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9831F61411
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9831F61411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DD454022C;
	Sun,  7 Nov 2021 02:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_Z3lKsCYxYo; Sun,  7 Nov 2021 02:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D1A640243;
	Sun,  7 Nov 2021 02:05:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 240951BF573
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12DB78102A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjZ1BkK0QL7Q for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp1.osuosl.org (Postfix) with ESMTP id 405D081AC1
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:55 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXVKmuRK6Ff01jXVKmqLDK; Sun, 07 Nov 2021 03:01:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250515; bh=D08PyEjtFwGdD/c54V8rZViBrmVd74AjBtzQweVgFxo=;
 h=From:To:Subject:Date:MIME-Version;
 b=HGXUwS4RrcLqNE/easouV+k9lEwsq2HWRMHgsI7X5p3PXUZ+R41qrcxidCgCUlHQS
 4ujkYZGaS8Xi7dfkZfnJ1FLH0P61PgNiX7Y+oOfcDCbBvmQ/5gu63nzVefvTGfE89k
 u61NzEsVZIjJvD6bQyzPSnyTNMe8jJOKfWG5AONrRZkVf35aLSkDYeWcTkKPxvKLLY
 uIOrf5Pr0Va/Zof1vow68bHuTe0Qryowgkrlir+IKjZSWK8ByWRmHWl7qajcxmJ0zU
 obmMUcKfWropRiMSFNydaZzlEpiNOnQkieaeT3L+G0VzyIzHu35TJJxZTj//aH/+0s
 nR3cC0jrfzrjA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:01:53 +0100
Message-Id: <20211107020153.3056415-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCCtDflZJTrOVnzE6qwMQY+WFJB/3Et8E5+N9LuQfvp6tU4jCCOWtGRlnOP8xgnt7o+/r4H2zzJNRClEoIExQBetYZPazUevInOtqh6sYLpnN+GR2Bqf
 isbXAZrRFDA+fTu7lnIHMfdb5cLMCGXtyKoErkrEv8b8wXTnd0WhhABBIj1h9OI+BPqbAH58glMAVxbxbPAl1fP8utZom80J6b0zMSmbuhOU1/gy9SyePW1F
 c8RIp38IsJzL9gNoymZUbYUgpoPXOpLBscVUG9zfeloWX9u0KYTR5IKqZdFUPbuOpzyXryGI6xw6xFKU6wtjT3Oeu6Cz4BpmV1Q0+pNe56OWMaX5awH+tSvR
 J2wblwkBsl+gMbIEU3m8UfcaEOXYYKGigU+ullrS46O5B25kgV00h+g47/GD3fjJ21Icb11T2lMuFObGiDk3AJqSGzLnckaE3/bWBsFRKbgESI+6U2e/HyUh
 +No/UdktPu5MFT5RA6G4C79hQgkNfxykTfH38gyOZxQyjTWXrS6nSVOtOasMoA7xPaXRu8+NkUXDth6fm8ADx6T4AVjU6Y3vgdFQQ8LKOJtpphLy4k8H8zze
 47kWnvs+Xr1TZ5iQ42SKsn8r27md1woGWSwD7rh4rEajuzVvHfk2q31fg8URf4UB44BbqVua5sv17OfwmuUvbAafLvLggTyVo39CzZGzHh5B8cWgv1NiK484
 g2hn1LEiw3ACgO9fxWqfx8PUzgDlAS4yxFb4zc8RKTQpDTIfd8ad6C4hBh7XaDwbHuZ9E7bwB9/8fpRkU9wh3k3u1u0XZxvyXK/SwFnNvvtD9fADRWWYqFq5
 Pp9pZiEHRf7EOyy6CAyQ98F0NcP8SZO0oMmfFR+Ev0YmPF4mA/CBBUqtP+Xi4qOvBxqFpGBuMBfSdDn1YxwrY62k0f33iTDEpe8WhrbCcXmI0AjM4r/qot5D
 GXvF/1Wmk+OvIeiuqAKpACuXONt/kKubsyZk4NtpDzt56KDZxbNtWLb2EMIBcRU6jbMe7Ay5hfO6fMa3kJFXUlgE8vTQ1tiUwrek7Ffv9NRcBhkYgw3rqJ9g
 +zxbp3/1FnomUR63bqj/hXN34wujlhDG/PJDnWDAys1rWj7/nPp+YwxMUeHDYASACwkhaPnTv1EJiwviu64pUwqC1qOpXUFynkD8iRAB7IVNs1BXfLponCXD
 kHTXqKDw9ejof4ZcSRQNfm3rWiCaIY6J9T44rtzLXIQPLY4oFruPau9vY5KLZqHvqmte3hbLD2pV3Y8WH9yvUhqipI92GcoImtFL/jN5SP68ICgDwY+odA98
 Tk0epJm5kb+oYhrBcR3j2URpAJLeRke9CpoZmIBSkDiir++Kgad8wLQ0WoXMLcgW6uPSY9zzG1KRKFBsTn7xd5hH05wV89curWLaMuxhSrGqinB8GNZAF4Sz
 eGQAM5HE+/kL4j0gP+3BojnJV+8SbwxxYtE2N+v7DQJZetzEwYKf2dQLAJ4mhlS7KpDq3IFWNZg3sA7/GCA2DhewZP06cVhgvA3r0HYcfrrmnp4MTtx5bWGg
 I7ACReqcyVji55dwyqAsW9iW0P8Tif/nEyppzRT4n+tnZPIucR7AnoNmPrTFjO8MNMtg705lAQXHR9NFeiT841I8ghjeLpL4IenNE+wPKoaq6xL8P/tQtF8v
 xd2qg/WURd8lvKPSTeFNxW9g2zUn+8lTBmY2yxvtQdyDJzEnRKoIW8SBR4hjeDpfXHGufVXEKKdto66UnZlGa/5ijqcO5CxO/87ciKHQz7Ad7ng+SNMCxQ==
Subject: [Buildroot] [PATCH 008/102]
 board/atmel/sama5d27_som1_ek_mmc/genimage.cfg: beautify file
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
 board/atmel/sama5d27_som1_ek_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/sama5d27_som1_ek_mmc/genimage.cfg b/board/atmel/sama5d27_som1_ek_mmc/genimage.cfg
index eaa3896fcf..a0adecfd34 100644
--- a/board/atmel/sama5d27_som1_ek_mmc/genimage.cfg
+++ b/board/atmel/sama5d27_som1_ek_mmc/genimage.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
 			"u-boot.bin"
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
