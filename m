Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628C4C83F10
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 08:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB491402DC;
	Thu, 31 Aug 2023 08:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB491402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBOmUIs-CVK3; Thu, 31 Aug 2023 08:24:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A5EF40A17;
	Thu, 31 Aug 2023 08:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5EF40A17
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 209A51BF3F4
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 08:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D807760B9E
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 08:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D807760B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqMMSLkETs1X for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 08:24:35 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0420E60A94
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 08:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0420E60A94
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B0125D065E
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 08:15:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D36C60002;
 Thu, 31 Aug 2023 08:15:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 10:15:16 +0200
Message-Id: <20230831081517.546751-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693469719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NK/fPLz5dpkGJ4a4gXibytATAR/uBEzzVcBv7E+lK1g=;
 b=ceF9BYxn4Uc1AFNF63jzH5TyHNOHhgoaZ7ZHdcZ+qjq/ZnO4XnKD3UIMMbu/Q5olACgfb0
 bArs+b+HX98qrCwW9adKXdaT9J1AmbTIZCBYpoMuhAwcLQbYm4eNuqUEJo/CHjQ4fB9msj
 zjlkFtV28b7dyWwP9ZXGh9vZSFFgXGZn9oF/hRCkSA4bUAFxu+2lvmHLZAGUyVG2CCsLlH
 DNgHVqeWM/XvffKHPKOoEflJY38G273KtyCgQLcVmfmGSP0PKNT47EjCXpC07WEdFmuFcX
 43tSB6Zc2nmSBxc0eZWkU1JmqgpwedSc8BtgmEpNY58pnLyxiUSRZ32TvG7chg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ceF9BYxn
Subject: [Buildroot] [PATCH] package/linux-firmware: Add new option for
 Marvell prestera firmware
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Jens Kleintje <scooby22@web.de>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Add the Marvell prestera ethernet cards firmwares.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 3ae72564cc..402e75c890 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -513,6 +513,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	help
 	  Firmware files for Realtek 8169 gigabit ethernet cards
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MARVELL_PRESTERA
+	bool "Marvell Prestera"
+	help
+	  Firmware files for Marvell Prestera ethernet cards
+
 endmenu
 
 menu "DVB firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 01718fa1e0..d4850307ca 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -616,6 +616,11 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8411-2.fw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MARVELL_PRESTERA),y)
+LINUX_FIRMWARE_FILES += \
+	mrvl/prestera/mvsw_prestera_fw*.img
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
 LINUX_FIRMWARE_FILES += \
 	dvb-fe-xc4000-1.4.1.fw \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
