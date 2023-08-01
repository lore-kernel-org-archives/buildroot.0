Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E01C001DF
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 10:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6A5D40581;
	Tue,  1 Aug 2023 10:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6A5D40581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjRi5j4aIfqn; Tue,  1 Aug 2023 10:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85052416CA;
	Tue,  1 Aug 2023 10:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85052416CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF251BF2B3
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 10:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D95C6072A
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 10:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D95C6072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmtYOfkGnGmG for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 10:02:24 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::602])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43CFE60750
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 10:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43CFE60750
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+qyBfPiOSdNhn/0iSkKiidP8UCTMjNvsApgBgI0Nncy26rRi8iQOS4cNNvR1Krta3skSnykjbOf2d5mIhhhLiWqHpWRQW6lr1I7X6ec85Z3SI+clMFfgLbANLqbmogT0u6Pzkqy+qOEJTK0wDu3QFsLx8La9H/2X6AZX/D4gc5Padp6pmRzIzFf5pBK6eU4kYYRsJXFhm61Wa9C81LqV2MvX3yque24gYn0oa6LfUWtYiYUJYx7AT7Xr/Z4OBASoN5zN47ZMam+1287j4KuFHMwVxI56bVmkUi6I2soq7PKD4S7pp7PQb7PMzIQ+6VFNYR4n3mjwTfFlkw6FNDSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6YczvVso/MHvDk5oB1JaElQnv1I5vRFfeNEbf5thxs=;
 b=M2hSI7n5oXOxOkC2HvJQgC042152hfcLNZc+7/jQuCXHWy13CnrpIJemMZLZe/en09NbWG5z+kI1akXlZuoUoVNE2tiagY/lQHY/GtN49GZwr/coG7TMnHmrq6sXaagsKPIZQbbYjx7h8ykO6vnH38QtHg61lHl7xFvBIbpduB7ZZnTUYQKSBJSR25LHx37R/M2FWjZcKZArhhvGxF1k9khgni8MB5RwC2K8p6N9K3e3hzyxh0a6FgFd0TOBz1O0CRr8MdMqOpQe/hkA5c9VkZi5gvxOAOLsCH08FC47KyAbF1TNeqfMXdrQXJuonoGYabhPhdUJ18aY1FvOXyMALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SA1P222CA0047.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::20)
 by MN0PR12MB6077.namprd12.prod.outlook.com (2603:10b6:208:3cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 10:02:19 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:2d0:cafe::74) by SA1P222CA0047.outlook.office365.com
 (2603:10b6:806:2d0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Tue, 1 Aug 2023 10:02:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.22 via Frontend Transport; Tue, 1 Aug 2023 10:02:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 05:02:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 05:02:07 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 1 Aug 2023 05:02:07 -0500
To: <buildroot@buildroot.org>
Date: Tue, 1 Aug 2023 11:02:04 +0100
Message-ID: <20230801100204.3111852-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|MN0PR12MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de0dc79-7059-46f7-eee1-08db92766371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NKtgLb99ij9/7Np3t4FbLjvb7Q7hbZPTBuUjebdNx9UH7rTeyfAI7fiCmd0cCdvwLDVXb48AMOjDOpjz3IV3b8kCCgE4DmFr/q70Sz6m5CMDMG0lc635r4UshhLdqj4yfqotTG6sNSxD41AoKu9GAjWiSaKOLzGo4+REbRD//v3kuat45Y/r/rlpNdf8sIsO29X7VxqIUgsEu9Dis6fduJVhB+v1yVrgVww9SJ+tV1YoRTeX+h9UqTl/D0KXJlqRqcPOkA1gDKCTyfL520Ht4qgOsGIu+yPzBETPhmbaq8L4RNbJy+rGaIvhe9Ss0wsigOS2NpmKTGjvQASMNu721SE9c+f5mgOkDKi06A1u9G+QRXYVxJq2c0oGalhejz9r7+CmeTrm74KLMkmNqtgJ17r7BM9dOFQau2+d/u1YecKFKQ2XagNXz35tdH/tUxE78jwhrdMnu3L3Q6VliWsD4a9yv+kQRZEJ6VTT12Ke649z/r6P+jI9nTke0AsbCzQF1BLqW1202590B4mQb3QLKPqT1jvObuZahuNKZfoYHQLmKPxVD8S4RET3BdGiLoMnGkPPCg9ZwQc+5D1PPVyLZwEEQR232OpQVsrCjQN2hlRxoYs/9AHr7rht/u1Glr7Lg/a6xbee+ZGIdJeD6lwRPbrD+DglQtSU+g/gz+cmnuoIxByZvWk2bgCU1apbqGGnewihn3Wu+3QSclOTvFySDKrJxzNKnDArqsb0W+H+xTL6ZSR3HeYWdpmtqKGTtV/cSocgb2s4ct8eWhg/4Xg6nA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(2906002)(40480700001)(6916009)(4326008)(2616005)(83380400001)(426003)(186003)(47076005)(86362001)(336012)(316002)(44832011)(478600001)(41300700001)(81166007)(36860700001)(356005)(40460700003)(54906003)(82740400003)(5660300002)(70206006)(70586007)(1076003)(26005)(8676002)(6666004)(8936002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 10:02:17.4639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de0dc79-7059-46f7-eee1-08db92766371
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6077
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6YczvVso/MHvDk5oB1JaElQnv1I5vRFfeNEbf5thxs=;
 b=gFBET6Ylb+SHQB5aJ3YNaTHezbhwDPDKr9fMshBchGWoxhF2JsHOdJAKatvj0LTlg/Wgw/sE34Xg3JQOErcCDFDiC7f5R927lzXBo4KMzcXYI84kwqUwpnUjYfhOCy4+y5WUo6L+vfRcVE5Bw+hFU+G/1GPQQwbuDke7sLFTisI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gFBET6Yl
Subject: [Buildroot] [PATCH v1 1/1] board/versal: clean shellcheck issues
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

This patch cleans up the shellcheck issues in the versal post scripts.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .checkpackageignore        |  2 --
 board/versal/post-build.sh |  5 ++---
 board/versal/post-image.sh | 26 +++++++++++++-------------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 27c66d0bbe..2ba4d5ea78 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -99,8 +99,6 @@ board/technologic/ts4900/post-image.sh Shellcheck
 board/toradex/apalis-imx6/post-image.sh Shellcheck
 board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
-board/versal/post-build.sh Shellcheck
-board/versal/post-image.sh Shellcheck TrailingSpace
 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 boot/at91bootstrap/0001-eabi-fix.patch Upstream
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
index ff8f8a6071..ed08ea2d49 100755
--- a/board/versal/post-build.sh
+++ b/board/versal/post-build.sh
@@ -3,9 +3,8 @@
 # genimage will need to find the extlinux.conf
 # in the binaries directory
 
-BOARD_DIR="$(dirname $0)"
-CONSOLE=$2
-ROOT=$3
+CONSOLE="$2"
+ROOT="$3"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 92e65ed3b7..729610d201 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -6,30 +6,30 @@
 
 FIRST_DT=$(sed -nr \
                -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               ${BR2_CONFIG})
+               "${BR2_CONFIG}")
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
-BOARD_DIR="$(dirname $0)"
-BOARD_NAME=$4
+BOARD_DIR="$(dirname "$0")"
+BOARD_NAME="$4"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	the_ROM_image:
 	{
 	  image {
-	    { type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
-	    { type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
-	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
+	    { type=bootimage, file="${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi" }
+	    { type=bootloader, file="${BINARIES_DIR}/${BOARD_NAME}_plm.elf" }
+	    { core=psm, file="${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf" }
 	  }
 	  image {
-	    id = 0x1c000000, name=apu_subsystem 
-	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/u-boot.dtb }
-	    { core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
-	    { core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
+	    id = 0x1c000000, name=apu_subsystem
+	    { type=raw, load=0x00001000, file="${BINARIES_DIR}/u-boot.dtb" }
+	    { core=a72-0, exception_level=el-3, trustzone, file="${BINARIES_DIR}/bl31.elf" }
+	    { core=a72-0, exception_level=el-2, file="${BINARIES_DIR}/u-boot.elf" }
 	  }
 	}
 	__HEADER_EOF
 
-${HOST_DIR}/bin/bootgen -arch versal -image ${BINARIES_DIR}/bootgen.bif -o ${BINARIES_DIR}/boot.bin -w on
-support/scripts/genimage.sh -c ${BOARD_DIR}/genimage.cfg
+"${HOST_DIR}/bin/bootgen" -arch versal -image "${BINARIES_DIR}/bootgen.bif" -o "${BINARIES_DIR}/boot.bin" -w on
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
