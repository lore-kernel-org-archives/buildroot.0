Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8873BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E0DE61440
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E0DE61440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B2CB81D3D;
	Sun,  7 Nov 2021 02:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0stVLscYuA8Q; Sun,  7 Nov 2021 02:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C4E681BE3;
	Sun,  7 Nov 2021 02:07:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 211E41BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F1EA6066C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCAxbmM6ExFN for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ED546066B
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:46 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXS8muPGjFf01jXSEmqK9R; Sun, 07 Nov 2021 02:58:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250323; bh=Wypwdo7MKBtSXHic+Jn2qnqo7eLwBkzUETeNiKZhrgk=;
 h=From:To:Subject:Date:MIME-Version;
 b=YLMpVJXj+AazljsyZhw72KC+wTaa2kPDB7LQfOv/I7plmamaQJhHdmODddhkughuP
 TZE7MrF9V31t3m1n4yQN1q5kxv3xeN9iUeHrt3j6Ffvi88VsgM1iaxzFGYx+IiUtFy
 VxLaWw8pDDPR2hekEYwCXPAvXV8Oy+/GlVonuKSkvPSa6pHofFc03MwFucezlrsROj
 TDsZCJWzv2kls7iKAqF1Fv/LQoAUKjg7N9SI249ndMdZR+cfbS4mrkdE2qoaisQ5TU
 YP2bq0/pwOHcgl/9+owbVjD3KIXbQCdSnL/FnqWqCLloGejXJymI60XUbsAa2EpN/j
 QHCL9U2ffaRSw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 02:58:23 +0100
Message-Id: <20211107015835.3055951-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107015835.3055951-1-giulio.benetti@benettiengineering.com>
References: <20211107015835.3055951-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGiUgch9pPlPXN0oCpVe8Dg3yNojlX8/YPZlMrGwsPsLHGKYsYfrPGVf6La4Q2oO0wCfjqQSwT0aLoAPeTCD7/UcYOEHrnHzhpRQOpGAPaNzv8+DXeZ8
 GYKNutCf4S2VFeeRycuGLWQHvoyhrqPCbtUh50h/1JY9+ypoa8bBi66xxFc5zYR35WR/UXwvM2EzGCj6YMmPcUO58iRVj8pI19tloNTSPMTJcJ0lXqv8E9kM
 1c4fFicJOTYR3oxxwkbwfGGDKDBGDcZQnotfFA4HrQX3doU3LR8//VTUQULBODwG4nukVfkE1R048qYDo5Ho4cwtq5IMnk8nXyDr1b/E7UTNbE6z1Qpv1KpX
 oykSUfZX3AzTaalyRUT5NEBadaHu/0J3pc5cDY04/a8QhJcAb5KE5KL7Ax4nhbhuFuvFebkF0IhjD8/P5p3hcJ483p2UhKgQR/PuEmRy0vTTN3lqbo08V7+/
 Yddv+kp8rs4FI+SiNQJ0gQ3bvm1UV1NGdcmaPfWI8a8pEFnqtOV1FRwapjgUbx5TZGcrGIj4OBRYzUlSHWvkdv5wc664nEHR8pTv8ScyrlnRNwaBxpAnUMIy
 1HWBHrt/hflj7ERLw/xuQ9Cgc+TZaZYDMF0iYlkkDeyBzUdYSWlPH6vc2L0ZyDL2xzxJAzWQwwuVdM5YpqDXSTxpKTKrGBMo5hP0ABJ6bzx/e6oEtlli3qlR
 pF3D/soZW9WB2o0maKBOlKnreJlB28xOvTIV5K5HsNuao/TSEJZQVsjHmtmHj8Z/PCmHnj6HjTEFY2QqW4WersaVizJw1VqewaHJ1zywiLurA7/iSUpsx1q7
 BGr/Te5K2HXxwxqfZ7hCRxy8GKr7DECFyVrXiUVEjhNIV/8COqHIPA23oN4D4VN6+1w5TqtYXeqN+pzGKP8KrtPfdRClO76F7kk9L9sMdkEz+hhFhmMazBpT
 WHrqa6l1YBwRU7yKeJBZgr/ILLj0ybwuTME2G2TpRHzhtjligS2IQkQR3jGjyUcJVV0JRgNw6fhQvQ0GWzQ5iObyel/JII0H7NDqBLIqRTzNf6C3v6D1o89L
 5PA+22xlSPBB/gtoOwog0g3zwJDz79dc2/Ev708Sh10uZZ+Q3WnCZ3fhQ7W8CQrYtS5UI0a0lK7QEUj6jL4LHi7xdTM3tjOoB+r9avklqnspiN+S+TTu7MDE
 BATcOA5qW1/AeTgLFRrd7cqGwzviEXBPNxtPc+twexMHU/+sOcGDSZJfJrI68UpZ+JwUZyCtkb/uFO3kWknmPjulxc1mjo3FbGamg/swJG2RUIi/SSVjyZI0
 hPyoS6ahEhleZRIJQnvt/DlzCqB8sBqTpJz9tn26Of02PAKJA5sDyYHoLISweNpyRFwkVSTBhpj6pimLq6fqJhIOfX8fTGkdNI9QQVOJCx7JpVs3lc2kyLyW
 Nu/bVdsH9ifjrh367vuK9rEv4VbduP4jcDUdU9Du8mrzEQQSZTW2JJRdXddFEjESbpR1j0hklButDCPU1rebkK+DPCSyxY3p8lxlVt8SK2avUgOtgmqzR33t
 DfTLBnrcbWUvnbas7/TzIaJUESKPnZYiii7Wo3lht69v9Dwc++DpRmjSd31B9sOuu1a0bxQBA+Zz4362P0objH2AGv67nFpC4jVhmE74BMgNm5x8gCElGUsv
 VWecjPZ8bJIh3A4eoFkmYyY8EpzSs6jx7AOKNb2hhjYK6bjtB/+exS6wdyS8f93Tcltt5jz1qucyYFWpp4yc/ucGX64XxRAjGg1TN8wJiQ2ayl4BXcwe3A==
Subject: [Buildroot] [PATCH 002/102]
 board/acmesystems/acqua-a5/genimage.cfg: beautify file
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
 board/acmesystems/acqua-a5/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/acmesystems/acqua-a5/genimage.cfg b/board/acmesystems/acqua-a5/genimage.cfg
index 63b003f378..7fa0a69c4a 100644
--- a/board/acmesystems/acqua-a5/genimage.cfg
+++ b/board/acmesystems/acqua-a5/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"at91-sama5d3_acqua.dtb"
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
