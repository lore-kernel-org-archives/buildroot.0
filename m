Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BD6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24553610A8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24553610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E93D16066F;
	Sun,  7 Nov 2021 02:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzOvYUreD5B3; Sun,  7 Nov 2021 02:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F116066B;
	Sun,  7 Nov 2021 02:04:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81D421BF573
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7111E40251
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0W4lqNHqgmR for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9714740249
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:31 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXXpmuSTZFf01jXXqmqLcD; Sun, 07 Nov 2021 03:04:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250671; bh=2t3lX01cDnUucNhfI9fnK+ThPbyfHFQ8iTKdpCpicbE=;
 h=From:To:Subject:Date:MIME-Version;
 b=dAOuOnc29eEKKFKfgsLuSNXYlOymgGCJrOrQ7ecW3D0S716hIdzQlNHpcmtt/5Azk
 +j/Av68eBFOelfrpEe51Fpp49BGdHQ4QvJo/9m6ZRoFYHD4lHAt6UGsZ9pWn3Y9DUV
 5/1gguAzSKIpEq8ddkTUvUUYIvwg4cvGw5W+9QApWA3T+TBsP+CsfoKSRJ5g4a6EQL
 5o3jIPeqapXplxjBmf73crRK2NHTre1BRHZ/qMWRs/fNVupS4EKircR2qUuDXSiZ4c
 vSaRIyqt/95krdQJOcX1Cbw5ZOfg0jKXH+4+oKPZydopWUqbpNMnt+99R8YasExbhI
 U2o/t39X1+zbw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:04:28 +0100
Message-Id: <20211107020428.3057113-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCNxuIiGa0QAqQ6OMVe+BAmB+YQVT6rinTGCcfCf9GnI6380a5F1AUfIFSftfyblTI3VkvyNzBOk04IBkAbxn+Dlr4ptFChXRbkQfTFR86y+Fsvaei1V
 1eoBkf8J8XpCF0+JAloDZUqAgBYZRDS9ROrN7RkxYjjKg5xCKcLpBZE5wfRKy+l9prjF9mAINoTpYAqA9G6GZ65TkYSoLMPy5AVG+swsaK+NGB8sOkYpX8XY
 Oc12Yo2s5NzEUKItvQu7U6JEsR0SGqDFOw/mOY7sAJ4sdRhSlufUuXKgbSEJERfyknTwnO4dFbAP48ClCbk23rEAnCAGH7L+ouyQxKWfqBXOZwfIHMmh7mVA
 cEKNas15v/HKyuHWAUx2Zqj/b6j5WLwNiaRKq0tJ6+yeTT24z0mO20ZLhP7ApXJqwreJkhO9sJku03v6uj09Z215t7HWlIARe782/KvA7LnLqxWFIdX7y7jB
 fFe8oEq8X6+pYnI2oaf3gb0/F/kmoh8XIkL1Ab79xDOLn8gius4d6JK4X8Ulu5Wg7gjnqjGPL02tUga9y9Z6RlQHc3rWs/d89t96PWiU3MUqABSAOkG//OI/
 peJBmma2KcTG3gdlI+WfSIviAyYDIQ+gjg6Qk5/Nf+WUoceJXUaeJskCV8ITVndC34FzjqG1oRoiL3GkZ60UbL5NSGT5PFGOSaBC4XPeS6u5HLTsOrHzMuap
 dFdn5WrD+4QxHi9fGsPiJAcNYYuUR92FasjPES3MUaYodjspegdi2HqE80azSBPVKYbMmXzg52zfP6epzPptOglLcSX6/G8DaZ6WCVRscGtoeTNmVxJWP8yh
 PiMadbTg82atMfaAYPAFZw9w3l9DZEZTYtfwzzjQ6Cd0mhMUWM5++AKWIHk3GkFUFTSzYurbxsTzd7vEawMuJ4gYrxmpUlowDAPs5JB29HtV6PV+1ZsFDibG
 /ociws2PKr+dxG49mHbOs+gRML8nI3+hEA0d/i8NCadNalT5pdZrHZKlJiYUY9RnIXxk2jI4lZYYnPYsp8mPu1WG0L/6PvcM591h83B4f2aw00rTal5Gglpg
 VdaOZT9EDyvsyPhF35wbhWiu9rS35tbEYpcSo/gPRfGo1Ft83LQdVR6AgGgS82V9T5SWsYfu9bkVxEaiqHJFajVUGb7w6YZAFph/6O9CQbMi9OLaZ3QHY2lR
 f0USMtHzSpHBNdkxU7tWZ7rBzTXifH6bIxHN4D2keTSMfugdqhL7wV3Jn78tNZ3XvaPBOZEnoLdBIIai3auH+Rg90zopAOaSnrSmhQXiImoEOh0eACCFE9ye
 GAjs/mN08+hMVQ6SYbIrKLP3X9ietZRRfiVkM8PL+GZ2FdCpExfLT3kkF7XUJLd5y+Nn5vWARhlGy4U5bDdLVbiTAzfPZtlmMw3A/0F1auz03h1G6ucdjbpC
 6e2epABvm045u074as0CZzCxVxWIR6F4kB6UZXYAN7bh2bkTJH1DS4RCrjB3bUfNSCRrHj+yMfEJm1G4VAjbXDQtorifG9JlcjJYSRLlbqoDocOekFG5Awzk
 3rwdd8tLnvvA5QClf7oACdT20OXDGIZ1SAtyRkB0Uiq60jB3NpWPxfFJa7VTJalWa6yTw8M8JoEl/ZiWaEsWUz/KKRKqlixQSPXYqFNZHdgOVK4/xr1UxaMo
 cytuM96WcSI+l8psFZGvNQsNOjYoa5syrzefzOBmI+RjoPJAFS8KsZC/YmRTltyfFRTFehNaa7iV/3Ex4M2dOrHfZeVKaD4FDBMGYeq3oFEnwyWqcx1l/g==
Subject: [Buildroot] [PATCH 018/102] board/beaglebone/genimage.cfg: beautify
 file
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
 board/beaglebone/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index cfc1039ec4..1fa6c5f381 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -12,6 +12,7 @@ image boot.vfat {
 			"am335x-bonegreen.dtb",
 		}
 	}
+
 	size = 16M
 }
 
@@ -22,7 +23,7 @@ image sdcard.img {
 	partition u-boot {
 		partition-type = 0xC
 		bootable = "true"
-                image = "boot.vfat"
+		image = "boot.vfat"
 	}
 
 	partition rootfs {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
