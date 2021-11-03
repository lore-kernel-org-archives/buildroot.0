Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D997AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:47:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B76D610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B76D610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE8040522;
	Wed,  3 Nov 2021 21:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clM-2JScsYoP; Wed,  3 Nov 2021 21:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C15F4052D;
	Wed,  3 Nov 2021 21:47:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E540D1BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1EA060B01
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAYMEeLtGivP for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:47:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C73B60730
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:47:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 86A928A4B9; Wed,  3 Nov 2021 21:44:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:47:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78d3f2ea03dfba07a73fe0405c2aa4778f063ce3
X-Git-Newrev: a7b63ebec3fa74b3ea14ecf640e36864096923b4
X-Patchwork-Hint: ignore
Message-Id: <20211103214403.86A928A4B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add
 RTL8152/8153/8156 firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7b63ebec3fa74b3ea14ecf640e36864096923b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add firmware for Realtek 8152/8153/8156 based USB Ethernet adapters.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         |  6 ++++++
 package/linux-firmware/linux-firmware.mk | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4376d44bda..3609c3ec4e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -445,6 +445,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
 	  Firmware files for QLogic FastLinQ 4xxxx ethernet devices
 	  (qede)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_815X
+	bool "Realtek 8152/8153/8156 USB Ethernet Adapaters"
+	help
+	  Firmware files for Realtek 8152/8153/8156 based USB Ethernet
+	  adapters.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ff793c9218..79ee0316d3 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -540,6 +540,19 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
+# rtl815x
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_815X),y)
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
