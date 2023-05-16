Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9EEC77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 04:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 423A540BE0;
	Tue, 16 May 2023 04:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 423A540BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssxTNpusHcQj; Tue, 16 May 2023 04:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED36540620;
	Tue, 16 May 2023 04:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED36540620
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B9811BF29F
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 419C28213A
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 419C28213A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27rpDercNnoZ for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 04:35:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF61D82117
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF61D82117
 for <buildroot@buildroot.org>; Tue, 16 May 2023 04:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfoAS4Rfn5uzUjIo1FYjolAXPbd9ol1EvouguhRi2UOGmKvsPkJT35PQLpOjT4F7enp1YmtuPn02g5akIpoWxeCfzCbVu3YmMXUhI2KdQ5L+UVGvmVNdFtvBehQMnynubqZ1y6B8B6fD3nf3LEnA2K+FoxFMNhSR7tXZO4Hn398cDhYbnVgXtEku1rcovRyF9ONmpdhsu7+MBOllZ6592GqdwaoirAdhoeVfSqPB+1d0QHvC27coEOBtrIrD8lLq2oWt/gkRrdYmhAHqahWLXjp+65gv5Vxtg8ua8T8D7JB1P+/HbrVVQn+vKXTrinxRYbglpB6v7nDom2LnT94bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5+TmkM5XPmYvmh+kEtyRZFUpaGbuMMlGoA4QJvhDlE=;
 b=QUTLaMErjP6FbTmDzhkNBTpanonU2SgJ7adQumN986mP5W03l27G6r4EQw93IybqBwG70cxLj1bS9GfHEz4vTJH8R5Idp5D8OOskT/wxZKUCg5ndFFbBjLg7Qg5LP6T77hLYVMtt62Bh4JgUgehiA62wjy0I/tmGG3zXsq6W/6cMQpyqzUJ0PFpiWsDvm91/ioYZosMLwBBOZPVmyifHxO1FJeSHxGAjBUZWOKF9ODZVUFGf7dL0dA1CbQ1aq1PRcCLq4z1SAdd3vEfHEoAck8zS6KczaTzoHXjfkwxV63eZqcwSC5BMOOb4KPFqCJHO56JEzwMQge6luX56TpwTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:303:2b::12)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 04:35:08 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::86) by MW3PR05CA0007.outlook.office365.com
 (2603:10b6:303:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.14 via Frontend
 Transport; Tue, 16 May 2023 04:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 04:35:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 23:35:06 -0500
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 May 2023 23:35:05 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 May 2023 05:35:02 +0100
Message-ID: <20230516043502.25305-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1cbe8c-eee8-428e-71ee-08db55c6edd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 78X/qnu23Wge2iuNO5Oa2/Yk+oOh2csMip8RQx/c9leeOmT8nnOQO1YaIMGCJigzFUsVZM9NLaWf0H+l+GMQ566hTBz0UEsXwRD8F96dOC3L6ra/AWCmk6JPhx/HHVOZmrCwMiKnM9wSxgwN/KTxoc4rNl7A4od/aJf6C/3BmLapOeMweMGDDUHLgqhhneg6O6fHRnHZEqjav+sluuutXN5p0YPj7ZKTEC0iU/ywAwSWFJb7myqMur52sxDjuYs/aJoZ/6mLfcyJa9k60c9MJOYcNLpKdLm8uMRmKxTFg6uGUIVD4DLFmwU36PknCzkP5Dqel8iNEacxQOlvvZMXQvxrkMGBxNP+k7JIzhT1NjEVStCZDMB6VVuTrhO0BReXiYQg3lR9oNUjC/3udix2G41dc0nh0rNW3cksYXCqP2O2h0EU3vRRmiziQxAsO9srm1iE7rDoJpbZwQ6cfXHczyDFCO58L4hOLNxDPYSd2vIAoDATfqKwfes/l2720XoNhC8m2mD59Wo/DkDqKbl3XrTOXRSIYp2pTDtm7P59EWoJZ2w/dhxC+p9NHfwvd3MbkLImbQ52UJ0xvaWUwd5aZFMaf2mM/l6NDrYx5uKrSxdsc2dso7pIeduhJiurL5e+SrbGq8r9zsjLm8k6+uacNJ/LSC9HRIHUfhypkNT6QQeCQ4HW0uP3FKNNmV8PTImuM8DLu+a9WhZ4ff3T8NUO4IUbOH3ZiEg57QcSAQAQNSHzdgZf49bYmN40HcSuxC2LEtSYm1lxdMbQorvjwEVTZQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(2906002)(316002)(6916009)(70206006)(4326008)(70586007)(44832011)(5660300002)(8676002)(8936002)(41300700001)(86362001)(2616005)(478600001)(54906003)(40460700003)(426003)(36756003)(6666004)(40480700001)(966005)(186003)(1076003)(83380400001)(336012)(36860700001)(26005)(82740400003)(81166007)(356005)(47076005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 04:35:08.3397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1cbe8c-eee8-428e-71ee-08db55c6edd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5+TmkM5XPmYvmh+kEtyRZFUpaGbuMMlGoA4QJvhDlE=;
 b=FMTFE1iV8iuhFZ3DlpFQ5Ys65ONGCx9dtVlthulFxLPktjTYl8gqxVceXOULS5n3yV421kY6b1ZCF/EJdkJiwUekWz1iKW9OKfVMdfE12/FwBSmz9yfMMCHEwTX3WT6vAwZvGNcgaGvnpfZ/nQI7AKC9qItWOmaRvjmZUcWrZCg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FMTFE1iV
Subject: [Buildroot] [PATCH v2 1/1] package/bootgen: bump to xilinx_v2023.1
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com, Neal
 Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps bootgen to version xilinx_v2023.1.
The patch for build machines with modern flex is no longer needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  -Added patch file remove to commit
---
 ...x-build-on-machines-with-modern-flex.patch | 133 ------------------
 package/bootgen/bootgen.hash                  |   2 +-
 package/bootgen/bootgen.mk                    |   2 +-
 3 files changed, 2 insertions(+), 135 deletions(-)
 delete mode 100644 package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch

diff --git a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
deleted file mode 100644
index ea82f5e70c..0000000000
--- a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 7251dce3dc974c7372e7024ade3e8a455266cfd2 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 18 Mar 2022 09:02:31 +0100
-Subject: [PATCH] Fix build on machines with modern flex
-
-Bootgen embeds an old version of flex, but uses the system include syntax
-(#include <>) to reference it, causing conflicts on systems with the
-development headers for a modern flex version installed, leading to build
-issues like:
-
-../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
-../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})
-
-Fix it by using normal local #include statements by:
-
-sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Submitted upstream: https://github.com/Xilinx/bootgen/pull/20]
----
- FlexLexer.h         | 6 +++---
- bif.yy.cpp          | 2 +-
- bifscanner.h        | 2 +-
- cmdoptions.yy.cpp   | 2 +-
- cmdoptionsscanner.h | 2 +-
- reginit.yy.cpp      | 2 +-
- reginitscanner.h    | 2 +-
- 7 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/FlexLexer.h b/FlexLexer.h
-index b115b5d..1c0386f 100755
---- a/FlexLexer.h
-+++ b/FlexLexer.h
-@@ -33,15 +33,15 @@
- //
- // If you want to create multiple lexer classes, you use the -P flag
- // to rename each yyFlexLexer to some other xxFlexLexer.  You then
--// include <FlexLexer.h> in your other sources once per lexer class:
-+// include "FlexLexer.h" in your other sources once per lexer class:
- //
- //	#undef yyFlexLexer
- //	#define yyFlexLexer xxFlexLexer
--//	#include <FlexLexer.h>
-+//	#include "FlexLexer.h"
- //
- //	#undef yyFlexLexer
- //	#define yyFlexLexer zzFlexLexer
--//	#include <FlexLexer.h>
-+//	#include "FlexLexer.h"
- //	...
- 
- #ifndef __FLEX_LEXER_H
-diff --git a/bif.yy.cpp b/bif.yy.cpp
-index 7dd0841..9e09267 100644
---- a/bif.yy.cpp
-+++ b/bif.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/bifscanner.h b/bifscanner.h
-index a6ec9e4..ded78da 100755
---- a/bifscanner.h
-+++ b/bifscanner.h
-@@ -28,7 +28,7 @@
- #if ! defined(yyFlexLexerOnce)
- #undef yyFlexLexer
- #define yyFlexLexer bifFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
-index 6ee80de..1acfcce 100644
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
-diff --git a/cmdoptionsscanner.h b/cmdoptionsscanner.h
-index a48af09..e02c1f1 100755
---- a/cmdoptionsscanner.h
-+++ b/cmdoptionsscanner.h
-@@ -29,7 +29,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/reginit.yy.cpp b/reginit.yy.cpp
-index 8422867..ff088f9 100644
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
-diff --git a/reginitscanner.h b/reginitscanner.h
-index 4e78af9..23177be 100755
---- a/reginitscanner.h
-+++ b/reginitscanner.h
-@@ -29,7 +29,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
--- 
-2.30.2
-
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 5d77c164f3..5ed2af16bd 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acbb3  bootgen-xilinx_v2022.2.tar.gz
+sha256  2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea8e  bootgen-xilinx_v2022.2.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 88bc73b604..d83980d925 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2022.2
+BOOTGEN_VERSION = xilinx_v2023.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
