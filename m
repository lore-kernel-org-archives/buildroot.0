Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B43606A883
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VMO6H+fc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A00926067D;
	Mon, 16 Nov 2026 14:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUGFfmGGce_8; Mon, 16 Nov 2026 14:27:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7AED607B5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839244;
	b=cKa4+3B6zHqyOinckh9T2RnKONfnE7K/A7IEO1rayrc1SAFLWLeLVP7JFeSLfVrbdXwQ
	 rCxMBylpeLObzhy4GOO7bL3ZSzgAOIcTx849W7pB4EZ9C9iEroNa/X0uT4oqCHwoptcaZ
	 q2KpbiUwKKgN7fErzXQ24ss15c8risB6HhQnxk5rjcAu7B9qvuHsDeBMUuErBqD9qkd5/
	 S9nZzbktFgL7Aj7UDGjNg83B4emP8fp/6QRyazJsci+MtnKkjFyAWDDsJwKvRDgsdNC2z
	 NaQkJzpDF2A7zKqt6ebHmlTFqsYGbydySQO+vGwN+v9aVnEd42HLw+yslQ9T2niv+bQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839244;
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
	bh=OvrTHUg3xcbkA16dnky6hqkx1Z5wWj4pMq+ZguHTK3c=;
	b=T2M0VkZmTZn8vOnbgPomN1nWwsmKihqthAEzd6zbRS2RCVlrD3qzyJhX6qPUzEhGXtco
	 a7yCx3MepH9rKQhmJRb8QNG5rj4bi/xZT/2cghb24k6uyyV9V9ukuwvYRNHMdu9ZLQ/mQ
	 nfvyyxxCvfUPDE7OKUDXomqyDHPyazrvweDOdlOtFzhT+r2wzqOHEv1+jpDJJ8KtAM+Yb
	 WtjQAfPQE3q4BtXvnNgpIx0Yq48RQdWmpEdBaEA3/BfiCaxOFxeh2UoPitT89d/9G4G/6
	 ZGfm6Yo9/DuUG5aJgeQ9TMUHErIkfkhoaITpPQDWiiBJpNeM+E4tCDAWnjV7pDrSlEA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839244;
	bh=OvrTHUg3xcbkA16dnky6hqkx1Z5wWj4pMq+ZguHTK3c=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=VMO6H+fcrF/qZ65VOW+hFKr3AMQQxSERE54UowdHVjkySxbGWm+jX65ng1lKVWCQG
	 hHi4Dk/4NmtesOpl5xA9fLIOL7CTgeKXh+t8sikZDuxTZZMabE71Q3s9+DmETpjImq
	 +EcQ392pxU4XC1k6+8sSWSQxrQHpCIoFNn45rjkbjfYXCjLK2oILG28OcwkTl+wf9C
	 UUMAkwVOZODdu7QtrxagPKEmgamRHZhBR/R3aPx5dz/XpBRyLiC920Yz5YOfmpnRy5
	 4Iri5WbxX/oEVjUybINv1RFNiB4etRr/sux6sVMIRdnDaegp11VR2+Bcl5tM1qOU8o
	 HvE5JnBaJlOzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7AED607B5;
	Mon, 16 Nov 2026 14:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76181109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67BA440274
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8N7k24_54RZ for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AEDF04009D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEDF04009D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:27:21 +0000 (UTC)
Received: from DS1P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::11) by
 IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Mon, 16 Nov 2026 14:27:16 +0000
