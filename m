Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343B1C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1FBF400F6;
	Thu,  3 Feb 2022 23:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTuIfqGwBthq; Thu,  3 Feb 2022 23:01:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B54F440A5B;
	Thu,  3 Feb 2022 23:01:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4670C1BF34A
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 341C441713
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSAZ6wo2pVik for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:00:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0F384170F
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:00:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fl55nOQm70FuyFl5AnQUOS; Fri, 04 Feb 2022 00:00:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643929205; bh=PW+KoKHPkY8LDec9f+/3MGYSP5fRFvz/bAYxbD9pHII=;
 h=From:To:Subject:Date:MIME-Version;
 b=AQUzv+65o0ziULoDX8HKmHwW82OvAL3IdcZcYSHuh66D2ylBcS/kVvPISFMzfk2eE
 5AyupCby6agDK696LFc+HjzFTjgjdzXBIJdFM3tPXo80EHVZmhhqZwhadiuJx1Dld1
 v+agyyfkIBSQR6zhJYNnBcgKscvRG7SwttWldb9pCuUhQXZzD1Uzf7QqzJb00gEDMP
 PySlYeXQgUh6uFTytCFBINrq6rz6bHZJBfdzZ8nBUIvstHtX/93kXaYiLmpdzp+hjx
 wd5Bx6vo292Z+x+M1gFZTbH1A9HPITmrkHig+fc4JOy3GAsbVQDxuZRmvuNrEqtJ0t
 N5TtxovVi++JQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:59:57 +0100
Message-Id: <20220203225957.3039320-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
References: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfK/+800M5/l6RQqCzFoR5rFSVzeqSCIKTr09e45y/WnjcxhXInr7u1iguBSzpGEezJSg+lJgv+rpvTu1ezofRi5K/rT73qllCyGb6zdztDkmpM5AdJ56
 qN/Jb3ywSZL8lGgO/I8EIBMFLtCgX61q0YU3+cND5ttXd3c4BPNphjYEhnuBnl5gvIkN6pWAziIdyHOSSMnrIPFvEI+iNinl2HYWKpAaSIknML5OV1nBRVKs
 DbL+2rOjJMBSlq5ZNOBNClNnCY+6qt36FaAk2HMBeku8dZ9qNo7RFngckOsSrhkKkEkm8bRPU3uI5rPBCqXUXsVxOm/g5RGaQi+OT4Ec6QqjTJu5BKAQppp+
 Xg3k7KGhUHW6ZJYPWPSLPcPNzpUyhA==
Subject: [Buildroot] [PATCH 5/5] board/radxa/rockpi-n10:use
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
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717241

FTR, the magic UUID are from:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/radxa/rockpi-n10/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rockpi-n10/genimage.cfg b/board/radxa/rockpi-n10/genimage.cfg
index 652e75db11..7f4b639bbc 100644
--- a/board/radxa/rockpi-n10/genimage.cfg
+++ b/board/radxa/rockpi-n10/genimage.cfg
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
