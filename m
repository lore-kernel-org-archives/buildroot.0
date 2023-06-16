Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C457EB64D9
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 00:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C7A41FE1;
	Fri, 16 Jun 2023 00:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C7A41FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1l9poh6WBGu; Fri, 16 Jun 2023 00:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0718641F4F;
	Fri, 16 Jun 2023 00:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0718641F4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A673C1BF286
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B13E60BAE
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B13E60BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kX2Ty_kp1TEB for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 00:37:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E8C260C15
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E8C260C15
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 00:37:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35G0ODw1098606
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35G0ODNW002453
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 19:24:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 19:24:13 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35G0OCSG015831;
 Thu, 15 Jun 2023 19:24:13 -0500
To: <buildroot@buildroot.org>
Date: Thu, 15 Jun 2023 19:23:56 -0500
Message-ID: <20230616002359.4139814-8-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616002359.4139814-1-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1686875053;
 bh=06TB1z96w/aOyRlNU3Dp9xF8N1/pGmK4M5XwfYrIMHg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PIz/Fg2hNwGVmS8TpqMrRpNoZ5yJ8GMQnfA9EIAnHPrnBPrpjRrbfycNsiNHsVaED
 h/F5zBUDGSdout+Rw5Q06G7VcffEZXkRXCWIy/d1oC+ezpDHPl6mJP0SneSrE9YbdH
 0eJOawEsxke0QaNnJZWQ6Xigr30Xnd9aUlvD9Yjc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PIz/Fg2h
Subject: [Buildroot] [PATCH v8 07/10] board/ti/am62x_sk|am64x_sk: switch to
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
Cc: Andreas Dannenberg <dannenberg@ti.com>
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
---
 board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++
 board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++
 configs/am62x_sk_defconfig   |  2 +-
 configs/am64x_sk_defconfig   |  4 ++--
 4 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/board/ti/am62x_sk/readme.txt b/board/ti/am62x_sk/readme.txt
index ccbb24896b..9c7c8818af 100644
--- a/board/ti/am62x_sk/readme.txt
+++ b/board/ti/am62x_sk/readme.txt
@@ -12,6 +12,22 @@ $ make am62x_sk_defconfig
 Optional: modify the configuration:
 $ make menuconfig
 
+Required setup step for High Security HS-FS and HS-SE SoC variants:
+
+To allow the image signing process for various firmware artifacts to
+work the build process for HS-FS and HS-SE device variants is using
+an external 'core-secdev-k3' package which can be obtained from
+https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
+To prepare building for those device variants create a local copy of
+the 'core-secdev-k3' and export its location through the
+TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
+HS-FS device variants such as populated on the SK-AM64B board, or
+customize this package with your private signing keys when using a
+HS-SE device variant.
+
+$ git clone https://git.ti.com/git/security-development-tools/core-secdev-k3.git
+$ export TI_SECURE_DEV_PKG=$PWD/core-secdev-k3
+
 Build:
 $ make
 
diff --git a/board/ti/am64x_sk/readme.txt b/board/ti/am64x_sk/readme.txt
index fe83c675f5..51d0312726 100644
--- a/board/ti/am64x_sk/readme.txt
+++ b/board/ti/am64x_sk/readme.txt
@@ -12,6 +12,22 @@ $ make am64x_sk_defconfig
 Optional: modify the configuration:
 $ make menuconfig
 
+Required setup step for High Security HS-FS and HS-SE SoC variants:
+
+To allow the image signing process for various firmware artifacts to
+work the build process for HS-FS and HS-SE device variants is using
+an external 'core-secdev-k3' package which can be obtained from
+https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
+To prepare building for those device variants create a local copy of
+the 'core-secdev-k3' and export its location through the
+TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
+HS-FS device variants such as populated on the SK-AM64B board, or
+customize this package with your private signing keys when using a
+HS-SE device variant.
+
+$ git clone https://git.ti.com/git/security-development-tools/core-secdev-k3.git
+$ export TI_SECURE_DEV_PKG=$PWD/core-secdev-k3
+
 Build:
 $ make
 
diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
index 2d05ddd96b..033101b735 100644
--- a/configs/am62x_sk_defconfig
+++ b/configs/am62x_sk_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am62x"
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="gp"
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="hs-fs"
 BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=y
diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
index a26e38a043..096dd77f6a 100644
--- a/configs/am64x_sk_defconfig
+++ b/configs/am64x_sk_defconfig
@@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x"
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="gp"
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC="am64x_sr2"
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE="hs-fs"
 BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG="evm"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
