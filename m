Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1BBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 20:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 925EF40465;
	Thu, 21 Jul 2022 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 925EF40465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itgNz36vhP0O; Thu, 21 Jul 2022 20:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 977C240204;
	Thu, 21 Jul 2022 20:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 977C240204
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC821BF3D9
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5048860BC6
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 20:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5048860BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gc4IZ4gs92PE for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 20:44:10 +0000 (UTC)
X-Greylist: delayed 00:05:12 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38D0B60B8C
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38D0B60B8C
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 20:44:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26LKcvYM016984
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 15:38:57 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26LKcvMw102973
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 15:38:57 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Jul 2022 15:38:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Jul 2022 15:38:56 -0500
Received: from [128.247.75.139] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26LKcuiK117227;
 Thu, 21 Jul 2022 15:38:56 -0500
Message-ID: <91ff193c-5e66-b80c-538c-7ebcddd9bd87@ti.com>
Date: Thu, 21 Jul 2022 15:38:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
References: <20220721203307.30488-1-x-shi@ti.com>
Content-Language: en-US
To: <buildroot@buildroot.org>
In-Reply-To: <20220721203307.30488-1-x-shi@ti.com>
X-Forwarded-Message-Id: <20220721203307.30488-1-x-shi@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658435937;
 bh=P2XVFFGRr7BjONsOESrUWZtB7BggoVqrV8Raub1D+CI=;
 h=Date:Subject:References:To:CC:From:In-Reply-To;
 b=zDzaQNcA6bnUqX2fak3EMG5gyrqMNM6nGjeiFJRN2GvSl1G9v9A/R+eRas0K1302b
 2uLWJm4g0hXPjr2voZJB69UwevGj/dTKGEUqDaye91Yec+0+Qula8w/K+rGn3hrOYl
 LqV+dcRg9ACk4//POsSdQ7WOaoVFCR20Bp6RwCbE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=zDzaQNcA
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
Cc: Alden Benedick Agcon <alden@ti.com>, Xuanhao Shi <x-shi@ti.com>,
 Sergey Ostrovsky <sergeyo@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

diff --git a/boot/arm-trusted-firmware/Config.in 
b/boot/arm-trusted-firmware/Config.in
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
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk 
b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 998de4b814..30ecb187ae 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -41,18 +41,29 @@ endif
   ARM_TRUSTED_FIRMWARE_PLATFORM = $(call 
qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
  +ARM_TRUSTED_FIRMWARE_TARGET_BOARD = $(call 
qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD))
+
  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG),y)
  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DEBUG=1
+ifneq ($(ARM_TRUSTED_FIRMWARE_TARGET_BOARD),)
+ARM_TRUSTED_FIRMWARE_IMG_DIR = 
$(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)/debug
+else
  ARM_TRUSTED_FIRMWARE_IMG_DIR = 
$(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/debug
+endif
+else
+ifneq ($(ARM_TRUSTED_FIRMWARE_TARGET_BOARD),)
+ARM_TRUSTED_FIRMWARE_IMG_DIR = 
$(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)/release
  else
  ARM_TRUSTED_FIRMWARE_IMG_DIR = 
$(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release
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
