Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448BDC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE8CB60FBA;
	Wed,  1 Feb 2023 22:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE8CB60FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECE9kvIeUFgI; Wed,  1 Feb 2023 22:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06CBC60F9B;
	Wed,  1 Feb 2023 22:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06CBC60F9B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E95DC1BF47F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7FD041817
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7FD041817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zj8RlzfPDtkq for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:32:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10AB0417BF
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10AB0417BF
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:32:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NLekpeh5dvodANLelpwuvl; Wed, 01 Feb 2023 23:32:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 23:32:35 +0100
Message-Id: <20230201223241.3867678-2-giulio.benetti@benettiengineering.com>
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
 t=1675290763; bh=xfb+/2eUswtLHOiWJmQbv/zj4peLcHwkQfd7HLjRk9c=;
 h=From:To:Subject:Date:MIME-Version;
 b=ei7Dyf8NxMrqN4+f59t1zCobuDi/IXcfGXrl6K9g1fQycln/Kn4nkfOvOd3uN02B1
 02hyWRRZqeCT6wM691JIwiz4yZy9STXtrwmf+TRSsvCmHvbZePjAy8q/enM56Rex5U
 q9mHYe1lIXTbNEM1n+US5zeX1kALC3Fo7HWMbJ9Suw5GCYljjJA3e28M9GkvN/P8k0
 F4gPYZFgDw+X3ce85HkRRC4UlKR1nCwqppxcJQFn7sdWmBTayNFjnp7bJRpxn6OTFv
 u+yQdZyk65cPqDQ9LWjMVFKI9OJy2NOfeoc1/N4u7FR9H+0ur1dtRUI6BKV+NRbCJr
 LlpXR4vJ+Mt7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ei7Dyf8N
Subject: [Buildroot] [PATCH 1/7]
 configs/olimex_a10_olinuxino_lime_defconfig: bump Linux to 6.1.9 and U-Boot
 to 2023.01
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
 configs/olimex_a10_olinuxino_lime_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index d0e00301f7..9c454b1915 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a10-olinuxino"
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a10_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -33,7 +33,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A10-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
