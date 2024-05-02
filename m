Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92071C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 552C841795;
	Thu,  2 May 2024 16:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJ3yMa3SWVkR; Thu,  2 May 2024 16:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8EFA41D6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8EFA41D6A;
	Thu,  2 May 2024 16:27:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 889C41BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C463E82F0F
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4DqjXHSG_nH for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACC2B82F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACC2B82F06
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACC2B82F06
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRD3U063658;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRD2E131036
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDqv109054;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:26:56 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-6-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=bb@ti.com;
 h=from:subject:message-id; bh=a6yesoNj7wbIZ5cWarDIPrxVJm9u6X3OYun7hd3FEw4=;
 b=owNCWmg5MUFZJlNZFrARaQAAaP/////fv+99fX/7bW8ot3/Ppdg7Xe1mzv71/39b3//+9XawA
 RswHajTRoaaDQDQAAAAADQ0yDQaAA00GmmhoBoMgGjQGmgaAyAaZMmh6jaAnppDk00DJoNAGhiD
 T1AAMIDEGgA0DCAGQHqNAMEMmQyAAZAbUPU0AAAZDIgHqNDQ00NANGgNNGjQNGBBkNAMCZMg0ZA
 0aAwIBkaaDQAAAaZA0DTCaAAABmDrwb5d8D3BwAU6m7J8EJfaikSQNMC5ocLNPG4xdlIDymGxiF
 LI3/b1d7R3QAhmAl25ZgHrdWQyxr0cCnTy+xK4M+d7frmmkrz7gsGNqt+fgmTRTY4rkiAO7UCxZ
 JaNRytZdn2+MpgTnY936mAXEUQjCl4ekgw16hXsWCO0wD7eM069jfVPTIuQOyVY0xSiG7xwsQBP
 JeZg1niHkk7cQYs5/BQtEbkoJ0+dq/FprfRg4vzlfUmoUAwJEovK5Gp5SCbuPIAzKRetQjT/es+
 Nk2Skvo0ppJYEEx7iAaZUc0/rNje9DBWoJznkWZMhCSpOKfx6o0zUr1sCsdTtB91H5yC4YmwDIx
 hC0dsLPBVrvC5E6APPhTjgCnZ0rsYJkGjEkBTIexiBCnyCAX/Wl6zprAOLbIt90a6GOGRMhNkIj
 UuALbPgQWQb/xdyRThQkBawEWk=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=rL1vRqTx675ZXJEa8gO2/5la7RROe/rr2CtwjpAbCbM=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=k43WGendwujStN/1t/bfaVrOhi90HKJkPzZrQ2I+4YMB1m0lTTHE413dIhyIqR1o4
 jBo9XdPO/rIB5I58KptMx6jBcNXYgUtiwETC8zwe6V+oRekO+gODmmGz8E3EfpdxMN
 kIkLFoyOnAyIL1lqHUYhYJ7Qz7pi0PfxsTix819Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=k43WGend
Subject: [Buildroot] [PATCH RESEND v2 06/11] configs/ti_am64x_sk_defconfig:
 update TFA to v2.10
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the TFA firmware to the latest LTS tag for v2.10 release of
arm-trusted-firmware

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 .../ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 configs/ti_am64x_sk_defconfig                                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 74fe35c9bc733..8f60864fbf67f 100644
--- a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
+sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 28e97f94e2f88..e0f48cd5bb062 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.10.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
