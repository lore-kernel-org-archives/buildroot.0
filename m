Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F026CA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 12:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55E8240C2C;
	Tue,  9 Sep 2025 12:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54PGH2OvmT_O; Tue,  9 Sep 2025 12:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D2840AAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D2840AAB;
	Tue,  9 Sep 2025 12:42:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C51711D9
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1A84613D3
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpV95lKeNbG7 for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 12:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.234;
 helo=lelvem-ot01.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF430613E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF430613E9
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF430613E9
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:41:57 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589CM4ZL4098938;
 Tue, 9 Sep 2025 07:22:04 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589CM4MR3701634
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 9 Sep 2025 07:22:04 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 07:22:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 07:22:03 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589CM3hc2318696;
 Tue, 9 Sep 2025 07:22:03 -0500
Date: Tue, 9 Sep 2025 07:21:57 -0500
MIME-Version: 1.0
Message-ID: <20250909-ti-k3-boot-firmware-src-v1-1-542b606ef0c7@ti.com>
References: <20250909-ti-k3-boot-firmware-src-v1-0-542b606ef0c7@ti.com>
In-Reply-To: <20250909-ti-k3-boot-firmware-src-v1-0-542b606ef0c7@ti.com>
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112; i=bb@ti.com;
 h=from:subject:message-id; bh=xAa4XIbjZj7r5fbImvStfhWB2vHNTNDlWTsf5kJRHyE=;
 b=owNCWmg5MUFZJlNZZ0aCFQAAYH////95qnN6/5rVrVZXm3O+edlnf/7Ovu7X7//e+v79ov2wA
 RsrB2oNGmjI0ZDQAAGmQAaNAANAAAZADTQBhMQANAAAaNBtTeqPSaY0npN6ogaGgaD0gZAaBpkP
 UAbSNABoAG1NDQ2poBoGmmgaGQGgGTIZDR5JtQaMhtQaGiGhkyDQyaaYEaBpkaaaYmJo0NNA0Aa
 aBpkGQYRhGQaYQaDTQDQAGmjQyA0D1AMHCiY9EElVC0IIkBPP6FiBIK/gZ3u7hSJ8YKiNNDAJdo
 LJ9Yv9DOxAICisDGeiAIQxPexeIQ8zNmi92NoNI6mKEJesZuy08+1VdGtio/nSUieMrllnF0G2d
 ygJYDtEiur24duwRhPQpCTkxEv0M4wcfmcs08lO43EG+geeo58EheX5SmTYm61kfE3z0j+BQPM4
 1e4PkBqEJ/rZ6RhCgI3LwVB7ETV4ToEHj8PyYYdbSXF7Bx0H+xN79XkkB9YYqzT9gDiAsBxHQzt
 OKEhFmTzys2GAMe3RZwCm4DX7rRMYdD0lBcrfQyy+BSQtaOuKRZeu/CmYDhdyrNgTLFyHwYj6QD
 TSkRS53jrERoTHatGTPPqKx/K37VM4RDoP4Rvrt3I4AuJ0ALsgaYBDEiwuBkh4vteGlnw77ERho
 B4Nrzj5dUZ/xdyRThQkGdGghUA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1757420524;
 bh=rpONh/SlW05C92leJmfdyKFdMY3k7g4vTckkrQIBYyE=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=DcOQPTRKtcgCDSQwcM+3rEDpyrpX0h2ojKNgW50UrZAw0hRGirUao4QUsmgBF/A1W
 CSRwYfq6We7BjsYhrCyl7ntFyqcI0bB2ugwRPKz3cX5ulrdlJA29C2wJLhyY8Cx+AD
 NBr+EJS8uFn6t1CyptM1ZTtz7ftkwmSwHin+QLfU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=DcOQPTRK
Subject: [Buildroot] [PATCH 1/2] boot/ti-k3-boot-firmware: switch to github
 mirror
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

The git.ti.com cgit server continues to be plagued with reliability
issues which are reportedly from heavy bot traffic. To combat this the
system administrators have removed the archived downloads feature from
this server.

Switch to TI's Github mirror so new downloads continue to be possible.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 571bbf121949dea8f9acb81f7448641eff915891..239694838179862283738c96029b27db4e4c4650 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  f9e09b84e206d605a9fb5691a325dcd4a7d6a3e6bf70a69cbc169d1a5c617804  ti-linux-firmware-11.00.11.tar.xz
+sha256  e98ae3350964100b6137d32d4874c16229a97b1cc7f8f4f23f8da59a386520c8  ti-k3-boot-firmware-11.00.11.tar.gz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 117c0a9a5ade0c6ab133b7c1b0b7a3e4a966360e..25956be68bd0dfad34f3a26c367dc42504b3ff9e 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 TI_K3_BOOT_FIRMWARE_VERSION = 11.00.11
-TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
-TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
+TI_K3_BOOT_FIRMWARE_SITE = $(call github,TexasInstruments,ti-linux-firmware,$(TI_K3_BOOT_FIRMWARE_VERSION))
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
 TI_K3_BOOT_FIRMWARE_LICENSE = TI Proprietary
 TI_K3_BOOT_FIRMWARE_LICENSE_FILES = LICENSE.ti

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
