Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F8CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415D760EB8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 415D760EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F90402A6;
	Sun,  7 Nov 2021 02:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kI87bK_tvVEN; Sun,  7 Nov 2021 02:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D44D4029E;
	Sun,  7 Nov 2021 02:07:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAEB11BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8F89402A3
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0CTZ8AJbeuh7 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id C27BD40295
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:35 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXYsmqQuwrIRljXYsmQwlJ; Sun, 07 Nov 2021 03:05:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250735; bh=y+btDuWW/adslAkqjyVqvwZKJSCdF4AK++wr9S0addY=;
 h=From:To:Subject:Date:MIME-Version;
 b=n1qyrAqn2WiMaGGRx6BjyI8Z+Sgtta8XNT6A76RVjJqJaKb0da8vk1VCnl1j3dTlz
 yEJ+4M7zCfEIKQq8fY2WHgYLTl/iN7rb83MCIXd3Kdwj0pyccnwiuJ2SP+8uTz9O85
 P7JWbrpC6tA/2CiMXftuIGGMHH7LJX7n/NA7t+qbOJdX2jC0o9rvWzEF9hbgDpIYBw
 MLevSmaJJAJ8s+CER1GXatcHMqm7Tqno5KGDTmwR5NB6CAX9rk1BCflPuLdamGQzAz
 YRqiNIsNyVhaGyI5GKXEOcLuwU7Awl7tQfLlvLGo6tEz0X2DYA6KDyXHn0cfyaTHwh
 VsG6lWths4PRA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:05:33 +0100
Message-Id: <20211107020533.3057513-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfF/AWkEafJnx4G6QZrcGk12CFjegXLmtpfMQyLNKQfIFEUZ4JJSt4YmFnDJ10cKTEgAuyTkxPIOdYMY2miCwzqDA27eWMhcMyHDM2SI16xiCMSGbX3iT
 CC63ev1L4ldujIP5OB0B4308wNWwGcxzQ1JhxKporAmB9XusHqVTKmh8rog0bdpR1cRMyQp1c4hg3LNVDLOjwilyjpqFkNSto3MOage80FgP74nDRXRINE6A
 j4y/UkcOa1F33NcV1CxxPyNnbgu4rSCOeX5oBW0fpbf20AAMScgj9GZL9Hu9/4BhK50s11AdtG2QgOdItj0u6wC0YIeHQBRkXeb94Mg2JACLZGwhcKnecKyE
 qGzSZP4DFxDnE7iYVHFjnryNdjWkSDK+HrgHd6B/WOa9uCiNtQtn2KYWr2I5sCt3v61kAU9z8EUxzPgrKTTonT40eXMArWJu7n91YoRmI9+YnVhtAiB2kyof
 vwTWmA9YubeS4ZRcEAXA2dU4L2aHiE7t+aW05JxzU61VqL5/XYBeJY3DUoM3AJJJa3ArlPIBUVu/23LBh42cHfVqnK9sbj/faG7QcPvLGtUIZ8QyAvs3ypsX
 c1ye5y/+kr+kyr47s9NUqiGixs2r2ylhQeHzZJKb+i2Xrrd345XJUSrFVW/hkUNOfzWzsz2vYFPphwJpZTn+KB0ueO1yX5mLwHxXgQ8rbwoIza1bhfW+w/DZ
 +p33E7iNFqGGEWrh5Ae3BYEg9Qi0aqd1fzpdEsFZFnpe3ujCfLNgFO/oXtOz8/jrP/1kWpk2mrWMJDqhKqvTuTwTLtztIYNEAx5nTPV0d3MNZ518eVkP8WGC
 IatfoTGQQyr9bRaDWZ2/2BWaSfEUK+2NZWrXcFwzZBiieF0rxQN4eBDzr5kzKqthkWlDT7nje34bsIY6Y6Uk2/tPPkJPVlmZkwF3YJHoipceHPY6ccjujQmr
 NODRhULlMtY6Fp0HBS6QqTKHKO0AQediT5QwHVBfdRrDrAL8Sk90/pKAL1JSaRAh/KKT5rqOtVlqn+gcO3L9J4MTrEjPB6MAf+yCVUuPEbTpgrStD4vZCyCB
 ImDDAY5lWDVIrT0LewstXlMZfZ+rPKWFmUaUnD2tGS+kOlLeYke9Dujf1P9KY23M+jc1h5FodcxYgPW7kGrqV4fFlxMlmqG/ksTtqOvuTbM9MhqbKBBLVq/D
 4tLx/q1db9SkXSJKkexbTKvkgwIkNUVq7fsbL0vWBObhcQpbhJR4wNesM7/P/ldXPWk5w914jikSJtcnhwcQ1JAr6yspcPpN7dC4uvcl4SAiVDFbQ2fg2nbV
 5J19+xBPFaMyVqOKclCo6VlRebFuOC5ECcnOzV0poXxQOpBjYbnSBQxYI12dVAloRb5VeyEZiZ06pYPct67f9uX8Wj4uH6k1dMPQ0pBvFB8B1175lfO5tQZL
 taUiq2OVb9CNfV4VK+IKIJaoAhBPtKxHW6n5gVVVbSGK3uOsfqa98HCEw5NvWRH671ZWKRTTu0bsk+X/iZOpMIrYwKKDQLqWVWpDHfozrBZPkslDXKN8eeaw
 0hyWMrIvtuSJw77tM3LEzYWdSgU/E30MAvUxjJK5T8tU/4SljWmspFfl/knmNLu/CQQ6nTi/m4FgpujiSjZn5ARuxFvRTH++EZDmiqhuX3lSTamvj0PklmON
 QivmKngM3rRrw56PEe1jSyHz/v0LUL4bCBxzsHDE6aiK/cmYDudB5PwCG87vFPBHSoQQ0L76sKv/9Hek/GDnModIaKoexoluTNEWBhQUZnaHN/oKUe2F3g==
Subject: [Buildroot] [PATCH 024/102] board/embest/riotboard/genimage.cfg:
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
 board/embest/riotboard/genimage.cfg | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/board/embest/riotboard/genimage.cfg b/board/embest/riotboard/genimage.cfg
index 1221c83b9a..d2e851a78d 100644
--- a/board/embest/riotboard/genimage.cfg
+++ b/board/embest/riotboard/genimage.cfg
@@ -1,17 +1,17 @@
 image sdcard.img {
-    hdimage {
-    }
+	hdimage {
+	}
 
-    partition u-boot {
-        in-partition-table = "no"
-        image = "u-boot.imx"
-        offset = 1024
-    }
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.imx"
+		offset = 1K
+	}
 
-    partition rootfs {
-        partition-type = 0x83
-        image = "rootfs.ext2"
-        offset = 1M
-        size = 60M
-    }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		offset = 1M
+		size = 60M
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
