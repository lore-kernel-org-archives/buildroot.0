Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C64606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HWienyqP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA2580E35;
	Mon, 16 Nov 2026 14:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkPImA1TcZRg; Mon, 16 Nov 2026 14:26:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3BB980E49
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839219;
	b=svlBl4RSZ48HUWja+4WtVHlIxsHNIJSTdJaeZIhF1TkCrw0F1EC/PdhPZk4XrEcle6l8
	 3Qc/sVPZRVSEVcSNVnAr169QrmgphL24UdMuwuV0mncc4v2LotZrbdY8xIVQEeKkDevqV
	 Jo8l5gAeosZZUtaF+5bcLOQAIkBrQ5LNG4PJidXI5iTfF7g4afX0DMUOAnqUYPVk51K/w
	 sFIxfPev3Cel0XdDVyOjC5CGvpQmgBYYTQx6OXL3PRMaQnD0t5cKs+xsUrQJWefzkOj+Z
	 eJNujy1RZ9WzyLJrUVTZasREb9zdVZbRkyGhR3RCpnMKCCDqpYFHjVQ1y4Ysxkn1+nQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839219;
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
	bh=4dXdx4lKL4geRqXbBtZl9Y0VIaFABlnXyPesOcSGqPU=;
	b=irYeGY6aA4dA3lY6cK4ozkW4To7Do4RmMJjHOwVF6tCdXyxgXFrxeoW0GnIVSCzRsv0N
	 pHQSWL5qpHaUQ+RphP8gURVNkai0GuySqbOWNB+SKvwJScKCPQI3MmaVXlxq57mMc804j
	 Ww4Zjja2ii/kxe9b9DKV+VEyWgKl4F4Q6Z8sh4y4mQlVJDK3d79vyLBgX6oVCcbz6iOVv
	 RpB6UnnScqKTuTTFX4M4S9UepxW2bZtQnANaYaiUBT4XrK4nPCP5Zvb+XyXiID2Qd6lNy
	 V6aODJiO/7GR0mJR4B1+fy553eEBzwc5JnF8XHEmpZ1D709TqxOlYqvwO/vLexa7dGA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839219;
	bh=4dXdx4lKL4geRqXbBtZl9Y0VIaFABlnXyPesOcSGqPU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=HWienyqPxPRcVP6Z/GtoZ3+/9vxG8GcKVYtHIOBkKNpoVl7CYMDFc9qLwqfFs+TH5
	 b8p0pYVVMV+BU3PyPFyVkqwRzix3whkzaxL+vvxAmwPEWDZx6HCNG75sOhp9665yU+
	 DFNSayd8OAOSuAVfIFrFxTZHRXP0L5GOUh9dxLg8XCAfK7i+5jiFhx4r0uJJtl+LCZ
	 I/yf8OSZ+9iWpNKQUU+Fal0XCtbnmOJrPgu+j8XAuP7HkXjh0/K/3rfSkFbgkiamRZ
	 J+n+fXhVB6/4tX8FC23tt6wjjF6JX4Px8qs6Hc42zF+zvbTHkh4hdW+2iwFpkvddrr
	 YgpDnP0cD/Hbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3BB980E49;
	Mon, 16 Nov 2026 14:26:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A702228C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C65460739
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avmqUCKi1vYX for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:26:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE52E6067D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE52E6067D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:26:53 +0000 (UTC)
Received: from DS7PR05CA0027.namprd05.prod.outlook.com (2603:10b6:5:3b9::32)
 by CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:26:48 +0000
