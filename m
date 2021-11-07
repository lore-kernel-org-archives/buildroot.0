Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7628C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599D4611EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 599D4611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332E982400;
	Sun,  7 Nov 2021 02:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDeKY9Ur61ir; Sun,  7 Nov 2021 02:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CEB5823FB;
	Sun,  7 Nov 2021 02:11:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4633E1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3504360666
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaJjSYbNUYOI for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp3.osuosl.org (Postfix) with ESMTP id 528D960628
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:08:08 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXUWmqMy6rIRljXUWmQubb; Sun, 07 Nov 2021 03:01:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250466; bh=dI1VlZgS31Vh1Hx/wwXeCYGOYeOiMSw6Sh03hy0+e6U=;
 h=From:To:Subject:Date:MIME-Version;
 b=Gngy8Y5mbGdCMwtVoQn4DbwcQdLeNXesdEEwqQmu2SQWwB3XNwZXBLXL8Lqp3Z05G
 pkIjB5q/R9p7u9MFumXSPMBTXUqOVA7/nRch+Xka4osiNn/Z3XvJJffWpMHFmq8U4I
 PkUhFyeexKnnsG780ljm0sEIHA/XMfft3cSHU6Z7vO+Ax3U73d18dlFDnDkAmR6Vyl
 BEF/inXFHCyooHt5Ff0iEawaeHaiiFP/YDRqkFBRx1UYUdn6suWJB47I3P3vCRXNdz
 3BnB6ZGXsp6PodyTJHxIMbw4ty5VQU31JS0OHWkvcIyB8JCsDB5jdkCJyd4LTMnLF0
 kAjLHVVF2SD4w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:01:02 +0100
Message-Id: <20211107020103.3056225-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDdBGJEuWl+G7Irwg1KrI6/qxsRh7B/xvgkqXV20fx/v9dcz4n+qRrHz97Lfa6SCDg9/coab+PCBuRKVgLf6j4nQDHfsuoicqt5E1dbTG7X3B8ob0SYv
 ohMqjPNaFS/qWKVaA+2fE4S6JxDMOFRsJOF4n2DAeFWz2bJ4f44Hs85Pd+WDznyVj0jkh30eFe7FNdsEOHJuR8WGyKb+IvQtywCpuGYnVqHzgIgDakn53YoL
 6yQ8iE8omrgyocC0ZkK3le5ZiZniPhkFvLZE/JBbL6HlpKQiudfSNn0PZuoHF5x69uK/WIxM2FGgndlzbqvwH0YEuycG6Yw8xH20Vv/OKbyAIR4GJLz8hUwA
 laOVeiAEpblCxXGvRyJQQKai/+xBYbT3uUNokQWnuaXmNgE+eo6OtHL4ajNhHj9BrMHcc50yejfeek8C25A6CMZDbcLbNfcijlyIXWQ1gkXEJJ9pvczQQLh1
 cOVBSnyjmzj7Dk7Ef9UigxLLUF+BD26KqZZqSUjJq/nu9AQiN26uk3cITpS0n86iqDlnMYtesBcImnYN+2r1DZQe8g+92ExfDSXA84FVvHUPFP/R72xxx4tv
 DM4ybw6q9OTlNI39mi2RWsE5mhfmEo7QgIGpTRc/B5y3Uv4k03JOyP9KyjsrevrL+Fo7lOuX2QnWvdEcdg/61O9w7Keebaa8c3NeiUqjIL8HtN9UaS0loFO0
 P0FiQIecFaMkYMp5rLBTxCBGFu3wxt/PKUjeVevXFPv3/eVoM6I5/GluXXGK9V6Ni7SF7E8z5vHH3iFvpjdzrxeFkammmTGCcsoxrNNJvU6fBda+atj/mCgX
 x0pft2CcARyiQMKycln1WJ7oXd44uHPG/eCGtbo0Z5/dnLfKHlrwZ0V3D2C/KFm90ucFih1ovGI3DD3QsPxgPxhHwrM8gh1EUuYLhPjdPzpICGgWNl9HA5Hh
 IQGMoGLEsxXipUGUoq09GB3FY6gQZvcQe1+5ZvQvOCAzesgY1uhpTxM2aEzRiMwaoBm5QivZojK4lw2v0VhHveTwcAWTfmP562Bb+X42zc/Zm4HBd0h8Z6wE
 +IweSUhav48DxgV3gbKzdYYhm1XNMvEkCE2l28vj0NMeMGS1fnLddv2rjgSdzWn0pZT6j7nersNIBBGfAAKEcAA99sDoTIpru2j6jmYI0ZjRVNRAkosnwqMp
 RVrKX89BWbcF2D4gXkYF29iVwIM+jfXKPiUHYufGrWfr2Qo+UoQDIDGyl4K9JynSB7INk9t0VoTYvPo7UdpqsQVhqdqPcNzpkMAlJ0SnaqyKqbSjCVrWSdYz
 lXVF3TZg5wU9orPxsz08vgrw2b58YBE0AhRCa+jTE52kxtBPIAAEYbViuW6FxPljGzd2/keqtbzGlep1/Hky3hdK/rHbsrzPrHocThajtW82CLJs9O2lkkA3
 93lSKtkoT2txc9jKBUvcRiF7VeNWX/dOx9csBC2j9heDh0iCGio2rNwtOBO/ziLnWysevpHRb4CiJ0O396eDxdlJswe7P4Mrj3676T5ZvSADHEJ29RUffiNX
 ilJgGQnXaWFUKspbSpU52zsXZ+q2yoKSG8HSoDuhDEecDVn6I447eSAFYcFw4+ZfXT9JZJC57F0F0l0bYCVSfudYyQ9Wc0HT1t7lx/YhrX3sGjqUbZwAteKa
 KhpArewpC31MVryFJ8BmfWPATup/QE7xcqoXy++fhiVP60Iajw81MMLRvE8eC18p8sCIZRKe9W3mKV6NeL+ar264zwAkBx45mHKbmx90C09h2oRPbYqQOQ==
Subject: [Buildroot] [PATCH 005/102]
 board/altera/socrates_cyclone5/genimage.cfg: beautify file
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
 board/altera/socrates_cyclone5/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
index 63fef8ba47..0af3f2ec60 100644
--- a/board/altera/socrates_cyclone5/genimage.cfg
+++ b/board/altera/socrates_cyclone5/genimage.cfg
@@ -5,6 +5,7 @@ image boot.vfat {
 			"socfpga_cyclone5_socrates.dtb"
 		}
 	}
+
 	size = 8M
 }
 
@@ -17,7 +18,7 @@ image uboot.img {
 		in-partition-table = "no"
 		image = "u-boot-spl.bin.crc"
 		offset = 0
-		size = 64k
+		size = 64K
 	}
 
 	partition uboot-full {
@@ -36,7 +37,7 @@ image sdcard.img {
 	partition uboot-env {
 		in-partition-table = "no"
 		image = "uboot-env.bin"
-		offset = 17408 # 512 * 34 -> just after gpt
+		offset = 17K # 512 * 34 -> just after gpt
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
