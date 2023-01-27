Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB519C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 08:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 445FF827A1;
	Fri, 27 Jan 2023 08:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 445FF827A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wX75DraJvxeI; Fri, 27 Jan 2023 08:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BA3C823E0;
	Fri, 27 Jan 2023 08:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA3C823E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D54081BF349
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB3CC61202
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3CC61202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAIdTQCXIugH for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 08:49:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E76E611FC
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::610])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E76E611FC
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 08:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pkxy1SeB286u8fCZ+4gugy2lGfH6yIt1EjPY75fX2ndGqX+hZSSV+pBt8iQgXqQCMOxETBbZ8+3NpBCwOJbhuJYuQljcJGqo6ctkhUhr+mwC6VX/9ImS0WC5919w7XFIwKMMX+X1mpw3Ye4jqMMPlzdkCv0UWFbVUCeM/B75KTAm2I3vsWymPZ6Sd7/YRRSHaog3ZqoR6U20yiPLey3EybHmE/djb/DeX5whYgm1KNymMxIilmldXqhplHhD4fQP0dpQeQhbLqnFMY36wvIqeE2NH+JyamBsqA+JJ92Ift8fGpBjz/fgHHRUUbt4KCU1gKxeIUn8oeNlK8lTae6i/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snH95DaH9VjjIPNmIx5RPOme7sGgGjOjfXDFhXQrphg=;
 b=JztFpy9dSEozNn4wTDNf7Z/7i+FlsIU0n8LLQUPzMWTAsUbC2LxssRDvK68v6eQiVMEnGgi7BfE9ribC2mMwsu7fPmlbTL7sADVdH227xzKC1DGDrz2Dsfk2fVJcJ8nN0AjRqyDaEGyTFuS5r0ggBo2k9Sv4J5qGSWa3+9fcsiV/ZkFcAOFZca1RZjON6SfU9jmGDydk+wfsmSN1TS/IACh2HiKyZDddGtbjEnfV8iOM9qvUP54s35YimAfcJ9R1kFCuJXEU7SyeSOfpZZ9U2HWi3AaTR4KmELFlPNhNsU/lSMupghbRrUl3zc6XH99wY23w241AMnxKlAOJrG/0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::25)
 by DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 08:49:50 +0000
Received: from CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::d0) by MW4P220CA0020.outlook.office365.com
 (2603:10b6:303:115::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 08:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT071.mail.protection.outlook.com (10.13.175.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Fri, 27 Jan 2023 08:49:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 02:49:47 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 00:49:47 -0800
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Jan 2023 02:49:46 -0600
To: <buildroot@buildroot.org>
Date: Fri, 27 Jan 2023 08:49:38 +0000
Message-ID: <20230127084938.15712-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT071:EE_|DM6PR12MB4250:EE_
X-MS-Office365-Filtering-Correlation-Id: c110662d-45f2-4da5-233f-08db00437299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pv5jlQQHCPlPcBvDRL31eXOgmXKfNvx46JOTyB/QsOUajRF8uSZ+93idbVwSJp/ZsYepgJofKB58zyeihjyfT9ZXHCeD3EY0fV8y9OMyFgBs8LN1Ey3/cShcw1KRBhWHs/sH9CUrCFrUtMmdq6wvsNK6/mb9dfIaPip4quM5kYCMav7SnUdGd5IHDRPueZ1GqU5R6m8BOA1wsU3I8kNhv+xuY+xdAimsIZHyEhEkE7FthE9FIpqmmkURTE6rG4yUy2l8vhXr92i6Hp3AkLG1/mJNDa+y8rdhZBCxsfXZ4yjoh0FHckfASyeuIw9jQ/Lhme8mXy/ttCGttEygb/3qayYqC7zWxIohkpdto51jRQWMPco0QMgOedvS+ttE8yqOOExhFM/IVYadLEKLwEDUK2yXnT3LErP5N2oov9wqzZ+PMsIXe3QaCdgxN6RGQYThCt2XbOYCLcm+pRTmDdQlT8Bs2//E1IbdhCXr47QomiCNtt4Os9mvr9UPYq0vzzhpeiFd9XdtxKll+s9kXDQsnDAcjuQusvJNEueK+YH+k1Q5b6YMfrUUa1eFLTp/IEnRW3K8g6x0F/NiFN60PrchHSqeFY2wOzRb+xtveSNJ3dVpCJnHa1uGwDiMPyk8OVp+sJpX604sWJTAiGkfQ3MWrgvW5m3hSPBfEY8ZMOnTRXWB+o91eJjC8jnPaWmiRREoKXniZbi0o46WgnKEODtI8NyR7Wj9QOSFfVBxu1pYzX5B8FjNr/KcvzSSObuGBCb1wk++i3cwiFglFs+O27qLgKH0jLYqwiIT5pAIKCr08zg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199018)(46966006)(36840700001)(40470700004)(4326008)(8676002)(6916009)(83380400001)(70206006)(70586007)(41300700001)(54906003)(8936002)(316002)(4744005)(40460700003)(36756003)(356005)(26005)(186003)(44832011)(47076005)(40480700001)(426003)(36860700001)(2906002)(5660300002)(336012)(478600001)(6666004)(1076003)(82740400003)(82310400005)(81166007)(86362001)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 08:49:48.6942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c110662d-45f2-4da5-233f-08db00437299
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snH95DaH9VjjIPNmIx5RPOme7sGgGjOjfXDFhXQrphg=;
 b=eAL2I5DdoN2nIHRGEQ+RCE/KvHjqEgWFyuVuxmqNTqpRyhBz9ByBMhrux67yyoqVCMsr4OlskFyCO+fWs7seb5q6EmtXbtZNAWQwug9/IHMteUIQ2J1eFlac5RgZWuvBf1zs0rT+3q0VQHj4FhcXMKPzuTek0lVl4O03sKEGQyI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eAL2I5Dd
Subject: [Buildroot] [PATCH v3 1/1] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reduce the configs in the kria/uboot.fragment to only what is necessary.
These 4 configs are already included in the xilinx_zynqmp_virt_defconfig, so
it is redundant to include them in the kria/uboot.fragment file.  Applying
this patch has zero impact on the u-boot binaries that are built.

This patch has been build and run tested on a kria kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - CONFIG_DTB_RESELECT is no longer removed
---
 board/zynqmp/kria/uboot.fragment | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 9e32edfb36..a6a262a562 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -6,9 +6,5 @@ CONFIG_PHY=y
 CONFIG_PHY_XILINX_ZYNQMP=y
 CONFIG_PINCTRL=y
 CONFIG_PINCONF=y
-CONFIG_POWER_DOMAIN=y
-CONFIG_ZYNQMP_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
-CONFIG_RESET_ZYNQMP=y
 CONFIG_VIDEO_ZYNQMP_DPSUB=y
 CONFIG_SF_DEFAULT_SPEED=40000000
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
