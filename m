Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBB6C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EFBC6FBD7;
	Fri, 28 Feb 2025 16:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJt8wJ2QpHmF; Fri, 28 Feb 2025 16:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9B636FBDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9B636FBDA;
	Fri, 28 Feb 2025 16:32:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D8D11DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37C7841883
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ta6UY_4J3MeU for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F0F941809
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F0F941809
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33439874A0; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Dec 2024 21:08:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e67568cedaea309a2d94574d7cb75bca72951b46
X-Git-Newrev: e02e59d124647af71b30eb224a78b53e77db61f5
X-Patchwork-Hint: ignore
Message-Id: <20250228162931.33439874A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/zynqmp/kria/readme.txt:
 add usb start
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

commit: https://git.buildroot.net/buildroot/commit/?id=e02e59d124647af71b30eb224a78b53e77db61f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When halting the boot process in u-boot, the 'usb start' command does not
automatically run.  Since the SD card is connected over a USB to SD card
bridge on the kd240 and kr260 boards, the readme.txt instructions should
document that the 'usb start' command needs to be manually enterred when
following the reflashing instructions.  Otherwise, the command to read the
boot.bin and u-boot.itb files from the SD card will fail.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
