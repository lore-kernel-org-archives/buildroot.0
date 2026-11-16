Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A24B606A32F
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H12lx4mG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 090F780E35;
	Mon, 16 Nov 2026 14:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdFBocvpzKbL; Mon, 16 Nov 2026 14:27:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F2ED480E49
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839238;
	b=NAryP5owW8ivENs8ovZ1DNEgSOdl8M/d4WmYbNr1L89vcxXJhjhHQCxafX/Xzn0ZW068
	 /fJk217xW24+xqBy1aA96+HSiTZ7NGVUGDbuhTRr04bP5S+0lo5AKkLtNksJlSj+w8p4k
	 A8dh4KPuUWr0i9/N1KEgD4ybG9FWvWE4K7FT9BzjQunnNSp7kBuQlumj/ldALgZkd2sSY
	 kcDkdyX0Ocy0SjefmRecGtBYUZj6pVpygum/o1m74sn8ByspKKK1Uhy6GOpxJ+LsBZ/b5
	 5Gz4Yvb1IqS2RvZdWJ8tyf8k4NbkI7tGhIZBFU/NpMesZj8C3NpcNBG8KzjcM1Kz2NA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839238;
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
	bh=nDa1aXZH58oC5X7IaVuBsOZGjUiRGJFvJnmsqAKlU24=;
	b=GWK0UDeyz5oFWjs8cZ5t6Sr3bE9EbN9s+eywx5Futc3KHjJVZbGI3aiYHg2nb8BH2gGi
	 CS35bmrUWz0Yadsudo2byo1OMpdmPuMcyFn1fNqgQRx+nhFUx5V+vHgCmBizV8KQT+FOt
	 6wkbH+kn/3URXtewBM2OMoJwg3EXOaQHN1JjesF2sC6NaJX08YOMLKJTGO0XtVgaRCw/K
	 hxbend6BwQsI0ugg6zFX8Ra/n90Kd9UK8o7r+hwGYu7RPd0mcswVXVcEc59tohfmzpmw9
	 B6J2iMjfaeRUWGXlIEfrUJQhIZFtdstW8dBc02bgLnWRqCtC1DCyyQI1cs3Q7wIojcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839238;
	bh=nDa1aXZH58oC5X7IaVuBsOZGjUiRGJFvJnmsqAKlU24=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=H12lx4mGYxxzStk3JjwGoKgWz3V6a5+N1NHyD1g+Dg9OOzZexey+Vj4dCzMVzdWtW
	 POqSukgL7x7C4HmZ3NMBsD5D1Ul6e2XYzHS7ZgM5c5Xya+3K/+mD2tZJJZvtnY9Aqh
	 MrMdxHUWUjmmprgZ42n60nT2AhU0kJ6GoAx4f7Kcx6ar/mKxvHEeMfDP6wrjrFQqSk
	 L0PM6LTwiZRTAcXe3IyPgTxAafWHhXjMllQvSw2R53MSnkPmzRMrR4aEz0HM3wm8Ns
	 QYhcZu7eTrbmOtmvdQecKqcSL/+nlf7+fQOFj8XELdLweNNPFW00fR6xaM5uEVwNj7
	 c3iug4JwYW3Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2ED480E49;
	Mon, 16 Nov 2026 14:27:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B54728C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 411E2607B9
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhQf5Gi9mmp1 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:27:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 39D02607B5
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39D02607B5
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:14 +0000 (UTC)
Received: from CH2PR18CA0029.namprd18.prod.outlook.com (2603:10b6:610:4f::39)
 by CH4PR12MB577729.namprd12.prod.outlook.com (2603:10b6:610:520::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:27:09 +0000
Received: from CH1PEPF0005BD61.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::4f) by CH2PR18CA0029.outlook.office365.com
 (2603:10b6:610:4f::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 14:27:08 +0000
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
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:27:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:27:07 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:27:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 08:27:05 -0600
To: <buildroot@buildroot.org>
Date: Mon, 16 Nov 2026 14:26:31 +0000
Message-ID: <20261116142632.1699007-8-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116142632.1699007-1-neal.frager@amd.com>
References: <20261116142632.1699007-1-neal.frager@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD61:EE_|CH4PR12MB577729:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ddb831f-d99f-40f8-125a-08df43edb202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261022115727099003|261021121427099003|261022075727099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info: pTPD0V9jdoussyuf2ZVSqzh57ZPpCRXjAAdB3/3UR0Xvvk643nPovPLgAr7oe/Uz8pGUlEtHN/1Ub7rJ896s4SpcFFEYjVqs2MkFnlyFi6CthbF7Db1xNPMkrb8GDzqGo6Z3m6kH+UR3I5iP5bkoHXO4E3xJDFv7kksHQ8Tmu9qZWKRsiTB10izQzRJQqjMdzPwiVC4RJ6CiSp2FHBOBCkwNI7jjEFK/elkDq5JxtlGZwxw+NJq0WBTPFfum9Xac4uaWW3KkinkPcWjC8i1iEqmaz0owjPBf/yiVdTD1D3kg/foKVsy+5aDdK3iJ8PGOfQ6uP0jAuPmrNhZsL1R+tlWfSEm2Q5obwZZaHrFrZCPPdO8cTG5y7iXO8PxfzvIiAoT5LwdaDPbChEt+zbBaMczKnWihDNA4f8mGJSo2Y8rf4rZ/bZ0BF/2vVun43ss9KDYdWVQWMqBMnXy21CfN0pXTe0N7s/5YOiWul3jU9EL+U8dBgOIXGqFgH5bFlcBdpNU3gYBfSXA8v5zibLqKuzipw1tQtFSE2HY45DRpLVkJY0AWxymh0omcwIQEq891IeIZsIvYSkeJpzCqqPF8GXVzNi6qSr0659+8gxamlGLeI/cPQ9hGlHAigRVzazSbx5jZHUz9q5xqA6OZNm8wGTtULN+zSVMa3Bt+a2tNwvhRshinMbSca/1FV2nAzQyDuiJTc9CoBZGUc3LCLd5uNGzFykCbTqGPkqdOLsSyV1rPslaA7aOTHvP7lIQr/ErmoHApr7LZqjc2wy6+5ieRPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261022115727099003)(261021121427099003)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YJTv7C7UQ69cgdvqEf0h2T3BxKpcqqrr64qWmKAWhP8wIyHpbXwrYqPIhH+jcx2weogAgP52VeibbToZ4oa5pYAef4BYH/AYdOh9X05H5YeodQfVeDa80ieoKXlTn3hSmBQpKUwT8nO51MCX44dtSSCzu4rSv2F9hI2SFUT9sKeYww2WsHwIMNKDKd9u3Zhk9ch1SEZYTDK48KXniS2R51jqjnnnzoare+4QcGxO8066eGSNFkuugygQoJ6upaRL/gNq8Nen4DKtyimDLS6LkuLohFw3g7kI0dhyHlvh27DXjsB4RvDKNACmEZYYV9UKCR37Dg6ctTpPSCiprHVQeFtN17JBXF/3P7oZJq5RSWoxjyR0dtlyilbE1DQrpc9rytKoPFE/607mNCTSXwxIdL+nqJ24kaK0YQiRP7tkK0QALdheWw4U6BzUvKo9ULMD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:27:08.2147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddb831f-d99f-40f8-125a-08df43edb202
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0005BD61.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB577729
Subject: [Buildroot] [PATCH v1 8/9] boot/xilinx-embeddedsw: bump default to
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Now that all Xilinx board configs have been bumped to xilinx_v2026.2, bump the
default version of xilinx-embeddedsw to xilinx_v2026.2.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-embeddedsw/Config.in                             | 2 +-
 boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash | 5 -----
 configs/versal2_vek385_defconfig                             | 1 -
 configs/versal_vck190_defconfig                              | 1 -
 configs/versal_vek280_defconfig                              | 1 -
 configs/versal_vpk120_defconfig                              | 1 -
 configs/versal_vpk180_defconfig                              | 1 -
 configs/zynqmp_kria_kd240_defconfig                          | 1 -
 configs/zynqmp_kria_kr260_defconfig                          | 1 -
 configs/zynqmp_kria_kv260_defconfig                          | 1 -
 configs/zynqmp_zcu102_defconfig                              | 1 -
 configs/zynqmp_zcu104_defconfig                              | 1 -
 configs/zynqmp_zcu106_defconfig                              | 1 -
 13 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 03488a18ce..65bb57088c 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -22,7 +22,7 @@ if BR2_TARGET_XILINX_EMBEDDEDSW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 	string "xilinx-embeddedsw version"
