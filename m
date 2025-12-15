Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D88D5B16F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 13:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB69A809B7;
	Mon, 15 Dec 2025 13:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MXpC1nc0zIH; Mon, 15 Dec 2025 13:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C44228099C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765805101;
	bh=w9lE4rpMRQBnNy7g4GAJRQPEtiNDi1i3gcP0ovwsYFY=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qXHP66vizEX6UcOzJEUL68QBu7tHqdrGGq82PQcrF2f0H5dmtiGOfGeAA8K4O/u1W
	 Mn7mTuSJasYEPNQtfoZumgj9gcVTCAg5c5axvhMTjGrZGjsMTTdf9txWthP9C4Bfzu
	 fXbfykXQx2/cKEL3NTA5fwrivifT6YqKiBHaTtIZ/xpUWoI53dh7WfVMd3sym/1F5S
	 7SQ/+IGZDtWghfdm28fiLd7Il/YV8yzajXsHqbuwezxL3aXV3vSj5MQQlkF9v+wNOD
	 c76jwKnwc/zJpvUJ33QKC/Tvh+3yvWlY6KfkxbLa0/W+W3YgxKu9nSD+FBHy8JUyrM
	 lQBEzN2ozrBhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C44228099C;
	Mon, 15 Dec 2025 13:25:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E239117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F60E60E2E
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSs5O4HQAntp for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 13:24:59 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=s-sadik@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B65A60E2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B65A60E2A
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B65A60E2A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 13:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMLfL3jg8cKLvCfIijBrRIu4BYkOL2U7r0ed7WhvSUq3jE4KQA1vgTAZCMzemt+isPCs/nYTVVmKN/Wr8HwMOy81Nf3/nga33hqktcYH7WReuWY1Cn1f/ePF4zTnW1Y98i1p5x9jkTi8r2sJ3jdIiBOLDtQBeZPqzvEcdq4ioGHNcRNjs/G/N0uDfxIZCBG/MjOvJCS/Bx8vAkyFOcfnhXlJbFLiz/+Z05baWFgffpeXDlmENWLRNGPR2bAixtht3cGUWn4pFXv0xzhUjBw4Z7MJ+Ttxx5O2ybW5HXS5bN5+R4Y5Bys2HWX6TGeNFwnbS6AXmOXnVmRw/J9GQUZGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5XZnNiEroiazVtzCwgv9ddQvHNHilz1c/Ttn8Xfm40=;
 b=VLv+1dzSM3WPbugnIID5gPsfdxghoNUWQaUP83HcwQgZdDejz3HTnS94ctTLwgNWyx99uqSODE5jw+n20cBkvdjXl9s0IfY/S+6B2bFfZR7E+hhnF6G/qrNiGMv+brb237LDqfUgJrt3aTVQHbgAyL1MhpozqRVCYtx/4JWGZuruDKbyGIvZa6vm6P6Pm10A9pMB6hSxLGyF2zneM9XY8CL0dtoT1ON4Ww6+ZVxsZXvF9wYJSEe5U3FkpSqzpSFDt7IzQ/vaLMxSUpSCO5VPok6c9+IpWjYhQK6/wL8lgZneGFqeAv9zmIcucPAJ99VYQq1JCOQSmTlRVEXVapclOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from BL0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:208:91::17)
 by CH0PR10MB7535.namprd10.prod.outlook.com (2603:10b6:610:187::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:24:55 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::4c) by BL0PR05CA0007.outlook.office365.com
 (2603:10b6:208:91::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Mon,
 15 Dec 2025 13:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 13:24:52 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:24:50 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:24:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 07:24:50 -0600
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFDOmII2483327;
 Mon, 15 Dec 2025 07:24:49 -0600
To: <buildroot@buildroot.org>
CC: Bryan Brattlof <bb@ti.com>, <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Dec 2025 18:54:25 +0530
Message-ID: <20251215132425.136858-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|CH0PR10MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: c3829289-e8f8-402d-97ed-08de3bdd54af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hlyCtvg5Bj/kMnoVQyYRaAmqaJ/m3potl4WJ1uPHMFqNclnhGC9xWSKkYbgj?=
 =?us-ascii?Q?0n+6iE3iN/d4RKtmIXNrgpV1bxIA8lTxUrAbbRDX+sd9BsJRuaPhrYma3uCe?=
 =?us-ascii?Q?7o7hb+S4HpzvW601k23DGbX3Y6Z/GFDQ85OZBn1+sMxiGzjul8qODICmnMtF?=
 =?us-ascii?Q?Qk1gVy2sEtYVmcKxd9tXP0zn+fZzN0cjZse/fBR1DTU95DwpvXIW0V9Le0wE?=
 =?us-ascii?Q?0Y+kBa01vQQmVJV/8x1ZB05XT2ZWfXl01ROza/CN9BQqXBh65tALP9o87wH9?=
 =?us-ascii?Q?HvMWqQH+/M/WEKBdFBdrTbbaeCh3Tr6JfustHm97FvC3KQamIz6GuHhJMEFo?=
 =?us-ascii?Q?bh/dUhI0TLhh+Cua+euC+IBVHMqCkgoLeayeFapjhikDPOmV/SMmQCvzb2xA?=
 =?us-ascii?Q?5zMNUdjxEuzu6nWxrAfeSosqBT45coroC9lmbDaVewOoaYjwemQZdAnZb8TX?=
 =?us-ascii?Q?NPJ0NyQFzgw+0LolaMJBiFNVrCe133Nc1aoNyrABsRIk/tc9CqgGk/b6G7vV?=
 =?us-ascii?Q?Av59aj7zO8QZxcU3X2XiRSdrDhtrOPesL0AthH83M61x0XuifOzA7b565SNc?=
 =?us-ascii?Q?M+InZYWCgm1ymt5sENhU5P7EzN77XeYap0k2TUUNRbZA10s0n3Lp+HT996IB?=
 =?us-ascii?Q?lOq2FvtuWiIJfBUwroZJoFac8cj4Vjfo61qazLcW5KJMT0jgCKWH4/HfBnFK?=
 =?us-ascii?Q?vTXqZmOl/lCSolcPBasswWxEUpgLS+wJ0MZTz7fBMTPgjQqRWiO+XFgTQR9y?=
 =?us-ascii?Q?x1S1/nIcHQc5HtMqWDjicJ3pYSs4wvU7okqVRqcwaEsuO7LfrXPJjqcb4kqU?=
 =?us-ascii?Q?rYa5W+0/8ZsCDMZQUtawliHDzXvBB/cOjzphEfAXjNDiMq5rWY4LlJ1rLMRA?=
 =?us-ascii?Q?YwfL63MeN+vBOXt1NGPGRCEiJ30DQ1sC+wMpFUt6Pb/r6JVD4hwLCS6M7OFW?=
 =?us-ascii?Q?JLSEnBlAf8+b0m6ZmzEdvNWsdQtaSjLNS8z90C8g7E6RIMIDk0YaWtJeQgbL?=
 =?us-ascii?Q?FHD02srXuQGWG/E8EA6qDIMzyHZyThofRx0YnqWf8FubMu+3zwRNI3AzALSa?=
 =?us-ascii?Q?GG5X4h4oL5G16kGqlIbMEgiUAnYeNrxqTTIpAICVKFOjbIMH5jtqlIhNLTbf?=
 =?us-ascii?Q?jfGzL78d5JRHN73IvsSPEV8uSNtQR5FZCEo+yVHc6HD2KKh5pyoxGoLdetkH?=
 =?us-ascii?Q?+U0weunbFS8UlyUpeLOtD08QNm5onQ8Ww11BZ/OKA7hZTE0w8oNEyB8SRMvm?=
 =?us-ascii?Q?E4CpaX71JXep39aKidCjC2EJrf43tqdSzBmCo8UachvnmuBVhIjQDyBcVWhL?=
 =?us-ascii?Q?A3G7dNQOCes6vH6zX0HvuyQn0eD481zVUJPWx2SP8MyqiZQUEneWbyGsNS1+?=
 =?us-ascii?Q?JO1BvUbs1YXb+RBkNxCEpDSypXjKr9hKtxb5/UlVloWP2fcmD1PhTR0darn/?=
 =?us-ascii?Q?dcqObaU1svJUtd6v7kGckJJ3R0Uws/oOIMEAs4KHIphnfuafl/cjpHiiWOX9?=
 =?us-ascii?Q?XkCBPM0CQO2sTO2hWQUofz8fSQQF3HZkgLTBdNmIxp7tNaFYejwIEZLMd77L?=
 =?us-ascii?Q?28arvRZ5OlhlZML9/5w=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:24:52.6575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3829289-e8f8-402d-97ed-08de3bdd54af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5XZnNiEroiazVtzCwgv9ddQvHNHilz1c/Ttn8Xfm40=;
 b=HasCQ7ebkAiH3uifta0+S1d2t/5rhbe1+3JKpitkOKEfzzMW/vm80C6yio20gvZ62197hHVxse1xQGswriWGlHOXg6mOpJgfRz+BMuPwnseJOy4esiRSAFT+KJH55xM+lzjgI6brTSF7Fw/Bp6dRycao33xHm53H4SzzxRPNBBo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=HasCQ7eb
Subject: [Buildroot] [PATCH] package: new: add k3conf tool package
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
From: Sadik SM via buildroot <buildroot@buildroot.org>
Reply-To: Sadik SM <s-sadik@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: sadik <s-sadik@ti.com>

add the k3conf tool in the package section

K3CONF is a Linux user-space standalone application
designed to provide a quick'n easy way to dynamically
diagnose Texas Instruments' K3 architecture based
processors. K3CONF is intended to provide similar
experience to that of OMAPCONF that runs on legacy TI platforms.

K3CONF currently supports Texas Instruments AM654, J721E, J7200, 
AM64x,AM62x,J721S2,J784S4,J722S, AM62Ax, AM62Px, and AM62Lx devices.
Along with the BeagleBoard variants of the above mentioned TI SOC's.

Signed-off-by: sadik <s-sadik@ti.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/k3conf/Config.in   |  4 ++++
 package/k3conf/k3conf.hash |  2 ++
 package/k3conf/k3conf.mk   | 16 ++++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/k3conf/Config.in
 create mode 100644 package/k3conf/k3conf.hash
 create mode 100644 package/k3conf/k3conf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..396452f261 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2962,6 +2962,9 @@ F:	package/agent-proxy/
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
+N:  Sadik SM <s-sadik@ti.com>
+F:  package/k3conf
+
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
 F:	package/fd/
diff --git a/package/Config.in b/package/Config.in
index 22970b4d45..a0aa112070 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -110,6 +110,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/google-breakpad/Config.in"
 	source "package/hyperfine/Config.in"
 	source "package/iozone/Config.in"
+	source "package/k3conf/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
 	source "package/kmemd/Config.in"
diff --git a/package/k3conf/Config.in b/package/k3conf/Config.in
new file mode 100644
index 0000000000..f282ad672b
--- /dev/null
+++ b/package/k3conf/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_K3CONF
+    bool "k3conf"
+    help
+      A Powerful Diagnostic Tool for Texas Instruments K3 based Processors.
diff --git a/package/k3conf/k3conf.hash b/package/k3conf/k3conf.hash
new file mode 100644
index 0000000000..47d9eca6a0
--- /dev/null
+++ b/package/k3conf/k3conf.hash
@@ -0,0 +1,2 @@
+# Locally calculated sha256sum
+sha256  a3459f80e7af5672da6b41bc0814114690dd549aac4cf81ba4e5dc84d42ab9c6  k3conf-v0.4-git4.tar.gz
diff --git a/package/k3conf/k3conf.mk b/package/k3conf/k3conf.mk
new file mode 100644
index 0000000000..b248fb63d5
--- /dev/null
+++ b/package/k3conf/k3conf.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# k3conf
+#
+################################################################################
+
+K3CONF_VERSION = v0.4
+K3CONF_SITE = https://git.ti.com/git/k3conf/k3conf.git
+K3CONF_SITE_METHOD = git
+K3CONF_LICENSE = BSD-3-Clause
+K3CONF_LICENSE_FILES = LICENSE
+
+
+K3CONF_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
