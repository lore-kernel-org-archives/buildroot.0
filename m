Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B13CE9D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE1BC4057E;
	Tue,  6 Jan 2026 15:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRf_q9eWiDLq; Tue,  6 Jan 2026 15:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB108407F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767715008;
	bh=GcNdKggAfvEvAqkbMJt53UODkDwrM4iTjxmNqW4rbR0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=K7pqLfRH1vknrrF8F4nE/jp0vhjdoyFWIKxkiBcHoKXfAGnxcfp5n8/Bh7QElbWA9
	 w0ESOX8A4mBUO5YTX3r2p+Vck7nZkcUq5Dg+rBl44zOHluolh9syiIl/PHApqqkyc6
	 fYiSw/mI24uod+NjsxseecYpJ6wGKZDaCOBCLBYFMgmzB8zjTq63hdwM8MNd3vSl6J
	 L4bGYKfzTTdrF2CX8l7fSvDr/nq1rN8afHIfZB+QBVjOAZwMFvYpDkZP+pqVqMO4PB
	 M+ouLcv9tSMbr/eng6opm+vToA7TKT5NVg/D4mmnzZc6BubDpkc7Flsu65Z8+Q/z0W
	 HK8Qrx8P8MHEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB108407F0;
	Tue,  6 Jan 2026 15:56:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B7372A9
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32EF6407F0
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VB7biv08m-qP for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 190484057E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 190484057E
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 190484057E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJHwrihJfA98FyyOi29cX5wcKOGqVNoEHnkr3ritIUWmPZjQzdA+6qBZ3C8nq864UbtPmfjKFdNnNVZSmKDWcJUukim/+4HJILRZSwUF9rWhVEMKNFJykLU4IYWbtrlWXEjdIPYLc9cM8huq8zA2lL8FIkUTfLN3MvHmORcFdleaFQNOIMwYjCdW0O2vhaejE7BSERzNp2JCP7cexP0ZwlLkaZgqmuNGny60MPdXrAu5dMH/FeQeWtSShB7G6MJjWahRdHOLqkPbQMYSvkxqYjuD6qovnkKUr7B0U/8ixQp358Zy0w9jtxXVz0iHK9kWcusXCZbr5Th03OnBONZW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah/kyktVaK4cEzA2u4EMQ3UERrqlLlLN+3onl+2VUZs=;
 b=wv9oCo7qjpsK2rJdDKxGPH32D8l0OWuUo80s/O/8I2Aty6nKdsYRgZ/Sba9eucQhU+IvjwfLEMFTaYTkLMjYuodMA0yuheiezkkYGptLb1SWCMt2Y9mCB6w6E8vJU6SWBI1NHLIEUXjPbJZuagYDQeS+q6iU7bUW+42kie9sNzO2QazYM8GeumWSyCDBfXK1BKqaapcvSBTy484PIUjbZ+KLME1UgmxHLcGOlYGfEc7YrLHZtalo3Xvty2WzLUsE0NBVG9egFWqpIb9ycRszhSSFhDpVGAFClugue2cmVT86OGSzbeS2Ul1HB9q79eNCbXSZ3HvOk5yOPtp/QYsa0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR21CA0012.namprd21.prod.outlook.com (2603:10b6:a03:114::22)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 15:56:38 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::f6) by BYAPR21CA0012.outlook.office365.com
 (2603:10b6:a03:114::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Tue, 6
 Jan 2026 15:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 15:56:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 09:56:37 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 07:56:36 -0800
To: <buildroot@buildroot.org>
Date: Tue, 6 Jan 2026 15:56:27 +0000
Message-ID: <20260106155630.2404514-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SJ2PR12MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 809986dd-fdaa-4196-de3a-08de4d3c2d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|7142099003|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9raAwr5RNbV2YAVLcUngdicIwN+QH/KTDU9755x/unYLY/NZxzeNiLvOVzQu?=
 =?us-ascii?Q?Uj+WDh4DRxsNFBn/9vnpa5C+Cm0xMB8mRqNQQzHCCeJDQh0pD/hCx2KRaTD2?=
 =?us-ascii?Q?kNXme/AaFUugkaZL95brePHxFuzGYAgr7dIEflRYwOB+nsG41Kjm1oTH2xXy?=
 =?us-ascii?Q?+OaoEorW7kMRPgKN83NWQUg4qvn+7fV3rKQNZLquVMkx2u4srbcyNrhKZFBf?=
 =?us-ascii?Q?0Cj2lSZzS/KIx38xuJeUmD7ufhMTxrl83+teDKGdy7p7stX8tkvV4qCEwWjL?=
 =?us-ascii?Q?mgWHCqvBOoqpMH7hWi9xwq9Vr9wgDTVjljjw9Dmz1SPWnR7l6U9Di6cK3gwM?=
 =?us-ascii?Q?UbmgMceSd319XYHENRC3axm2FOjFHo86mXjtj39PHVSWu9ow3JS0k+aLl2QW?=
 =?us-ascii?Q?/ePxGSPxoq+4lXxK1bTXcSlx3mjX0MeHzkLCqoXUT+nble98SfwUgUjHERCV?=
 =?us-ascii?Q?wfbg2GDwFxbL/U1d2ZBoLj8nvrzEZxjklG1Fxqemo/io+cIGjI1nsFHI4HHC?=
 =?us-ascii?Q?XgvCeE4YsSgE+gNFsODMpPvPSwmX3gy+PZYcbIyLN1LSjwGDRygztarO2kYL?=
 =?us-ascii?Q?7BdME+xubH2h2ko5LiXD5y3mJIVWlFSvdMTZuNSIdSRmPAMvXOSHQg+BZSYv?=
 =?us-ascii?Q?IMsr4c/Fueg3UJJEkmcXvINg4IZki8Y4LopScQQCZ9/jqJlyGuQub+Cy314C?=
 =?us-ascii?Q?i2i1U+5WDxevUwjWawdt13yxabo/TOW5663jtdIT98EvwM6U+W3J83y4Voyy?=
 =?us-ascii?Q?44d7opI3F3I3pfJMw/lF/FqOQ/bv79q85PkURJBTl0N0U2gSF2/1GC+nSmKP?=
 =?us-ascii?Q?sBrVetgrdUyUkNhhCNqrkDjG4PJYuAfjhC0vQpfRqJHfjEJGkdrs7womfdeI?=
 =?us-ascii?Q?cBvjvue6R3Fu0MJeKj6Gc7eUpOE2qjndX/aWL2cltbA44fFf29ZE1pwu7wMA?=
 =?us-ascii?Q?LzPHvijuNJEpb6dZ77IFk+dT0afj4NloIRaBlIptQOar8dLiH5ISjRHbbCL5?=
 =?us-ascii?Q?DeEENFB2sJUEmNwQvjdUEnjnAPmSUOHgjvv3e7E8XhFwjS9NSshooM1qiJGb?=
 =?us-ascii?Q?mJeDXFILXIpd1hqmqfM8D6ArHWZPwkOHiMAdJziVY/F/vCRTVSm8HjOZRmzb?=
 =?us-ascii?Q?zR4+ItxF7u6nSvqCGnvkK1otDIP3Kc+Wo2V19yafOiyiakVS1iBShVsQTN93?=
 =?us-ascii?Q?0BEVCFZTEVnXNBtacEqseG5kFSqwfXfi/smD8zw0xAhuHIDrVuC+yDi6FCHI?=
 =?us-ascii?Q?/fwqCRuKOASQc2Do9IdIw7jZY7T0d8yQ3+fumYD1/L2kg1RGza/Q0DN7vqwT?=
 =?us-ascii?Q?Mtd1Y0OmG8+swfWwslux6A+J9xZz5G4Yo5WvUXVcUugtBQbytdkLK7gvCSut?=
 =?us-ascii?Q?A3wbWHakF+fwOPNXKz1/mEryOMxX6/sR7HeGdL+MPm9FcEsya79bn1qvZ+9c?=
 =?us-ascii?Q?WD72nu5O7kPnskZQCc1VTnbmBGh5JPNR58ynZQgX1xnH+ne7WR60MzrLTiEW?=
 =?us-ascii?Q?kfWzI19wRhjXG5iIUNz18YlFl2psFIsOOLYa5sl5ALUbcbagmiieoABOESV2?=
 =?us-ascii?Q?m8BIMCT5B5XhfPz098QKqLhXxkTfnveF+M101tJR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(7142099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:56:38.3327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 809986dd-fdaa-4196-de3a-08de4d3c2d2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah/kyktVaK4cEzA2u4EMQ3UERrqlLlLN+3onl+2VUZs=;
 b=38lzDxzU2o44QyWndmbrQWZQVW+DRFfL0PXzv78od13o3yVvZRcXR5Y3v1NP7J+vS+7AybHV7rNkTLHumA5FDx+X3Ge6acEa/OHvuqVKRfRAZUVXxKp4J7/0p69U3S/tANRwx3PF2GGb/9J/sGwAoQEWFnwEDkaQB7w2OHO/Ixg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=38lzDxzU
Subject: [Buildroot] [PATCH v1 1/4] board/xilinx: add Linux 6.12.60 hash
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the hash for the Xilinx Linux 6.12.60 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 90feba3d62..2c5a57277e 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz
+sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
