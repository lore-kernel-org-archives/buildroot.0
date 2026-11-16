Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58DF606A333
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A3/Bpmdm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884CD406D8;
	Mon, 16 Nov 2026 14:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQ3_24wo_j0B; Mon, 16 Nov 2026 14:31:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87CAB406A5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839460;
	b=HbD67kWTK32mTUZD/kMG3M3eTau/GMTPG3RnoaLXIa1sMpRmVxRPvVScCVcI+/o21m4E
	 FGXvZ67H1G6uNUzAiffdECUr0DLPye+rUsVEUUZ5vm70GqBsq0bUYVMJhZwsUKkqWqP72
	 b+/r3iCuqzufKTf5MZ5gojcleKy31rDg0qAbbF+5uToIf6w1pXY37JZiG6Y0Enu49lWRT
	 hHcVd0omnXp6RYP85f7eItk04E6PKPOloxrZLD/OxXb5fdt+bBbf7xJatL8rBIhgBRpQK
	 qxXLBHcGJo1gB9BAcLpAy63cFXd40LifxZK5z6wmZJc1tyG0/uzqeasNjRYQm3FGeLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839460;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
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
	bh=NKOaNG7LLVc/UaB1XF/ln3eFNEO2OQqPHzSQw1PjnK0=;
	b=n8LvQFSQShymc5FTKqiUoGtUmnPTP86ufZQTtmzORBE3qYsKb83nTkRu8WnaImw79PQ3
	 qDyBodNwcJrZZc7blA2VTJWtOYXc14RPB93NO728mUf/WkKJv66WENqmiDTXDPS1RwJUE
	 rBVK2C363uostO/T21gf9bi9xAZ27cTf8DNwo/cFQ2apLsvybIslwXC0fVdPueFzYMrl1
	 /g9n7AayQIOjFu3YBb4BQTSyQLKJ8aOK33VrppKCPNyWSm8z1FcjmxyedbjG7R17bcXr4
	 wpdxlcNcBNIgoc6tQlQ9KCF59227jhz2p3flTHWa6zJmbrOx7oz5UYE0UcfzFQvRupw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839460;
	bh=NKOaNG7LLVc/UaB1XF/ln3eFNEO2OQqPHzSQw1PjnK0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=A3/BpmdmgioYX3y0Jp8tACs/pIhPHehHwc35wghFWNysIkSQWnujTQ7yYZP1QK+PE
	 +XLJaQcN9t3CLEM/bsD4+A3knJjvo06KjesNleteApRdyPWsyiwVAF/kavSsn2YH5u
	 vaEmTXminR1VyXbQZ0aQJlCDIB9gXBqp1HuaH1H4whxOsRaRXXXZlVWu71RlR3nkrO
	 KE6yyNzrJY/HWpy+eof70y4lqzceEvSfTwRO1gsb8aYtuCRmYLGX5x1QVGpVs6AG76
	 JcnRW9jFkL603+L+gC4jYLQhO3h6ydZUPtGloyCzzfGB/M508u64f/eESreYzRzh3o
	 qsJCKvdpPlx+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CAB406A5;
	Mon, 16 Nov 2026 14:31:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EFED28C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50AA96079B
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E67ocN8asVJ1 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:30:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA9CC60794
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA9CC60794
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:30:56 +0000 (UTC)
Received: from DS7PR05CA0023.namprd05.prod.outlook.com (2603:10b6:5:3b9::28)
 by IA1PR12MB7712.namprd12.prod.outlook.com (2603:10b6:208:420::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 16 Nov
 2026 14:26:45 +0000
Received: from DSM2EPF0000000B.namprd02.prod.outlook.com
 (2603:10b6:5:3b9:cafe::68) by DS7PR05CA0023.outlook.office365.com
 (2603:10b6:5:3b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Mon, 16
 Nov 2026 14:26:45 +0000
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
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:26:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:26:42 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 08:26:41 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 08:26:40 -0600
To: <buildroot@buildroot.org>
Date: Mon, 16 Nov 2026 14:26:24 +0000
Message-ID: <20261116142632.1699007-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSM2EPF0000000B:EE_|IA1PR12MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 45029067-55aa-4c82-b10e-08df43eda3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|10067099003|11063799006|56012099006|261021121427099003|261026121527099003|261009223027099003|260925021311599003|261102123227099003|260925021911599003|260925022911599003|41080700001;
X-Microsoft-Antispam-Message-Info: Yxy/j43CLu+5irfgRtnbiMtyeVN/82PtDjsDFhGbzJozrTpeDnJerkIkdgooJqUk2yNvbiH4j8tUbHr99PJRF/F40SEWLjY0j/fnyk29ZMuMaYew4KfphevkO+FjRLiIBYWIfbv405tEJgJ/e/FNofp2tCnwemMn3pxncr5LAF5ZRJWcsu109SUApMPVe/KgABA7fwMoI/R32RNh12usWsc4+cWhzh2B4pIUHQrCGr0dUp20nfqqzNL4uqWyzih2l9abhVdH8BJY1Y6HRgXepZql5dS0yF4R53Nyxk+oxZVN1f3R/YMcQQXod42KuZ3ze5VzWMivDZ/T1nQ9sv2qn6R8hIOKbYXpwUClYeizhPywdIC0bAfs5PASB9smm7PGvWoWSBQb4TGmbTY6yUU96v7AciacFRxgJbC5qRwPmRWV0y7yCqArh28h+fLFTG8zs5mVE+3wFbU4jpdX/BvyOpKoFmico6JEkaw9ZgvDH9pXHIL4sCXwbvjvm+ExIKaTBtBQB8EASs5oXkBw1tMeY617wQSNUPrKZwstFhKQanfM70dM7RtcqnC32Yfs9cXXJOD6QKjYcmgUvV2b8oY6KNPp2LGEvMxO3Cfpt1gVDQKgonvQxXanyZ6gfA1JJkn2IERLRVPtYg6hcuLEsspC1lrLxYXLtNshOUsJiISr609xf+ohkQZpjVUsKDVRbVYiCRfoODEye5Drq8F3EoHk6phKakW4EUjufGy0Lns9HsFVKyGqxkohDeKX3mhp4WHP95SdJy5gKK+eYok1PDS9lQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261009223027099003)(260925021311599003)(261102123227099003)(260925021911599003)(260925022911599003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Atl7dh6cRcTbWQJNEdpnZeR1m0YnmiWbrIpP6YSJ5EUZDr7mternrP6kti4Ko8ULIyhEc0PPBPSVMxVBZvDn1ekprt27eItTKoQGq0qnIx8ud4uQWwuhbdIsWPDAx2El5xFX9KP7+zW9cxPglldWNMB4A36nhd9fnRbaHmI3ORAswE49vwRmEmDVvrrQf9B13BSJhzkkGxdvjRlZ8kzx+5O7FO/tCxksrZ8roIpABRK9HUJneKRlEC2ydJWOl+oiRZHwbm5ijePT7fjl6p58Pyc3Vg/4us2A3RA9iHkBwM0TMd3il/Z0db7+TF855t+RjkJljg8ole/+f6aaCYz2M8Jux9PmPmXy+311p/mdj9qnYwGzxkvebRJ+Jm5VRcX0RmYlbVsIVL6AtcWOE5R1NrBLcl0iW2qDxeMx2GTQpnPcoNQZiLzbzJnUgAqPWkk1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:26:44.5967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45029067-55aa-4c82-b10e-08df43eda3f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DSM2EPF0000000B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7712
Subject: [Buildroot] [PATCH v1 1/9] board/xilinx: add xilinx_v2026.2 hashes
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

Add hashes for the Xilinx vendor repo xilinx_v2026.2 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 5 +++++
 .../patches/linux-headers/linux-headers.hash               | 1 +
 board/xilinx/xilinx_v2026.2/patches/linux/linux.hash       | 7 +++++++
 board/xilinx/xilinx_v2026.2/patches/optee-os/optee-os.hash | 2 ++
 board/xilinx/xilinx_v2026.2/patches/uboot/uboot.hash       | 2 ++
 5 files changed, 17 insertions(+)
 create mode 100644 board/xilinx/xilinx_v2026.2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/xilinx/xilinx_v2026.2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/xilinx/xilinx_v2026.2/patches/linux/linux.hash
 create mode 100644 board/xilinx/xilinx_v2026.2/patches/optee-os/optee-os.hash
 create mode 100644 board/xilinx/xilinx_v2026.2/patches/uboot/uboot.hash

diff --git a/board/xilinx/xilinx_v2026.2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/xilinx_v2026.2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..096cc8c273
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  841c3bebf248393786151ff107aba6380e0d5d40027c59f8c65d0900ea72e521  xlnx_rebase_v2.14_2026.2.tar.gz
+
+# Locally calculated
+sha256  dbc8c4c1042f833ac961730cda41f87b6845068d9b5be2c90726504cfc82382e  docs/license.rst
diff --git a/board/xilinx/xilinx_v2026.2/patches/linux-headers/linux-headers.hash b/board/xilinx/xilinx_v2026.2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/xilinx_v2026.2/patches/linux/linux.hash b/board/xilinx/xilinx_v2026.2/patches/linux/linux.hash
new file mode 100644
index 0000000000..ffe2f749ba
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.2/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  f7b00cb857d3db279605d3b4767f082080a5dd32b48aad6d3caf231a7bb71136  xlnx_rebase_v6.18_LTS_2026.2.tar.gz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/xilinx/xilinx_v2026.2/patches/optee-os/optee-os.hash b/board/xilinx/xilinx_v2026.2/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..9582a4fea1
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.2/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9a87b97177e4b2093368a988b21e77f704fe46093d3f330b7c7ede7574bf3200  xlnx_rebase_v4.9.0_2026.2.tar.gz
diff --git a/board/xilinx/xilinx_v2026.2/patches/uboot/uboot.hash b/board/xilinx/xilinx_v2026.2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..1a82ffc4ad
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e018e33773a617f1d04445f609f02a799d94a35d8115a0a36f828e6d811decd2  xlnx_rebase_v2026.01_2026.2.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
