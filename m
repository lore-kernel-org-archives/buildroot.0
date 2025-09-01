Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B74CCA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B33610F9;
	Mon,  1 Sep 2025 09:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alWJ0DYhgfK1; Mon,  1 Sep 2025 09:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A2C60DF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A2C60DF8;
	Mon,  1 Sep 2025 09:16:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1E93169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1C7F83CF8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9thOvVJx4-6 for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 09:16:40 +0000 (UTC)
X-Greylist: delayed 1810 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Sep 2025 09:16:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6623883C9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6623883C9D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.2;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6623883C9D
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:16:38 +0000 (UTC)
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wAXEKXQWbVoTeP3Fg--.7684S2; 
 Mon, 01 Sep 2025 16:31:17 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Cc: Andy Yan <andyshrk@163.com>
Date: Mon,  1 Sep 2025 16:31:09 +0800
Message-ID: <20250901083109.284281-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wAXEKXQWbVoTeP3Fg--.7684S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWUZryfGr48CF1fJF1DKFg_yoW8WryDpF
 1UWF4UJ3yjgw1fJayUKasxCr15Zrs5ArWjk3sFka4rKF17urWkX3yDWFs5Jrn7Cr18Aay7
 Ca17GrWkuFyDJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRZYFXUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgW7Xmi1U-TbOwAAso
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ql
 A4Lga/dGKvW/hiyPNnmOwB3uec3SRX5BaiHteBCSk=; b=BGqXpyypbHjQdgfOLt
 2qOBsUQT6e0eTbo+neKhjfQbyDEP7+LijznPZrcIem5lQxRFHhU6k/kKUZI0+bNw
 NDUeJ8cClDOvYl/A1MzsamMs22cwMZ5cO5r9fGCk12TyoWgsUqr3A5OasM0KZdTy
 8PseWVwFYoKHw3lQwFj0E9yw8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=BGqXpyyp
Subject: [Buildroot] [PATCH] package/linux-firmware: Add option to install
 cadence MHDP8546 DPI/DP bridge firmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cadence MHDP8546 DPTX IP used in TI J721E SoC needs the firmware to
work.

Signed-off-by: Andy Yan <andyshrk@163.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 778dfef8a0..21dff9768e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -205,6 +205,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0
 	help
 	  Firmware file for the Broadcom 4366c0 FullMAC chip.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CDNS_MHDP8546
+	bool "Cadence MHDP8546"
+	help
+	  Firmware file for the Cadence MHDP8546 DPI/DP bridge
+
 config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX
 	bool "Cypress CY cyw43xx"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 40758054e5..869e2d668f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -913,6 +913,11 @@ LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CDNS_MHDP8546),y)
+LINUX_FIRMWARE_FILES += cadence/mhdp8546.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cadence
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX231XX),y)
 LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
 # No license file; the license is in the file WHENCE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