-	default "xilinx_v2026.1"
+	default "xilinx_v2026.2"
 	help
 	  Release version of Xilinx/embeddedsw.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash
deleted file mode 100644
index 35d443e965..0000000000
--- a/boot/xilinx-embeddedsw/xilinx_v2026.1/xilinx-embeddedsw.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  c6cce76eec367bda35c0c02fea18b0cb913b57a30ae809aa803e4c8c64e6991f  xilinx-embeddedsw-xilinx_v2026.1.tar.gz
-
-# Locally calculated
-sha256  bfcf86c2e567dd91b311be961ef0a144934e1c79f8b9c4518d0a65e44006ea5d  license.txt
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 43e0b446ef..da17921faf 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal2-vek385-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 1c66c2ddf8..6f34f7dbac 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -39,7 +39,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 5d91d8016f..9fe662b7de 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -39,7 +39,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index b4058969e1..d34d6d8754 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -39,7 +39,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk120-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 2e756534e5..48ac77faf6 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -39,7 +39,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 87e9e7c1f5..28c6828cca 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK24_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 63b2f2eb59..9500755a97 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ca79a3a0e0..1aa4d72898 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index e1d0eb0d84..15b31bd6a6 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -44,7 +44,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 6a54b38233..caf5998236 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -44,7 +44,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 2af93f7cc3..8c2f677cc6 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -44,7 +44,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.2"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
