Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA89C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F70F7042F;
	Mon, 19 May 2025 10:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5a31J5dyhBP; Mon, 19 May 2025 10:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C54467041E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C54467041E;
	Mon, 19 May 2025 10:51:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0844FD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FFC641764
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 400PPh0iCIgy for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FA6F40DB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FA6F40DB3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E33081517; Mon, 19 May 2025 10:39:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 21:14:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 28851289475c4475ab2de9abcf062095e42731b8
X-Git-Newrev: c7ea55f040b6d74314961e433c3879ef1ac61748
X-Patchwork-Hint: ignore
Message-Id: <20250519103951.1E33081517@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/raspberrypi/readme.txt:
 add note for bootcode.bin
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
Content-Type: multipart/mixed; boundary="===============7660850717754822078=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7660850717754822078==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c7ea55f040b6d74314961e433c3879ef1ac61748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The second-stage bootloader is contained in the onboard EEPROM[1] since
the Raspberry Pi 4 (i.e. for pi4, pi400, cm4, cm4s and pi5).

Therefore, the file bootcode.bin[2] is needed for the former Raspberry
Pi only (i.e. pi1, pi2, pi3, pi0, pi0w and pizero2w).

This adds a note precising the file bootcode.bin is present for the
former versions of the Raspberry Pi.

[1]: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#raspberry-pi-boot-eeprom
[2]: https://www.raspberrypi.com/documentation/computers/configuration.html#bootcode-bin

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/raspberrypi/readme.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 64f0e2a26f..5f6b1c3e7d 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -112,14 +112,14 @@ After building, you should obtain this tree:
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
-    |   +-- bootcode.bin
+    |   +-- bootcode.bin            [2]
     |   +-- cmdline.txt
     |   +-- config.txt
     |   +-- fixup.dat               [1]
     |   +-- fixup4.dat              [1]
     |   +-- start.elf               [1]
     |   +-- start4.elf              [1]
-    |   `-- overlays/               [2]
+    |   `-- overlays/               [3]
     +-- sdcard.img
     +-- Image                       [1]
     `-- zImage                      [1]
@@ -127,7 +127,11 @@ After building, you should obtain this tree:
 [1] Not all of them will be present, depending on the RaspberryPi
     model you are using.
 
-[2] Only for the Raspberry Pi 3/4 Models (overlay miniuart-bt is needed
+[2] Only for the Raspberry Pi 1, 2, 3, Zero, Zero W and Zero 2 W. The Raspberry
+    Pi 4, 400, 5 and the Compute Module 4, 4s and 5 load the second stage
+    bootloader from a SPI flash EEPROM.
+
+[3] Only for the Raspberry Pi 3/4 Models (overlay miniuart-bt is needed
     to enable the RPi3 serial console otherwise occupied by the bluetooth
     chip). Alternative would be to disable the serial console in cmdline.txt
     and /etc/inittab.

--===============7660850717754822078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7660850717754822078==--
