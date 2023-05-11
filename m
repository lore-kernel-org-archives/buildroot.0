Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8913CC77B7C
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 18:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09585701FD;
	Thu, 11 May 2023 18:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09585701FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8tDC6OHXj-C; Thu, 11 May 2023 18:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D74B701F6;
	Thu, 11 May 2023 18:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D74B701F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 229511BF299
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 18:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 093DB40BAD
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 18:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 093DB40BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1d66yn-brx7t for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 18:00:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71CE44046A
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71CE44046A
 for <buildroot@buildroot.org>; Thu, 11 May 2023 18:00:02 +0000 (UTC)
Received: from 1pxACD-0005Nw-Td by out3d.electric.net with emc1-ok (Exim 4.96)
 (envelope-from <kris@embeddedTS.com>) id 1pxACE-0005Q5-TR;
 Thu, 11 May 2023 10:35:18 -0700
Received: by emcmailer; Thu, 11 May 2023 10:35:18 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3d.electric.net with esmtps (TLS1.2) tls TLS_DHE_RSA_WITH_SEED_CBC_SHA
 (Exim 4.96) (envelope-from <kris@embeddedTS.com>)
 id 1pxACD-0005Nw-Td; Thu, 11 May 2023 10:35:17 -0700
Received: from mark-desktop.ts-local.net (_gateway [192.168.0.64])
 by mail.embeddedts.com (Postfix) with ESMTPSA id C6D90DE58;
 Thu, 11 May 2023 10:35:16 -0700 (MST)
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 10:34:51 -0700
Message-Id: <20230511173451.2293054-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:DHE-RSA-SEED-SHA:128
X-Authenticated_ID: 
X-VIPRE-Scanners: virus_bd;virus_clamav;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=MIME-Version:Message-Id:Date:To:From;
 bh=PnGLgadKkOFOhbG7DU19s35ItVzke2cCsJy7q5zOaRU=;
 b=GkeUD4u/K5CxIKuW8VD9YGA+oKeTfSukexkQo7IdssLTBvr+VzHeP7uFan+Dao2kgasL/l1p432wBmtVSUa5w+PCurOGvpZknR0dBdKw8H4fNx/aScC4/eurJCE5foAPwLFjYKE7cF7Y6YERtVuOBBEtgxH+34MZcpBA9eqtPT45NNIoIs5ZCRx9QD4fCja56PYLywTFG00vxuMGGH4BsHKF+SsEIL0l1I+4CmK5ZtNpPmHC81VuzhHipdgpxOHYetsglHFzD1HcVrA+VNCl0Rv+C2t4DlHAQ8uZ3tbiF1FUfbtKD13Sntuv/GBJiRar5XqdKDWPQtaiIV7YofEqig==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=GkeUD4u/
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add QCA9377 BT
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Kris Bahnsen <kris@embeddedTS.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Mark Featherston <mark@embeddedts.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Deploy firmware files as well.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4b415a7da2..4cab6e7939 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -69,6 +69,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	help
 	  Firmware files for QCA Rome 6174A bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_9377_BT
+	bool "Qualcomm Atheros QCA9377 Bluetooth"
+	help
+	  Firmware files for QCA9377 bluetooth support.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_AR3011
 	bool "Qualcomm Atheros 3011"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9d9d12bd5f..9672c7a07f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -65,6 +65,12 @@ LINUX_FIRMWARE_FILES += qca/rampatch_usb_00000302.bin qca/nvm_usb_00000302.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
 endif
 
+# Qualcomm Atheros QCA9377 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_9377_BT),y)
+LINUX_FIRMWARE_FILES += qca/rampatch_00230302.bin qca/nvm_00230302.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
+endif
+
 # Realtek 87xx Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT),y)
 LINUX_FIRMWARE_FILES += \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
