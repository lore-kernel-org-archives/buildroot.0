Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDA3CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 05:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A138760E87;
	Wed, 18 Oct 2023 05:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A138760E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrmsHs-i68Ts; Wed, 18 Oct 2023 05:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1BD960BF9;
	Wed, 18 Oct 2023 05:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1BD960BF9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E80DF1BF5DF
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 05:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A791240948
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 05:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A791240948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFZRpB-KtmRV for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 05:42:05 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22C5D40929
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 05:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22C5D40929
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuEDLkrSOGjvWV6Mq3HcgPU5X5IXuvi2ucu5k3/WEmb+ToKowpe5ee10GP4HSKAvpd/a0/BmYBkVjSfgsN20iI2ES36ICqY+pmVUwhK+hu16F7j6ICvKasD+BdIfUY8x6qpdFxSWYLjHpsk53Q/weBr0YYZOzUxEOl1H0WsxL+Cd+ELVC6KW2mnyRrbK4lMByP8ie9+ZtmY3ZTUtNJXbAv9B3HTU2B/cRIWQH6HOd+BIdEvYYGMcQ8eFkMje3nCL+W6g8G6wUBULoGafcs/i9ojtHoYF1tOyyQXMqf+YFWwC5e9b6UVhEfbGJePhDksB3FLEte6ZdgSMpSM7q19Tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2LsEiigHUeLQNDTcKLgdkoXtg2w9tijoqdpzhT9yyY=;
 b=Gr3qfV6nt0Y8OvU+mutLNCKhbdEgwGG5hkhpzvKktCtfYZxV+7kj9VxnOI4g3tfXIl4z/UG6W33baA8GJXFs95Wte2hXrSInVUPuzeEiccCPX4RYgnjMelKaQui5G4hWNON7FfSpAih5ORDbdmAZWlr1o0e0KknsZsV1VUlQk9hehH3N0LG54VxtGMogTU5U1jLOESoKjwA9p7wV6c4vA4+rWLpUTr8M3NTxypuegENAFIr9YzS+1vFRPGBuHFWUWpjURYVfB/CZMx9/FGb9V8IG4yS1MdtnE2P918ITjfHEGMXNZUzvqRz2Qp8efL2Q9kE3ExWmGKanXUE1ybi/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR21CA0025.namprd21.prod.outlook.com (2603:10b6:5:174::35)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 05:41:59 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:174:cafe::26) by DM6PR21CA0025.outlook.office365.com
 (2603:10b6:5:174::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.3 via Frontend
 Transport; Wed, 18 Oct 2023 05:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 05:41:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 00:41:58 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 00:41:57 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 06:41:55 +0100
Message-ID: <20231018054155.1907860-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 3802c8b0-3272-4209-8e57-08dbcf9cf25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JlBMsoQU6Q0MESIYnwLc4pc0x3pCNJZASWZJkYP5AcYHB7xE6zY+5NcZ3C6dDm/xXPRJPKdsCL6YiQY4m0S5m7ifJRsdPslxI+U5feeD00P3VNPAvvdPwnPNIvphbUqwEpJXR7fZzhHHUFmQ4BptMvldkaoOmciqJ9xQ5J/zPdqFimYwlUfddUf83ivQlfBBybWPTRCHzRU6lqlSMze5yb+7BXOjilHU/3Q9VIzSKwetRq0i4o8GROfEPqOOZQ83MDnE/fP3d7ZmnuK2XJnixp7VWpbUMSm+AhupHx5HidhjNkzQje/aFZQgIRsy6n5n6RQt6Qa/FoGGU+shkdp2tMQWzv9bkf16C9EF6yZ1v4BCMJpswI2G2zOjSylx2f1wwT9TnfXASUnTRFDGTCs5vU0YEBaDFw2uBYNIOsV03/dwNQyishxvsw/uAPkRqUJzF7mcVjq+2OqriaqfxRq1Mj61nZjc1VFy7Z/Fft6gknL1ZOGb0qZRjJwFHu+TWot/KQxHBvhcuyY1AezPdrLu6LeAzknfXom7Ew4QOY6iHHByGgRucX9qU4PaOhgBxmPRcLHmD9sV5UDy3QJ121USokEYf7QUGJ9u94qc7u4MlZHhzvMQJAS4SaBag1hODIDs5wsP1RiW03zpJMuVs72/DvY66mPYGhinQwBzGyqSOcRuj5K+UEEPPjC9Xexxj/iX1N6nju2bd3WvS3IKwnG3UdX+kMmN6Y+eTMVy6m5U+NabOd1hOmTuqY7EW60P0xGH7aoX1v2GBcKKFiQW0fwEEuAq9qOJLQ9n2EWvRyRJWjg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(426003)(336012)(82740400003)(83380400001)(356005)(2616005)(26005)(81166007)(1076003)(478600001)(966005)(36860700001)(47076005)(54906003)(316002)(70586007)(70206006)(6916009)(41300700001)(8936002)(4326008)(8676002)(2906002)(86362001)(40480700001)(40460700003)(44832011)(5660300002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 05:41:59.0184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3802c8b0-3272-4209-8e57-08dbcf9cf25d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2LsEiigHUeLQNDTcKLgdkoXtg2w9tijoqdpzhT9yyY=;
 b=HjCyhVhQIGQj3ljvge5uzttevCv6//rymjy9ux8BHPLkFDLi4ismO4RFd6IyTm0ltf8Z5UzgAaKCyxZRvsiRedJndZ9Luz3pTtDRNyn4WJSFH0cAaVluySanIrn54cQqHuQ4qjQYeOO0MY9HsdIm0KN2szc+7VAACEOYfTcf/gw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HjCyhVhQ
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to xilinx_v2023.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump bootgen to xilinx_v2023.2.

With version xilinx_v2023.2, the flexlexer patch has been fully applied:
https://github.com/Xilinx/bootgen/commit/8e6702bb5064b806e45028486de7376962470a36

Thus the flexlexer patch can finally be removed from buildroot.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...n-machines-with-modern-flex-versions.patch | 69 -------------------
 package/bootgen/bootgen.hash                  |  2 +-
 package/bootgen/bootgen.mk                    |  2 +-
 3 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch

diff --git a/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch b/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch
deleted file mode 100644
index b13dd2b03b..0000000000
--- a/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 29a4e487527d109f517fc47a7c284b7732b27a10 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 12 Jun 2023 21:04:25 +0200
-Subject: [PATCH] Refix builds on machines with modern flex versions
-
-Bootgen embeds an old version of flex, but uses the system include syntax
-(#include <>) to reference it, causing conflicts on systems with the
-development headers for a modern flex version installed, leading to build
-issues like:
-
-../bisonflex/cmdoptions.yy.cpp: In member function 'virtual int CO::FlexScanner::yylex()':
-../bisonflex/cmdoptions.yy.cpp:1362:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})
-
-http://autobuild.buildroot.net/results/293/2936d9b054269b7055e66ab5a7f7c1f7f4926d48/build-end.log
-
-Fix it by using normal local #include statements by:
-
-sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
-
-Notice: This was already fixed on master with:
-https://github.com/Xilinx/bootgen/pull/20
-
-Notice: The patch was not applied, instead a different patch with the same
-content was applied to master:
-https://github.com/Xilinx/bootgen/commit/af4f7083ea92931a07e47995eb2bc2a348c577ed
-
-This patch was not applied to the xlnx_rel_v2023.1 branch, instead most
-of the content was included in:
-https://github.com/Xilinx/bootgen/commit/bfba91b2c84160dc203ff09f0e930d82ed06a83a
-
-But the cmdoptions.yy.cpp and reginit.yy.cpp hunks were accidently dropped:
-https://github.com/Xilinx/bootgen/commit/bfba91b2c84160dc203ff09f0e930d82ed06a83a#diff-e0287adb420dbecc112acdf7d4a1efba8ea6cbf06401e4e8679b8ffd22a091d8
-
-Upstream: https://github.com/Xilinx/bootgen/pull/24
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cmdoptions.yy.cpp | 2 +-
- reginit.yy.cpp    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
-index 38fed35..4e940ab 100644
---- a/cmdoptions.yy.cpp
-+++ b/cmdoptions.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/reginit.yy.cpp b/reginit.yy.cpp
-index d830734..dede473 100644
---- a/reginit.yy.cpp
-+++ b/reginit.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
--- 
-2.30.2
-
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 937509c859..6f34b2b850 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea8e  bootgen-xilinx_v2023.1.tar.gz
+sha256  aa8120369d8a6016c731a3338188045c82833602e8ea955b53130a16560e5eb3  bootgen-xilinx_v2023.2.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index d83980d925..70338090f4 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2023.1
+BOOTGEN_VERSION = xilinx_v2023.2
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
