Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5107CA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 12:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DB6613E9;
	Tue,  9 Sep 2025 12:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zluI0_M_ZuQ; Tue,  9 Sep 2025 12:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8EF7613EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8EF7613EB;
	Tue,  9 Sep 2025 12:41:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A58E186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 393D2613EB
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dM8sXZ5bV66Q for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 12:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.234;
 helo=lelvem-ot01.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A428613D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A428613D3
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A428613D3
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:41:57 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589CM47u4098934;
 Tue, 9 Sep 2025 07:22:04 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589CM4vu3701633
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 9 Sep 2025 07:22:04 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 07:22:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 07:22:03 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589CM3Ej2618003;
 Tue, 9 Sep 2025 07:22:03 -0500
Date: Tue, 9 Sep 2025 07:21:58 -0500
MIME-Version: 1.0
Message-ID: <20250909-ti-k3-boot-firmware-src-v1-2-542b606ef0c7@ti.com>
References: <20250909-ti-k3-boot-firmware-src-v1-0-542b606ef0c7@ti.com>
In-Reply-To: <20250909-ti-k3-boot-firmware-src-v1-0-542b606ef0c7@ti.com>
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=bb@ti.com;
 h=from:subject:message-id; bh=m80Sy5ThgIPMqRlD7yibTv3KTgXvw/wxpMcQFgokIrc=;
 b=owNCWmg5MUFZJlNZynDBVwAAZX///3/NX33i+f/3811Wfs3/zIvq7fb/Xf6XXc/Z6dLunX8wA
 RsxpAAAAA0DQaAAA0NAAAAHqZBhAAHqA0NMQNHqB6jyjTR6QeoD1G9UeofqnlDo9QNBpoYmmmRo
 NBiaZBpgmjQDEAYCNDEGgyDTI0MJhqAANNBkA0AMmjQMUbSZMm1PUaDQ00GQADIPSGRoaMmQADE
 BoNGgxAABoaGhoYmgNGjJo0DJ6QCC9UpNITzsqDsca2IlRIieSsFEqQcCmerHWBxwBUDEv24EPA
 LHCDF1KI/LnuQRAij+AoNcj65ongQYEEJznc5A9VeY9tX9mZSV9StSPe3FcFQT4OrGisGHJe007
 Liiv4ayG++iBdNQ7o51I2WcjXwVsn2Ks3+AfwMYAKx/dI67eUoXT3p1hoKwBjiYuZ53B9reUWxl
 yCk3lmhLZJUIPzjZr8jV62CkzzVIIghgg6r41j/IxWKZF6BXIxG8ZYr0RSiBz5qAn855SAqTmT5
 s7A84O0VCdxSgs9r+VKnXCuDKHrZZ4RdJiwYQb9xcdotSn5Pi9zrUa5QZYAK08ZwNq/1Jdk+mAx
 QSDoOOD2mhWYowLyUBsA1cDaqBXewGUSDCAuyDak1a/6AEGG2fLQfzkTNG1L/XUg/lxaMwth8Oc
 hPSf4u5IpwoSGU4YKuA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1757420524;
 bh=87VJohtDWCx4ijSy8bVRcwTBwLHA5EMo1VJMgnQZoIc=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=nswqNlMxkuh/SMydy1fl90mqjPfk/7jx/jdhb8Ey5kztCNNmq9NXmBZ0woqehmh8c
 BxqUL9Fw2FmsGlfAbrw6QLDtOky5JHCVOZstl0aMZUnwqPPu/SJbBvlqVLHNlZf8oe
 CnBWEI6cy92q6FBCCbc0sJ4e/fKYNBh30r2ZN8ks=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=nswqNlMx
Subject: [Buildroot] [PATCH 2/2] boot/ti-k3-boot-firmware: bump to 11.01.12
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to the latest tagged version of ti-linux-firmware to pull in
updates for TI's DM and TIFS firmware for TI's K3 processors

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 239694838179862283738c96029b27db4e4c4650..d94590e70544b6c868f6d4aa33e74b3abdc4e36f 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  e98ae3350964100b6137d32d4874c16229a97b1cc7f8f4f23f8da59a386520c8  ti-k3-boot-firmware-11.00.11.tar.gz
+sha256  eda8af01e1c142e3ebe766877585ac4f37e4f1dc4ad5fe29ad15c120c18ccece  ti-k3-boot-firmware-11.01.12.tar.gz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 25956be68bd0dfad34f3a26c367dc42504b3ff9e..7689071a4c26d4c33c97ff56527db21014bf1e2e 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_K3_BOOT_FIRMWARE_VERSION = 11.00.11
+TI_K3_BOOT_FIRMWARE_VERSION = 11.01.12
 TI_K3_BOOT_FIRMWARE_SITE = $(call github,TexasInstruments,ti-linux-firmware,$(TI_K3_BOOT_FIRMWARE_VERSION))
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
 TI_K3_BOOT_FIRMWARE_LICENSE = TI Proprietary

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
