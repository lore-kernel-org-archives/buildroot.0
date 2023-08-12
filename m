Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1451EC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97692822D2;
	Thu,  7 Sep 2023 15:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97692822D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PstzTZPuuUgj; Thu,  7 Sep 2023 15:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE7C9822A8;
	Thu,  7 Sep 2023 15:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE7C9822A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 564FA1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ECAB6128C
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ECAB6128C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_tW53Fv_JuN for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FFFE6125F
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FFFE6125F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9007186A22; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 23:12:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 595939e31fa936d1c969329746d03af02c46da5f
X-Git-Newrev: 4bb810fc5d2e8735b1a51a921c4c2d960b3c8c32
X-Patchwork-Hint: ignore
Message-Id: <20230907145129.9007186A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/sifive/hifive-unleashed: include
 QEMU instructions in readme.txt
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
