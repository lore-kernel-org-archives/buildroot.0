Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC304C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCFB5615E4
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCFB5615E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99DB1402AC;
	Sun,  7 Nov 2021 02:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIMRqlnXls6p; Sun,  7 Nov 2021 02:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 083E1402C9;
	Sun,  7 Nov 2021 02:11:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D32571BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD75640232
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSCkbpzrBglW for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:08:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACCF94022E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:08:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXc3mqTWqrIRljXc3mQxwv; Sun, 07 Nov 2021 03:08:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250932; bh=XCYO5lCQvqLDCrF4xWaW4Z7kaZoBvO2lOuSrB448vJc=;
 h=From:To:Subject:Date:MIME-Version;
 b=OyXCvini3Q/XWCdWuMYD3jl1idY09qGMIt/t2zineOz7Ph2wXriPZ1Kgi6UaFFj8u
 /3Soxnx2bGaGwxqCqY2oWkGubaglwDMSkj78l7aq4L1Aa7eg46CKf+2iMvx9aTTN+1
 JhgX4s4CmK65lix1rVrl4HmpW3lbu7Y9VuL+qgb+b+Q2/rq6LMX6sha5cnmwENij7M
 JQDFkn9iT8QYjY7RP31t19MgedAVPFlKm48DVRQF2J9Z3YQ+se0zDlYhTPDXYs2gdY
 Ze088fUSubqZIc2yZeNMQoF70rS3lpj3uKqJmWKD3oPToi/5zKIWuoh3Y0v6TxB7br
 6oXr8FpjMpqWA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:08:50 +0100
Message-Id: <20211107020850.3058581-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJ9iGmjl7EnkFDEygdbl+HNBW+k40AghQl7vNxhEfy+nWenInDy64BxOVIqlGpl3eqYEDLareg91QluvMI8+MDMRLWjIwKSFFTGKqZqTVMj7LQUt1eLF
 TTfQiVDp+sq5YMfXq0rp/1nXMkhH/yR73OsKZS87pIWXpCPswAsZX1ecGxXqBOPYZ70ljUMW1QjDy/6FcB5j+Q0sqX1DcrXjbEW3blX+c1fciYd+lFYljis6
 i84EKwvP3X7CAo2UkqRQ69GcgCtIZQvDb6uK1jUMTNLE7ZVzYR93lxLUCZKs9eSSIGOps3Gab9alCjV7C/Cd+uRR3HkHkwdFfetiUN4MsPRchbqk2Zd7H6j9
 O0l7J+x1Kt7an7w2LnMkUvRSwfGoYCoX2UMmRD/08nsyA/b2jqUsNgAU5VXTFtogUrv8ZekT4JdHDgy+w0282BxFX2QFZ0H582sXi8T0fReIeTpiaR40HKEg
 3WC6nf4/l+yfwkM0z1U8MSNcDNnSof+g64a5xn6vf0A8OowCwqF0PahGajK+m7u7oHXWzuZHWBixgveKBL9Q+9uEBu08a8cBXdp1Kki94EuDOpRPYtfNlFeY
 lxto447BMeZOgaNml9hT9gML13u4FxKUF07q4FcxoLOdPLf67+zrFksMkHHNoxyP19Dt81Y/autgiGUZ3jFSQ9LniMm5rkqDu8i2wyBNY7ugMQ2rGjIMUHhF
 Aa8s7xa2cxwK8NeoMUrxL6FNNnzOSf7ew1q8rsNuBm/FPKSIQnRaAAPIv4a2bCfZKERsAXtOtR9gK4Q9HI8eDdOT2LRCG8yDw8xoNvviZ9FELVQW4JMQU+5i
 ErvcvTdz/0/yZ3IgaBbL6g9jYmU35buWDcU02upRbKg2Ql/3i+s87VdbA+KAfmNPo21iwx1RxCfBxz/eLdBhh1u9s8HxcOOpYRNtQlyHHrsVLCvj91CQKXc5
 Xcva/DdJz7oU2sTG4zTPjG4BwqGVPiufgOuiHQqCqXegK2IZc08uSyJGUKV3ypRkfTm0jQItkPUipDvvKENSvpQazx+sdce71zPRnmB9g+Yr3haj7HTb9/qF
 w+aGxFXL73Jkn1uvTtNfngX6jMp/RkHft/pAi5+sXNNDfaMBgWQtbgUvs5fPEjLR13Yhk26elG14c4dvyCGGik0j2ZK7rt2Uy2+9P8e6n5+kUTC19KIoY2ST
 Uaqk3XGMrnws4BsMDjQhOyOIn0kn9BvNjsS7RFSIFZVYXHIAonPYGQHwKF35IIdsh6J1b6Xz3zEfQdKATY7f1UznCsEtQjhVdG5eLVsjNLLCpeucqNtgkk8X
 E0AsOAYMlurtSTrqS+BT5Aqv+qTIf0+c7IPTd53MYwynwYAn5dWV66v3OqWfDsCOUtdmpU9zaZwXtTSv90UCQzl9kCL5flgQZ+uymW4rerMUEjU2n1KNxZ9j
 rhOMZGownbrUxzWxitXszVCChOlF+RhKiTR/BI1MKs+XE7DZuQbCUeo5D9Exfl7WpTA9KFZK7Cy4U7i61Mlb8aHNyMtCi+DY7MqAgBaI43PdsHHacuKOJnbc
 qQP8HzJM1EVomqrf6PFka6bH1B6oDIkyLE6NVX0Y7lw/Zz6SLA/FwJZiEmsB1xRlg3bZbVSMjbASOiGlARUEgOSXr/fCNoR4Ba9VGcpLnILmYQuCzAiGZPPe
 G9wGXpqE9Q1bzmi6lQ7VN+rmCGoaJ0XuoyUO7fstQt6qDKfGrvkq9/lMgBLbeuP3ex34vcep452Y/yK7w6AvwsRGMgbBrFmePK7yHGh+Arpr0suFxdq1bQ==
Subject: [Buildroot] [PATCH 040/102] board/hardkernel/odroidc2/genimage.cfg:
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
 board/hardkernel/odroidc2/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
index f49c1deaf3..c283b514d6 100644
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ b/board/hardkernel/odroidc2/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -22,7 +23,7 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "uboot-odc2.img"
-		offset = 49664
+		offset = 49664 # 48KB + 512B
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
