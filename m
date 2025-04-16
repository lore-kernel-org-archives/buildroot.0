Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC71C369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8DE82EAD;
	Wed, 16 Apr 2025 19:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0NafnlMuZmU; Wed, 16 Apr 2025 19:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 592B9810B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 592B9810B8;
	Wed, 16 Apr 2025 19:20:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18BC8E83
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3291413BE
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-E93LSTDJb7 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8F441380
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C8F441380
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3460584F7A; Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 21:14:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a642bed09afdfce42a7063e38c2e10beddbed5ef
X-Git-Newrev: 7ebcfe3cb99ba536b5dcce7704956aeb11b6a57b
X-Patchwork-Hint: ignore
Message-Id: <20250416192009.3460584F7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi/readme.txt: add
 videocore note
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============1134194955757162314=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1134194955757162314==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7ebcfe3cb99ba536b5dcce7704956aeb11b6a57b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The VideoCore blobs for the Raspberry Pi 1, 2, 3, Zero, Zero W and Zero
2 W are differents from the ones for the Raspberry Pi 4 and the Compute
Module 4.

The VideoCore blobs for the Raspberry Pi 4 are named with a 4[1] (i.e.
start4.elf, start4x.elf, start4db.elf and start4cd.elf).

This precises which VideoCore firmware blob files are present on the
Raspberry Pi 1, 2, 3, Zero W, Zero 2 W and which files are present on
the the Rapsberry Pi 4 and the Compute Module 4.

Note: The VideoCore blobs for the Raspberry Pi 5 are self-contained in
its bootloader EEPROM[1][2]; there is no additional files for pi5.

[1]: https://www.raspberrypi.com/documentation/computers/configuration.html#start-elf
[2]: https://www.raspberrypi.com/documentation/computers/config_txt.html#start_file-fixup_file

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/raspberrypi/readme.txt | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 0f3ec9d8bb..c12a8969f1 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -115,11 +115,11 @@ After building, you should obtain this tree:
     |   +-- bootcode.bin            [2]
     |   +-- cmdline.txt
     |   +-- config.txt
-    |   +-- fixup.dat               [1]
-    |   +-- fixup4.dat              [1]
-    |   +-- start.elf               [1]
-    |   +-- start4.elf              [1]
-    |   `-- overlays/               [3]
+    |   +-- fixup.dat               [3]
+    |   +-- fixup4.dat              [4]
+    |   +-- start.elf               [3]
+    |   +-- start4.elf              [4]
+    |   `-- overlays/               [5]
     +-- sdcard.img
     +-- Image                       [1]
     `-- zImage                      [1]
@@ -131,7 +131,11 @@ After building, you should obtain this tree:
     Pi 4, 400, 5 and the Compute Module 4, 4s and 5 load the second stage
     bootloader from a SPI flash EEPROM.
 
-[3] Only for the Raspberry Pi installing device-tree overlays. The Raspberry Pi
+[3] Only for the Raspberry Pi 1, 2, 3, Zero and Zero 2.
+
+[4] Only for the Raspberry Pi 4, 400, Compute Module 4 and 4s.
+
+[5] Only for the Raspberry Pi installing device-tree overlays. The Raspberry Pi
     with Bluetooth connectivity (Zero W, Zero 2 W, 3, 4, 400, Compute Module 4
     and 4s) use the miniuart-bt overlay to enable UART0 for the serial console;
     the Bluetooth uses the mini-UART instead. Alternative would be to disable

--===============1134194955757162314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1134194955757162314==--
