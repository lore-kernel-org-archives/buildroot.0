Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC26C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 14:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 542FA60F12;
	Fri, 22 Jul 2022 14:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 542FA60F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_fXcljY9Kis; Fri, 22 Jul 2022 14:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F02B60782;
	Fri, 22 Jul 2022 14:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F02B60782
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 493531BF681
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 14:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2192F4037A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 14:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2192F4037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hA4TL_G-XBtQ for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 14:33:43 +0000 (UTC)
X-Greylist: delayed 00:37:01 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2463402C4
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2463402C4
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 14:33:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26MEXfrC039392;
 Fri, 22 Jul 2022 09:33:41 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26MEXffj128362
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Jul 2022 09:33:41 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Jul 2022 09:33:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Jul 2022 09:33:41 -0500
Received: from uda0500628.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26MEXfGf005467;
 Fri, 22 Jul 2022 09:33:41 -0500
To: <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 09:33:41 -0500
Message-ID: <20220722143341.17115-1-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220722095503.27868873@windsurf>
References: <20220722095503.27868873@windsurf>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658500422;
 bh=3YSvUMbm2wHYoOUKE4MaiKsm5W/Y3rbPU3iNbbybz4U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=F03U7tHptCG831cSvofqYRQdxBlKd9mMbY/P8ss24Aq9HoIjTjmG8/FdgmU33uvWt
 Q8u1DL7uwQAQesT9IiEvg8m7mhGt11WlvyJCS49SQS5DS9VuSa6rdO7BHYnmetSB6j
 s+fKdYNf7t2fANGLzwxEakMepMUOflQ/oBobxOqE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=F03U7tHp
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add target board
 options
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the second try sending this patch, sorry in advance if it's
duplicated.

Some platforms such as TI's k3 outputs a TARGET_BOARD directory
in their ATF build output paths after PLATFORM.
$(@D)/build/<PLATFORM>/ does not contain the debug or release
directories for these platforms.
They are under $(@D)/build/<PLATFORM>/<TARGET_BOARD>/

Signed-off-by: Xuanhao Shi <x-shi@ti.com>
---
 boot/arm-trusted-firmware/Config.in               |  5 +++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10b..a9354522b5 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -68,6 +68,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	help
 	  Target plaform to build for.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD
+	string "ATF target board"
+	help
+	  Target board to build for.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH
 	string "Device Tree Source file paths"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 998de4b814..30ecb187ae 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -41,18 +41,29 @@ endif
 
 ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
 
+ARM_TRUSTED_FIRMWARE_TARGET_BOARD = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD))
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DEBUG=1
+ifneq ($(ARM_TRUSTED_FIRMWARE_TARGET_BOARD),)
+ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)/debug
+else
 ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/debug
+endif
+else
+ifneq ($(ARM_TRUSTED_FIRMWARE_TARGET_BOARD),)
+ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)/release
 else
 ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release
 endif
+endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
-	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
+	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
+	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
 
 ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
 	$(TARGET_MAKE_ENV) \
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
