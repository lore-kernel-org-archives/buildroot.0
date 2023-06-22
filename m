Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2EEB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF974205A;
	Thu, 22 Jun 2023 16:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF974205A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fS3b81sjulI1; Thu, 22 Jun 2023 16:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A90542053;
	Thu, 22 Jun 2023 16:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A90542053
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9A71BF3D1
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E92C083D21
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E92C083D21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDd3eGuTQJjB for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:02:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C211583C9A
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C211583C9A
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:02:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2HfN070359;
 Thu, 22 Jun 2023 11:02:17 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MG2Hjx115084
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Jun 2023 11:02:17 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 11:02:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 11:02:17 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2Gj3107613;
 Thu, 22 Jun 2023 11:02:17 -0500
To: <buildroot@buildroot.org>
Date: Thu, 22 Jun 2023 11:02:09 -0500
Message-ID: <20230622160212.2063472-9-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622160212.2063472-1-dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687449737;
 bh=BzQj2VKEEfiq76fvkMr6WuqoYDKcgXZidg7IcbWyhNI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=iibSCNs6ozSYSBEB4x4CGWqZqsiu4uAKqfvP0kArY5agcaaLCeVGSLMQ1ZW+LDbvW
 xQF7llGI06824KN2w1zZVdNbBmHJoyPKVL4YDRgYdRLW2ZEisDjY/ng92XTgQ8g091
 temqVVCXHAyNjciVMXYNvsm4SrsU9lJeZc+EaqVs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=iibSCNs6
Subject: [Buildroot] [PATCH v9 08/11] board/ti/am62x_sk|am64x_sk: switch to
 HS-FS device variants
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Julien Olivain <ju.o@free.fr>, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Current starter kits for AM62x (called SK-AM62B, see [1]) and AM64x
(called SK-AM64B, see [2]) both contain High Security - Field Securable
(HS-FS) device variants, and those are really the recommended production
device variants and boards TI will provide moving forward. Hence, switch
the defconfigs for those boards over to accommodate those now-shipping
device variants and boards.

[1] https://www.ti.com/tool/SK-AM62B
[2] https://www.ti.com/tool/SK-AM64B

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Tested-by: Julien Olivain <ju.o@free.fr>
---
 configs/am62x_sk_defconfig | 2 +-
 configs/am64x_sk_defconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
index 0b196f4cce..17855bc743 100644
--- a/configs/am62x_sk_defconfig
+++ b/configs/am62x_sk_defconfig
@@ -28,7 +28,6 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am62x"
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_GP=y
 BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=y
@@ -52,3 +51,4 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_TI_CORE_SECDEV_K3=y
diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
index ccd58dad68..dbbe16eca5 100644
--- a/configs/am64x_sk_defconfig
+++ b/configs/am64x_sk_defconfig
@@ -28,8 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x"
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_GP=y
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x_sr2"
 BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=y
@@ -51,3 +50,4 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_TI_CORE_SECDEV_K3=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
