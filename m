Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3318C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 15:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56D7440123;
	Mon, 31 Jul 2023 15:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D7440123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLVeHNK7nYWm; Mon, 31 Jul 2023 15:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0117C4173D;
	Mon, 31 Jul 2023 15:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0117C4173D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0DF1BF3BA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 15:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60A5C60B9F
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 15:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60A5C60B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ai0fyGmi79hZ for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 15:47:53 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE9BE60ABF
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 15:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9BE60ABF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2heZrrTx3I0mokiNFUjXMNkUCdwzz4hd4/Ev3wGRgAHHyAiPXVIqTKzFUDxUPmdiPJQvjU+zijJRnahaYKwgJMj75fffkIEdGFRKE+zAGHtUGQlW0aHEygBSqVjO1ZfYzaxZ1iH4Mjhh5ItQeJlLnt6XUHNAgFpnoUyb43N16HN3XWITM2wptwnNiPCaa+49FvcSGuBRaZdYwIBIT75sF3GzYT3XQD4llzqNs/TpIrFLFKm28+P/Ke1ULYKIPckL4xK4sxGNed64WSuvyXqLjLk7d1VhywT+0lku9q36jYQk61W8K3FOPOrMdOVqaiBjOk4tkBgv85XWdTpmW6kVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rsn+bHfCZXqVGqsznCUUIJS3XoYq0ujr6+MHXAd/qzk=;
 b=JpDmotzMS6U0L/GZsQSQYte99eS2PBBLntksK8z0b1oWjvFij+9DwgiwAz78a8sh30tmpxKDHRn9M40hHHwavcbDC+JiGs+rbYFnsSsZ+X1C9FOHqrNwFmyvoLHyiTa9+HbQSQQDOyOlve3BPRp+Bo38XUMvuGAChk1h42aXpdt7qTjXDKdPlzPtz35P8qrVLmNSK+KuV1LFP3uPQBB4/ICVvzOBafOi4Pybq2h9jHP6OuAFp5iJ0SIEFJzHiX8RP1bmukShPFlFsiw0F/bS1FCY9B7mEo2SUkN+vWE9UakKS2JmnYqDD/gcTn39zIeMk2rAqkXBcQx/uGfeIiQ2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN0PR04CA0188.namprd04.prod.outlook.com (2603:10b6:408:e9::13)
 by DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 15:47:47 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::86) by BN0PR04CA0188.outlook.office365.com
 (2603:10b6:408:e9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Mon, 31 Jul 2023 15:47:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.43 via Frontend Transport; Mon, 31 Jul 2023 15:47:47 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 10:47:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 08:47:46 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 31 Jul 2023 10:47:45 -0500
To: <buildroot@buildroot.org>
Date: Mon, 31 Jul 2023 16:47:39 +0100
Message-ID: <20230731154739.1371164-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731154739.1371164-1-neal.frager@amd.com>
References: <20230731154739.1371164-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT015:EE_|DS0PR12MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 000ec171-a9d0-4429-4a6c-08db91dd7ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3f8cHrVuqmQkOzfEEj/fncz8IzUKRzW8uFs8bNVIJTPEdLw8vaGxPF0lNeXLOGPG5WrPbu5SITm1i21WCw5AQbhlaFyrgY8LrI4OAha7Q5Ia3gH5PG2q6aFpajerxrf/nxuaoCa+zBsJGqbGcY1aKRuy9JeDalIpx/2161U0TjpDjfPXU3KUCEBJL95Jm06SgGLn0qahJPfWhnd1nO9UuPRB1yLDEkvJ9vGrVLtdLb8/cWTtIkP03yCToZ/oTaXcP7mqbIRkNqFmsCqxT3P+XZGHuWQcHr3tbHwzayEp652xBYCX5on480vbGPa0b8hTWpdVWPAjHp3WAFCJb65qwOT/4AX3WrbDLvRo2m6a1mihEHEywEpnmfwMLH36ISxrVpjWnmo0nEh5GC99TtY5PBqnkBzffgEpUcLADe9xQJ+Qi/Z7Xsuga/fb8zcWZA1KjlSHDXEtbIGWX3qmyLgGOdfoCTI9wKu2n3Nizh4D0d9lqhelLc9ae6xB32Dp+UJTXQFgK3le0ah0d/iw6s1ufVcDW91hcGajuImXalqnXsxvmzfC8dXHRpYAy+5Isa7OPb9go3HDWS8s3KHZRLA/vuDVxPnzC32/6WIRRhhspTZC/kFQQ6ou0pnrF3HodzCdkXILAxRw1XzOmHeQHZSw6BLXzseeWzzOQtisUzPz01VyM3Y2OSql7f6AhKRrpTHrFLC8wl+Ew/g2/qgrT9hNI1WkAiBOt9h+LS0i75DZ5+Ocw8qMWHErSU1OEARYgOWvczoewqwpUPB+89KJUviMg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(5660300002)(2906002)(70206006)(6916009)(70586007)(4326008)(44832011)(41300700001)(54906003)(316002)(2616005)(6666004)(8936002)(1076003)(26005)(8676002)(336012)(186003)(426003)(36860700001)(47076005)(83380400001)(81166007)(356005)(82740400003)(478600001)(36756003)(966005)(40460700003)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:47:47.0086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 000ec171-a9d0-4429-4a6c-08db91dd7ccb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsn+bHfCZXqVGqsznCUUIJS3XoYq0ujr6+MHXAd/qzk=;
 b=BXAq2yOizPh+mnxu5kR9givFBrm2uaZdPR6xekYYDM3BqR2LW6LlFLf93oWh8UzTq23NmrRyE+fUkUhNhQ96U5QLGMaREdn74eh6epWpnuYq+XunGpohuDx64VFmOjzY5lNXIHKZDzhL+Kc9u88pfuGOjGuPxDUyd9d/aSlnqlY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BXAq2yOi
Subject: [Buildroot] [PATCH v2 2/2] board/versal: fix atf build failure
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

Binutils 2.39 now warns when a segment has RXW permissions:
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107

This causes the following build error:
aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
permissions.

This patch applies the upstream boot/arm-trusted-firmware/v2.6 patch already
included with buildroot to solve the problem.

Fixes: https://developer.trustedfirmware.org/T996
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  -switch to upstream version of patch already included with buildroot
  -fix commit message accordingly
---
 .../0001-feat-build-add-support-for-new-binutils-versions.patch  | 1 +
 configs/versal_vck190_defconfig                                  | 1 +
 2 files changed, 2 insertions(+)
 create mode 120000 board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch

diff --git a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
new file mode 120000
index 0000000000..695cc80b94
--- /dev/null
+++ b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1 @@
+../../../../boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index a393b681c8..fab41a2991 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -39,3 +39,4 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
