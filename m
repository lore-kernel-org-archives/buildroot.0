Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12159C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 12:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C3A60A79;
	Mon,  7 Nov 2022 12:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C3A60A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoER_TCzlMAY; Mon,  7 Nov 2022 12:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1A51607EC;
	Mon,  7 Nov 2022 12:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1A51607EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD62F1BF375
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 12:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40300607EC
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 12:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40300607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCfGpSD1U4ZH for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 12:43:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6024E607C7
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6024E607C7
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 12:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj4Sph2i3yXfu7/CvAUxvYJGQhws2MVY78mPPmoaIeHIjHWAH7TkWr1WKz6XigLe9Ac0Bg7y1F/S+dGI7xAG2++fQQwJULp9OBRJPrJbGRVvv0h1OIVJn1qNrbFJHft51Tfd4d1zCz43RtjFKtNAUiwskWWFhAEP92cZv6tB7F37EE/ua3UXcXrsxeHeNdMLFogejpTVetygKN2ym9WRskK9If7BP5T5qMHhthSg27RKJLaL8nx+gCrOHgUmoXll+CG3f6bpAC4w8mQQDofknFlS6Q9tZIg9/a4LvqMDBWPZqyNPYQjqkjssySw8FB8A1QDa4Vkmi69aLJVpqqYVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmCxZ0Q6i4MttA/R46zkM6o6DSYoR/1T4raTygTWS6M=;
 b=TGzNrGmRltr4LoDvZew4wMoMdulWzMalVm7UqMGKZzTi7r183rXX421JgS8YlbxSUpZP2rCvOQYUpQXfhpQDiQQoA9kqNNgXrxq3pSWZ8zi2QUSDh/aFyRWWJhbH6bRxmlc8AsWCttlj14hjQd02e8kveKaKCY8xE8wLUBu/YW+qpwhuo5N6ciriddoSpcSDxlVUKhHNP0ZEflh21qj50eeoxcXiXOzlUmvrJYL/RkSA2D+FKx2wiKtikqj7yWEXcgf0yYs7tIzLj0Djv+IwnUwNwFqE8fNyz/EbCj9g26xiehmRYNOIQYM2BMEmVqa2Vi5TG701VdSkp7GCLATPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR05CA0002.namprd05.prod.outlook.com (2603:10b6:5:3b9::7) by
 SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 12:43:37 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::21) by DS7PR05CA0002.outlook.office365.com
 (2603:10b6:5:3b9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8 via Frontend
 Transport; Mon, 7 Nov 2022 12:43:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 12:43:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 06:43:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 06:43:22 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 7 Nov 2022 06:43:21 -0600
To: <buildroot@buildroot.org>
Date: Mon, 7 Nov 2022 05:43:18 -0700
Message-ID: <20221107124318.21725-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 914f5270-f165-429f-75c9-08dac0bdaff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m9FZ9UhJMNfrdsq+ivaAioS0DnvA5CB2ZVQ+Wo77m4VRXtX+kU8riO32B+vs0yw/LgbvfTChNXBssvg9wYWP2v+d5GcfuI9teBQdVRZR0aNztSIRL/pBd+NHfum3W5DgiIJK7mzwsJA5ANgAtqPLj4YmgP0dw+Z7dKjiC5rlXtCtUgf1RnqWP49qZGYyeTevz407CiMtK2/1j06pyBfS9pL5uTMLPB8F3EwVwCSRFnmZNaNSax1uN+NwF2qS3GNf2j4QQXKW1Bbl7+jXLOURSPSZev4ylu7DhxONJ1zWrSnVgOY3K70RBzfwmKNDJCLsgYGq6C07mFfZU1HIBwRNHb1Fh1UgibhHtpuyuge+Chmp/3u0ZD/6PEQwTibaanLqqxfnlOgDrU/Dcx8dSQ+naQHP1J0sSt3paiAnjobF2EabWRY7zBc6F72hUSGWUVrd2BIfQ/McTxu06HFgp37rFUjwVAXK9NgwRNNR+PA5LzL39Rze50M7YJFfV0XoTj7C4In5TGSl6dBJs0XqaUNV9frGUiqB01U0ll4qDQZhOLR7IMmodZZaxN3QF1gs6efw0nKNE0vAzk5kdVqLoCZyOq//RIwrZx7OGbhgQbLG/DulqwP6XrY1nvHXhHjEV7tQo+h9Ws9DOde5H5xWWmLpq5zBmVqF/5RoJjBkKqSdek5eeEp7wuWovr+D5w1mkRZqpAT7PpNExAn2eLOoE7aZLnn7H1Ke7J9Utnwc5Tgj9/oI53jZ/zOvSELe/r+2k0UIUwgxRvl1UcOv2HjwOWV2D101SpMf9RCD0rjCpEeQNsVIW8/IpF65D7YU9wX9Z7pb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(2906002)(36860700001)(478600001)(82310400005)(26005)(47076005)(36756003)(8936002)(41300700001)(6916009)(316002)(6666004)(54906003)(40460700003)(81166007)(70586007)(4326008)(356005)(82740400003)(70206006)(8676002)(86362001)(44832011)(40480700001)(5660300002)(426003)(2616005)(83380400001)(1076003)(336012)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 12:43:35.8950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 914f5270-f165-429f-75c9-08dac0bdaff4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmCxZ0Q6i4MttA/R46zkM6o6DSYoR/1T4raTygTWS6M=;
 b=h63emnmB9Os4naArJQOzuM9ojc0TIl8n3FkbQde+7XQ8Yw6vvQlD7GY0rwRwM51sQ0qIpSILErGP6oVfphre2w2Tk5kdmrdRghLfgZ6x9euiLsfXAvWDig2iGy4/1C5KIWSMfzwSIqMMLimNzeFbwDQA5TTPcUgoL9X5FP/+CUE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h63emnmB
Subject: [Buildroot] [PATCH v1 1/1] configs/zynq_xxx_defconfig: use
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the u-boot device tree definition
from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
instead for the zynq_zc706, zynq_zed and zynq_microzed defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/microzed/uboot.fragment | 1 -
 board/zynq/zc706/uboot.fragment    | 1 -
 board/zynq/zed/uboot.fragment      | 1 -
 configs/zynq_microzed_defconfig    | 2 +-
 configs/zynq_zc706_defconfig       | 2 +-
 configs/zynq_zed_defconfig         | 2 +-
 6 files changed, 3 insertions(+), 6 deletions(-)
 delete mode 100644 board/zynq/microzed/uboot.fragment
 delete mode 100644 board/zynq/zc706/uboot.fragment
 delete mode 100644 board/zynq/zed/uboot.fragment

diff --git a/board/zynq/microzed/uboot.fragment b/board/zynq/microzed/uboot.fragment
deleted file mode 100644
index bc4dffaffa..0000000000
--- a/board/zynq/microzed/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynq-microzed"
diff --git a/board/zynq/zc706/uboot.fragment b/board/zynq/zc706/uboot.fragment
deleted file mode 100644
index ad5efa6204..0000000000
--- a/board/zynq/zc706/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynq-zc706"
diff --git a/board/zynq/zed/uboot.fragment b/board/zynq/zed/uboot.fragment
deleted file mode 100644
index d58fcd5439..0000000000
--- a/board/zynq/zed/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynq-zed"
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 10a4f4095f..5f3fc5e6ab 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/microzed/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 82c47be7a5..0daaeca872 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 34e1b67184..74c2e8c4d3 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zed/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
