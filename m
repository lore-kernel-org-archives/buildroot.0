Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2A6C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 489F440B0C;
	Sat, 23 Jul 2022 13:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 489F440B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ee1eF8-n_9Ga; Sat, 23 Jul 2022 13:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5610F40B17;
	Sat, 23 Jul 2022 13:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5610F40B17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 990F71BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72A31417A9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A31417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YMa8jDUZQmD for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:36:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86175417A8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86175417A8
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 944EE84460; Sat, 23 Jul 2022 13:23:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:36:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6951c83091e2f8104a695b08d0385fd32a80c9d
X-Git-Newrev: f57d4c5b9f96141836681396dcc91d2b95b0dc78
X-Patchwork-Hint: ignore
Message-Id: <20220723132308.944EE84460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-r1/genimage.cfg:
 use correct partition type
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f57d4c5b9f96141836681396dcc91d2b95b0dc78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boot partition is not an EFI System Partition, it is a normal FAT
formatted partition, so using type F instead of U makes more sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/orangepi/orangepi-r1/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index 61d13fe7fc..78b69269b7 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -28,7 +28,7 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = U
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
