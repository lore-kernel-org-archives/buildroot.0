Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC19CA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 11:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D8B561C45;
	Mon,  8 Sep 2025 11:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRPjnDXsa59v; Mon,  8 Sep 2025 11:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91F1161C33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F1161C33;
	Mon,  8 Sep 2025 11:02:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B8B91D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E563C84231
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB7CwYDsqukq for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 11:02:43 +0000 (UTC)
X-Greylist: delayed 908 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 08 Sep 2025 11:02:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C02E8841AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C02E8841AB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp1.osuosl.org (Postfix) with ESMTP id C02E8841AB
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:02:41 +0000 (UTC)
Received: from ProDesk.. (unknown [])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgBHnuw2tL5o+PveCA--.13936S2;
 Mon, 08 Sep 2025 18:47:27 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Cc: Andy Yan <andyshrk@163.com>
Date: Mon,  8 Sep 2025 18:47:16 +0800
Message-ID: <20250908104716.1242187-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: QCgvCgBHnuw2tL5o+PveCA--.13936S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw4kJryfXry3XrWDGw4xXrb_yoW5Ww17pF
 1DWF48X3yUKF1rJayUKa43Arn8Zrs5ArWUK3sF9a4rtF1UurykX3yDWFs5Jrn7Zr1jy3y3
 Ca17GrWkuFyDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR15lbUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMx3CXmi+rNPrvQAAsN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+4
 MJMZNq5ugyfTq++3EESA6dv3kW7lfKPYgMVx8scwE=; b=htSOFTKanm1fMyYcyj
 8A+76goKMwOXYmXBHV3CkdxG8uc8xDLGGdJNWCkA7qjfre9SwPOfzPcKhWXEVHMt
 Z7/gunlIEjzl7McO6et0UXiD4N+mtDeX5TDCBktRPo2J0UGcujTQ7XkBj3nCIq7k
 iTOKrH1Cpz6PBlwVbtLdwdh7k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=htSOFTKa
Subject: [Buildroot] [PATCH v2] package/linux-firmware: Add option to
 install cadence MHDP8546 DPI/DP bridge firmware
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

Changes in v2:
- Add license hash

 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 11 insertions(+)

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
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index e980010cd8..7f73401ab0 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -13,6 +13,7 @@ sha256  8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021  ath10k
 sha256  bf1cb89140fe7e138fec229b26fa45d2fb46f416ab559916c6e56c0224df2e8e  LICENCE.bnx2
 sha256  691f2b5e3e94e06aa89450c99ff08c83336c77fe4ad64a609b1cddea4bf98727  LICENCE.bnx2x
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
+sha256  5b97965d9a820a747fa1ab6339290cea0e6ce86b001e6620c4de4c0df532ed2f  LICENCE.cadence
 sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENCE.chelsio_firmware
 sha256  88236d5ae45b7abc96c2ab4c6952af88758e24b17412dd173746ee1c559b3c6f  LICENCE.cnm
 sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
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

base-commit: d9e043a18dd9279654490617e209c07bd3590afc
branch: master

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
