Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A595E63CA4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 20:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E00DB60712;
	Sun, 25 Jan 2026 20:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cWg1vx9snGl; Sun, 25 Jan 2026 20:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 246C160880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769374544;
	bh=HOy6vXVn2HHdidZZz8vDnu9QwG3bw7/LrCNPnn4HLSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pgW+ttwXvCH3dlGWaNZpOV7dTBUkhFiNtKyzUqLQ/9baq6Qdc9kEM7lAvavXjrmjI
	 HXC2vWboyF3wcDK+/5LUSCNXSntDXuokqOOpUlwgMA5DVlsA8PXF472d6jhvC9eP2B
	 AeMEzh47nXFOfC5kuDNlORrEnIp+nbIqR8SjYiTZ6O7dwa/gPCGXa1NW71Z3bFnB/0
	 SNO/WAP2RER4xoY0ztBTouZmnZEupKypY+87MmFqgBa17HC9Yvd4yV112u1XhDRYzS
	 GTufjALLFkpv9+pRq8bc/LsxNEiM8Qja2HLXtBLsA2DU5/bGxHdQ/buxJhjFZobRc/
	 lWtcRCHJIQ/5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 246C160880;
	Sun, 25 Jan 2026 20:55:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3123C35C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1557140391
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id He3ZPoZEGjTr for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 20:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53B7540379
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53B7540379
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:55:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38F5187667; Sun, 25 Jan 2026 20:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:54:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd10beb0e8cef0ab3e1c199085751dc732d8d043
X-Git-Newrev: 7cedf74c1759394bb0cd8381c605664c8c20eb4f
X-Patchwork-Hint: ignore
Message-Id: <20260125205541.38F5187667@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32f769-disco:
 fix typo in readme.txt
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7cedf74c1759394bb0cd8381c605664c8c20eb4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a missing space in the "Creating SD card" section of the
documentation.

Fixes: 1a1239fd286ec5602e6ea29a1799e26b6254202f ("configs/stm32f769_disco_sd_defconfig: new defconfig")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f769-disco/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/readme.txt b/board/stmicroelectronics/stm32f769-disco/readme.txt
index 8f4f79a861..5b8fba7099 100644
--- a/board/stmicroelectronics/stm32f769-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f769-disco/readme.txt
@@ -20,7 +20,7 @@ It will flash the U-boot bootloader.
 Creating SD card
 ----------------
 
-Buildroot prepares an"sdcard.img" image in the output/images/ directory,
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
 ready to be dumped on a SD card. Launch the following command as root:
 
   dd if=output/images/sdcard.img of=/dev/<your-sd-device>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
