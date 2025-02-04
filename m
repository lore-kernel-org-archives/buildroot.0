Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09923C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C1A540293;
	Fri, 28 Feb 2025 17:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwnCKfaKgSMh; Fri, 28 Feb 2025 17:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93514F108
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D93514F108;
	Fri, 28 Feb 2025 17:11:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFFD1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E80194143A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFyHp6b5T-9f for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2761641992
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2761641992
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CEF080042; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 14:25:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3b4038e3d70375cd4b16d790fb90508b4f902f99
X-Git-Newrev: ddc348d46f6f990a1feb5e806d9bd71d8fb99d35
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.1CEF080042@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/zynqmp/kria: update
 readme.txt with info about qspi.bin
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ddc348d46f6f990a1feb5e806d9bd71d8fb99d35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch updates the documentation for Kria SOMs for reflashing
the new qspi.bin binary file.

The qspi.bin is a unified binary containing both the boot.bin and
u-boot.itb files for simplifying the reflashing process and also
enabling the BIRT for reflashing the qspi.bin image as either
"ImageA" or "ImageB".

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/readme.txt | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index 7d3a520fde..6fd7ca61ca 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -42,6 +42,7 @@ After building, you should get a tree like this:
     +-- boot.bin
     +-- boot.vfat
     +-- Image
+    +-- qspi.bin
     +-- rootfs.ext2
     +-- rootfs.ext4 -> rootfs.ext2
     +-- sdcard.img
@@ -80,39 +81,28 @@ easier.
 Instructions for using these utilities to update the files
 in QSPI flash can be found on the wiki link below.
 
-https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM#Boot-Firmware-Updates
+Please note that since the BIRT utility requires a single file
+for flashing, the qspi.bin should be used as either ImageA or
+ImageB.  The qspi.bin is a unified binary containing both the
+boot.bin and u-boot.itb files in a single binary.
+
+https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process
 
 Additionally, it is possible to use u-boot for updating the
-QSPI with new boot.bin and u-boot.itb images with the u-boot
-commands below.
+QSPI with new qspi.bin image with the u-boot commands below.
 
 KV260 Flashing Instructions:
-Flashing u-boot.itb:
-    $ sf probe
-    $ fatload mmc 1 0x1000000 u-boot.itb
-    $ sf erase 0x280000 +$filesize
-    $ sf write 0x1000000 0x280000 $filesize
-
-Flashing boot.bin:
     $ sf probe
-    $ fatload mmc 1 0x1000000 boot.bin
+    $ fatload mmc 1 0x1000000 qspi.bin
     $ sf erase 0x200000 +$filesize
     $ sf write 0x1000000 0x200000 $filesize
 
 KD240 / KR260 Flashing Instructions:
-Flashing u-boot.itb:
-    $ usb start
-    $ sf probe
-    $ fatload usb 0 0x1000000 u-boot.itb
-    $ sf erase 0x280000 +$filesize
-    $ sf write 0x1000000 0x280000 $filesize
-
-Flashing boot.bin:
     $ usb start
     $ sf probe
-    $ fatload usb 0 0x1000000 boot.bin
+    $ fatload usb 0 0x1000000 qspi.bin
     $ sf erase 0x200000 +$filesize
     $ sf write 0x1000000 0x200000 $filesize
 
 It is possible to boot the Buildroot generated SD card image without
-updating the QSPI boot.bin image, so this is an optional step.
+updating the QSPI qspi.bin image, so this is an optional step.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
