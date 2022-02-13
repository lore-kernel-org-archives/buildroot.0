Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF53BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6034040424;
	Sun, 13 Feb 2022 22:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZefoSgE9Ssb0; Sun, 13 Feb 2022 22:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FC20403FD;
	Sun, 13 Feb 2022 22:56:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 201A81BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C7DC606F9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dkwEGYmydZ8M for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb150.aruba.it (smtpweb150.aruba.it [62.149.158.150])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AAF2606EC
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:56 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkhnv7zQ; Sun, 13 Feb 2022 23:53:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792835; bh=i/gCWZHYR/qj3eOTMkT9lZQ365MLe5n+NJgNhZwBVoo=;
 h=From:To:Subject:Date:MIME-Version;
 b=RxmUnnUqqLAydUpN0Mq4t6dTvivGpvNcoeHvziTF648wvtZsHN6EOXIo4llKbgEsq
 ebNeePHI8hykjOJOj3w2JVLk+7NN02y6nCmXJccXvw5puiE3jCKjd6zJ2LStnBXeH5
 qCUZ1I65W8nrRmSWo+JpaTfyDlf7zvHbGwr3tMdEmrq14fYcJ2fCuOBOhbgtRRZnTw
 2csOGDJCcNMbY7Ro9I3o6lLiPyfpW4hZURVhy6S4KTPaGL8UOpli6ACPZiQwkE5Krc
 oW7O82Irb6PDtV2cCw16LF/hDXB+YUCy7DFs3L9s+JMs6KtuPX5d2hH9SgCGccheyL
 DvffHIcl2695A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:40 +0100
Message-Id: <20220213225350.3466696-7-giulio.benetti@benettiengineering.com>
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
Subject: [Buildroot] [PATCH v2 06/16] board/orangepi/orangepi-r1/genimage:
 fix partition-type-uuid for boot partition and remove "" for consistency
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
 board/orangepi/orangepi-r1/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index e93e802bd9..da96e4c4b8 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -28,7 +28,7 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = "U"
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
