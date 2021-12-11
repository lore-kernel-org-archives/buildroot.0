Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01001C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 10:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC8F61CA0;
	Sat, 11 Dec 2021 10:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JOyAVPYRO7p; Sat, 11 Dec 2021 10:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E897A61CC4;
	Sat, 11 Dec 2021 10:02:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2011BF963
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 880A242367
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgg3m42rnrcu for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 10:02:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B6A742364
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:02:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5562B8277B; Sat, 11 Dec 2021 09:56:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 10:59:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba50ccf9a310636b555dc05924e59486b71eba27
X-Git-Newrev: c4b305bd818fb0151247dd5368c3221cba97dd97
X-Patchwork-Hint: ignore
Message-Id: <20211211095654.5562B8277B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-zero: enable uart
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4b305bd818fb0151247dd5368c3221cba97dd97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable uart1 and uart2 on orange-pi-zero board.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0004-ARM-dts-orange-pi-zero-enable-uart.patch  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
new file mode 100644
index 0000000000..839bc16087
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
@@ -0,0 +1,35 @@
+From e8768cc1f0f1231cbd4864417de629330e21222d Mon Sep 17 00:00:00 2001
+From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
+Date: Sun, 21 Nov 2021 00:58:32 +0300
+Subject: [PATCH] ARM: dts: orange-pi-zero: enable uart
+
+Enable uart1 and uart2 on orange-pi-zero board.
+
+Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
+---
+ arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+index f19ed981da9d..03acf166ab70 100644
+--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+@@ -184,13 +184,13 @@ &uart0 {
+ &uart1 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&uart1_pins>;
+-	status = "disabled";
++	status = "okay";
+ };
+ 
+ &uart2 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&uart2_pins>;
+-	status = "disabled";
++	status = "okay";
+ };
+ 
+ &usb_otg {
+-- 
+2.32.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
