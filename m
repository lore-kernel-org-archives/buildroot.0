Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910F5C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF7DB81E53;
	Wed,  1 Feb 2023 22:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7DB81E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFEGMUTMk2kn; Wed,  1 Feb 2023 22:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF1F981E76;
	Wed,  1 Feb 2023 22:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF1F981E76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D810A1BF47F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA09381E75
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA09381E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nogQjtnUreI for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:32:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 102C981E53
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp1.osuosl.org (Postfix) with ESMTP id 102C981E53
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:32:45 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NLekpeh5dvodANLelpwuvr; Wed, 01 Feb 2023 23:32:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 23:32:36 +0100
Message-Id: <20230201223241.3867678-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
References: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEJ0J9xZUaLGPDnIovPeTsk0HLGmCMDpguqb6+whaO/RfbqotOuOzRZAQOYI6SujK9GsOXTdA2XwkRMtDOVsYQZNKjhYFi01cATBZMSjTZl/8ES/OIsl
 tn+43YN2Ysqinl05PIgjL4+XwoQ8ozjkXYrKkvF2oC30c/dn4/BC0sdExX58LckW61IbYANixEN58FjoFtpSRZsQP8V+y0GgiNCD/gEfxTH7yf6ZIeXw/UkB
 TfOMDsdx3UHV0/T/Vldwv0pWiexnjOQVHU374o88vZT4KyGVBrOe0ASsXUa7GDOxaYVERTzeQPCCKGWrugAkFz6WECGth9UK88cNirgxnZvFW0AvMUmGO1pk
 +7qMvxOUcuf9Qwn+IEoC1KnnEOZqi7YNvea052ymuQTcmvOWkBZduwIeakLJJiszj/bhqeYLuTYm2U6OIvN0whUY/+36wQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675290763; bh=/mYiP75F4KlYeI2iK/QA5n9H58fiKTwXtJwuS+PlTl8=;
 h=From:To:Subject:Date:MIME-Version;
 b=PnAlXh/zR72MGUQzMZkAq82Wio6pTet7eRV2r0P3dcJpO8hGfxPZ1uGNVh5Pr649N
 80vBbOpAKg1+//6ezhpxakv8xyk521HBWJdWKArgaWp0fPMGOXnbvAKJuwHv7k3Y4h
 FaaA4ISPe+OwEEUl9dcG86WuXXSAnH11CH6uSXYoa920Ebx0211q91NRKKSLzGRKBI
 ShnFEE4xI3EaejU8w0g7JsRUu86omw2s/o8s9ILWlMXDP1r749fGuOy5sCLmplUVdb
 7dSyw3+IC7DQDW9xPHek4R3MBFOth9IFTca1+e45ck3CxSNXdz7m6Llg/hmTwZqeSj
 /qzaIDEsXkYVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PnAlXh/z
Subject: [Buildroot] [PATCH 2/7] configs/olimex_a13_olinuxino_defconfig:
 bump Linux to 6.1.9 and U-Boot to 2023.01
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a13_olinuxino_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
index 6d25d7d0a1..8469ce1fd0 100644
--- a/configs/olimex_a13_olinuxino_defconfig
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a13-olinuxino"
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A13-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
