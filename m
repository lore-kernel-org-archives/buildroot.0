Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6CD606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qhd2HpZM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 918606067D;
	Mon, 16 Nov 2026 14:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQOFIS3O0tN1; Mon, 16 Nov 2026 14:27:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9B8FA60739
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839231;
	b=NA/GKFC6rNeA3alqMZfmdGck9oR0BT42mDG92uoOUexY50PvZJZ5FhwNbiwQU0Hab2G3
	 eu1UVof1RTR2qMIEwIHK/tVZ+TxtcmgRPnuSNnorGlUUFmbEnnW3JgLivSeqcq3BifXiG
	 V8Fy8NjXpYOSzin67XgnrckheBBaDKNti4EY2lNqp9gyInkR1Yqs+cFtqpxAOkcYPY6xp
	 ZADyzhR9actwWVAWMJ1hKCVALBO1E6iIoUhlFkc+HzvmPnjgzpWaapAVdDf6Pn3LsLQOj
	 MFHoQy76JOTt/cNz7AT+R3ReUjAsj60EZ0F5GxZTW0cqDiatvRVLkb0OZESV4mAywRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839231;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Received:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/D/WtQ+nc3siTmIQoMTPs0FRU/xJGnbuwFMqSJmm2Gk=;
	b=p6T4PD75tDSceLJymCewWTP8od6mDzb8K8FWZygSlJR2EkNOQosG8OxWwZdFtU8mA7gu
	 GI6AWn64RomHUlBxb2iVzQbutripgUceFrnkURXByCGp/a1oeBDPHWq5jM0x8AsFx4M5P
	 X5Vi4xQFaJdAVRHIscva/OvrbbDfF2ETKTSUPUxbm1+Hd8QAntL3FN98Dw4QTpKz6ygQ8
	 Im+8GMnR3GYt4oDTf7Q0YA19NrEspooDEGxb0UUz3i9p0ZHzmx+e3Im7ivznlG/CCDpdE
	 NwrxTIVbc8g96WXCcYvv69BJ4MFy+zhj0XeS1u6tzwe0w+XRtum4JK2D09wqw+D7bkg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839231;
	bh=/D/WtQ+nc3siTmIQoMTPs0FRU/xJGnbuwFMqSJmm2Gk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=qhd2HpZM9Yh1vLVLX2c/CpysFub9F7pvuBsFeQfY/Ssp0EiIC3G2MnsU7faTG/B+A
	 YL9PulWDtPkPzsxc7hOsJVC7eeGJseSD/nKzuThsYfYkzb5QUhZVVWwqsr9lpy3slm
	 wNKC7+Iq0JF/+Eyhe0toRYHDRrjWE+ODJBt/D/Tpzt3GW2mVIM1B7JCbACvm5Lgv3Z
	 WSphLCBggrlsB73BaUhqUuaF9+PG5iEewQwjtlC5PZyqvaLt9UrA/5zMCstxT4Dn10
	 2cTseLM5GfsqtKG0T6xtiE3yPL96ZulWe6arsLcxAQTf9Jo6JBb1h4JR5FqNnnuIEN
	 Ih1eF+xoOBb0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B8FA60739;
	Mon, 16 Nov 2026 14:27:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D20E28C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72DBE406A3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7asNlXL7Hq4k for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:27:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8ADFE406A5
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ADFE406A5
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:07 +0000 (UTC)
Received: from CH2PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:59::33)
 by LY0PR12MB331121.namprd12.prod.outlook.com (2603:10b6:404:226::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:27:02 +0000
Received: from CH1PEPF0005BD62.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::55) by CH2PR03CA0023.outlook.office365.com
 (2603:10b6:610:59::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 14:27:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0005BD62.mail.protection.outlook.com (10.167.244.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:27:01 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:27:00 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:27:00 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 08:26:59 -0600
To: <buildroot@buildroot.org>
Date: Mon, 16 Nov 2026 14:26:29 +0000
Message-ID: <20261116142632.1699007-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116142632.1699007-1-neal.frager@amd.com>
References: <20261116142632.1699007-1-neal.frager@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD62:EE_|LY0PR12MB331121:EE_
X-MS-Office365-Filtering-Correlation-Id: edd1d2df-0178-4fbb-4865-08df43edadc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022115727099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info: 89xLopbVM6xgSYQf+9nMfRx4516ShsLuvlCWlV3GDkJSRWGqMIuMtma2LAUIzzPf+vW5IXrJdG8Askg1uYKjMqC9weN893Mvx65Yi7A5c51+5KPVyfL4CQoTF/dnwDPOoGDuZ1PXzVncEnnqNEJzW0TcEPxi/szDYN4Hu+z5C4tf7Fbbd5ztiRKxPjmhn8XyR/3PwNwsTslOcDZUNya+bkj6C1xEGhox/NN92v0A67s9C908XmB6HurJ/OcM6tqH3vbE90ckWKAOXJvVJoPu1Uxn7USpBW/gtbqJ9FQW0kXtnIkX59Xl1iNbKpFDeNmz3SSItdjq4GuiRQl0TdhZUZwt3gfyYvuGig7Zxy2QnDiFue5slX43XwXpctexDNPKsmuVSYHTi8JEXbcL1MoVPGI35H3fy52uh8t2MloO/EXgUlRDQjTyOiK4QgBKV1pCrqOo1ML1765h6kUq6N2yZXsYW+HIZcOT5zQCjLw42+ywdnfQXrl648dHAuzdOKTH6sBdJ63kqSuFU5fszqgkH59rFEka6fUkW1aqUyk8/TLUoCHCJ/oE9X+glAMYz6s2Exf+KMSo3wav5DoBwGg/2CppUBJy3AscztlBJk+1Az4B9SARPOyj3LjkSax3Nye4M4sm2j1ZErkW7eAkJSZhTYOOFOtPxapmrT24V8JobB9Jw+A/cu5PnteORMAFC1onsM7JHA9LCfI4IFKJEdx/vGmQFvCOpnM/Zt0ghlMQjaYXOE5aZ/iOM6oXlNv7Ij3BmmkHJWaQp1QcmGcto94g1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e/OwHaHQs4weVGTUXgNY4Zn6CiX8pRL+NZuhncwstJ2dh/GEJW3Z6I8Or7GzAhLyQ+a2sG0/cHzIYLcTQZKPqbdaZ1jd6X9DXTwC+Wgf3yMKEJ1XPFNnAQTY3vhFE6x1q2Lt4sO7TXunXNZMKRJSL7gzVdakAscG3+nkBSJKkULV3Ry9Ja3mzs0ul5+FXEtkjtQ44moXfVNfSrwrw/Znv9Mcf6PHiHuujZcqeDqlEsh+WEChiEJGwBL+srypsxIS2iajK9GG2Thv9twLhQm4CHs+nSol/nNQ6Gmye0D7dkxQbrJuwuKeqJH2EpaPENdRUP6Lib5l6SHx/NlARuXB5fYhl6qCxdiLj0KECwSU6fGhzirKRNxQfgx11h+7UUhhC03rSZHk+N9ts6/wt0Xwedzb8GexHuBHCOolP9wL0yZQXd9SPTttDKCaqTruY8vU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:27:01.1236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edd1d2df-0178-4fbb-4865-08df43edadc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0005BD62.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB331121
Subject: [Buildroot] [PATCH v1 6/9] configs/versal2_*: bump to xilinx_v2026.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, arnout@rnout.be, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bump versal2_vek385_defconfig to xilinx_v2026.2.

xilinx_v2026.2 includes the following software versions:
arm-trusted-firmware v2.14
asufw xilinx_v2026.2
linux v6.18.40
optee-os v4.9
plm xilinx_v2026.2
uboot v2026.01

xilinx_v2026.2 was run tested on a vek385 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal2_vek385_defconfig | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 5fe5ecdc62..43e0b446ef 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf riscv32-buildroot-elf"
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.2)/xlnx_rebase_v6.18_LTS_2026.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_XILINX_FPGAUTIL=y
@@ -21,20 +21,20 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx-rebase-v2.14_2026.1)/xlnx-rebase-v2.14_2026.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.14_2026.2)/xlnx_rebase_v2.14_2026.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
-BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,optee_os,xlnx-rebase-v4.9.0_2026.1)/xlnx-rebase-v4.9.0_2026.1.tar.gz"
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,optee_os,xlnx_rebase_v4.9.0_2026.2)/xlnx_rebase_v4.9.0_2026.2.tar.gz"
 BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
 BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="versal2"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx-rebase-v2026.01_2026.1)/xlnx-rebase-v2026.01_2026.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2026.01_2026.2)/xlnx_rebase_v2026.01_2026.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="amd_versal2_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -45,9 +45,11 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal2-vek385-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.2"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
