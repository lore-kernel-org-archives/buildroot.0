Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E36FF3026E
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 15:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D3E827AA;
	Sun, 15 Mar 2026 15:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYOJTAjsvQgE; Sun, 15 Mar 2026 15:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5B78272C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773589444;
	bh=RXG44Ppj3RYJwWDaqsCISX+ho21VmxGcZIVPf7bU/6E=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=r54Byhu7vqyx8IRY9UzeBnqFPu0nelhvQkoN0tA9RXbGB86v7vr69gG9zq8MIn+tw
	 CHMtKVsH0hyPQ8aJLuAmtZFTVne/HHSHxqwf7ioGam2ijHnbUtDsDo4w0IRzxx7ix0
	 Yyw0BPBflLSV6MX19W+NpkujdHsvJFF76RFUKWlaV3CMdRinc1pz6Houe8qujqDVY+
	 28jkKq5Sb5zE/6wMVK+0z3FsQ4s160o2ZJNLUeW4yaUwLjqAwCdVhQ6+O9p9nbLukX
	 a6JjFDjomA/qCSumHgShx02jwcEJuTSVIGjZZVpUg9Hmlizc88nh0XM4FoIpUlN4Ci
	 Y/N0oqh2P/YjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5B78272C;
	Sun, 15 Mar 2026 15:44:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E3F61B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2483D82716
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpqhkvFzrTjA for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 15:44:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A2EB823A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A2EB823A0
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A2EB823A0
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SO2lvkkDgRtHdtZ8n+fYR2Rvip+ertk7hYXDdycrDp8wShQqdRNVjLsl204TNRahtTADxMfwR6DZSdQIL9dcQ/UfpQ4gl1peaGLvcYSxcGAuDe/49VqRcyvr4GzuhuM4MGcgUHM5b2Z1tTuKqM6u8yQYH7ZuGkjuE3O/hB/6aY3ThGhXUtODQE2+TmHQaEpeB6YEgwI/Y4AcfgFEqNkiqS13NN4SdU38LSOH/1oijs6CsT46jPNdF3OwfhRA3QC/Z6C1w84o7+pTgjZE7nATWWtxyM0VjzijYrnEzvhUZ5+FCS2PuCXoIi4IpLYaOnujJRpmneiQBp93I+e+Lv+U8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5sCuBJ2jYbn0RqI8RzZGifG+yhJx3DuUl9BuPoj3C0=;
 b=oAUGdGgzLTsw7h9X2XgtNBoMSgYtQKXMufBzn0BJmNdo5MkSgedpG8ltSjTBYd+vIwMni4NRDJeMTQoQ5V9WNTChVIq2qFBKfTzIM2Y+niR53JrZ5YXX7BjtfV7kIq0vUB/MMqS4x5DTDODoMGmqqcf2kLJ8KBi6KcReRdRsIwYYpDcmQnKSME3SwHU02RabqzCTi++tTkEVRU3+QEqxL0awLaqoE2DWz0PbM4O2rkQZVwCC0rWfFYG1K+PRJxw0i+0gFGg6NkT3zCJY4c0hU+MwhCLp8apEL8Sj/OIyoZpYuupIpGuV/bibTmfiuAND4he41xYE99h2gEH8xi2UXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR10CA0016.namprd10.prod.outlook.com (2603:10b6:5:60::29) by
 LVUPR12MB999160.namprd12.prod.outlook.com (2603:10b6:408:3a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.9; Sun, 15 Mar
 2026 15:43:55 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::b4) by DM6PR10CA0016.outlook.office365.com
 (2603:10b6:5:60::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Sun,
 15 Mar 2026 15:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sun, 15 Mar 2026 15:43:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 15 Mar
 2026 10:43:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 15 Mar
 2026 08:43:54 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 15 Mar 2026 10:43:52 -0500
To: <buildroot@buildroot.org>
Date: Sun, 15 Mar 2026 15:43:42 +0000
Message-ID: <20260315154343.3144013-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260315154343.3144013-1-neal.frager@amd.com>
References: <20260315154343.3144013-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|LVUPR12MB999160:EE_
X-MS-Office365-Filtering-Correlation-Id: 111d13ae-ba92-4ea0-daf3-08de82a9aa32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|56012099003|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: UT67mofsAoYFvIrkqrMfCorBT4QiUs2sX+rf0aoYPWkMHtc6mgGM2UJpSrpS7fSR6xop3fDfI+QDy4KHfUr1vf70XKuXOuOjvHTSz8ymt04o0OI1X9zML4I/SuvwkiPojEoji0r7PSP4VODKgxoXmArgpOnzEfw0dzUkwsDjYCOhh4+KKA9hwbotQXUnZeEicAYXKomIp3Sxrn4CYAd1PNvTM3v1yODr2/i2brqc+hPxbSNWX02iuG7C2nnWaVExZ3wnwybk1VD7YSJpZ1tHUKN3Hv5waiuJRJusoG/0HjxH1heJmspUTEbo+LxOeaSI76/1ep8Hd1CA/v0E2CD4nC5WRGGzedqmb3vG7AggDsmPb7gwTeEJRXw9KyrEVEqiVZY1/mm7/Hs8jnz/G4763Ma85DXLeo6b2tOw3jp6fwks9LaM0MSCafm39n0Hq0z0VVTNsAtyIvLaT3Kg7/KtBoc4DEET7iaUSfVEywQgjc1pHeoG1T0L/KDmDAjNyLG4U12PUTp3QU/KOh+e0sQPsV6wIILl6KqY5REPjxIzcliOdjfl/qgqO/+KuAeF2Iw+pu1jzG14A1OJJdhyhTnq0VXEhHuGop9AYeeoL3sLmsgq+K7zAYLGV8IH/zQCkmgDQcqSO74qblPDlsFhfBFcUdH61WNPW4TDbPGPp6xIikAMTjAGf307JtN6ziytTGr3sewAentfoCFdslZhXCeyppQy+kmd2/5DoOU3NmSARL/de7pLlDwGjx/O0oV58YhAZO4JWgprh2uM6c2qG1Zv/tvhM6cFA+n1AeeDa6M3flvPfOKhAA5r5oKlS7Pw2zRN+FK8/45GqZ2oGYqSEP6QuA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(56012099003)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YX9WqDk6BPG8KNiX04N1uvR9/w+ln2EDinwhFfdAkZAJmntVuxR21HCfxVG+NMzy4N0QdEX/PBJ2sGgU3OXz28MM+pUsR+pi1PQUyUkf2mgUZ/F6cnAQ7pN+th9aPkVqj39w4XLvqZREmrysB4fM7pVmS9fGSBZ9q2nCvDI9yJYhrP3Rc4LMWBaHmEcuqirm0YlFIvjsX0O4TxlU17hyQZIQj8NfBPcu4mgtrZinzbyqBq9o4L+jo7H43ywvHEU1siAN08uVnWI8+sEmzmEbREcnEgrkYOn2rGP/8Tc2xA5hfxZsW/bylJp8yXiu0OzC95gEtaoxMeX79B8CHBWmqeJBfA6VjDe1LuYb5Q7FuzyonF8liI7VaKzvRqDV2uYp5WnKI36rw/wvB2KbMwEQvD6Q51RYDgV+kxMWmp7MtHmQls+ESRkL5jDuTWPqr/th
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 15:43:54.8934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 111d13ae-ba92-4ea0-daf3-08de82a9aa32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999160
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5sCuBJ2jYbn0RqI8RzZGifG+yhJx3DuUl9BuPoj3C0=;
 b=2UCtxY2TNxZA5LK/Hu3crt3E3MQgWNFElMyp/QANDQnyj+79tgZCnjIQHC4ITpTAEKR4++20gkSXHRoi2avIsByfctEhg7dXW3jIEh862W1a5GUlNKiW6hz78jTs9iGH8vribMlvWTbNVi6MA0wCTyXOqFd0+TVtpC6s2Wt3SGw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2UCtxY2T
Subject: [Buildroot] [PATCH v5 2/3] board/versal/post-image.sh: add custom
 hardware support
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
 yann.morin@orange.com, brandon.maier@collins.com, fiona.klute@gmx.de,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a versal evaluation board
to a versal custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- removed unnecessary $BINARIES_DIR from symlink source
V2->V3:
- ignore anything after the first space char of LINUX_DTBS
V3->V4:
- use make print-vars to get LINUX_DTBS variable
V4->V5:
- fixed shellcheck issue
---
 board/versal/post-image.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 3242e4384a..4a810ff15b 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -2,13 +2,9 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
