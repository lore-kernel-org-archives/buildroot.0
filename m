Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B4606A321
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 18:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ohRuOvAl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 814A560850;
	Tue, 10 Nov 2026 18:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywgts3-kvM5x; Tue, 10 Nov 2026 18:53:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 93F0360871
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794336830;
	b=QO/LG2y/C/GAQQkDGJRHgIZYCpd+Iy076tV8RGGWlb/iuO3xYKP98vTuDH2wjXJIZ4rx
	 JIWBRKX7sUmzrCV0I+nHBrENcxJnf/UJ5U8ll5WXGZ00aqDN8g5DJnXf6oKa3nd++tRw6
	 h13XuYaJp82I1bMViOd00ZcfDH3BtTUgz/lQMJDkZejdTa3tckHPuQSLCZxAxcyTsrR5M
	 uQ9vmW3BikiddaCbJ7VMuWrmP+TvO6j9rzU2mA39cMYeLEl+xvx13PPlrl81bYZv3C3It
	 P6+F79DVsCnEPEAtyMtneewtT4sTY/P0ixeQVs7kAiwXZKREkZIuBuv2LmtLD0i7FmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794336830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=ymOSogMom9rjJXw/cYpPGKXVlqoYh+hHXy285BYn76A=;
	b=ULgJPXjY/2oO5PMmD9cNGM4+FSKFUFPurFmYOG4umVF/+KNrFwst304Clkb6+7avawYw
	 mThKxTDWIa82JLNcsRJqJlpSFoVTmWyUGbOQ7rhQeKrc5iJHcL7ckhZcslfB5XEx+W3I2
	 +dFVoQieUd4t26UAc8sMFUd6Bnr5JkFI4aJbkiVrbgAJ9tv7boo3V89pMJGObtlUDkTlR
	 l155n0NnNqFdvaEo5rTcQ6r3X/D03HVXw996gjhhTp4/Ec47uEEvJGFc0MoSt+Q9cTkg5
	 iCHSdsaK1XT3afRxIP4SQjgaZUDu/lmA9b2sYGUpez53Yx9gci12/Xl7twAGlmA0S0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794336830;
	bh=ymOSogMom9rjJXw/cYpPGKXVlqoYh+hHXy285BYn76A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ohRuOvAlx/xY5Vwzwl86dOLX77DEFd+ygvddEP7T+hwASw5TCgnoSN293hOHRD9ep
	 dp8U+4uF/NbUiQ5VmoTzv0rOYQQGVFgM6bEWDIwivuimGiT2fxGZA+dsMg4yDifsJg
	 3UesxNUx23EKVqmb0EyqgIsSL32S5sv1I0Cr47Ge8ykWbXIgWt+cXsHZTxSgaQPdSA
	 WjR58nfqvqLwXHnCruCtp3OHQrYRQMlyxVv53MtCrzeK+6GXLQ6+ZzmiK9g1QHnjt1
	 xSpmS9HrwfaNgnzCjQleXLj8Wty9ipzlNFU9pqJh61JOSg5g0ACWbMETOZTT7MDCnW
	 q+9z2GLQXiNHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93F0360871;
	Tue, 10 Nov 2026 18:53:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC484731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 18:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B95C58117F
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 18:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_2caPqM--po for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 18:53:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 753098117D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c110::3;
 helo=bn8pr05cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 753098117D
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 18:53:45 +0000 (UTC)
Received: from CH0PR04CA0006.namprd04.prod.outlook.com (2603:10b6:610:76::11)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 18:53:34 +0000
Received: from CH7PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:76:cafe::a5) by CH0PR04CA0006.outlook.office365.com
 (2603:10b6:610:76::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 18:53:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH7PEPF00000015.mail.protection.outlook.com (10.167.244.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.2 via Frontend Transport; Tue, 10 Nov 2026 18:53:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 12:53:33 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 12:53:32 -0600
To: <buildroot@buildroot.org>
Date: Tue, 10 Nov 2026 18:53:29 +0000
Message-ID: <20261110185329.165764-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000015:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: 042325da-fd00-490e-75d5-08df3f5bebcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|56012099006|260925021311599003|260925021911599003|260925022911599003|11063799006|261102123227099003|261021123027099003|261009223027099003|261021121427099003|10067099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: pzdA4URGOowjhJb4N7bLDry6ExbKwpcW0H/3Tbq2mYRW2FslR+X11AlUVo828IdENt5V/ZV18qGYp5A4dnWflzRcQgpSJ9rYOFLPBlsk1kfbUBut8/y04uiRjILaqnNDEKGMKtrYpYmwEW16xcFH4NOv6YMPa48NyGIl4Hv2w8wbzW1h56TB7U3678Ry9xBWxG0JdNgaYB5CCG9wS1aKuTxyb0z/daHvmgTwAv5ySuVJchUSEU4ahT0Woe6IRYFYFtyoD/ajACG8Mr+QYIVYLExfckGUdJeXRYvNGJCvv2xIL0a4HQvWNYQV7asSw8sxfaKA+WA8aT9hLV2DLE3FgWzVyX2wjUkIOXQAxUi7K26A3+iHdnpwydFiXgtUSUDaEaygspf76kQ07F5KwLoLq9gjvQBFgt3Lx1S3Kh1duYmVr2b1QvuXKRI54C2bqcUcOJ+DuCMEEkThAhUosXfrONd7pcBFFXeXpfEQ35IBlJbb4WC3VR+wN9cEN07drN2T33S01atzFT+9dqI1pei8QzyN1GVorRX+zjUHyfoQFZ18ShGO6Ztppn6C4zH7kpdY8LRcIgrEPtT5g8tCS3/jJHgxdDSh0UP9AZ4tNWPDVGZPd446B0RYqotafrL10sPwYODZj3eKK9lO6QYUZV23I9/t89a+ss4YoS+BaBsGQ4uKS0igG+xHlDk3B/lLyzfLbXz1s6yuQJyKYOcrVMwrNsNHn0NOvR4nDITtFkU48DDKh0RTJ9qRo+wgBAhbjB8bG4ECVbh7sYLKhn/GSXEMNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(261102123227099003)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Bpz8f3OycpTw7O+Eq/rXFF5yCT0mulKg4o53L8HXZ0vOrUAsNofUjzZWWqGxtFat/lpuli5smboYSBYMG4v7jb+mONZtHiGxTU/R1qn6uEJY/6CO8+Qe/jpoCsj7Tp0Ebfn7d4sa45btu9kFhIYB1hlSAR8VozEVg4iizJOqgSCa4jp3qw2zqeV4slLK7OvblTsEmj+aIP3lblGv7oSvGNf8Xz33zymFFdYI/1rF1fi/obAOmAbpGek2T0qCUI1ya68wiETUJ2cDmOfIsd3uMCI1VnM2HxHJcvkMJdWVwjDVZDHxqQ+vZ4w9AGdgJxIrpHIfTPT9uJoBiReI04BTCupCbAspin9dOIlqKOvu31lO7oaRihtPVzi88ariGE4sSFyv/eK/6R9DkbNuJWzkL/H1nNY922NRWOwsuHXe0KVuM1go5Mrezm0frj6W6tlK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 18:53:33.9957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042325da-fd00-490e-75d5-08df3f5bebcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH7PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100
Subject: [Buildroot] [PATCH v1 1/1] package/xilinx-fpgautil: bump to
 xlnx-rel-v2026.2
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

Bump xilinx-fpgautil to xlnx-rel-v2026.2 version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/xilinx-fpgautil/xilinx-fpgautil.hash | 2 +-
 package/xilinx-fpgautil/xilinx-fpgautil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.hash b/package/xilinx-fpgautil/xilinx-fpgautil.hash
index 42a10c40bd..24acc1a31a 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.hash
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6126a6d1baa937bf94e044fdde1eaecbd1c0b545835293bad51bbf5a8e6b7cc0  xilinx-fpgautil-xlnx-rel-v2026.1.tar.gz
+sha256  da75a79c4ec26131bb3029e143b182f045f01f2f03ce0dd0f8440871611cd035  xilinx-fpgautil-xlnx-rel-v2026.2.tar.gz
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.mk b/package/xilinx-fpgautil/xilinx-fpgautil.mk
index bc63427f18..e760f8131e 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.mk
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XILINX_FPGAUTIL_VERSION = xlnx-rel-v2026.1
+XILINX_FPGAUTIL_VERSION = xlnx-rel-v2026.2
 XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
 XILINX_FPGAUTIL_LICENSE = MIT
 XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
