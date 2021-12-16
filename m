Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEADDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE6A83F1E;
	Thu, 16 Dec 2021 19:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obbi6nQicJxl; Thu, 16 Dec 2021 19:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB98B83EE5;
	Thu, 16 Dec 2021 19:28:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9C501BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8DFD60EB9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xes-inc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPkVymNgPfYU for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:28:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3963A60E2F
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:28:57 +0000 (UTC)
Received: from jschultz3.xes-mad.com (jschultz3.xes-mad.com [10.52.16.120])
 by mail.xes-mad.com (Postfix) with ESMTP id 7EB3522421;
 Thu, 16 Dec 2021 13:28:56 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1639682936; bh=JLXphtn31EpSJuRAy0+hJA2ss5HfxJQpu3QXzYm7ItE=;
 h=From:To:Cc:Subject:Date:From;
 b=JEX3rqpQUtTd/T1qLXTfoQnCPToZwcUlOarzCrxuzw2IHJJeGVFkvC48ygXho4bCc
 W/y/24xirHWgJcL3sKI8Tsbars+VHKHFtiGQvyaZIRu769xUuF4/RpgryveBW3ANMG
 RfBQgRP3csnNTwWyxWBHlsehPoenbr0ZK6C4/HHY=
From: Joe Schultz <jschultz@xes-inc.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 13:28:54 -0600
Message-Id: <20211216192854.4016224-1-jschultz@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for
 Intel E800 Series Network Adapters
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
Cc: Joe Schultz <jschultz@xes-inc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 3609c3ec4e..622b1ee685 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -432,6 +432,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
 	  Firmware files for Intel 825xx handled by driver e100
 	  (e100)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ICE
+	bool "Intel Ethernet 800 Series"
+	help
+	  Firmware files for Intel Ethernet 800 Series Network Adapters
+	  (ice)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY
 	bool "Microchip VSC85xx PHYs"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 79ee0316d3..281ed0189d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -528,6 +528,11 @@ LINUX_FIRMWARE_FILES += e100/*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ICE),y)
+LINUX_FIRMWARE_FILES += intel/ice/ddp/*.pkg
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ice_enhanced
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY),y)
 LINUX_FIRMWARE_FILES += microchip/mscc_vsc85*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.microchip
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
