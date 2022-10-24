Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAD7ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 14:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07ECA60BF8;
	Mon, 24 Oct 2022 14:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07ECA60BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kh4mL5xk0dNT; Mon, 24 Oct 2022 14:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2295F60B55;
	Mon, 24 Oct 2022 14:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2295F60B55
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32FEE1BF2C8
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 14:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 015B14059E
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 14:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 015B14059E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKZ22N1rlYi5 for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 14:22:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5F640588
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB5F640588
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 14:22:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmbYo4yjfghpgFdpCuKNIAOBAmouoZqpgwGD1QoGvTdJdkxQt2F9BDX3YLSAlzt5RcBbeMdpiL1HyODri+II+Y1DTtwV6I3q3Od2NbbD351JABaectk4IJ6BWN79qUcV+TEy2QbQv3XvcpIzokWA7rq4oNqL7JeEwpLxoyjq6MTdIqBS8t4N///4HWUOGgGIbJIz612W3bgLtjskqpVmFtCVDnFrkwqIvn/wPHksQlhB/PMMv1RvUlgAy5DLkncAsvl03ZS6uafCCjeMJmbc0hOJ8shLBRbElfbCYZX7tvzmZ2CxQRKPijjh8cHD6oEAWqlmwEZuoddEcn88/fpmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD5hFKYKH2oz87NPDQyTW15NvlVje5/6bqcsQGIwnQc=;
 b=fYcYDMkmXshz8L5zt8QAGfXBUO8M++wC+0jURHH5jGR552nZW8KvcHQPVk9Jz9F38NpB1txLOPu+D85bCHOQBqic22bz2ysFfZyPXIYXxoBjAfX0ZbZ9FlOqqL2f4qtHhomiXNy3l2ZIUFDzwZkhMeOwA0EWppef2TefQdPXaRkWxJEIWJxPv2LD7hRedqvVwGWLSJGzPlYCvTCaDCbuWAc7XTY2xYs9UYjFxGTf1qMjvYtiUhC0Tn5yMH8l9lDdiBIJX0Pi3yrFs//0N/LvAbxBM3FwKEAiTpmuKth4ZF2vHQJ0TxhKarVcYtq3bfJs5xVXzbhy8rMYs0cRukuZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0046.namprd03.prod.outlook.com (2603:10b6:303:8e::21)
 by DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:130::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 24 Oct
 2022 14:22:27 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::f5) by MW4PR03CA0046.outlook.office365.com
 (2603:10b6:303:8e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Mon, 24 Oct 2022 14:22:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 14:22:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 09:22:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 09:22:25 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 24 Oct 2022 09:22:25 -0500
To: <buildroot@buildroot.org>
Date: Mon, 24 Oct 2022 08:22:16 -0600
Message-ID: <20221024142216.31273-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221024142216.31273-1-neal.frager@amd.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT044:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 09836872-c35b-4984-ef47-08dab5cb2d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yjLiQ+dhLaqBYqTXKi5ovjkF/r7yWwZXYcIjlUioZGO8tnrlWb90wXN23dr1gcDsryNkJ+c6hmo4PQVu6IeahuyAR4x+UgqBgmg8BGBmCYA6AUbcdB/etVlh7vq83Ugq8Pgbrt9v3x1omL9REFyDGVLCCPaEg02UpNmBSChq5B/xDnu8ETwoRTRwtpOKiEetw9IFy8cX6JLBhMcN9v8Mp4rt/QkyDkB5VoW+fl/x/QywSFkaEGsppg5TPv4p+rRJG1VipgAIzll4fNGKTJsBI23zDKGo5iv/ooF4yWA/u+AoTw9wNr+HQK2qKjTa+v/ifEs6e57Kb1WKvyIMwS8Qy64rUKZbYcRDUHyicoxUHXShVEC1/mRVdVtuPY9t3wQ8kIMamz8v3GbiizX/2pXDMpvC/1VURKP0yZZuDfNl+lDX3NUZztrDQ8qvg6JNKeSs548u2B9n6TtwXyCUnTjJ7ErvzKXN1DsP7/8L4BHkbSN3BGGWQpFvaHmQvTNCwwmo0/O64Vyd/zmD5JLfZyZhbWyq2dcMuvAYiRQbvCUdXMt3CytrYGGfvR/L8heVS6vEUfjrYyrrQ4gOWUfbF7W5Yrn2v9lfVgswIHDvh3qug/PBJp3y7WXGG+5nxVRX/Akbn7179p84h5LEDOGvLqejchbjP9BnejIPCunDbXQmcYpg8anoB+2Rj/EtJcgzXCpJur8qfWCLMgvY2dZpDln3UDR7RXCtCyTlngaQ/OQLuv3VlYs4HefZetg+WesgOHTF9l25V5i2BJDSsHIa78pKKDAL76FKNmMFtVJy6NlaO8mVEO+rOo82kEBBNEFXUReLq9xufa+NFkZr7vquuWf+SdyRllIrxAYj1w/ute0CwfWyAIVniecqA1wrHYFurNQR
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(478600001)(1076003)(356005)(81166007)(2616005)(82740400003)(336012)(82310400005)(44832011)(966005)(186003)(8676002)(83380400001)(6666004)(70206006)(6916009)(36756003)(70586007)(41300700001)(426003)(54906003)(26005)(47076005)(40480700001)(86362001)(5660300002)(40460700003)(8936002)(2906002)(36860700001)(4326008)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 14:22:27.2482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09836872-c35b-4984-ef47-08dab5cb2d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD5hFKYKH2oz87NPDQyTW15NvlVje5/6bqcsQGIwnQc=;
 b=hTQKh6qXhLuMqrxzFs78NrtDn2gDXYPtFiLd7JkpYwJDpn69DHLJQL3y47LsKsJOk+wYpqYKPqGT6lzP0G33gapJ/iuyDkTZJLbdSJ/yl3u1INFx7Zi9Y3uiXMWoqEuqVctXfK2LwerqCNXTv7O3ZjfCpIO4RFBUEr3iHKSC2II=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hTQKh6qX
Subject: [Buildroot] [PATCH v1 3/3] add configs/versal_vck190_defconfig
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Versal VCK190 evaluation board.

VCK190 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vck190.html

The VCK190 is based on the Xilinx Versal family:
https://www.xilinx.com/products/silicon-devices/acap/versal.html

The VC1902 included with the VCK190 evaluation board has Xilinx
AI Engine acclerators designed for accelerating machine learning
applications.  Also included is an upgrade from prior Zynq and
ZynqMP families to ARM Cortex-A72 cores.

While the Linux kernel for Versal is quite similar to ZynqMP,
the boot process has significantly changed.

Triple-redundant MicroBlaze cores are used to boot and setup
Versal devices.  For this reason, current buildroot support
will download pre-built firmware images and use Xilinx bootgen
to generate the boot.bin for the vck190.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                      |  1 +
 configs/versal_vck190_defconfig | 37 +++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 configs/versal_vck190_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 08095c9702..4634a957ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2172,6 +2172,7 @@ F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	board/zynqmp/kria/
+F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
new file mode 100644
index 0000000000..d80dac8f4f
--- /dev/null
+++ b/configs/versal_vck190_defconfig
@@ -0,0 +1,37 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2 vck190"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_versal"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/versal/vck190/uboot.fragment"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_PACKAGE_VERSAL_FIRMWARE=y
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.2"
+BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
