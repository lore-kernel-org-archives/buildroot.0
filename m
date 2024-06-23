Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD11C2BA18
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 22:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3F5860857;
	Sun, 23 Jun 2024 22:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuLL-aKNX45i; Sun, 23 Jun 2024 22:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DAA260831
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DAA260831;
	Sun, 23 Jun 2024 22:03:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D98001BF580
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 22:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C765280BB5
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 22:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFIKAo3RIy4y for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 22:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08BE780B88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08BE780B88
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08BE780B88
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 22:03:50 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-37636c3872bso6135535ab.3
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 15:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719180229; x=1719785029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8xn6KNr9xyOSimT8WsKNKC1/cNZS+0gTIyEFDD4VDvk=;
 b=QlAq1NNw4teYvqr1e/OXla/z/t9CXMWuPJkKKZUIyDcE/0PE/w0KWWpDR5JpxYfEj/
 ydkPKMA8loemoGA7WSyfkeowFElcjhXpqtcFrQYoQgiLkKgqjx8/SOkPFdrEPh4wHLwO
 R+7rCF3YWKiFBZDJkuwfaRZbvqr3ys+QhRqqI12rAhW4ed7u3N2f1JqB+rEe/4mvqt8t
 PImn+dWONjFGM80wfz1kF00y9js8jIvi9KOuw383seaCsbJ5FX5+vySG+y7Efw7BmDRY
 YiK1NIAsYP7vsHbbqYj5oS2qskilrsUxT49sXRK4BP7yj/QMUVQpmzvFEhTwRGsNof5m
 JhtQ==
X-Gm-Message-State: AOJu0YwIHa+qCwTFN9sBaIxqcbm8tf90SLPIch7WUVGfFhHvOavO3OyQ
 LJ+eHOc0YjgMiD1LWbFAritrXvRcuIK9vxvQ6HZGadYpgDy0STWvSoTPJw==
X-Google-Smtp-Source: AGHT+IGkJo6FimU80yxJ9wwqPz3zwtCEDbhns17irQepvZAIB40fDAFSI0F4ISNw1+gh2qjpHv68ZQ==
X-Received: by 2002:a05:6e02:12c2:b0:375:8a71:4cbe with SMTP id
 e9e14a558f8ab-3763f695927mr34038855ab.21.1719180229433; 
 Sun, 23 Jun 2024 15:03:49 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3762f2fb209sm14438625ab.10.2024.06.23.15.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 15:03:49 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 16:03:47 -0600
Message-Id: <20240623220347.1967206-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719180229; x=1719785029; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8xn6KNr9xyOSimT8WsKNKC1/cNZS+0gTIyEFDD4VDvk=;
 b=D4ZTOaqSeXCx1xJnQWZTrt8W89YjA4cMDBMNVt54/vN1hqoHaxfZfxPuUT25NmcfVe
 hKAAfdV4KCB7PdR8rnFM4nKKH9dfT1Z+eJFRtzcMI0oVe6Qkx0ZYNeZqsJKfi0ZAXcdx
 TwwY9B5iitpPEdofJQVsUScjh+JXoQfm/kDi/aPStVEeMKi8fHZ/Wr2EHGTg47Pv7pC8
 usBIp+jjIYj3HxY+O6RDN0NzqHlUn9czAl+5aKyRa7p0TQlmEnR2NgbC+QABuCTCQB7G
 v4rB7JspM6v6DXYFFPMG0d7UOMIW9/yvLRRk+MDsjicdaiZJv/oDla5EKd4mGD8TZnI2
 tQnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D4ZTOaqS
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add WiFi and BT
 firmware for MT7925
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Lance Fredrickson <lancethepants@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lance Fredrickson <lancethepants@gmail.com>

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index fa08b342f1..1f00afe4e8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -79,6 +79,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922_BT
 	help
 	  Firmware files for MediaTek MT7922 bluetooth support
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925_BT
+	bool "MediaTek MT7925"
+	help
+	  Firmware files for MediaTek MT7925 bluetooth support
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	bool "Qualcomm Atheros Rome 6174A Bluetooth"
 	help
@@ -444,6 +449,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922
 	help
 	  MediaTek MT7922
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925
+	bool "MediaTek MT7925"
+	help
+	  MediaTek MT7925
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
 	bool "Qualcomm Atheros 6174"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 13dbc6d98c..c06e229c63 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -404,6 +404,19 @@ LINUX_FIRMWARE_FILES += mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
 endif
 
+# MT7925
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925),y)
+LINUX_FIRMWARE_FILES += mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin \
+			mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
+# Mediatek MT7925 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925_BT),y)
+LINUX_FIRMWARE_FILES += mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
 # qca6174
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA6174
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
