Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83EA606A32A
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fpk4rG0H
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 963F7406A5;
	Mon, 16 Nov 2026 14:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4lzdyZVy6A6; Mon, 16 Nov 2026 14:28:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 73AAE406B9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839281;
	b=OyjvrTYYTfmu9i7aWNmJw+ndXk6++djEr+SDBesRfF/EdmKojgUHjpfLxMyot6pp7cA3
	 gnyQjjT5QMVEyG1afmULwCMnqQKpDcZyseQOAGoM0D+9Yjk5oSxv9gF5iYOwpHI4SzgRl
	 JzvbTffdP2/1JlUf+ddG/5RsGwdq8Gl7rNKwBeS+L105QhNeN5djbaewUZ35XDT8Pp2d3
	 8KRGBk9busjb7fFBVqXj04zUnACSnnpLXhx9opJuUWqUmrPiZ0sRDq/8I0erKa+PDTbwi
	 71bCC3pat3Qyk4KImMtKDgDvLyp0ETwK4RAL8bhp7PN2++5kQHylO+rc6vm+MdGPvFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=Ls3DJUoo/E0/N1HETA1VYjYZ/Df3q6wUdU9Km5WyRrM=;
	b=SQYb+CAUgF9+kBy09kWaEdwFOd21aKzFbK2lnTOKDzZeZ6/MHlepS1mobO07OduCuKG+
	 o6Po0a73vdOo4Avido8g0diz0ttPAr2YqxWrJ2SzYefpFsTbJ54ZmhcnXK1LhCjl+UN4c
	 xAO6bZGhmdN51yiVWKJHcM7o3Janf3tS73M3mUkbiej2y+7j4Zj/cIIFbPZ2OROmhlIZe
	 ZXe+i/OgNcPo+fFEn7KkJaQLi2SLMHXyyE11sjcUmNZiBQ3fTJ6/7eDaZICJBvPYfBy0u
	 OZ2lqQMOEtPTRt3xgC1fj0aUsoSmqYMDvHHLOHhIi2B6Dh6X1P8Y9Rzrcf642mRiokQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839281;
	bh=Ls3DJUoo/E0/N1HETA1VYjYZ/Df3q6wUdU9Km5WyRrM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=fpk4rG0HwwQL+GhbtTW8xwkQBc8+wzXAWsd8krFtXYk+UU5TcrLKMtlz7M6PWuTUu
	 8fn7dcx8a+6UhGqhnkIVOINKg9IuqRy+GJ9uWl87sXMASnU0UcNCZGUdIndlqL2erH
	 u3s8ZcmSc8MLIoadSs0ODrIZLOJ0tSba2x5/KlDFQatiWX+Rnx/8zGqrAdI9X0a89e
	 9q1xdMfNKlOCKy7UaSu9KRLgedtJu4ayd8X1/PgVb5ByYa5SxwLZFI3d4dOSNdUpRM
	 t5rvpfUM/A9HPWUqFX5z7SpLBOkI8VU82iSKC52+RXQboiUipawboVsFsYZ7qgkKgX
	 rU6SyFW4gM5+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73AAE406B9;
	Mon, 16 Nov 2026 14:28:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A33109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EB5F40274
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHA5eewcFUYX for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:27:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 937A04009D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 937A04009D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:58 +0000 (UTC)
Received: from CH2PR14CA0040.namprd14.prod.outlook.com (2603:10b6:610:56::20)
 by PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 14:26:52 +0000
