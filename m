Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E7AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A692402C9;
	Sun,  6 Feb 2022 20:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDAB0Qi8bADp; Sun,  6 Feb 2022 20:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EEC5402B8;
	Sun,  6 Feb 2022 20:06:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA7F81BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8199A40186
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYhmDihfD_Ud for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80969400C4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnmznXO8v; Sun, 06 Feb 2022 21:05:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177938; bh=r8wdw+SDXEGet6u4GmG2uFJWqszgA+TFK6Gmy9cSFoI=;
 h=From:To:Subject:Date:MIME-Version;
 b=a/CKid8YvcN3z/lC629xIA/cLBFNVGzD6hwRdS2crtVBbn4uJ6T+iyV/BFXkG4mHr
 6RZ+aOQQruAlB9PKW5Ewss12rlO+R8oAeMGXTiCceeoSq/rfDaYi1CCqpL3AIHofKT
 7fr2QRs1AI+zHR+LYjbdAWdYdvaY4Y8Use/usJnCy5+L+8ymsPtrXVPIiG+Cey4hv1
 vdK5WZm0G7HOxrVkt3Lt3szdEBsj0T8nibavOO0S+tccX6NFTMackrZv2e/BH8qOve
 4vzrcgzNtfWDHIG9dJiwPhMa7Ev29Oh3vZ9odef4ezgcHTxdnR0qWrUObwH/uHJDkp
 IslT4QEvX8rcw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:23 +0100
Message-Id: <20220206200532.2758493-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAT5XGrMxEsFiz00hqqXkBeiLhOojjyT+MAOsG+ZnCeD9VR61VwpC99O+pLSLWlvo8gNC3hZhh83W/Cwo16x/nx5F27SaEL9sO8QKNZKA79I201Tgrx2
 3lBW5fdPWzJbCBlpBxnYRTGiN7j1ldFILBsnylCmdZCjQ8MG71gZGF9f8Bawuzg7tsl6o0mI3nC33KRjoWRLDftck7AmT1Iv3WeBKJGcRfnqgKL4v5Kyq7k/
 1kN74rBOPkfHsFbb0SOgxx+Yh1/zcA4dRDA5kkJtSU4Yt7OK8T/XJPIEzySLL2VfuIxsg28egjRTC1YftD6jlNQyk5wGzW1JcrFM+OyAc1ftN4uj6eNhNleZ
 /RuiVE/jtJs2y0hxINfOPGl3kKRNkufsUqWDiP9gaqDePvzCdGRlJCY1RGNp/FbGuMLkUk8v+frd+O+CX93DfE6dZ7pDkw7FNdYQ8ibBPje+xtl2LIFzMHa7
 3DE08NqhFLJR4dQVvnuytElCBCDnjBJvhN6uZ5YC7s490Uso4MXRwWZyD1GFl8PzNb56uFt1oXCveWZjew5rXSmS+QfA06FUsDYKSxH53lzoNGOfUFg4od2d
 qJEXUSRPwJbWV4wQkjzAfS76
Subject: [Buildroot] [PATCH 07/16]
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-zero-plus2/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
index 5a7ee7707a..9538e6a54e 100644
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
@@ -34,7 +34,7 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type-uuid = "L"
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 		size = 256M
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
