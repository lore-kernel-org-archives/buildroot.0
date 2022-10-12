Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A22C4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 12:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5D7683281;
	Wed, 12 Oct 2022 12:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D7683281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPztGCh0W5tf; Wed, 12 Oct 2022 12:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1477682C75;
	Wed, 12 Oct 2022 12:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1477682C75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2A7B1BF5DF
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 12:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 861DE8328E
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 12:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 861DE8328E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-PILUR3Km4P for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 12:37:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C316D831A2
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C316D831A2
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 12:37:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9Zp7MjCuNgN+uXtW/6X0+9DWXlajnidQjKtkvmDhOwpcY6pHQjs2+TjvLsBhLoWyQJXMqqibZWGChjBpfRxcGBqFfb691qYm0E6nH/yJqKGFhcMdL6tkF8rRONAx84uI4ZRrUQN/Tevr8E6HVLKWzz+MkCrqTnXuFD4dkbqyUq3UcEbumAi1nmq6rn2M5IlOZZp9Blke+xtbOc7TWDaocfouzmDozLOR1qjJ9w9XFaUVVHFAd3+jFhs+Nr7efb9PdI3l61Rdmo6LGe4jCfF4oinaueJfJ7GKODpkKJaKaY4u2H1DttjaepcK/jQxRWdcVH89jDYzhhlkhLSNbWvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS+l7tgD8YW2KqBQ5Ecr3iEosLEUsK04x30DFJdFA2s=;
 b=RQJl0Ocxc4wLJbD6lDkeXcQyKRaQHWIxZey7krKEENrut+44XfdwWjiD0y30bUcrBJpQPAVkFW9QgKbUXG9gXnbFiRQhGDCh+GExcbzVlgtYqqvBxWbI5w1FeYtzPR7pbPOzHHUXpMYDDBukEbgWDqN9EnTQ+ySwZuPsfqrSdhKwxAzuxmAKZCqqJNNHayAhRyoTgCnzQY8z8LS2EJtIxf6fuqYsuoiwxHlhkWP2vG8zl9TPbI7rTwOHmicu9c5f1M/GuvZ+DFMQBrcsanokETH2L7xiIodDGZ8bi/Vo1xOXcM+ScOFZLrPC5jGo5OLMnk3jCFopvQBsetl0DJc/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0377.namprd04.prod.outlook.com (2603:10b6:303:81::22)
 by DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22; Wed, 12 Oct
 2022 12:37:00 +0000
