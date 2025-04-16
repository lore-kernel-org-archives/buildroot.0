Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0389C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E487046A;
	Mon, 19 May 2025 10:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9E16w7p2G6E9; Mon, 19 May 2025 10:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1DFC7046B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1DFC7046B;
	Mon, 19 May 2025 10:51:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0564CE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4D4B417DE
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9ogxDFgTmto for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31BA341173
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31BA341173
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3017E83B63; Mon, 19 May 2025 10:39:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 21:14:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a642bed09afdfce42a7063e38c2e10beddbed5ef
X-Git-Newrev: 7ebcfe3cb99ba536b5dcce7704956aeb11b6a57b
X-Patchwork-Hint: ignore
Message-Id: <20250519103951.3017E83B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/raspberrypi/readme.txt:
 add videocore note
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
Content-Type: multipart/mixed; boundary="===============3899587930470851667=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3899587930470851667==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7ebcfe3cb99ba536b5dcce7704956aeb11b6a57b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============3899587930470851667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3899587930470851667==--
