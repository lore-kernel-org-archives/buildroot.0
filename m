Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CB7C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 13:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A53415E9;
	Thu,  3 Feb 2022 13:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spPIo5ABynAl; Thu,  3 Feb 2022 13:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3681841573;
	Thu,  3 Feb 2022 13:44:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CACD71BF476
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 13:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6B62827F0
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 13:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dim4gHLveikx for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 13:44:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::620])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0A5C827A1
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 13:44:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9EuhLGZFxBpzpYYFi2H64987lOsuDVoH+WjFbZ/ExtxRyIkMt4gWjdDjj0VS6Dzbc5Snyh2TGnhU1Ob8g4W7n0xm1vefWaPYUT1ftftCXe0Aj4hcnjESdHE88+/ElxtCvwsrrTcE23ly3KTn5uwB9PtGUnkloLLyy09hKkOzsXDT2leKzQ4dsYd2v+dSrFQ9d5THE+O0c1/ErX5IrKwW3QZUFZW4vS6TGDLI3mkM5bDBdGfa6s6aBon9eW6dxbF1/yDtrfPTFmP2NFok0dMKuOf6nYMLcWI5nUUsJDc55kxqbHZcQ1b5bd2F/ixDRXlvNZlC3V2zNEGG5dPtfp6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1yBdB5nJwlm05erW4XbyGbl93gUAJPryI3Re5A6Iok=;
 b=DfKPicXsP1yToF8TD3nSA5mfQaPnuFVNyFI0o8V7Az5lv8iBpauU3IrO+JCWW4kEU43+mgSXaxnrywpZLchNBzeXOrAi/E3mEfwT5LYWqISyOSTJfx4eCxrtwxqQ5n/8LG2lfqTTaM5BTwH/4r8G1NT4DoPWUo3E1QqjHHDBwNV8VbRl9d0BqqkLt0UU+BiRZIUY/4W6b1FkQXv22FsjY0eb6x7AP7v+x8T6GNt2OnsYLA5I37wJBmLo+49pzDmvgqkOjBfkhTa/wQZTi2JRyl2zFXJOGBfbxrFuKpDLe9eJwUSX6x4p9JQZ0Wg/kwJTWgfMn+CuVSOAjCjxAAZy6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1yBdB5nJwlm05erW4XbyGbl93gUAJPryI3Re5A6Iok=;
 b=NDgCge6NioSFh0rreLItzyl6CYPP2mSj2hzstbg6bxki6oUIukmVcbQUBpwR4Sr1ddxNUO4ndUmEvPLp1LPG4hn9R8qjgZRr5EeZVbbxUbQeQ5Pu3O6OcvIiGtJ5tCnu/uK7RmW2bWYx6tj1+2uSBDc92f8Gb2qUFH+I5LZFbhw=
Received: from SA0PR11CA0045.namprd11.prod.outlook.com (2603:10b6:806:d0::20)
 by BY5PR02MB6931.namprd02.prod.outlook.com (2603:10b6:a03:232::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 3 Feb
 2022 13:44:39 +0000
Received: from SN1NAM02FT0053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d0:cafe::d2) by SA0PR11CA0045.outlook.office365.com
 (2603:10b6:806:d0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11 via Frontend
 Transport; Thu, 3 Feb 2022 13:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0053.mail.protection.outlook.com (10.97.4.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:44:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 3 Feb 2022 05:44:37 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 3 Feb 2022 05:44:37 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Received: from [172.25.185.186] (port=46978 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nFcPd-000DZ1-BK; Thu, 03 Feb 2022 05:44:37 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Thu, 3 Feb 2022 06:44:02 -0700
Message-ID: <20220203134402.1647985-2-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203134402.1647985-1-neal.frager@xilinx.com>
References: <20220203134402.1647985-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62550970-2cb0-48a0-768e-08d9e71b528a
X-MS-TrafficTypeDiagnostic: BY5PR02MB6931:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6931877835A6B60F07A81226D7289@BY5PR02MB6931.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36OwFVD4qmrI63tFvqYROUsitsAyon77J3nCw512KDqm6BUVgt0KnbPJq9wSefp3PhsZWkMjP46Kmn66Yz40fKNK+9IrS/JtUTV5zfSEmo2UnWIES5O/1T+mVWaaRkhFyPEix2NZ293wsBwoT0rbur8RMTRB1ewzf8z7cFToX150QFE9WsaRoWRWgqrG/RhN2orP8r+FwA2GreRqfPvUw/hlQChQaid0P7y1BophCgAiWhli30AUCNgIH108GcO4YaZ0/N93WWOF+J5Egayd05Ui6olHAOwC8ZcxpqKCmthAef+eXEjOCccMeQkaVyexeeQJeW66/4KG7YV1A8ibclpcPfu3sOUsJnuAO3W4QX+MzX0l140fSY2CEIiRygSnyIDR7U5ehxDDBkfDKC66Oe96IqDWnl2RlM58ock6C9kgDv9qIEZgmbR/gccjJfctt/OSpvKw3rUMyiutINupN2h2Dt+EsZ9zx8+SP1PB18yU3e3Np8ZDaZvQLrFa/wci2txCXjmYU9xvIbRMYyWRz4CLlRClJkb5YI2qrAHwiz/ly+t5x5DWAEbjoIAkYd1i6Y0fISZpmm8cNYfWi0ypDPK7F8Dxg6LPsgcCuD5gI1ERgq3ZPMW6/dNReMoFM2+t6XnEabDyZw2zb9jQ9muVzAEDcyqFGkx4er+1EBNafvaKzZqwgI991yweSe3nmfTH027X+9XGuqANZ0TR104M2L9/oTusOFtndWiepIEICZYElDudl3RV0hwa4l5TXrp/riiTs9ZTj2uGK+BW6YqtYN4+wWLBDWo0k+hyC2HRZ4w=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(8936002)(8676002)(4326008)(70206006)(508600001)(70586007)(2616005)(7696005)(6666004)(316002)(6916009)(54906003)(82310400004)(1076003)(426003)(186003)(336012)(107886003)(36756003)(2906002)(356005)(7636003)(36860700001)(5660300002)(26005)(47076005)(9786002)(44832011)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:44:38.3793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62550970-2cb0-48a0-768e-08d9e71b528a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6931
Subject: [Buildroot] [PATCH 2/2] Add configs/zynqmp_zcu102_defconfig
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
Cc: luca@lucaceresoli.net, Neal Frager <neal.frager@xilinx.com>,
 giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 configs/zynqmp_zcu102_defconfig | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 configs/zynqmp_zcu102_defconfig

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
new file mode 100644
index 0000000000..5f98e72aaf
--- /dev/null
+++ b/configs/zynqmp_zcu102_defconfig
@@ -0,0 +1,34 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_TARGET_UBOOT_ZYNQMP=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/2021.2/bin/pmufw-v2021.2.bin"
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
