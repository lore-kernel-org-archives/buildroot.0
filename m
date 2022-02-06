Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8B0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EE6540240;
	Sun,  6 Feb 2022 20:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNOmZoLNfmYa; Sun,  6 Feb 2022 20:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9322B40201;
	Sun,  6 Feb 2022 20:06:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 113BA1BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00D074027D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWtiXS8odl6A for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 291694028D
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:37 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnmznXO8d; Sun, 06 Feb 2022 21:05:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177937; bh=DB+YRzeGJLWc4MIKHYmVSxcPIprOv/nGDiGWLZ+PZ5U=;
 h=From:To:Subject:Date:MIME-Version;
 b=nGXfXtwk0wev0UupsFc3M3QJxrCw2Db+7NfvUKPzuWiGJu4J3dZ8jjAcGZVNBzvwW
 F/xQa+wEiBwfMSqthaOQYG0+aI60YydLQG/smE0iSCP3QVZ/qYtzzKBSi/nLyG1hyN
 9GgHTl+e5k/YNluKnvpzofEG07CecJpMSzUmYDNEvQCUleEKtoE8A+48YbmIhrKc6W
 /rlt/oDoqwf/1gm78t6PAAIxcCN4H4bbgeYPQXjMY9zbakT9v1KQbL1vUBP9158lPL
 79GD95C5D9CfN2Ia459deoRdesNcoBpWWZ6x0xOM/crm8ssAyHYwHZrsbMU67038rE
 faZCIfjqi74xQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:22 +0100
Message-Id: <20220206200532.2758493-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLus2h4/E9eyxbTajqMR6sXhHA6YCjiDtfIUo9dLeAEPET2mPnJrcr/4Frn7QVKZXDffSmkOVsLOo9PXipMC08as4TSU9aRtDsrgwIab1vBDuHZlGRDs
 NLKOn4lqS5YB7HNCSAPaTaI1KyQxgId8CDEEFf/fP2z9WPIciGl1MvUTBHIo0L6VH7044x49ef1iD3jWAbCfCIvBECsink4pqFAfZ6ey9x5Png1YPCwOQZLF
 vxQnkP91meBkvWESVx0dPnVSVCRiMj7Bfcvef7D+SwWBTLLGML8ClAbd947cJP/rxdNSWLFlWlHMJaKoEdR9rf6faigJds5QI3Om+KUqwjs1jTNTtQdolqQG
 AJAvaja3Jn4Ug3I38qdRBAPhgB7ObM4QPC7t48i06FZSKv8sBvq14zgH3eJmwSK8sDl9PuBWyDySkFZwI1zI3okxKuRG9HQH7DeY/1emEXxSCrBGHEY+0KE6
 0Qafmjq++Xffs68FAN52ZTUB/eEUjqgMQl/v/Nkpe42FmpByPBkvMjjGd2wq1U0wm9iKSPGApSAzyI5UoA9a66a+iOYR7ajhVUKIB9VHiOt1BBrrQAkHnrpa
 2vE0TRcPdr3z/NIPxfuN+eqi
Subject: [Buildroot] [PATCH 06/16] board/orangepi/orangepi-r1/genimage: fix
 partition-type-uuid for boot partition and remove "" for consistency
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
 board/orangepi/orangepi-r1/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index e93e802bd9..78b69269b7 100644
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
@@ -36,7 +36,7 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type-uuid = "L"
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 		size = 512M
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
