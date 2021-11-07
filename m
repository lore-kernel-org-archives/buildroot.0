Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B37C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8C7615E4
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB8C7615E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A798C4035D;
	Sun,  7 Nov 2021 02:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XwvgUZD278L; Sun,  7 Nov 2021 02:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1436B402C9;
	Sun,  7 Nov 2021 02:11:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5B11BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4965A4015C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWvO6skux__q for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:07:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6907C4012E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:07:58 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXbAmuU3qFf01jXbBmqMDb; Sun, 07 Nov 2021 03:07:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250878; bh=sJ3CCccQM2310DdG21f5e1YP9d0JpCGcW+RI5GiuTXY=;
 h=From:To:Subject:Date:MIME-Version;
 b=LjR2Xmzs6cuubdfk/P/F5uSkMYkWPzdtD9NeqP29uVxfCV2drJQ3mTHBwW9uTnsyd
 bERemjHHpa9rWAuQy3vmgjaXLtah+2OHrAYErFSl8WoM7lG6TetZXF4uyWmnqVPSkg
 P43adiln1QmQGszCUZjYPUZjZPDcv+SvNrlPXOJMBoO8Do4KgpPpOPC9XYawX28xBQ
 iHoKX8awDureJ2JSfDs/Hzm7OGE7j1+091N4BabE0u/IUS1RRH9bcHX4VcVKmkRjXr
 kw4SbU64Zs7QK/DSDXddqlCSWXPCuHtcNQhgg1gRwS9VMLt6O/zRI37LSw6ZRF1bLG
 GXG8F44PxxUTA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:07:55 +0100
Message-Id: <20211107020755.3058400-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKZcfPYF3wM58MfYgWj9jsJwUJB2V/o++SXwhShvec3mDxhcf0g/omvufyRkAeYLab4oID4bXxQBG+hOZ8WvXHwMej+yNLefbR3N1i/5lmymAXgJjaaT
 yhMzr4SNnVyBytLXOEeC875jKq0J8fL97ZqF/4ugvf3Bb+zOVKon0sBp+Lg2aKfTyw7Lh39tQu5ZY+XHvN3wHBMVO8Dhwqyyauy974Sd4kRQ+g2L9OpJFpdV
 uWQv0jXG6NB78V+WKdYTZshJ+QeYzW3KtVVC8PIDCqaL3XgTT6r35l3+AJDTsGAB11ZMt5B29umncDYzXeDnArNT1M0R9UafpNkf9JWhlHv2I5UTnXy+Rjbn
 LoLzZd5GrPZpbSFPGU1RTG2/3scnEvo7nGT3aM2Wy/MapojzCFmNrHU3UCLt7D9DeAkDcStimdFw2glforx5TviRmAoEsVO81Kbwy3c86LmEIAKZlQNGFQQX
 8aFyvBAInjEPYOXagpwPRDa7p2DKeD92nVSEY8S60emaIXp2bF8ssQuzi/AKhpyQGswSp2FBTwrZEaKImSe/nDErm5wxwv1J2iL+5nj+4zVf7shsT/cmFavT
 MKKBryMToW9qdKg2G0VHhKxQpQrY83dJAFrg8r1X+mD3KsnpXc4l+09VKp1OSfou0588pWkZ1fNclw/FYv/bQMZ72W3Vqgva/GhFeve0oT0xjrOgki4G972n
 YIUQPAocUfGw68XOdv9fr+jz9pfHJw09hnkQTv2a65i6btnpLE4d6F/mwBGwRTPti6f3/+4MePqJWEWS03yowgyzgwTikuskRprFbU7imWX0FnOuiAucXVSK
 DKuEuMC8VqBzBcm0OIj03tpQp+mPvnYwmCX1b9jgDQ1qoodroMiWD9NwdCaLLhv/WMcvyzRZfAkW/VgpVbeBv72JHWB7fO/uhg6RUCUME2OiNGq6CzSq6MQF
 g3O1kMDbXCIKH7Y0Ug8HLL6XH1NBoh9iRvNoXhGldLfZbKNShHh0nZ6Y/IInuHxe67eeg4r892vcj7ttzquuzoU1qI98mqzp7TdMA5ECB0vu/HIlYa1g6hG1
 6ARGjiiEGJmEFZbGJToC9GHSt8iwcoA2xk6FIDx0Dn3i0DWS4+0u8G7vu2f7kugHOJJo/7KxSDF9T6ZTfkcI8MMuYLOjUQ31UyDzejUgp2UW6dSmBt3CHfQa
 c2WvrcPtU/P5mbPcx6EVl84hVmhkN116n8WVZ0lV3ajipTmG5TchPmvsoe5LXtVNm1Tr+JZngN2o44HeK8yMfVFOfL+7Vgw+CUob+wX3hI6EuPJPeVWkfiV5
 /XUSHXOYFj1PlJuCtK6ZqvGikvOietmOYcggb1F41q7WPbYo1ZDAv8qTSMQE4BxdHMqJDeGgbh0KXn04Im77nLaFcWIaMVXbJ6HtI/gCc9usAjbz41DV2eWY
 nmwYg4DxBwdQ/Nc12gGfgs9AYwN5+bMJhfw0pOI2Nw9Tc5j8XbSzcaGOXBYorOfGBx/uYxqUPcqoYwrQURSLZd64xtBZcsYLlU6YW8FRz8dHWiQ5/IrgpFkH
 pCrojZTQMdIQmguAWTRCFvPqonDcgR6A9sN2qXoIOVpt/ZtV+NA75o0uVsYil5IyMScX4ErDMFWxycU0ZcyUKmepof6ik7TN3BhJsV0KJ0WnE10L0wvoDyKk
 7olNxQ/Urad7jy+B5Ybt5wbEokL5Ta3enSASd785MJbFdkMZ8gm4/n9I56G8LFRKV3Kz5tdmx+S6a/UvKla1RFF/stpzCM3hAo1Tdn1a7+tJiSUab1spfA==
Subject: [Buildroot] [PATCH 039/102] board/grinn/liteboard/genimage.cfg:
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
 board/grinn/liteboard/genimage.cfg | 59 +++++++++++++++---------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/board/grinn/liteboard/genimage.cfg b/board/grinn/liteboard/genimage.cfg
index cbce2db585..d0b29819d8 100644
--- a/board/grinn/liteboard/genimage.cfg
+++ b/board/grinn/liteboard/genimage.cfg
@@ -9,40 +9,41 @@
 #
 
 image boot.vfat {
-  vfat {
-    files = {
-      "imx6ul-liteboard.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
+	vfat {
+		files = {
+			"imx6ul-liteboard.dtb",
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
 
-  partition SPL {
-    in-partition-table = "no"
-    image = "SPL"
-    offset = 1K
-  }
+	partition SPL {
+		in-partition-table = "no"
+		image = "SPL"
+		offset = 1K
+	}
 
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.img"
-    offset = 69K
-  }
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 69K
+	}
 
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 8M
-  }
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 8M
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
