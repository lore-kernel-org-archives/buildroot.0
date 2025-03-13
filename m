Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D52C28B28
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 09:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C313A60AB7;
	Thu, 13 Mar 2025 09:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oF7rVyUf1jxw; Thu, 13 Mar 2025 09:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C760760E1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C760760E1D;
	Thu, 13 Mar 2025 09:45:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24620EA
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 09:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08A2260AB7
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 09:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUlvfJZXhClZ for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 09:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B02C608F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B02C608F4
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 09:45:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3135087F67; Thu, 13 Mar 2025 09:45:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 10:42:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dac8e9b30399ecf15fb0cb07e67e6e6a32fb8dec
X-Git-Newrev: ac300757f612e5153b767ae37cffaedfb386e789
X-Patchwork-Hint: ignore
Message-Id: <20250313094525.3135087F67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32mp135f-dk:
 fix boot steps in readme
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
Content-Type: multipart/mixed; boundary="===============8839037818975939233=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8839037818975939233==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ac300757f612e5153b767ae37cffaedfb386e789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The instructions in the readme use incorrect connector names.

See also the official devkit documentation:
https://wiki.st.com/stm32mpu/wiki/Getting_started/STM32MP1_boards/STM32MP135x-DK/Let%27s_start/Unpack_the_STM32MP135x-DK_board#Out-of-the-box_kit

Also the board does not show the console on the screen.

This may have been a copy & paste oversight from the STM32MP157 readme.

Signed-off-by: Gero Schwäricke <gero.schwaericke@sevenlab.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/stmicroelectronics/stm32mp135f-dk/readme.txt | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp135f-dk/readme.txt b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
index 46879f88cf..44472840b3 100644
--- a/board/stmicroelectronics/stm32mp135f-dk/readme.txt
+++ b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
@@ -27,12 +27,11 @@ Copy the bootable "sdcard.img" onto an microSD card with "dd":
 Boot the board
 ==============
 
- (1) Insert the microSD card in connector CN15
+ (1) Insert the microSD card in connector CN3
 
- (2) Plug a micro-USB cable in connector CN11 and run your serial
+ (2) Plug a micro-USB cable in connector CN10 and run your serial
      communication program on /dev/ttyACM0.
 
- (3) Plug a USB-C cable in CN6 to power-up the board.
+ (3) Plug a USB-C cable in CN12 to power-up the board.
 
- (4) The system will start, with the console on UART, but also visible
-     on the screen.
+ (4) The system will start, with the console on UART.

--===============8839037818975939233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8839037818975939233==--