Received: from CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::c3) by MW4PR04CA0377.outlook.office365.com
 (2603:10b6:303:81::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22 via Frontend
 Transport; Wed, 12 Oct 2022 12:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT100.mail.protection.outlook.com (10.13.175.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Wed, 12 Oct 2022 12:36:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 12 Oct
 2022 07:36:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 12 Oct
 2022 05:36:55 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 12 Oct 2022 07:36:55 -0500
To: <buildroot@buildroot.org>
Date: Wed, 12 Oct 2022 06:36:51 -0600
Message-ID: <20221012123651.4218-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT100:EE_|DM4PR12MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 53145ee8-4caf-4229-4897-08daac4e7503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLwYIKuAuNunf4rTIiUHniECfLRkJ9wT7u+VG2iVZHgshjQSQz1wIdYLdZx2OZTwU73KwC6OAnnDhP3Xe7u0y4FdjfR3mS2fo1XqpJRNc7VDuKQejqhxCP6ymzXRAZTPpEUgCF0ugDO2F1qnTUNws1FXKzcqTgCJuVHdGM5aPouQCVkwlsdwTq9BKdNKnzZ83bMIc+1Y4r1vNEU5mW1b7fpH6m/+L9tSz9B5qoTqsJeh1yOFqFkwvubsAcrrou8Z578j9xKo1Yy24gUzO2LoPv2VHx3WhIW4jgH7WTx2C2eGYiga1UkkLmgb+irsGdKkT+Q0YT9loTRTOxXVaeX/9Vu6/D12KFb76KXs7pHxcI9pwlkRPVUF5MHjO8ODZSolBHgqyixL7/FQd9dsyX6otV5EP2RiOCn/MuVINMbx5ZDiJoJ+goSzrju+N+Pump1MGWrnP1U3el5lT0tkMYpV4EX1yQIxZD6WP9gGAAlChrpyMhTXYnAqwpsNMWUKNSSWoN5phZ/1O/zslnSU8btgZHm6OZZLnINU5RiOoQixH/hCJxFhhQL2mjhfnyg7LIefSEJUmBXpIYWXz6Qwif0Mdgdc6H/AjqWjEjfw/WqtjQNGmTKXWUOW4TFdXyNeUh6+Ot52XGcQ1L2i5GUV6Eqz6FQDNt8SqDx9UijnDeuWRk0sjZIIOM/IgtbVMsqmCtTlGOxmtzhfgo2zZjnlzsfmYpJ2tVv5EpSoyF+575so3Toim/2JGEBg82hEP3EIn989Llq/7BJzJ0ohsPBMIN0daGDDYTS/HetEFj8tYT7VryrfTlbJYKHHkUuJ8DcNnT1+GnbVoM6/DNCbyM0I68hbl+Z0XvenWwWjo5XNnhC+/ZRwVP/8Rh9zcGDLXVzCfpF5klmZkNrSSV9Ffk1+28R8JA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(6916009)(54906003)(82310400005)(478600001)(8936002)(966005)(5660300002)(41300700001)(44832011)(316002)(36756003)(4326008)(8676002)(70586007)(70206006)(36860700001)(40460700003)(82740400003)(356005)(81166007)(40480700001)(6666004)(26005)(83380400001)(2616005)(336012)(1076003)(186003)(86362001)(47076005)(426003)(2906002)(36900700001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 12:36:59.5360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53145ee8-4caf-4229-4897-08daac4e7503
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5040
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS+l7tgD8YW2KqBQ5Ecr3iEosLEUsK04x30DFJdFA2s=;
 b=vHa3s6XHh+2xJImgdg846IXYa5Jt0h1MJ0B0koA/J4n0i1Dwgy97D2TGXzzerNbEYY+9xqDSo4GB7ViBiefSOLgmim9sLT0KOfe0Lh7ZcI+XlbRukpC3j91bWpq29u693SkPrPLbDfX1dp+37TOx5M5+B9LxRIjWvrBl8tTppWU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vHa3s6XH
Subject: [Buildroot] [PATCH v1 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
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
Cc: luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>,
 kris.chaplin@amd.com, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for zynqmp pmufw.elf files.
It will allow buildroot to use pmufw.elf binaries directly
from the Xilinx git repository built by petalinux.

https://github.com/Xilinx/ubuntu-firmware/tree/v2022.1_22.04_1/xlnx-firmware

It will solve the problem of the pmufw built by the
zynqmp-pmufw-builder where soft resets crash.  Details of the issue
can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Instead of using a pmufw binary built by the zynqmp-pmufw-builder, this patch
enables a pmufw binary built by petalinux to solve the issue.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/uboot/uboot.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a9f9b1bf16..136cd9e306 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -392,8 +392,17 @@ else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
 UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
 endif
 
+UBOOT_ZYNQMP_PMUFW_BASENAME=$(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
+UBOOT_ZYNQMP_PMUFW_SUFFIX=$(suffix $(UBOOT_ZYNQMP_PMUFW_PATH))
+
+ifeq ($(UBOOT_ZYNQMP_PMUFW_SUFFIX),.elf)
+UBOOT_ZYNQMP_PMUFW_CONVERT=y
+endif
+
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
-	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)")
+	$(if $(UBOOT_ZYNQMP_PMUFW_CONVERT),
+		$(CROSS_COMPILE)objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)
+	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin")
 endef
 
 UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
