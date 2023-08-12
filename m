Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3909AEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 21:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A908840499;
	Sun, 13 Aug 2023 21:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A908840499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rN5NAxf1cfAa; Sun, 13 Aug 2023 21:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EB5640488;
	Sun, 13 Aug 2023 21:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EB5640488
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3241BF869
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 21:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6307A40488
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 21:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6307A40488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZM8Kgj8-RGfu for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 21:55:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58132401AD
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 21:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58132401AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 466DA85CA0; Sun, 13 Aug 2023 21:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 23:12:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 595939e31fa936d1c969329746d03af02c46da5f
X-Git-Newrev: 4bb810fc5d2e8735b1a51a921c4c2d960b3c8c32
X-Patchwork-Hint: ignore
Message-Id: <20230813215513.466DA85CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/sifive/hifive-unleashed:
 include QEMU instructions in readme.txt
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4bb810fc5d2e8735b1a51a921c4c2d960b3c8c32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The upstream QEMU 'sifive_u' machine supports running upstream U-Boot
for the SiFive HiFive Unleashed board out of the box.

Add the QEMU instructions for testing in readme.txt.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/sifive/hifive-unleashed/readme.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
index 3263913e9c..e9ccb26fa6 100644
--- a/board/sifive/hifive-unleashed/readme.txt
+++ b/board/sifive/hifive-unleashed/readme.txt
@@ -113,3 +113,20 @@ Booting the SPI flash on the board
 
 Make sure that the all DIP switches are set to the off position for
 default boot mode (MSEL mode = 0110) to boot from SPI flash.
+
+Testing under QEMU
+==================
+
+The SD card image can be tested using QEMU:
+
+$ qemu-system-riscv64 -M sifive_u,msel=11 -smp 5 -m 8G \
+    -display none -serial stdio -nic user \
+    -bios output/images/u-boot-spl.bin \
+    -drive file=output/images/sdcard.img,if=sd
+
+The SPI flash image can be tested with a slightly different command:
+
+$ qemu-system-riscv64 -M sifive_u,msel=6 -smp 5 -m 8G \
+    -display none -serial stdio -nic user \
+    -bios output/images/u-boot-spl.bin \
+    -drive file=output/images/spi-nor.img,if=mtd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
