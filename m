Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60EEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:18:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB5E61361
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CB5E61361
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 785B280EBA;
	Mon,  8 Nov 2021 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PLsb-BgI1CF; Mon,  8 Nov 2021 22:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D106C80C80;
	Mon,  8 Nov 2021 22:18:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8CF1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7671401C0
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNHZFPJGKYZN for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE18E402EF
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7786C8B711; Mon,  8 Nov 2021 22:02:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b55e3434c3b1d8c63e471f577027ed4a99b8c7d7
X-Git-Newrev: 1de0e582dda288377c81128cd1337d4149ca87b3
X-Patchwork-Hint: ignore
Message-Id: <20211108220212.7786C8B711@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/roseapplepi/genimage.cfg: beautify
 file
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

commit: https://git.buildroot.net/buildroot/commit/?id=1de0e582dda288377c81128cd1337d4149ca87b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/roseapplepi/genimage.cfg | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/board/roseapplepi/genimage.cfg b/board/roseapplepi/genimage.cfg
index f4a353e823..f1bceb0ede 100644
--- a/board/roseapplepi/genimage.cfg
+++ b/board/roseapplepi/genimage.cfg
@@ -3,13 +3,15 @@
 image boot.vfat {
 	vfat {
 		files = {
-		     "uEnv.txt",
-		     "uImage"
+			"uEnv.txt",
+			"uImage"
 		}
+
 		file kernel.dtb {
-		     image = "owl-s500-roseapplepi.dtb"
+			image = "owl-s500-roseapplepi.dtb"
 		}
 	}
+
 	size = 128M
 }
 
@@ -20,13 +22,13 @@ image sdcard.img {
 	partition s500-bootloader {
 		in-partition-table = "no"
 		image = "s500-bootloader.bin"
-		offset = 0x200200
+		offset = 0x200200 # 2MB + 512B
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-dtb.img"
-		offset = 0x300000
+		offset = 3M
 	}
 
 	partition boot {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
