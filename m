Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3823AC43334
	for <buildroot@archiver.kernel.org>; Fri,  1 Jul 2022 14:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B225540BB3;
	Fri,  1 Jul 2022 14:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B225540BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TACwsf2zcWhP; Fri,  1 Jul 2022 14:58:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D515F40B86;
	Fri,  1 Jul 2022 14:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D515F40B86
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A2D21BF59E
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 14:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EA7E4169E
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 14:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA7E4169E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTh_UK4ybUKd for <buildroot@lists.busybox.net>;
 Fri,  1 Jul 2022 14:58:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2445940301
 for <buildroot@buildroot.org>; Fri,  1 Jul 2022 14:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2445940301
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3ECF3877EE; Fri,  1 Jul 2022 14:45:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Jul 2022 16:27:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23e1e04d5448e17da7ec0a65199740ad1cf923a0
X-Git-Newrev: 0017c3daa8d10be79b93803cd9124e3ae9f875e5
X-Patchwork-Hint: ignore
Message-Id: <20220701144533.3ECF3877EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/kria/readme.txt: improve
 documentation for qspi programming
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

commit: https://git.buildroot.net/buildroot/commit/?id=0017c3daa8d10be79b93803cd9124e3ae9f875e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch improves the documentation for kria k26 som qspi programming.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Peter: drop trailing spaces]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/readme.txt | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index a3a4b5e65a..bea1430482 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -56,23 +56,39 @@ Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
 
-How to write the boot.bn to QSPI boot flash
-===========================================
+How to write boot.bin and u-boot.itb to QSPI boot flash
+=======================================================
 
 The Kria SOMs are preconfigured to boot initially from QSPI.
 This makes these boards different from other ZynqMP boards
-in that the boot.bin needs to be flashed into the QSPI boot
-flash such that the U-Boot SPL can then load all of the
-remaining images from the SD card.
+in that the boot.bin and u-boot.itb files need to be flashed
+into the QSPI boot flash such that U-Boot can then load all
+of the remaining images from the SD card.
 
 In addition, the KV260 Starter Kit QSPI comes pre-flashed with
 a utility designed to make updating the QSPI flash memory
 easier.
 
-Instructions for using these utilities to update the boot.bin
+Instructions for using these utilities to update the files
 in QSPI flash can be found on the wiki link below.
 
 https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM#Boot-Firmware-Updates
 
+Additionally, it is possible to use u-boot for updating the
+QSPI with new boot.bin and u-boot.itb images with the u-boot
+commands below:
+
+Flashing u-boot.itb:
+    $ sf probe
+    $ fatload mmc 1 0x1000000 u-boot.itb
+    $ sf erase 0xf80000 +$filesize
+    $ sf write 0x1000000 0xf80000 $filesize
+
+Flashing boot.bin:
+    $ sf probe
+    $ fatload mmc 1 0x1000000 boot.bin
+    $ sf erase 0x200000 +$filesize
+    $ sf write 0x1000000 0x200000 $filesize
+
 It is possible to boot the Buildroot generated SD card image without
 updating the QSPI boot.bin image, so this is an optional step.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
