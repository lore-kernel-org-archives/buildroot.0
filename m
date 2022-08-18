Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC2BC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 13:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AB9440591;
	Thu, 18 Aug 2022 13:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB9440591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJSAne_rTo1p; Thu, 18 Aug 2022 13:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89BC340620;
	Thu, 18 Aug 2022 13:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89BC340620
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13AA91BF303
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 13:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1C58418E6
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 13:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C58418E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ft-S6hbcFhVy for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 13:18:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D87D6418EA
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D87D6418EA
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 13:18:45 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id E4FD25C1384;
 Thu, 18 Aug 2022 15:18:40 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com
Date: Thu, 18 Aug 2022 15:18:34 +0200
Message-Id: <0e18605c9938776a707a4aab032be74a1a9afe8e.1660828116.git.stefan@agner.ch>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1660828721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=UEJa/ycAHCj1ghZBonZOk3QLH9GoUSQ8dft11LSPLrU=;
 b=KI92xvfZnfUvovXJvpggunRrIYEDNBlpbBnd3fw06o3MZ7PgEo2u2klQOIMAwKfv/beSAn
 CNXcONtPcOFUccrH6BP/FmtJBLswz2Sqkm5Rx7ljTJqH+eM41L3AhG1HioiVJqwQjVrUfF
 PH11Ni6Qx8pHD0w219pzcE7CNX4T3qs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=KI92xvfZ
Subject: [Buildroot] [RFC PATCH] package/linux-firmware: Add more Intel WiFi
 22000 series
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

Add more Intel WiFi 22000 series firmware files. Allow to select the
firmware version using shell globs.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
With the Intel WiFi 22000 series the amount of firmwares is just stagering. So
much so that it causes size issues in our case.

Intel firmwares seem to have an API version, which is the last digit before the
file ending .ucode. The Linux kernel sources have defines which API each
individual driver supports (e.g. Linux 5.15 22000 series kernel driver
supports ucode API 39 up to 66).

This crude method uses just file glob matching to allow to select firmwares
which match the kernel in use. However, this approach has a problem: Some
API versions are missing. E.g. simply using "66" doesn't work since some
firmware are not available with the latest API supported (e.g.
iwlwifi-so-a0-gf-a0-64.ucode).

Also if an older kernel is in use, some firmware files with an older maximum
API might just be missing, which leads to tar complaining about missing files.

In this case, we can use 6[46], which happens to select the newest version of
all firmwares (it seems that firmwares which are available with API version 66
have only been released with version 63 before).

However, this of course might be just a coincidence. Ideally Buildroot would
select the newest version available for a particular API version. Not sure if
this is easily doable.

Thoughts?

--
Stefan

 package/linux-firmware/Config.in         |  9 +++++++++
 package/linux-firmware/linux-firmware.mk | 15 ++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 8ce71140da..49a40283c8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -181,6 +181,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
 	  Firmware files for the Intel Wifi 22000 devices supported by
 	  the iwlwifi kernel driver.
 
+if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB
+        string "*"
+        help
+	  API level for firmware files of the Intel Wifi 22000 devices.
+
+endif
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260
 	bool "Intel iwlwifi 22260"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 64d096df14..2283cd7d5e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -436,7 +436,20 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
+LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB = $(call qstrip,$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB))
+LINUX_FIRMWARE_FILES += \
+	iwlwifi-Qu-b0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-Qu-c0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-Qu-b0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-Qu-c0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-QuZ-a0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-QuZ-a0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-cc-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-so-a0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-so-a0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-so-a0-gf-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-ty-a0-gf-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
+	iwlwifi-so-a0-gf4-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
