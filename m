Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38237C636D4
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA8D4198C;
	Wed,  1 Feb 2023 22:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA8D4198C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SsLjCc05lAg; Wed,  1 Feb 2023 22:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B3441973;
	Wed,  1 Feb 2023 22:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B3441973
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9E931BF95C
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF188418F5
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF188418F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6WQ6JKc31Qc for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:32:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9AC8417E3
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9AC8417E3
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:32:45 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NLekpeh5dvodANLempwuwT; Wed, 01 Feb 2023 23:32:44 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 23:32:40 +0100
Message-Id: <20230201223241.3867678-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
References: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHx0opEOFD0m8Wd5y0YKymLKMxwAcVQVwUmah0myaD/0L/m+lziVFSt8tTKC1CnAFuZotZWgNTvHjRVKcJQXTkD2CNP1w80/rghyFAcoVxOh6kjynPPJ
 WJGf8htjbp3u4AVmDAQpnz4EzXWwD4Jiwq9B9cz5Vbt8rIB2vWHJG52WVrE+t9U7w+mU75jmgPNBPcDxICaFacSgC9Prpi4YaSH41COfdOYvWaPX6IIlaz52
 THG7mnXdXxFubkanPIGEOTKSQL5p1SsapRQpAWpIFSA79STn0AuS23fG0HcK2T0RLCJXfb+xIUzwYaUu9Ppdvzyw/6ZzkJ6nJC6q23Z+oeRN59fB8/fGQdEJ
 IWUMyriOMWoiSjNCdHfnKvFqdoYtEeIv8SkhLePBWe0S1iSNeWTSoLrcHImb8FVG8NbuSS1AYM9yl7w+sbbHZe02pPevPA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675290764; bh=T6u+YoW3IQ25uxQeXNMPr8HFBFP6XIbLFL2S50Ww5Yw=;
 h=From:To:Subject:Date:MIME-Version;
 b=WgQjXtiHRFUtfSQng4kO4liTc41XF52oLu4K9ZI7d4YYCmKtg8NboPhjlFetS7Il8
 gzdAipUoJh/WKCxsYVl9xcZA9LsaPy3gA3vB/XUOPLzXoSv51HVUtNT/ZPGtGP7pkY
 3BdATxdrvFG5XGRPDgLC4EJFEUAm/8kgs+mIk604gqBJ52Jzai7MOpOzfXEU1TTqrM
 rlPzTe6HRDhioJf84Z/ElOZqEwpSHSm+YBAarvBWFzFErjxLIVfVHqzK+h+YebIB9N
 QwsfaXgv064I0IAksk8QM/mycx6qN+/azkJ/X6ISq7AQhBT2zAN4pxC0lMSRQviHih
 IE+i5cuCpm6Tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WgQjXtiH
Subject: [Buildroot] [PATCH 6/7] configs/olimex_a33_olinuxino_defconfig:
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
 configs/olimex_a33_olinuxino_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
index cdbc63efe1..35398ac6da 100644
--- a/configs/olimex_a33_olinuxino_defconfig
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="A33-olinuxino"
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A33-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -31,7 +31,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a33_olinuxino/boot
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
