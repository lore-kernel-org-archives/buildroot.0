Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3317C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8CBC60B79;
	Mon, 24 Jun 2024 20:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEYLVKuju8v9; Mon, 24 Jun 2024 20:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FD3460BA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FD3460BA7;
	Mon, 24 Jun 2024 20:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E86FD1BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615CC408E4
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43wSz_Dqs7c9 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C47D408E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C47D408E3
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC51C82B63; Mon, 24 Jun 2024 20:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:27:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8beda6f2210e19e2fd10ff16c1ffa49b4760df11
X-Git-Newrev: 462fe09bd19f5b085bf9b06268fe4b763addb4a7
X-Patchwork-Hint: ignore
Message-Id: <20240624200225.EC51C82B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-zero: make the
 patches to be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=462fe09bd19f5b085bf9b06268fe4b763addb4a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the Linux kernel patches to be applied with fuzz
factor 0. The fuzz factor specifies how many lines of the patch can be
inexactly matched, so the value 0 requires all lines to be exactly
matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...002-ARM-dts-orange-pi-zero-enable-spi-nor.patch | 41 ++++++++++++----------
 ...0003-ARM-dts-orange-pi-zero-enable-spidev.patch | 23 +++++++-----
 2 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
index ff0a1db223..ff350d68b4 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
@@ -1,4 +1,4 @@
-From 068c3baff3048a3db4ef2518ff917ce749cd8169 Mon Sep 17 00:00:00 2001
+From ddc295a04269437e5c726f63239689786354d44b Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Sat, 20 May 2017 11:24:26 +0300
 Subject: [PATCH] ARM: dts: orange-pi-zero: enable SPI NOR
@@ -9,34 +9,37 @@ For more information see:
 - http://linux-sunxi.org/Orange_Pi_Zero#SPI_NOR_flash
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
+ .../boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts    | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-index 4e1a9050c6b4..cdf19821b1f3 100644
+index 6b74cc923e16..4012f8712cd7 100644
 --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-@@ -161,3 +161,19 @@
- 	/* USB VBUS is always on */
- 	status = "okay";
- };
-+
-+&spi0 {
+@@ -167,14 +167,18 @@ &ohci1 {
+ 
+ &spi0 {
+ 	/* Disable SPI NOR by default: it optional on Orange Pi Zero boards */
+-	status = "disabled";
 +	status = "okay";
-+
-+	flash@0 {
-+		#address-cells = <1>;
-+		#size-cells = <1>;
+ 
+ 	flash@0 {
+ 		#address-cells = <1>;
+ 		#size-cells = <1>;
+-		compatible = "mxicy,mx25l1606e", "jedec,spi-nor";
 +		compatible = "mxicy,mx25l1606e", "winbond,w25q128";
-+		reg = <0>;
-+		spi-max-frequency = <40000000>;
+ 		reg = <0>;
+ 		spi-max-frequency = <40000000>;
 +
 +		partition@00000000 {
 +			reg = <0x00000000 0x200000>;	/* 2Mb */
 +		};
-+	};
-+};
+ 	};
+ };
+ 
 -- 
-2.11.0
+2.43.0
 
diff --git a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
index 04d43c344f..61dc97fd8b 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
@@ -1,4 +1,4 @@
-From 8dd1b2a696bb7e9914abd11cc6f5c0f54c33d626 Mon Sep 17 00:00:00 2001
+From 208b13119fc0f709935fc2fc13c0295b19edbbf5 Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Sat, 20 May 2017 15:36:51 +0300
 Subject: [PATCH] ARM: dts: orange-pi-zero: enable spidev
@@ -7,27 +7,28 @@ On orange-pi-zero board SPI1 pins are accessible via GPIO expansion port.
 This patch enables spidev driver for SPI1.
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 11 +++++++++++
+ .../dts/allwinner/sun8i-h2-plus-orangepi-zero.dts     | 11 +++++++++++
  1 file changed, 11 insertions(+)
 
 diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-index cdf19821b1f3..7242aaecb14f 100644
+index 4012f8712cd7..3552eb312747 100644
 --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-@@ -59,6 +59,7 @@
- 		serial0 = &uart0;
+@@ -59,6 +59,7 @@ aliases {
  		/* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
+ 		ethernet0 = &emac;
  		ethernet1 = &xr819;
 +		spi1 = &spi1;
  	};
  
  	chosen {
-@@ -177,3 +178,13 @@
- 		};
+@@ -182,6 +183,16 @@ partition@00000000 {
  	};
  };
-+
+ 
 +&spi1 {
 +	status = "okay";
 +
@@ -37,6 +38,10 @@ index cdf19821b1f3..7242aaecb14f 100644
 +		spi-max-frequency = <10000000>;
 +	};
 +};
++
+ &uart0 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&uart0_pa_pins>;
 -- 
-2.11.0
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
