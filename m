Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10583C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A870A42317;
	Tue, 26 Jul 2022 16:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A870A42317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z1kLZxvxC_tQ; Tue, 26 Jul 2022 16:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF97422F5;
	Tue, 26 Jul 2022 16:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF97422F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0F11BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 259C384788
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 259C384788
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5t2zbSYX63k for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:50:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA76C8479F
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA76C8479F
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:50:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QGogPs022466;
 Tue, 26 Jul 2022 11:50:42 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QGog3K032254
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 11:50:42 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 11:50:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 11:50:42 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QGofBq095306;
 Tue, 26 Jul 2022 11:50:42 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Jul 2022 11:50:41 -0500
Message-ID: <20220726165041.17584-5-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220726165041.17584-1-x-shi@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658854242;
 bh=Y/2wPcfPWWbOrH1q6qA0O67SWUogEtfZJZzDMT0WI1w=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=I4NlJzQUByKLAe4hBcN4rqlB/tgM3SXRTa09qPXBdx4xC+RHdZWk0m1wyRbQcRDq6
 pd/KOCqUoOvoohIRE8PeoD7zgpPwIm434mxhCSwFEU1rjRySAHjwu9xdTyHhP58pmn
 a9r9C94rC6xeqdVUOOfe+qejwZjPIstnYzeVWiJA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=I4NlJzQU
Subject: [Buildroot] [PATCH 4/4] configs/am64x_sk_defconfig: add new
 defconfig
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds the new defconfig for TI's AM64X_SK board after patch.

Signed-off-by: Xuanhao Shi <x-shi@ti.com>
---
 configs/am64x_sk_defconfig | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 configs/am64x_sk_defconfig

diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
new file mode 100644
index 0000000000..629bff6519
--- /dev/null
+++ b/configs/am64x_sk_defconfig
@@ -0,0 +1,44 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_INIT_SYSTEMD=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/am6x/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
+BR2_PACKAGE_K3_IMAGE_GEN=y
+BR2_PACKAGE_K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG="am64x_evm_r5"
+BR2_PACKAGE_K3_IMAGE_GEN_SOC="am64x"
+BR2_PACKAGE_K3_IMAGE_GEN_CONFIG="evm"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="SPD=opteed"
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_CORE_IMAGES="tee-pager_v2.bin"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN=y
+BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM=y
+BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SITE="https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10"
+BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SOURCE="gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2"
+BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_LICENSE="GPL-3.0+"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
