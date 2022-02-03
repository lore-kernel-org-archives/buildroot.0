Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53310C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001BE41730;
	Thu,  3 Feb 2022 23:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpV6iqnMRrPW; Thu,  3 Feb 2022 23:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3186741713;
	Thu,  3 Feb 2022 23:00:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5A8B1BF34A
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0CB840A41
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XjyCKJqz9oT for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:00:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6363B400F6
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:00:01 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fl55nOQm70FuyFl55nQUJO; Fri, 04 Feb 2022 00:00:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643929200; bh=qjnpF7xH5YZQhF5Gcilu8TlZ6N6Kph1taaKbreBu+74=;
 h=From:To:Subject:Date:MIME-Version;
 b=XL6w0XXQP2GCi/ozxf3ZV6tr79sUS8bHASWyAyZsl4bKUR/yvuGzLsdeL4AHPTL6W
 Lf+a9A/rvq9FHAt6iC1xJz0UGCBLR4r0OALszi93E/efPfBlhQ+HC66YzQIbQApAIb
 EAIRC2RLoO514u7D9Govfw2pFW3z2XpV5A8fkUkSG1fZFaQhQzWWhW+S4h6osdAbti
 /1ZXQYwyDWBU0FMRCrJx4g6ZDJW1T8y8xO6DASlCBUSUkV0raZ/QZMoHdPbGjZObJ+
 uS2IIc5GkDR3XdXzdBHX8DAh+onMAV9TU6GtUKu1a/0LCFhASjNeYSwDIvsgyXb9ya
 hHRef4ot8sGOQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:59:53 +0100
Message-Id: <20220203225957.3039320-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
References: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL7lne4VdHRlzDIG+zAasJ4nXAi91pTlHO7eJ6l+p6ShD/bHPqMXmp90Zw02Au7F6RLGxrVLOfcqfNd9SWqJkymG0Ted5ytPOC9hFyFq1L1T3WQtCF2Q
 0xLNe4wYPGcG5ezbi0ELrX/K74fB1AJZtDeHnLpiQmqm0OxbLsL3QzjswEGTA1XGTK9Agrv8lhpB3ZiuVwggXZzn7q+tt5sMA9G6iq6hLoxpmxAPgXwCTIPY
 zZEzBg0kCJcdfpJRU+AIZrC2t5B+E2acSEg5dtM5/ObLGbnqWAcz8EV+/7wgHjdrJZSTTciOsoCNMWu4r7Bz1QIdb7xXxeJXCWWm34Lpz9KGDgpf3Wofh/PP
 JWJRpUBlDp/yGVodV49Xo/L1nIMn8w==
Subject: [Buildroot] [PATCH 1/5] board/friendlyarm/nanopc-t4:use
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
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717055

FTR, the magic UUID are from:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/friendlyarm/nanopc-t4/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
index d63c293ab4..98dc2f3892 100644
--- a/board/friendlyarm/nanopc-t4/genimage.cfg
+++ b/board/friendlyarm/nanopc-t4/genimage.cfg
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
