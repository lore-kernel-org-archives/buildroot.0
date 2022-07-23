Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC57C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17ADE84AB4;
	Sat, 23 Jul 2022 13:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17ADE84AB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFiG3Y8WCQ17; Sat, 23 Jul 2022 13:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 174DF84950;
	Sat, 23 Jul 2022 13:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 174DF84950
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 729041BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DF5A848E9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF5A848E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLB5kuszM2vz for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:36:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96E7B848DD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E7B848DD
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A7A778445A; Sat, 23 Jul 2022 13:23:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:36:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 025d8ac80d06ad46ec3042c4af85ddd6a5e09b80
X-Git-Newrev: c6afdc173c7bfc4064607d03c8f2aaa35338fbe8
X-Patchwork-Hint: ignore
Message-Id: <20220723132308.A7A778445A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/sifive/hifive-unleashed/genimage*:
 convert partition-type-uuid values to lower-case
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6afdc173c7bfc4064607d03c8f2aaa35338fbe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to match the recently written rules for
partition-type-uuid values.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/sifive/hifive-unleashed/genimage_sdcard.cfg  | 6 +++---
 board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index e66f221d73..079ac5ed26 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -6,18 +6,18 @@ image sdcard.img {
 	partition u-boot-spl {
 		image = "u-boot-spl.bin"
 		offset = 17K
-		partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
+		partition-type-uuid = 5b193300-fc78-40cd-8002-e86c45580b47
 	}
 
 	partition u-boot {
 		image = "u-boot.itb"
 		offset = 1041K
-		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
+		partition-type-uuid = 2e54b353-1271-4842-806f-e436d6af6985
 	}
 
 	partition rootfs {
 		image = "rootfs.ext4"
-		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		partition-type-uuid = 0fc63daf-8483-4772-8e79-3d69d8477de4
 		bootable = true
 	}
 }
diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
index 903e675a90..14b7bb1e1c 100644
--- a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
+++ b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
@@ -8,12 +8,12 @@ image spi-nor.img {
 	partition u-boot-spl {
 		image = "u-boot-spl.bin"
 		offset = 20K
-		partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
+		partition-type-uuid = 5b193300-fc78-40cd-8002-e86c45580b47
 	}
 
 	partition u-boot {
 		image = "u-boot.itb"
 		offset = 1044K
-		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
+		partition-type-uuid = 2e54b353-1271-4842-806f-e436d6af6985
 	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