Received: from DSM2EPF0000000B.namprd02.prod.outlook.com
 (2603:10b6:5:3b9:cafe::e) by DS7PR05CA0027.outlook.office365.com
 (2603:10b6:5:3b9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 16
 Nov 2026 14:26:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DSM2EPF0000000B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:26:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:26:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:26:45 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 08:26:43 -0600
To: <buildroot@buildroot.org>
Date: Mon, 16 Nov 2026 14:26:25 +0000
Message-ID: <20261116142632.1699007-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116142632.1699007-1-neal.frager@amd.com>
References: <20261116142632.1699007-1-neal.frager@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSM2EPF0000000B:EE_|CH8PR12MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: f83bac61-2dd0-4f8a-ef40-08df43eda57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|11063799006|260925021911599003|260925021311599003|260925022911599003|10067099003|56012099006|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: XaxG1C18TyPUjXXL5ZoeylGERC9NT7DbhRpU8iOWtoXAzngoIoCRMj8U7TI4Cj/a5E1IwyZt0aZqTzLrImw/08541eERajek9seKb3VylkefM2WK9/0XVGKOVMCNnvl0Sxl+/QzXBttmd4FRcP970kecv3FdJEec7RdDRLEHRkAYp88A0hRXdk1+xsjSHthAGzQSdMy4fOyeSuzvFdOOnvcCUQTu6C7R1VNE/e62d/16PscBIZI2v/+AsZwcr7YyGVukWwVcJAInwDcFvkdJ8am9J88Mqxjf9SHVgsKD2aCh8jDL0g0fmm7gDRTFzjavsTKP+CsbrihLCAa1/1k22uiEwye0ziO7DWyckerGOFReEiKsNLiabYb5N0LQr/80jkhyXGDtESriy4G5t4GbXKuO7g1dktFsazycajIejFPNGqup7vVHvQVzo+8QmVZd5HDayIeI2ecMx74Z0PiYcSNTkmZYb1jgRJw+gINHCJSxjeAj7F7MQa7JWROIHnfl1QonoB3E42C90uhCl8Niou/wqd3mrpetxRCH6ysdiVrd+t2pYhTpcqCR33RLn6NFBH/gfGx8rYzDt/QNnDROGbccELBalHS924kR700hnRRKUvyGQXdaJrGiOV+CDF++/DVeceROynze2mcDJuzR5e4XoJOy2IzYnb86VKpBePgBssHRMlrB2roO9BsaiAyjDTjH9zk8Vf6yrqD6azvryK0+RJOfFgAPRHgDLY9+EuRktcdETz4h4RMif4xb8BUQ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(11063799006)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uq/A/VN7QvGdj3XeuLgnG3hbEdHTTJ+B1yx4tY7/DB31i7Br3/nSIQ8LoI8teR5iPC0r5M+P/y6noergEbbMf5m1gaxj5vTrw7QsIAcXElJA+Y0CMPCy6wlCfMk5+1OeczfPj33OeUhOVMRGx9bjJONQh7HiEhnm9zRhSE1Z05wSb3HvoD65MLCIpbwIfp109Y0Dyhivk7VJZ3TZB05CPtOxZVh0dBgyNHPrY2Vt9CJWGaWd95+/QMtNGV5TI6tzl3lEjOqyYw4yZAk9R9TZtRe/OdYanX8vYd9+CNP1FJ8PfbkAe06GYE6FOtpfUSGJP54L6nl/kbSf08tNY1BliZzLWC1Llg8FdBMOcpJC3Jjcx5n/Z1dFkjlIFptdFg3Vd96Tsn4Gg+dRg3/FmtNAzhj+u9XYisI5XNaTGn7k45uTmA0LwIXhuIXdzWJT5+Uw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:26:47.1995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f83bac61-2dd0-4f8a-ef40-08df43eda57e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DSM2EPF0000000B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9768
Subject: [Buildroot] [PATCH v1 2/9] boot/xilinx-*: add xilinx_v2026.2 hashes
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

Add hashes to xilinx-embeddedsw and xilinx-prebuilt for xilinx_v2026.2
release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-embeddedsw/xilinx_v2026.2/xilinx-embeddedsw.hash | 5 +++++
 boot/xilinx-prebuilt/xilinx_v2026.2/xilinx-prebuilt.hash     | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 boot/xilinx-embeddedsw/xilinx_v2026.2/xilinx-embeddedsw.hash
 create mode 100644 boot/xilinx-prebuilt/xilinx_v2026.2/xilinx-prebuilt.hash

diff --git a/boot/xilinx-embeddedsw/xilinx_v2026.2/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2026.2/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..aa28d9319a
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx_v2026.2/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  836af9b003a9b763067869789f8c684992a6083dcad92c8a53bbafe5c9a0e65f  xilinx-embeddedsw-xilinx_v2026.2.tar.gz
+
+# Locally calculated
+sha256  58b41262f6d461799c7d3e61d272058fa466c76be620927cd4136bc406293b63  license.txt
diff --git a/boot/xilinx-prebuilt/xilinx_v2026.2/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2026.2/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..e5a366bacb
--- /dev/null
+++ b/boot/xilinx-prebuilt/xilinx_v2026.2/xilinx-prebuilt.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  99966d368b654b179224c6d48b3db1ac0a98af2fe6573bca548e398c3d893512  xilinx-prebuilt-xilinx_v2026.2.tar.gz
+
+# Locally calculated
+sha256  e4a8315687fbd55fc6bf0965c968bd95c8b73b8a957bb10b2ba618d5390b0e3a  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