Received: from DSM2EPF0000000E.namprd02.prod.outlook.com
 (2603:10b6:8:44e:cafe::55) by DS1P223CA0019.outlook.office365.com
 (2603:10b6:8:44e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 14:27:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DSM2EPF0000000E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:27:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:27:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:27:03 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 08:27:02 -0600
To: <buildroot@buildroot.org>
Date: Mon, 16 Nov 2026 14:26:30 +0000
Message-ID: <20261116142632.1699007-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116142632.1699007-1-neal.frager@amd.com>
References: <20261116142632.1699007-1-neal.frager@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSM2EPF0000000E:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 23359819-d2db-485a-6960-08df43edb5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|260925021311599003|260925021911599003|260925022911599003|10067099003|11063799006|56012099006|261021123027099003|261009223027099003|261026121527099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: UyPQHX/jWklce1cfkWhqUuLhq4jUNzNHVGuBsZQlUvgvDL795yyEofq7+PSS8XNvHbSeCk42PPHErU/EY2zYSuYGNMNK8iqXl8GXw59ISaoM0yJmQok+WX0Vs1aPlgTZXmq9J4pncc2c9AySvLXADJebJIkOy6biR6F0WxlaTp6FEgtMK06wTp293Yk94KsLBmGryaM2KmoWh65MO2/V1QIaKlzV/LxpPACi6+rxTyAmVDYsdbxH3yjZfdp0oJs1kwGZyRe1Jyo8e/W8+rBEIr3I0NUPnYJZayXLMfL+kIfH9LUWk81mr2FmMJ6FTgjcJdxR/rCRcXxebUcnk3JiHWsyoJ3LVGTFXeegF8dL5uyFFa8vP5lxuehBqm1/0v9Fw55QA1xSjcdJRA+9mvP0T4j9dCUe959bzdNPgFL6MTQeZZZcvcmH47RLoFW1VYMwcmS0r8Fp4hNz4tDN9DDxALuyzpGC/vYKcV8AONEj9H7oRuuCNeunqYQxOgBbKqRMJRkXmqKTZkt7L8ZjcLW66varC6dmOTD2yEIsE6Aed0UV8nZ2imQAK7HELbf6e236vfoT1gbyGgZUM3oOaUsk+2iO/G3gQDL1AdrnNrfS51C637XXHvMwBlb1EOJ2Q+4DC5mDNd2ibrUG0JZjK4W0IrGTV9+Wf2zoYW3mytTGPUOZMvFJMpI/PdLzYRwm1XI8Ty2yhN4N+RDzCpHvFb1/MWQewUkS5JrPiG6LcxGEbKsXtlwYFhWQHUkH6WbP3mVXpy9ZT9WMulj6k69x71cKYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261026121527099003)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UG/aATRL7OTkuaJME/Nx+Kj5xDYMfhc8cR6sxSV4I1KiUbN1I3nQmt1gnKxleyxeHeIPFTEJ6Xpq/lUmc4Oy+ckGkj1YpxXyAA363iObO82EaQcWJhNNDbD2xngcps6h3d9FFU64+16FzheLErbsOVzsqum2WKBwFr65Nw7XXYYR8Tcwu4pFX2gBdVgo4zQlRmiX/Y61K91Ikeeo6KLKU2Zk7gzHlAx15i7c4zDX9HRZe6fvSVLGG23Fu2S2ocKnLPjIYO/vnuDJIRuj8gAjp2+WAfn0Qa5F4PEoV7RBWI7/Gk/Pok2AkYhX9S4kR7JICLGCy/S9z7zNcUKi6LsJSPc+M8M7bThUVnR9U3H8kGFEAdO+d1lxqWcatZTN2TlbVY+A+sO+ne1L+slJOIrJKfcxCGOq5OT51a9j2Ky2/aoUosZ1wOID4j0UY7Dr1Y4l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:27:14.5494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23359819-d2db-485a-6960-08df43edb5c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DSM2EPF0000000E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
Subject: [Buildroot] [PATCH v1 7/9] board/xilinx: remove hashes for
 xilinx_v2026.1
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

Now that all Xilinx boards have been bumped to xilinx_v2026.2,
the xilinx_v2026.1 hashes can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../linux_6.18.40/patches/linux-headers/linux-headers.hash | 1 -
 board/xilinx/linux_6.18.40/patches/linux/linux.hash        | 7 -------
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 5 -----
 board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash | 2 --
 board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash       | 2 --
 5 files changed, 17 deletions(-)
 delete mode 120000 board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/xilinx/linux_6.18.40/patches/linux/linux.hash
 delete mode 100644 board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 delete mode 100644 board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash
 delete mode 100644 board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash

diff --git a/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash b/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/linux_6.18.40/patches/linux/linux.hash b/board/xilinx/linux_6.18.40/patches/linux/linux.hash
deleted file mode 100644
index f0b8984573..0000000000
--- a/board/xilinx/linux_6.18.40/patches/linux/linux.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated
-sha256  bdb5c40d7b43f8a1ea6ee34e2392a389935120b11cf54c36ad3ccff937b1a179  xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz
-
-# Locally calculated
-sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
-sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index d40bcad589..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  6047af5f352fa7aaacd988a3fe0d018627dcc200dfdf93de0c0dc8072adef828  xlnx-rebase-v2.14_2026.1.tar.gz
-
-# Locally calculated
-sha256  dbc8c4c1042f833ac961730cda41f87b6845068d9b5be2c90726504cfc82382e  docs/license.rst
diff --git a/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash b/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash
deleted file mode 100644
index 8dde8c24ea..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  0d33919008db24241580ac54c355d5c7efb18b089c2a7248704676a769790380  xlnx-rebase-v4.9.0_2026.1.tar.gz
diff --git a/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash b/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash
deleted file mode 100644
index 52fcaf846f..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  bc42689fffa878f9852120b167b871d8294697441cdd9f8347506a30d4024e8c  xlnx-rebase-v2026.01_2026.1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
