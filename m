Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED879C433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 22:14:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C6B260F70
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 22:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C6B260F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDF4403C9;
	Tue,  2 Nov 2021 22:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZh7qX1yS_qY; Tue,  2 Nov 2021 22:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D14D403BB;
	Tue,  2 Nov 2021 22:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 401741BF215
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 22:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EEE3403BB
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 22:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgzHDAtSXnV8 for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 22:14:12 +0000 (UTC)
X-Greylist: delayed 00:08:11 by SQLgrey-1.8.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 196C9403BA
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 22:14:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:169:3df5:10:5c1d:e28a:f461:57d5])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 6E4B85C0C02;
 Tue,  2 Nov 2021 23:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1635890758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=BT+ML6/Ij2PgkQ6r7y/is1cS4UHUOMyYsdDy+KHM+08=;
 b=PDmH6dE1ovaX9GrrU5rBSUn0ysTIs2UyF1IhuZHZDkSCHVrrfjdyAoWEzII3htLrLCtyLh
 jJnh12zEI/WyadOyCT4S0PCjlFOhsWsLGj4NYjXsnjZKQs6UfOqqLAN0iUqbJEA8hFNoKn
 lJt3MaMDWOjUz0b6AqgzYEs7hfa+Vao=
From: Stefan Agner <stefan@agner.ch>
To: yann.morin.1998@free.fr,
	buildroot@buildroot.org
Date: Tue,  2 Nov 2021 23:05:49 +0100
Message-Id: <b6ebfe5a4b5d2aa9183874a96b345c3a1cf79354.1635890634.git.stefan@agner.ch>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-firmware: Add RTL8152/8153/8156
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
Cc: stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add firmware for Realtek 8152/8153/8156 based USB Ethernet adapters.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/linux-firmware/Config.in         |  6 ++++++
 package/linux-firmware/linux-firmware.mk | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4376d44bda..304f5553c0 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -445,6 +445,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
 	  Firmware files for QLogic FastLinQ 4xxxx ethernet devices
 	  (qede)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_USB_NIC_RTL_815X
+	bool "Realtek 8152/8153/8156 USB Ethernet Adapaters"
+	help
+	  Firmware files for Realtek 8152/8153/8156 based USB Ethernet
+	  adapters.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ff793c9218..ac91bf55ff 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -540,6 +540,19 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
+# rtl815x
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_USB_NIC_RTL_815X),y)
+LINUX_FIRMWARE_FILES += \
+	rtl_nic/rtl8153a-2.fw \
+	rtl_nic/rtl8153a-3.fw \
+	rtl_nic/rtl8153a-4.fw \
+	rtl_nic/rtl8153b-2.fw \
+	rtl_nic/rtl8153c-1.fw \
+	rtl_nic/rtl8156a-2.fw \
+	rtl_nic/rtl8156b-2.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8105e-1.fw \
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
