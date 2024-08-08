Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFDDC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76629606A5;
	Thu,  8 Aug 2024 16:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OsWjBSd9nXF; Thu,  8 Aug 2024 16:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF7F60ABB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF7F60ABB;
	Thu,  8 Aug 2024 16:43:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 484661BF29F
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35DF960ABB
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jo3Mnp5aO52Y for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 16:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45063606A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45063606A5
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 16:43:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E39184768; Thu,  8 Aug 2024 16:43:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 18:43:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53116d091562fb260460382fa295738323decf3d
X-Git-Newrev: 250a3544bff016a0a69fa3847808f221dc54af0e
X-Patchwork-Hint: ignore
Message-Id: <20240808164334.2E39184768@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi: reword console comment
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
Content-Type: multipart/mixed; boundary="===============8732780163836742768=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8732780163836742768==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=250a3544bff016a0a69fa3847808f221dc54af0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Raspberry Pi with Bluetooth connectivity up to 4 (i.e. Zero W, Zero
2 W, 3, 4 and Compute Module 4) use the miniuart-bt overlay to restore
UART0 for the serial console (like the Raspberry Pi and Raspberry Pi 2
that have no Bluetooth); the Bluetooth uses the mini-UART instead[1][2].

This rewords the comment instead of enumerating every hardwares that can
be extended in the future.

[1]: https://www.raspberrypi.com/documentation/computers/configuration.html#uarts-and-device-tree
[2]: https://github.com/raspberrypi/linux/blob/rpi-6.6.y/arch/arm/boot/dts/overlays/miniuart-bt-overlay.dts#L4-L6

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/config_0w.txt          | 2 +-
 board/raspberrypi/config_3.txt           | 2 +-
 board/raspberrypi/config_3_64bit.txt     | 2 +-
 board/raspberrypi/config_3_qt5we.txt     | 2 +-
 board/raspberrypi/config_4.txt           | 2 +-
 board/raspberrypi/config_4_64bit.txt     | 2 +-
 board/raspberrypi/config_cm4io.txt       | 2 +-
 board/raspberrypi/config_cm4io_64bit.txt | 2 +-
 board/raspberrypi/config_zero2w.txt      | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/board/raspberrypi/config_0w.txt b/board/raspberrypi/config_0w.txt
index bc59d5fad2..123e09cf56 100644
--- a/board/raspberrypi/config_0w.txt
+++ b/board/raspberrypi/config_0w.txt
@@ -22,7 +22,7 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
 
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
diff --git a/board/raspberrypi/config_3.txt b/board/raspberrypi/config_3.txt
index bc59d5fad2..123e09cf56 100644
--- a/board/raspberrypi/config_3.txt
+++ b/board/raspberrypi/config_3.txt
@@ -22,7 +22,7 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
 
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
diff --git a/board/raspberrypi/config_3_64bit.txt b/board/raspberrypi/config_3_64bit.txt
index 6672871125..88206e9b14 100644
--- a/board/raspberrypi/config_3_64bit.txt
+++ b/board/raspberrypi/config_3_64bit.txt
@@ -22,7 +22,7 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
 
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
diff --git a/board/raspberrypi/config_3_qt5we.txt b/board/raspberrypi/config_3_qt5we.txt
index 752310b179..3d81a4e5da 100644
--- a/board/raspberrypi/config_3_qt5we.txt
+++ b/board/raspberrypi/config_3_qt5we.txt
@@ -22,5 +22,5 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=200
 
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
diff --git a/board/raspberrypi/config_4.txt b/board/raspberrypi/config_4.txt
index 74a7b270cd..9b77d23d74 100644
--- a/board/raspberrypi/config_4.txt
+++ b/board/raspberrypi/config_4.txt
@@ -22,7 +22,7 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
 
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
index a4ae327d2a..fcb1c5c30a 100644
--- a/board/raspberrypi/config_4_64bit.txt
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -22,7 +22,7 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
 
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
diff --git a/board/raspberrypi/config_cm4io.txt b/board/raspberrypi/config_cm4io.txt
index cf7e6df1a1..15751e7187 100644
--- a/board/raspberrypi/config_cm4io.txt
+++ b/board/raspberrypi/config_cm4io.txt
@@ -22,7 +22,7 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
 
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
 # enable RTC
diff --git a/board/raspberrypi/config_cm4io_64bit.txt b/board/raspberrypi/config_cm4io_64bit.txt
index 813f6eba7b..4884bda553 100644
--- a/board/raspberrypi/config_cm4io_64bit.txt
+++ b/board/raspberrypi/config_cm4io_64bit.txt
@@ -22,7 +22,7 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
 
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
 # enable RTC
diff --git a/board/raspberrypi/config_zero2w.txt b/board/raspberrypi/config_zero2w.txt
index 55095f64a7..123e09cf56 100644
--- a/board/raspberrypi/config_zero2w.txt
+++ b/board/raspberrypi/config_zero2w.txt
@@ -22,7 +22,7 @@ gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
 
-# fixes rpi (3B, 3B+, 3A+, 4B ,zero W and zero 2) ttyAMA0 serial console
+# Enable UART0 for serial console on ttyAMA0
 dtoverlay=miniuart-bt
 
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach

--===============8732780163836742768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8732780163836742768==--
