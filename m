Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD6FCD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC9874054E;
	Sun, 17 Sep 2023 20:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC9874054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2mR8kBBOw9M; Sun, 17 Sep 2023 20:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC6E4058D;
	Sun, 17 Sep 2023 20:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC6E4058D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A17EB1BF4E2
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73F7D4058D
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73F7D4058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fPYBQBk-5fd for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:54:19 +0000 (UTC)
Received: from mail.light-speed.de (mail.light-speed.de
 [IPv6:2a01:238:43f2:8900:dd04:e3a0:ee11:a73d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95F3F4054E
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F3F4054E
Received: from bilbo.fritz.box (ip5f5a8b4a.dynamic.kabel-deutschland.de
 [95.90.139.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id AE7073D4246F;
 Sun, 17 Sep 2023 22:54:16 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:54:16 +0200
Message-Id: <20230917205416.1518714-1-mail@jens-maus.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1694984057;
 bh=Auz25NGH1WezJWMsmK3KjBCGMWQqqyzhgb0lEY8xkQU=;
 h=From:To:Cc:Subject:Date;
 b=k14pazo/rPKT28lVR56Olcd/P1UdapfIjOQRVeYxAoBjcT5wSg3t+UXIo8RhhBIj1
 AsZNeFSK6XgKPtf3FpsAtoFnpKY7IIpKEbN5PC2Yh4vG3IWcIeR7Gd4Cw+fRfh1o+v
 EAvYLIucbTRjELxo4M5Uz/0ErkqcDXtayJDyX8Co=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=k14pazo/
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add iwlwifi quz
 firmware
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit integrates support for the iwlwifi QuZ firmware files
to support the wifi chipsets for the intel NUC10 type of hardware.
Thus, this change adds BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ.

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 46e538776d..f86818996e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -279,6 +279,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E
 	  Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
 	  supported by the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ
+	bool "Intel iwlwifi QuZ"
+	help
+	  Firmware files for the Intel Wifi QuZ devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f8c239d816..0cd1f30c16 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -527,6 +527,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ),y)
+LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
 LINUX_FIRMWARE_FILES += tigon/*
 # No license file; the license is in the file WHENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
