Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C30AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D270C401B0;
	Mon,  3 Jan 2022 20:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5puERMgwMGw; Mon,  3 Jan 2022 20:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3007640170;
	Mon,  3 Jan 2022 20:42:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1721BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04BF4403AA
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCvx8NeieJSk for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:42:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0966D40123
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 20:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 64AE982A54; Mon,  3 Jan 2022 20:36:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 21:41:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1368ce2331cc0303ea59b35093875989d0d2bf8f
X-Git-Newrev: 16d490d1117e1e7496fb6287a8b6d5c04b1712b5
X-Patchwork-Hint: ignore
Message-Id: <20220103203632.64AE982A54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/aarch64-sbsa: use
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16d490d1117e1e7496fb6287a8b6d5c04b1712b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Genimage 15 restricted the partition-type option to mbr and hybrid
partition-table-type and now prints a warning when it is used [1]:

ERROR: hdimage(disk.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

[1] https://github.com/pengutronix/genimage/commit/1d72d8091f83790a0a35a1ea7dc25d46adba8876

Sync the genimage.cfg with the one used for aarch64_efi_defconfig

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717179
https://gitlab.com/buildroot.org/buildroot/-/jobs/1921792262

FTR, the magic UUID are from:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
[yann.morin.1998@free.fr: add Wikipedia link]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/aarch64-sbsa/genimage.cfg | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index 121ae9f37b..bdf8a89d75 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -18,12 +18,14 @@ image disk.img {
 	}
 
 	partition boot {
-		partition-type = 0xEF
 		image = "efi-part.vfat"
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		offset = 32K
+		bootable = true
 	}
 
 	partition root {
-		partition-type = 0x83
+		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
 		image = "rootfs.ext2"
 	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
