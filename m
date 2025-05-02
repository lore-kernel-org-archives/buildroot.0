Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259EBC3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DF6423EE;
	Fri,  2 May 2025 11:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsOJStIevw44; Fri,  2 May 2025 11:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C71417C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C71417C0;
	Fri,  2 May 2025 11:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 171EB22A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 570A7418BE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEolGJzTXDeA for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BE841995
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3BE841995
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1C3A860E9; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:11:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 70efaef76bc5bf76ef08280f28ba241dd1811f4c
X-Git-Newrev: 1011e3a3d31a20aa44dcd8b5c257659e7e336b7e
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.D1C3A860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/raspberrypi/readme.txt: reword overlays note
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0880791373906061445=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0880791373906061445==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1011e3a3d31a20aa44dcd8b5c257659e7e336b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Any Raspberry Pi may use device-tree overlays; it is not restricted to
Raspberry Pi 3 and 4.

The defconfigs for the Raspberry Pi 3, 4, 400, Zero W, Zero 2 W, Compute
Module 4 and 4s use the miniuart-bt dtoverlay to switch the Bluetooth to
the mini-UART (ttyS0) and restore UART0 (ttyAMA0) over GPIOs 14 and 15
to enable the serial console (like the Raspberry Pi 1 and 2 that have no
Bluetooth)[1][2].

As a consequence, the Raspberry Pi Zero W, Zero 2 W, 400, Compute Module
4 and 4s install the device-tree overlays as well.

This rewords the note by adding the three missing hardwares installing
the images/rpi-firmware/overlays directory. It rewords the miniuart note
at the same time.

[1]: https://www.raspberrypi.com/documentation/computers/configuration.html#uarts-and-device-tree
[2]: https://github.com/raspberrypi/linux/blob/rpi-6.6.y/arch/arm/boot/dts/overlays/miniuart-bt-overlay.dts#L4-L6

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a642bed09afdfce42a7063e38c2e10beddbed5ef)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/raspberrypi/readme.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 5f6b1c3e7d..0f3ec9d8bb 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -131,10 +131,11 @@ After building, you should obtain this tree:
     Pi 4, 400, 5 and the Compute Module 4, 4s and 5 load the second stage
     bootloader from a SPI flash EEPROM.
 
-[3] Only for the Raspberry Pi 3/4 Models (overlay miniuart-bt is needed
-    to enable the RPi3 serial console otherwise occupied by the bluetooth
-    chip). Alternative would be to disable the serial console in cmdline.txt
-    and /etc/inittab.
+[3] Only for the Raspberry Pi installing device-tree overlays. The Raspberry Pi
+    with Bluetooth connectivity (Zero W, Zero 2 W, 3, 4, 400, Compute Module 4
+    and 4s) use the miniuart-bt overlay to enable UART0 for the serial console;
+    the Bluetooth uses the mini-UART instead. Alternative would be to disable
+    the serial console in cmdline.txt and /etc/inittab.
 
 How to write the SD card
 ========================

--===============0880791373906061445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0880791373906061445==--
