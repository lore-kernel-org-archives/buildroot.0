Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20A7C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 10:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83FD260F1F;
	Mon,  4 Dec 2023 10:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83FD260F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mMYsZkpD7Ss; Mon,  4 Dec 2023 10:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA09560F45;
	Mon,  4 Dec 2023 10:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA09560F45
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13C8C1BF37E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 10:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECD06408C6
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 10:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD06408C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bty0TJrZZUYH for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 10:24:47 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::618])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70CCF4087D
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 10:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70CCF4087D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StWfR1etlh4u4abRLMG9eqn3PlVZjX8CtbYUNs0mdX/su/kQhAA2Gcsc6VrfGQew/WIdsGJx7IHCAycvwlTVt/tYxLJvjlvbL499JLkGAEsQBrLgvzXUO6Hp73FicDvWGw4ysrJMjhh0pg7qjjRLa+dQGIInpOB+2xwicLD8GZD4TTAJI7kx6VTPl001tbetnTKWGEHs6nLK9YYB2U4HH/NcVSDSvnzsRWsUvetifp2uqyIoEh8JM7eovoEyiySJo+m0X+fOUxTeHia5ncXZ+sifcCjBnfrT4MCCIdmn5WUp820/oECIr84Pb46rrjMHvvDcqDTyjhgZT/nsk1VuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPwmm/3nEj/bHL8SwfjE0J7UjRjXF1zQJjmwR31EvoE=;
 b=QZdoIM2NGaZ3qIlwyDH+sQ28O8wnqrPKn9/V9johbpyQMm9pL+Y3Kw7RVk2a+cu2us/ehVVZ8Lz/qXvI2ZwEScah9ghKsu9RKrKRVPATJvEOaUiASIJSLFF+f7d3+MnMX5BYSHtRColgB41UpCqHcMCmh2egFDpPbXiYLszl9xs3q3nZDL9958JhsPW8iVlUcXrVKJRKeP1XQrU6mj1GJrKACiiaCe9+RxGa+UR+xFCR9G6J4J0dUmYvQwrzG0QnJZAful9tTo47GGqoPxpZpRTuG/dT82K7lyYoDo9qXJZwAUbK3xAWX+lxrbDnh1bNei6E+Md7xDcX9w7JSWGzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0274.namprd04.prod.outlook.com (2603:10b6:303:89::9)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:24:44 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::39) by MW4PR04CA0274.outlook.office365.com
 (2603:10b6:303:89::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:24:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:24:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:24:41 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 04:24:40 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Dec 2023 10:24:30 +0000
Message-ID: <20231204102430.1612918-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6ed149-cba0-4fb1-bbd1-08dbf4b33ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7pcZMeoouOGKqpvtdhQH1HyxWUa1iAOC/FcO4mGOBw7mOoM9d0k6MLIVYPEu40Rui2pUzr6hrJSgfIgMGS14PsKad4A2t1uMwgBBzRmZPyERq/zCFpufmWjLtJS2VPUQGGHowiRqxIDm2pcuHf6oIdbLEtsKsy9V6W4AS9fbvISh0VGtuLAqgxAgpA1vQTh8iOotfGiZ5lMQm5cCtvAFFNiIaQZgdh5ByDdPAAD4TnVC26fNn1ITVAJagxUMJYT6XZH8eXdZCaCZNEpkL24ugAScWP5jxly5BoDnPYbd56OfgsWb+GQjFgdzhtU0ix/uLUczrAKar7B7wNNOOThZaBjtGF63gSLqsTeyj5PSe2zW8nhryPC3pLdwUKsjxBA3YQpmFTUBcgsX45QTB4OggyPS0wywL84ZAGSlGrkOAX1hZ6Dpci+cPM5nl2ehBUo2l/H8d40ysoQCAAD5Ee87Si7kz/LjoApCZjCDKDZ+7NyUuUKgWMj1HimNl+Zq+Npmwv4j1F/wdj7KiC9pN8pY2ZMcq5Fm5/8k0mxCHTaXidDdMiEbjnTW3K30BIngDplS6Wjwv/j9H4HFSs5UCZMZ6aRf6VB+LWksHMyUKLoviHcEfXqH1DrVh3iEc9i6niSg0cUhVFZFi2GxJ6Tvtg+0RqQ9+RkffJH8oyr6d7tQ3Bpg4Blj9VwlLSqSk5pCAQNyEd56Vk+rxHosoTiohJ0ogCDmSl4omwIdgKevPlYgTYK3X0/VcB8YoDqRlxuhv6PfdMSZ9WSCs2+6n/97baZn/qj9UIybGVRupcENqMf87RaeF5RDa/T3gt2lKL4WOmWy4LGh/oYflB5ywzrAvIguwg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(82310400011)(1800799012)(64100799003)(451199024)(186009)(46966006)(40470700004)(36840700001)(478600001)(336012)(26005)(966005)(83380400001)(47076005)(6666004)(356005)(81166007)(426003)(1076003)(40480700001)(82740400003)(36756003)(2616005)(316002)(6916009)(54906003)(70586007)(70206006)(36860700001)(5660300002)(4326008)(86362001)(2906002)(8936002)(8676002)(40460700003)(44832011)(41300700001)(15650500001)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:24:42.5690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6ed149-cba0-4fb1-bbd1-08dbf4b33ae1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPwmm/3nEj/bHL8SwfjE0J7UjRjXF1zQJjmwR31EvoE=;
 b=gqBG9PPQ/emvAjE1dwi38osxK2PSRe4nVu6FYDT8PnSE3ImCZAHDuJVk2BkJmQnvo1hKYJvVU1cspEnHZ0XYAboIUz3QpI41lT//EbQmu5VvSSIlTenAfobYSuD2p0524nvD4LW1pC80ov2P3L/yY/uMjq/5fm9gj+OBk9az7XM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gqBG9PPQ
Subject: [Buildroot] [PATCH v1 1/1] board/zynq/readme.txt: update doc for
 zc702
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
Cc: martin.chabot@gmail.com, ju.o@free.fr, juju@cotds.org, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the zynq readme.txt to add documentation for the zc702 and correct
documentation that was no longer up to date.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/readme.txt | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index 162734963a..b2a4cefedd 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -1,7 +1,8 @@
 This is the Buildroot support for Zynq boards.  Zynq boards are available from
 Xilinx and some third party vendors, but the build procedure is very similar.
 
-Currently, three boards are natively supported by Buildroot:
+Currently, four boards are natively supported by Buildroot:
+ - Xilinx ZC702 board (zynq_zc702_defconfig)
  - Xilinx ZC706 board (zynq_zc706_defconfig)
  - Avnet ZedBoard (zynq_zed_defconfig)
  - Avnet MicroZed (zynq_microzed_defconfig)
@@ -9,6 +10,7 @@ Currently, three boards are natively supported by Buildroot:
 Steps to create a working system for a Zynq board:
 
 1) Configuration (do one of the following)
+    make zynq_zc702_defconfig     (ZC702)
     make zynq_zc706_defconfig     (ZC706)
     make zynq_zed_defconfig       (Zedboard)
     make zynq_microzed_defconfig  (MicroZed)
@@ -31,12 +33,11 @@ kernel_image=myimage
 modeboot=myboot
 myboot=...
 
-Note:
-The DTB for MicroZed is the same as the one for the Zedboard (zynq-zed.dtb),
-and this is the recommended solution, see
-https://forums.xilinx.com/t5/Embedded-Linux/Microzed-default-device-tree-dts/td-p/432856.
-
 References:
+ - ZC702 information including schematics, reference designs, and manuals are
+   available from
+   https://www.xilinx.com/products/boards-and-kits/ek-z7-zc702-g.html
+
  - ZC706 information including schematics, reference designs, and manuals are
    available from
    http://www.xilinx.com/products/boards-and-kits/ek-z7-zc706-g.html.
@@ -52,7 +53,7 @@ the upstream kernel and U-Boot, you simply need to change the
 following Buildroot options:
 
  - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
- - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARD_DEFCONFIG)
+ - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
 
 Custom ps7_init_gpl.c/h support:
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
