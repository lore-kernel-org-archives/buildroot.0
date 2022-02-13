Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CB5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6275440498;
	Sun, 13 Feb 2022 22:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlDk31S6i9d3; Sun, 13 Feb 2022 22:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44E4F4048F;
	Sun, 13 Feb 2022 22:56:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 510F91BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EB724040D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3NpyVGHy2vP for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb150.aruba.it (smtpweb150.aruba.it [62.149.158.150])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466D1403FD
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:57 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkhnv7zn; Sun, 13 Feb 2022 23:53:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792836; bh=MJ8a37F5YIVCoT4NQQ2RykrZzqjysssSulRV7eATqc4=;
 h=From:To:Subject:Date:MIME-Version;
 b=Hgg8nMCt17BnQezCEbnyNxaEbQHd3hLA1Um6TmYE/bjupPK8PdchAhqGkE/CQ+e+8
 hwkl8xy3jNhHX7U7o4X3pat1/p8n20IM0a+40Bqw3GCtywKhXtNzxmITxx82z9yvyS
 PS88LqE8fjSLz9pxnUHh1uwxfpm8cpfkopQJTiXkUFW5J+QeCDrKwVel0jyId5WWOe
 +1xupdYURwk2lJi/MIpjYtjktUMyFl+KCSD3Dy+SFr5KfQZFnv95eqDSqSzvn0RTLS
 mmIeF+kaEnN0dftlHMEHMItoi1kP0eoJu7umBJ+kRGxh+/kbZtN6uXJPGM1sMEhR8F
 v2BDPwZuwsBrA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:41 +0100
Message-Id: <20220213225350.3466696-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBLieSnjckLb0sKi+oBzwZ3A5HUUsEnToauXMdCfLBq/JdBjawpE6mnkuka9f03vKssaG2lNLakmT0gtST2ilApEia6hNF5ZYAfAtAA+5xx1zH0Fn6f/
 nGHfHL0coehHyvunTvrZxUrjzg5p2wew218mHRtcoMNZRHj8MNRobE/OKjPFljLyVhiT5C5a7D8qOPUstOyLufXEc9dt0EQJZNFlYZ1urJ+LSYGyb7vKrUH2
 z++SgQOSDwrs0uVGmLWulMSY3zRGWDl8L0N4FRzJqTWkUOOX6N20PXy7Yqm7EhzLTuzeD9ZRdQ4Eyn6IzITmajGDfoWYa8Rb+xYiCpKGeWDIwFsrVO5QZ4j9
 eEjgYERphPPkEZZld/DOduXVwqkODNk2pG7stoovp+GZspwJfFaqCY8nM69CZsdbwLLn5N5ejZOWmpGqCyP5h7yWCU9djKAbZh8HWrBHnUZSWtBgKapdUBRz
 HtaUTPbwu1ClTWhqLJBaDHh6HhIVs3D++6sLpGj2LEeHd1YyVMD5rZ6b1h9PORytfNbqg9XIIaL1xtfa/9KM1L+ytp/dgXsgsRxGXMIj3C1dAn8zkR3j1yMn
 +sjMK9NTByEaZwT2WxZUSAD2vvd7szWRgbE3zojZXEm9xckjBVrzERN2cDgHRmBKrtd11j01X5tx+a4Rh/z1fPEV
Subject: [Buildroot] [PATCH v2 07/16]
 board/orangepi/orangepi-zero-plus2/genimage: keep partition-type-uuid
 without "" for consistency
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that rootfs doesn't need partition-type-uuid = L since L(rootfs) is
the default value. So let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-zero-plus2/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
index 5a7ee7707a..0a03384f30 100644
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
@@ -26,7 +26,7 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = "F"
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 	}
@@ -34,7 +34,6 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type-uuid = "L"
 		image = "rootfs.ext4"
 		size = 256M
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
