Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86345C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 15:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D3060F8F;
	Tue,  6 Dec 2022 15:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D3060F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZ7pifu6Wku1; Tue,  6 Dec 2022 15:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D93560E28;
	Tue,  6 Dec 2022 15:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D93560E28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63FD11BF3FF
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 15:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23CB360E28
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 15:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CB360E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VzJsK9hZ8-d for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 15:52:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC29260758
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC29260758
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 15:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpriJrXt6D6mOgE0F1IOHhBAquDUiNDZxXjFE5jo51TyjHSi2g3hxQLS097RBhCUwajJPKiBRhw/JXa+IWkL9mTFN6C45hdcqnaJR0YnjX4LgJdfgntq9DMyX2Q8BofxCCm/fOBbQnXVbJ/fsrCKfgI9hTLljBZaee1TW5rXX/8NyAW3ZYhnM7a9/bMX7u2D11bTKBGEQcJWMCp+pW94v0kZ+/cj0zcP2A9S4vSLeE7p2p59eIcuuzaKIH2uqFp4d4e/qiu9CsGxe4jmxh4hhZMSqks+ErGNPzbF82yU5Z6Ke9f+uWUW398rDzzhbNq6Y5g5YoAnJe7d+rdjPnhvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npvWh45DjpeeZ+M28DJmK7FGUwnlNG892OR8hIF+S8A=;
 b=cAVnBWWtUOgKWQlV8UeSbdrmeuzRhOWcDmFXysrBARghU71Ha/aQM2Z9YrYCaez51ZWW9D1ZeP/VCK3TVncFCMT0HdJ08Y/n9dufmydQ+pIITpvTQu+Q9IkMXXubj8T3neIwDzLAgLOdFPNDqDjUPXWc0A1RChQs2ar/t/lZRXmlTPyAm1xdtmJG/vFiF0jNtkYtvCrKL04Yzv4Sp6lR25pPKgloqkJVYxXGKQBHXE7MhkdW5SOgpuQxuY6203tE/6Dyznkl57agvH+Bt4NRgdmqfMi2kis8jm0pWseI0TZpfiedgy0jq0lmHECQsiYmFN+Ei/jzvA8aKaTFHjz6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR05CA0068.namprd05.prod.outlook.com (2603:10b6:8:57::20) by
 IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 15:52:31 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::16) by DS7PR05CA0068.outlook.office365.com
 (2603:10b6:8:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Tue, 6 Dec 2022 15:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Tue, 6 Dec 2022 15:52:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 09:52:29 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 09:52:29 -0600
To: <buildroot@buildroot.org>
Date: Tue, 6 Dec 2022 08:52:26 -0700
Message-ID: <20221206155226.54290-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6c6879-797e-43fb-b05f-08dad7a1e1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMrjnsnSn89Kd1yKBr7g996SohSOVb3fWlj/zgY2ClO7pBH8OEVS3ArELpeQUf2y5g5ZbjZw+tw83K0YfrbkQ1nqYeDxH/wpz9cpRUKCN/vjJk4zZTbaLGqsqax5mcIIaplPVev9NCos1JXlT6jax/+V7MfoqlzbwDymwQsF8Cm+1XdhXJHP108zSTFzaIzL8r9VNTVUOb0hj4lnu1e+5dE/qsfV8ROV7Ep/8rk5OH4/jySziX2iPW6umrDF8xwyZJ6MXokTl88fFOh5cIL5Bjwt6oty9uJ5uVQCUZ1Fm6FY48OsvkcCsdX5xojqqhl8WaTG8dKPZa4ctAxcxz6+m6mKA5bM/obNTrilXrgxBc7XUGDyVyVmeEutME2/A4x8UWEeXTZJ4ZRp7FkcQNCskqd+eETLHatoabx1+dJWjeaC68Hk2VvvEgNR/f9zcrWksaJBB0tJ95uk5/MSiGLt15vG4s9qR4Zb46xMOmn01xi0vF2m0adagZS/JegjN6kxtH3HkUAGmwc7m7akwPu9/SWGiL+FN/5VZaqO7cgPNAUQzaWpJlZgFKDROAacsCFWhNDE8DlumV3WG0Zp0YVB6fyetfuc7kJAphxR8aExyuo9QqGCQgpIi0RrXli0UmZclXNJUNYMs0uIiJ6SZzqstWQJhLa7TqkOlrz6AuQvlrb8Kyq2YWEFpwMbxeXehiah6jY6Ayurlx+uqZSYSPpocPoJqvpSvmomYadYpRtPkyiokh1DwsYfqVNlLf0WWeH++DrbpzWeB3AkWDizPfiN9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(81166007)(86362001)(8936002)(44832011)(356005)(82740400003)(5660300002)(4326008)(2906002)(40460700003)(41300700001)(82310400005)(8676002)(40480700001)(186003)(26005)(478600001)(336012)(426003)(6666004)(47076005)(1076003)(6916009)(2616005)(966005)(54906003)(316002)(70206006)(70586007)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 15:52:30.3756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6c6879-797e-43fb-b05f-08dad7a1e1cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npvWh45DjpeeZ+M28DJmK7FGUwnlNG892OR8hIF+S8A=;
 b=Xv2j9IKDSDMs6sSYYfXxndwB4qZqDaViikM2G2kVKcWCrzvU7o/10LD5lO38bHEfAUyLKKST7WtT93fIeQxCr47hLENTpoLUEERXCLqUNn9F00wyafOwO5vYa7Pcj3MzpVgIZoko73iAP5KAjaXK2A8pLVVHPtTGdL49VGMDQYo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Xv2j9IKD
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/kv260/uboot.fragment:
 move to board/zynqmp/kria
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

This patch moves the board/zynqmp/kria/kv260/uboot.fragment file
to the board/zynqmp/kria directory.  The reason is that this file
is the same for any kria starter kit and is not specific to the kv260.
By moving the file, it can be logically re-used with the kr260 when
support for this starter kit is added to buildroot.

KR260 Starter Kit:
https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/{kv260 => }/uboot.fragment | 0
 configs/zynqmp_kria_kv260_defconfig          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename board/zynqmp/kria/{kv260 => }/uboot.fragment (100%)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/uboot.fragment
similarity index 100%
rename from board/zynqmp/kria/kv260/uboot.fragment
rename to board/zynqmp/kria/uboot.fragment
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index df01ad30b8..3214d45fa9 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/kv260/uboot.fragment"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
