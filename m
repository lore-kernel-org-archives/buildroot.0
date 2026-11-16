Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080A8606A335
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ibhkbC71
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D834680E35;
	Mon, 16 Nov 2026 14:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LW6bBDEOf4_0; Mon, 16 Nov 2026 14:27:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E752C80EED
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839249;
	b=R9mDGRStXXTxrx+MU85+ahaKJKztwNKrgIR2jUwpxtWs4kgcvQyymlIKxHGrm73le+MI
	 wRDGzUjlnT3PiEkxbxOs3VWuirGyg7mPy9OK+6UtUpKpGAdS+rKP9OYoae48IZJL5z5el
	 95tQ+pwxnZZI4Bfsae226FvuA9UhfNrDDVpVfr4DR+f418Q3PK9sPWew6ynYFW+vs7OFt
	 JX46eQO9myRTEvTKzvc8w1BKpGHogwXjWYzjTCBGbUT0iMbKVjM7CGwvho3eUTNoCBEQs
	 2oTK1MY+ezLI/MloTmzo99g/DAzbaBiCqXWN/n+UfmrQC73AYd50taufT9vi/XsDjAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839249;
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
	bh=QYUAKi50hYSB8YPAYmz1dKyYJWcr7PHZkkOL/mkC9p4=;
	b=NiN0beuBh7KQj5ys5Xdg9L+cy8EY8vbTmNtyqZw0V6roGboZVWf/RhVdRllPhH19VzeU
	 I6ozkaaJtfWU2XhsLzoFMIsGOzJVZoIL4NXa7DFAOjteY0Cqidmr0fklD4lNfmpbMkU8b
	 3elZhF+x3WzrzewLrn18CT80pIhCAX/6URlw2HleRtZn7m67A/PvHnNAFsE86RhwejjQp
	 vdPnWtE+qanj4jSD/JCTLjcklSDYgoz3U74JJlqcYd9b5xgzxKxH+wqHWBiMIqkps3TiK
	 vOBEZiYpx5TRBkvXQffiH3nFhQ9dba5kCn6p5XaA0ynixL+XXZ31yR0gc0TeRchdVSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839249;
	bh=QYUAKi50hYSB8YPAYmz1dKyYJWcr7PHZkkOL/mkC9p4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ibhkbC71/9jwDDffc0Rf8u/eoggwGkGqkqyZs/I8irr7k697pPptYZyqFia5xytxO
	 pQGFVVn6BhpTeiAwH1jGp0jEl5UdO+mFWe51sKWUsi37ek7qQsnRN9VWjacWHM+9v+
	 u+cSbcbY1ADYH5ifRDzBHNYhWXfRqy0TqS3Q4pZM0JzqkA+BdqsyaXMY0QEX/liW4x
	 akbhsJrv1n+VVWhF64syQ8grUv/lmhyrxE78+DJkR7C+d+ydZ2v/UWsAEWcPJSKZ0l
	 i1l4fPs0dNaK5bXxP6VnQ8YnztHlbVyHUM1jaoQQ31g9d+laaq70I3/pMcZ3FyXhlf
	 0nGkpYkLm3Z3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E752C80EED;
	Mon, 16 Nov 2026 14:27:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD4728C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D27DA40274
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKtZ-kre7ciA for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:27:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 20BB44009D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20BB44009D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:26 +0000 (UTC)
Received: from CH2PR18CA0010.namprd18.prod.outlook.com (2603:10b6:610:4f::20)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:27:10 +0000
Received: from CH1PEPF0005BD61.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::c) by CH2PR18CA0010.outlook.office365.com
 (2603:10b6:610:4f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 14:27:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0005BD61.mail.protection.outlook.com (10.167.244.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:27:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:27:10 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 08:27:08 -0600
To: <buildroot@buildroot.org>
Date: Mon, 16 Nov 2026 14:26:32 +0000
Message-ID: <20261116142632.1699007-9-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116142632.1699007-1-neal.frager@amd.com>
References: <20261116142632.1699007-1-neal.frager@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD61:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 48050483-0f78-443e-343d-08df43edb363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|260925021911599003|260925022911599003|260925021311599003|56012099006|261021123027099003|261021121427099003|261022115727099003|261026121527099003|261022075727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info: MIpEfwrabYlzs9pHpy4q3y4PJ+pIPqaQ7nLPQZbebu60bfZ6ViF+iuKJZYVoiUaRjTvdqlvn74pxIqMpRO+yDjMY42gZwEyQ3Hxhtb81zJueUNuwEcMNL5oWuwtjpIQUpUC162vcqf5QXXo3GMEHwrbq2+0KhR3rivslJBkmD9IbTUgvc/HkuTNroG3Fs0BBAjkuXN8CcosWkVciHy/Z/0Ca42vx1ylJE+oguAOo0nvA9DJNbEO3FftMD7tMpxjs0sh9+3IN+PCBvCGo0QNk4x94qCGgQ7k2k6ZbI8wbx5rekXPx5goD5GWKw93hEBdII9tMh1vN+gFyLdGdKC3PBGpr2WbrFqk5iBTrum0uWWPXH4WYpCmjd8ZPkNM6k5pLFbnlB7eW+tyS5GYjlmo1HA48hyao3/AUwl2A4/XyIloLidchipySGaMQyZf8SeklVtDvJuHqZY/+zpTaDAb0a9LEtkQXlVtFpSlNc+MPRInbm66dERDS9lwpFanlnpMFYKtMKDNUuTauKuGkxVY5M/sW1CPGgtR3sUcttgs7r4NVZDc8DYSayleQi5CZTPb1VdiRqijLEjSE3+kXx6P5lfXxk10JPsLpNmV8Qep2Vr3C5h5KS0lHrj+W61Bn1n1s5F7vuVyB/VNS3ADiU9yORxHrT+Vu79AEWXYbE9s3JwH78qhNKz99TouEtoqIdVV4mJnlP09HNEUiO0n3HqBog3y/FDmkM2harxpsxPr7VqyXUxzVl1s+zWGUBhuhje9EA5CkCaHDvwuLs1JVji9nlQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(261021123027099003)(261021121427099003)(261022115727099003)(261026121527099003)(261022075727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v0ag/vC0mN/0rA790CQVPucrBTgztVZZwaGz6Jb048GQeGMlpX1OUhEKjJSF4wiRMhoEMFGChwy96Lee9FwwgGIXxF51GPAQOUak2lr+NkIKNn/+eXRt/8z65KfmQOnn/TWZVk/ceJSZNxlwPguOIgA5ExlXMqwigR9YD8AISVjZwGSVwxAjMmgETMUM7ZFpd0Ki6cKI0GiIHBOSfKqyGjvzKgzJ8xHJCSioHsTIlr6gfDyNS1gZSYooy7CJzLZ56jAZoT3vpOBRxRynvOkPS7OmidqDAza3/JHiQIvREUm6M0nqnIM2tBIOlC2dx4p8A4Z2NYg2TkBhW6jPMGantr7Qvy2FE7Tos7uhf4Dka4nCJTo8xGHOXQ22lScwUHHVAkfyGzTieugoXhbhHN0z3/d/DYCriHA8q0rEU38kVoG1p/OG9eSVnqTl/7q20FlE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:27:10.5564 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48050483-0f78-443e-343d-08df43edb363
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0005BD61.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342
Subject: [Buildroot] [PATCH v1 9/9] boot/xilinx-prebuilt: bump default to
 xilinx_v2026.2
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

Now that all Xilinx board configs have been bumped to xilinx_v2026.2, bump the
default version of xilinx-prebuilt to xilinx_v2026.2.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/Config.in                           | 2 +-
 boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash | 5 -----
 configs/versal2_vek385_defconfig                         | 1 -
 configs/versal_vck190_defconfig                          | 1 -
 configs/versal_vek280_defconfig                          | 1 -
 configs/versal_vpk120_defconfig                          | 1 -
 configs/versal_vpk180_defconfig                          | 1 -
 7 files changed, 1 insertion(+), 11 deletions(-)
 delete mode 100644 boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index ff129ed5b5..721162cde4 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -17,7 +17,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2026.1"
+	default "xilinx_v2026.2"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash
deleted file mode 100644
index 4e82561cb1..0000000000
--- a/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  6e02391f0dae67a46efc260729901da9c110b956880d0ff2617701f8b6cf0e1c  xilinx-prebuilt-xilinx_v2026.1.tar.gz
-
-# Locally calculated
-sha256  e4a8315687fbd55fc6bf0965c968bd95c8b73b8a957bb10b2ba618d5390b0e3a  LICENSE
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index da17921faf..3cb8868045 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -48,7 +48,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.2"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 6f34f7dbac..071cb3cbaa 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -42,7 +42,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.2"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 9fe662b7de..10a2b00df6 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -42,7 +42,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index d34d6d8754..3175ed5cef 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -42,7 +42,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk120"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 48ac77faf6..d5036faf63 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -42,7 +42,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
