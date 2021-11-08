Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D446FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:14:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B5861353
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96B5861353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F46480C48;
	Mon,  8 Nov 2021 22:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxP4Jj4nm3FF; Mon,  8 Nov 2021 22:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71C280CD2;
	Mon,  8 Nov 2021 22:14:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B095B1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BD38402E9
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLh-cC1XUvCj for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41BB5401CB
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EBB298B708; Mon,  8 Nov 2021 22:02:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ca31c6d7c54cfd2a548ebf7c38a058ea2c4852e
X-Git-Newrev: 0458912a45e58dcfba33a44cc26c0ce6b74dc436
X-Patchwork-Hint: ignore
Message-Id: <20211108220210.EBB298B708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/olimex/a13_olinuxino/genimage.cfg:
 beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=0458912a45e58dcfba33a44cc26c0ce6b74dc436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/olimex/a13_olinuxino/genimage.cfg | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/board/olimex/a13_olinuxino/genimage.cfg b/board/olimex/a13_olinuxino/genimage.cfg
index 6f6b0b0bab..4eb14eb520 100644
--- a/board/olimex/a13_olinuxino/genimage.cfg
+++ b/board/olimex/a13_olinuxino/genimage.cfg
@@ -1,12 +1,13 @@
 image boot.vfat {
-        vfat {
-                files = {
-                        "zImage",
-                        "sun5i-a13-olinuxino.dtb",
-                        "boot.scr"
-                }
-        }
-        size = 64M
+	vfat {
+		files = {
+			"zImage",
+			"sun5i-a13-olinuxino.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 64M
 }
 
 image sdcard.img {
@@ -16,16 +17,15 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
-        partition boot {
-                partition-type = 0xC
-                bootable = "true"
-                image = "boot.vfat"
-        }
-
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
 
 	partition rootfs {
 		partition-type = 0x83
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