Received: from CH1PEPF0005BD5C.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::76) by CH2PR14CA0040.outlook.office365.com
 (2603:10b6:610:56::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 14:26:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0005BD5C.mail.protection.outlook.com (10.167.244.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 14:26:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:26:49 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 08:26:47 -0600
To: <buildroot@buildroot.org>
Date: Mon, 16 Nov 2026 14:26:26 +0000
Message-ID: <20261116142632.1699007-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116142632.1699007-1-neal.frager@amd.com>
References: <20261116142632.1699007-1-neal.frager@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5C:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ce02ba-52f8-4964-e033-08df43eda725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261026140227099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261022115727099003|261026121527099003|261028144727099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: Aqr4cUwfR0LHKv/FjU5GbNStN7lxBmC/Z+D6IlGvOOGg9nBKkuK63bh8F8oPxvA5kXE+mM/nDPrXU0vxbWs04jpjSmbzFC5XCFoNYxhb9HXQH4SrFVQ1EspHtpAagEwF1vi0Hpfbxd7V3zzSpkKfHK6gyCCyaS+IIiErqCRPmiw31XL7V0TuULs+0Qd6yAC+z8VWfLEz1RuGf4iNvkEhTEp4Sp+cOSqXzqKARmdkGQzXvEEiNUVbdDNhEx2F0jCp+j0EQ4qKIvYkUptP92XX5P2p5Abzb9dg9QxMIGXhHvpOePTTXKQaL3MtiAQ4VDF7iV/mXGPK+V5xwR7C1xXrFw4+kjoUzMTxzQemVnjD3RG/nlxE4xNczhxEuvb0c5esJSS6b4HTTpqlJZjWh7XmD7cpeOAAXHAbHWJqzkU43dQ8cjOc21Bx5i+6rpt/2IiadUM9/HDFouiXzpT8FtwbwMcMSPayj3cpryER9AWIw6I6EjED6i/F5tZlhMCOl5MvmOv8r6o9/KrUWDScNCgzMWffjmVQzjg00mRglAzwM8vvnHAEwQeyW/saCaMcxhu/h76e7rNmHNJfrQ6CB3QwmfOnJGUZDea9eUovPaJ9QeMR5d4iUAVPRW5dk0Kpck4j2WosiuPptR/KlRGI2H55DcVb98x6Ysk1IK2kTR9j3U9AKd70x1yuzZ7XnmziQvJtf+auKVET3IhJyjpg0LD88L5gU3MO6jRVFFBhXPnGNVmA4XwG/CJdr5cOLHE4EM4nW3D4MRUH7hnFiEyAuDtArw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026140227099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YNtYSU9z/iYfi+iEl2AmCC/fZG6JYMgwVyrQ4bJl/TSMSXPWm3iUcGe+c7yiwHlRUkKwaBPq8LbrfcXCitQKSHgj5Hqp6i2beIq+rb/h1JA0AiTQSJRsgpe3u6dnHG32DipaTwizGQ76EQ1KS63OtxrAITmqPHXBr8KJu/r3eEXONd/Eg+wqHmy7ddYTx+XMcpUlBCsgP9Ps5i277NOpHQx83hZylKpDNaLwtRwnGHFY5x1LFIaDnFS1rG3+Feoy8sJn4K0uFz7tQ3vsb6LEJTybdM6yjrze6t/y+Q+OIqL34UYK7NXV7qb1FaW5ikXbkDjeVDAAPsRBtmtlYvXKn0SfXQOkfhewpiopGTgWBmQEt9YK1uHWmrykHOkZ6vEtXooHi5r6giqowhR7tB+DX916zbGKe1Jul9/82sG10EgTls9mwn/a1iEWoJ7KOzOj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:26:49.9937 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ce02ba-52f8-4964-e033-08df43eda725
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0005BD5C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203
Subject: [Buildroot] [PATCH v1 3/9] configs/zynq_*: bump to xilinx_v2026.2
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bump zynq defconfigs to xilinx_v2026.2.

xilinx_v2026.2 includes the following software versions:
linux v6.18.40
uboot v2026.01

xilinx_v2026.2 was run tested on a zc702 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 6 +++---
 configs/zynq_zc702_defconfig    | 6 +++---
 configs/zynq_zc706_defconfig    | 6 +++---
 configs/zynq_zed_defconfig      | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index fae1abc60f..2f18de0b98 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.2)/xlnx_rebase_v6.18_LTS_2026.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx-rebase-v2026.01_2026.1)/xlnx-rebase-v2026.01_2026.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2026.01_2026.2)/xlnx_rebase_v2026.01_2026.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index e3fe95dabf..55f1a98791 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.2)/xlnx_rebase_v6.18_LTS_2026.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx-rebase-v2026.01_2026.1)/xlnx-rebase-v2026.01_2026.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2026.01_2026.2)/xlnx_rebase_v2026.01_2026.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 2bb670d8d9..60db61aa4f 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.2)/xlnx_rebase_v6.18_LTS_2026.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx-rebase-v2026.01_2026.1)/xlnx-rebase-v2026.01_2026.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2026.01_2026.2)/xlnx_rebase_v2026.01_2026.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 2c4db8bdad..e51695ab59 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.2)/xlnx_rebase_v6.18_LTS_2026.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx-rebase-v2026.01_2026.1)/xlnx-rebase-v2026.01_2026.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2026.01_2026.2)/xlnx_rebase_v2026.01_2026.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
