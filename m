Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD77C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8403F60AFD;
	Thu,  3 Feb 2022 23:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cz8WNMbHYErj; Thu,  3 Feb 2022 23:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C2360B05;
	Thu,  3 Feb 2022 23:00:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9B7F1BF34A
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8B2341713
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaGRQlnInc4K for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:00:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id A33C74170F
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:00:04 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fl55nOQm70FuyFl58nQUMg; Fri, 04 Feb 2022 00:00:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643929204; bh=2dZt32GVAzo3trlJQtgmMYlJ1TnlvOyAigTVO1SyWng=;
 h=From:To:Subject:Date:MIME-Version;
 b=lImBh5My+veK2YZOk+y58P6OWe4diC615K1Rfpxy9CULBJjqBXulsr4fxsnJxYIMh
 kMtUEH/ilo3khCDuxyinEDRi/daGt2krOENypmKQU5hQcep02+nAETrPYzJZYX4xKI
 ZDGImmmQMFvYtvcoTym8jduuCsumvcs2jF2Y6sLWHhlfZd4U6nQ3dViH+40T8N+ewa
 C/j2vy80ykptZ1fHWetwS8EcM0RhaywYtLU49mLtbL9R2Wp/TFswqiW7YrJfcwy7/O
 H5XBLn3wnJ/kFDTlqB/GKoj4VnrRTha55pe6rklfFCrUzE9ekxeaBqgFxU/OwY+/XT
 kxeYH0vQFiLzA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:59:56 +0100
Message-Id: <20220203225957.3039320-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
References: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLA95i/6lsE/6ol32IUu3wW94AcNqdoZcNRazrZskZ5g4mOmLFvMv7N8FZrxcfUtHcDe+ddU/FD26yqB9+sw6yW9NLVglmnKVxGJE/atnA/TFGqDSCIW
 C+7a/wlRPiXcOoACz3t8yx6XbxMY08Flu2iklWQvm8FhpGFSImniMUhbP+KQqp52kWbBwxdw3PVz5CSpj9139UeNRh7VN27FAXSnnS9ikVPnCg+U3QMj9u/i
 qNviDT4SlWZjuRYrrX1kMbL0lR180sgfA3hB8izIsRVQVlk02PuDm69uObpBM1c6F+godXtkjzwldRSbRu1PBY0CYZkJde+u9bYT8mB3kHw6qmeRmNQsQgZe
 a3PQ5nldISPJJhpTK/BnnqsWleWUiw==
Subject: [Buildroot] [PATCH 4/5] board/radxa/rockpi-4:use
 partition-type-uuid for genimage-15
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Genimage 15 restricted the partition-type option to mbr and hybrid
partition-table-type and now prints a warning when it is used [1]:

ERROR: hdimage(disk.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

[1] https://github.com/pengutronix/genimage/commit/1d72d8091f83790a0a35a1ea7dc25d46adba8876

So let's use for EFI System partition:
'partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
and for Root partition (64-bit ARM/AArch64):
'partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae'

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717240

FTR, the magic UUID are from:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/radxa/rockpi-4/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rockpi-4/genimage.cfg b/board/radxa/rockpi-4/genimage.cfg
index a5100af420..68cc4d61a8 100644
--- a/board/radxa/rockpi-4/genimage.cfg
+++ b/board/radxa/rockpi-4/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
