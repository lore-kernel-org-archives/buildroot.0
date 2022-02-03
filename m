Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8BEC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 789CD60B05;
	Thu,  3 Feb 2022 23:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5zFuiBqrcPF; Thu,  3 Feb 2022 23:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADBE16101E;
	Thu,  3 Feb 2022 23:00:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AA301BF34A
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24F4A60B05
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2RWDdfEnFh2 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:00:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0255606C0
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:00:04 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fl55nOQm70FuyFl57nQUL5; Fri, 04 Feb 2022 00:00:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643929202; bh=scsaTQX+J2Wz3j6BxIcDI8CSTMEdM9tpCibox++gaiA=;
 h=From:To:Subject:Date:MIME-Version;
 b=NzsELGojoyglVHZAwF8Fxa80ol0UnhC4BIzvicAvyx3LQdq5AwI/QlE9HmJEcYjR1
 9EmaG6CVq8yn0thwExksPvc6ElLcAFXcgmLx8N6w9F4rpiFNvNd5iBg+GiOPWMjZxS
 geIQSr7mxfffUOZC/tZ57Lkc1lTdAAUiKQNKEO9E5XJdSNfotzDryHH7eaKefMadT9
 /VthgGg+o2ioM1tS9s6JTjZrTONE2hhnUyvWIlg/sFQdhBn+l5vEfe0DlY0lauYk12
 lqsnILVIDdEcMmW3IABFd007GTMyA8b90/pX0EV6eD8XzTUBPkjLxUmq0LDmkTDOBi
 EkZJJFRoKzxNA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:59:55 +0100
Message-Id: <20220203225957.3039320-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
References: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLPWDYGxYp3QeaIaWiitpZgepFu3OA+235Xbk8FJ0rHADSXxnvZWlBCAz1ghjZ4t+MhjEPN5zFycraL2LOf0HuP4N3ZcNdpo1jjeeU2k5JFWtn2XnnEn
 C20hpQDlFlfnWEYzQIhgvo6aw6xTnAzMQrptHcyKZ90w2AbN0ffNUxI7VhxXbU5OAFl2pcQovNaJVXuQqcUA8P7Vs2XwRX9c8Pen13Tl3ImbuRNUuk9MPlgd
 Mw7nwFhjcHsmguWhgM3ijkR156fyzCVWijw6IEV9mqR+4lIkcA5ZSfK1kiuurtu9jI4MnFdHK6ZDT2CIVzCfGUqTX8aA037mQ+OgzcE6GPqiCMGKUFoVFgt8
 loUj++2Y3bnHxCnd+y1bOocnduIaCA==
Subject: [Buildroot] [PATCH 3/5] board/pine64/rockpro64:use
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
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717243

FTR, the magic UUID are from:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pine64/rockpro64/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/pine64/rockpro64/genimage.cfg b/board/pine64/rockpro64/genimage.cfg
index 14dd0e1d18..d3926f2df6 100644
--- a/board/pine64/rockpro64/genimage.cfg
+++ b/board/pine64/rockpro64/genimage.cfg
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
