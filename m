Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52683C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B1E403CC;
	Sun, 13 Feb 2022 22:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2T9DowqVq0ne; Sun, 13 Feb 2022 22:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C04240361;
	Sun, 13 Feb 2022 22:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB7C1BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5990C4040D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iR-AhaFOWYWf for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C21D400F3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:56 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkgnv7z3; Sun, 13 Feb 2022 23:53:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792835; bh=/QpVmUZjn9ZJq24qSM2bX9aFXI25CH/fq4aryolk62M=;
 h=From:To:Subject:Date:MIME-Version;
 b=lrTINPf8bK9DXUEDW1Pw9Hzda32BCmeoxDjrOHbPegohmgysbtO0rCL54jUi8vSyk
 sy0ETepTpVEG7r8b7qssqPX7uj5N9XGqV5jODNgUQua31Gbauzmr4tsSFbM4eLMdkI
 WPlC3yf4YdDZmlnxRvMo0Iyvv/ndd9KlJnesOlosJyVaYBNN04vb60yfjmfAk4qEiM
 KW+NHRjl6YVI6r7fiQ9GyvIqpSTo7vpvwxjlLrKtPluf21wzOgSKWc9aL4Ox9E2A8K
 THCY870bQ9eQ59g/1HhQ9xuAMLMHbAwCunfukft2IBgNk4oWWaWp0muBAPJJg17jsD
 PmXxpeRVwZCWw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:39 +0100
Message-Id: <20220213225350.3466696-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKFD71mzkOqLx3A0Q0jYVCNk8P8XFIVACoJWWMbLKJtlxaas9eEAztAd/KgnH/gGSlHz2ym2iSqdlkgAdAC3hmf/mkFt2MZsJZ3pTyxuhYs1xNh1S51o
 D+Z8XIJLyHAoE/zcb/ztxWQ58hjwN4RGMXl22BnQrQjaDiU+8OQVnJRgETZZrElMUUisx6mkoJNPBqaoSD0IvZ+tE/edkWEtnQVvARLScLA7e6FlfgJG+gcM
 soV//ladOPBWda//paN5awloqGrVqIuikyu9/vabjFPfnKNd6DQejYkmHBfFHn5Lp1Y+rp23R0qGkGrg5GobcTNoCO1ptpjJehtQuNjR4v7orLIK16z3Cjs0
 eH2O4uGxHPq/LoNcQNa2/3G2ijE52vAXtBpNO7InfwCWaKACX0FaPzhgo1rqOOmgdHqueAO3PdB98VIcvrWgN7pe45PfTT0/lsFr9HX00yFYD8rhDJ/91qmB
 nk+hYzPH7vnljPiTf1/jlhIm8XlgADpbAdd0siWdt7ZmEj0SYStHlE7yvunm7qfVndnAGgAEaH4eDEUsXPOGIk6MIgVxH7VcbsrK8MOuTRlXj+S7seXY4R5C
 +LdHvQzLK0RnQiyEsfaOS6STmTknGLAKcQMA+U4vg2lTBsW6j00ALgc78AbQ0cGXbw9SRdwvbeJEMJlRsOemvnyJ
Subject: [Buildroot] [PATCH v2 05/16]
 board/orangepi/orangepi-pc-plus/genimage: keep partition-type-uuid without
 "" for consistency
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
the default value, so let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-pc-plus/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
index 3812d785d5..2c68b28e10 100644
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -28,7 +28,7 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid  = "F"
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 	}
@@ -36,7 +36,6 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type-uuid = "L"
 		image = "rootfs.ext4"
 		size = 512M
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
