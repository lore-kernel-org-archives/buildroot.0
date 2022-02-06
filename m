Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686E7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B4160B0C;
	Sun,  6 Feb 2022 20:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Y6vk-xSD_qm; Sun,  6 Feb 2022 20:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57A7B60B89;
	Sun,  6 Feb 2022 20:07:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE9191BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E3A2400C4
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncztC3RZG-bT for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1145401C2
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnmynXO7v; Sun, 06 Feb 2022 21:05:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177937; bh=ie6GKN5xzyh9lJabmfuCqMDkhRtzKdtlA0nC6ojLklw=;
 h=From:To:Subject:Date:MIME-Version;
 b=fuaAWEtT3PKg00bwLRF2HRUOmvd2CH030Mci+vIm2KkcambZj+BY43Y/h/ohVntNz
 1dk5qt04KUUQHNsbx1CA65LZ5sdEM6r7ZLa6N5UX8ezt8yn636jWKiUh+jM3ztJH3L
 dsDOsDX7tu48VuYMxb86cXMjPOqhHco5ubYvXIpn0ifS0srIIQ+buLOKBp23gmhlRC
 pFDjACu2Cz+85yc50fyGrGDkNsS6qWuSKXaJUw/ejVwGm1n6z5ZpGB7ZBHVNYAYrau
 w7pn4gFHdlrXTpGamsQhdG0wr2vnuie83lMPmOkfvZ99aNmy0h6AeMiXMMWoL6vbMG
 kAMVITUUKpgFw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:20 +0100
Message-Id: <20220206200532.2758493-5-giulio.benetti@benettiengineering.com>
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
Subject: [Buildroot] [PATCH 04/16] board/friendlyarm/nanopi-m4/genimage:
 keep partition-type-uuid without "" for consistency
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
 board/friendlyarm/nanopi-m4/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-m4/genimage.cfg b/board/friendlyarm/nanopi-m4/genimage.cfg
index 8d0e6ad13b..655981847e 100644
--- a/board/friendlyarm/nanopi-m4/genimage.cfg
+++ b/board/friendlyarm/nanopi-m4/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
