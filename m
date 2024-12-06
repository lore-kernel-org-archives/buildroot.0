Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F234DE77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4360F613A8;
	Fri,  6 Dec 2024 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05YveaFViadn; Fri,  6 Dec 2024 19:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D29C6136F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D29C6136F;
	Fri,  6 Dec 2024 19:54:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1560BED7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6FB561314
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ooc_CFYocxHD for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 19:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60F5660618
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60F5660618
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:54:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B67686A73; Fri,  6 Dec 2024 19:54:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 20:48:59 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 02e27152e636eabffeb9859aa69c876e1942d082
X-Git-Newrev: 8472776a87fbcd31b496b17a4ba75836caec8709
X-Patchwork-Hint: ignore
Message-Id: <20241206195421.4B67686A73@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 board/zynqmp/kria/readme.txt: add usb start
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

commit: https://git.buildroot.net/buildroot/commit/?id=8472776a87fbcd31b496b17a4ba75836caec8709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

When halting the boot process in u-boot, the 'usb start' command does not
automatically run.  Since the SD card is connected over a USB to SD card
bridge on the kd240 and kr260 boards, the readme.txt instructions should
document that the 'usb start' command needs to be manually enterred when
following the reflashing instructions.  Otherwise, the command to read the
boot.bin and u-boot.itb files from the SD card will fail.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e02e59d124647af71b30eb224a78b53e77db61f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/readme.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index ca3164383a..7d3a520fde 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -101,12 +101,14 @@ Flashing boot.bin:
 
 KD240 / KR260 Flashing Instructions:
 Flashing u-boot.itb:
+    $ usb start
     $ sf probe
     $ fatload usb 0 0x1000000 u-boot.itb
     $ sf erase 0x280000 +$filesize
     $ sf write 0x1000000 0x280000 $filesize
 
 Flashing boot.bin:
+    $ usb start
     $ sf probe
     $ fatload usb 0 0x1000000 boot.bin
     $ sf erase 0x200000 +$filesize
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
