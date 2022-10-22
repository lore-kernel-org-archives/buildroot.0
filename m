Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686B9C3A59D
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 08:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABC7E416BA;
	Sat, 22 Oct 2022 08:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC7E416BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qz6mCKPtOycO; Sat, 22 Oct 2022 08:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57EA1416B1;
	Sat, 22 Oct 2022 08:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57EA1416B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0911BF271
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 08:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E6B782FCB
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 08:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6B782FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAYDDRwoqE22 for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 08:27:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0676882ED2
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0676882ED2
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 08:27:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKxauqvZgeQ7u2pAKi1V+IsSptTu5CMGSyPEDKwBayzLsZZTGx/KlWJCv7HDUiyLtTztihRraVPNjN64cvcV4tTXaJlELmLefOWDYAqebxOxMJIs2ZXzD/KZ9BkmYj6dF5GOAtlkUF3BIPZKIPerZ6rhxG5/1RZxYf05WTeXFkwQRfRsGuV9yYCfObV6an2UT8CJ3LYhczEUGnXh+Uh+xSX7tVYp0uQzrg2Wart2crJKLWFR5pCRCXzhlJehtoJy1kVRo13GYp2Xb8qMaMOj5JNK/CM27BqtuHSIzk0zjNfYLLr0CRULkPUm9U7RxxMv/RZ6uuWohNrfjN7FSjTPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2IUOjWhutgv9hCuJPwBN92WoVwB/Rrb/wZc5wTIO9I=;
 b=J3s6gQZjAk1KmvTJ2244yiRsBph4DRvSb9M2JRkKUxqHf5S7QxfqtiC2uNZFwChMkVQv1+NLsn/g1V0gwpgWxlRI3blHS2xBSEHizJO/hKuAAN8/LFwhpTLFoXJJ5gopslFSD9Avq7T5PC1imzMnEeLiSa/JkjwQyoo1ZuOPpU1oZdw6zcxex2Ei2wJL2BQOK+LXuvlCNJ2PZiQWjB9+ioL6lWpokOnf0zIBllyzaFTOSq+XIAsjMFx/5+SrmdjqJhTV0vEvsbYVeqnEct1cZ6VirEoFwS/QOwQ+g1KjZVF7YcEc9NILrHTODqsWsDE0rhLAyVjQ/6LJ3Sy5MXN/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR05CA0005.namprd05.prod.outlook.com (2603:10b6:5:3b9::10)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Sat, 22 Oct
 2022 08:27:04 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::42) by DS7PR05CA0005.outlook.office365.com
 (2603:10b6:5:3b9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.8 via Frontend
 Transport; Sat, 22 Oct 2022 08:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Sat, 22 Oct 2022 08:27:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 03:27:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 03:26:54 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Sat, 22 Oct 2022 03:26:53 -0500
To: <buildroot@buildroot.org>
Date: Sat, 22 Oct 2022 02:26:45 -0600
Message-ID: <20221022082645.20505-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT003:EE_|CH3PR12MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b9a125-7db0-4bab-5853-08dab40732c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1DjLNz04NYHsBvqK6z9AfBatJ5uqM8hRlOWvI+VZw/cOTrsn0u8ggJ7AkCXHuzyZ3gsF+qv51KieDdPchgfm7KDX4df3hJ9XWedMjFGbdV/PNmqTfPU/kKKG2JGUrkxxh4Fw1XyW3s1/rX06ZLef5E9WULZmtXRmBlZWj47peJf2Ty/ypa7F920/ozhuQDGJ30+qhKHVr0120WGOGVfoSWz6EH5CY09gFHFjajstJYlVEWSC6+1QUBgXB/V9iRvEiGTlqVnawtN2E8Xxcs0bwFnfIyNND1/VD8zFgjdhBmLeOoc8TRUAF8reOcT4XmIj9NoOkDF/LO4olEPweZ+sXR/FlYBjfto+Ra2Pay8b+Pyu8jQ3ChWMZEGPiTdDWVD/ieh/dT8+44LcOH3Lq0IY1waqJgHSlo3WBO8PE4ng+OBD7wXAxP97TqQsRfLPtlcsjlQ6rXOTJBaNA8PXr4Jyb2aNLVj/CNAbbH3j9xAhFlR0LeDzmcrSJKMyLSfoUmZjhhoYqlAfvEaSJaTr5IzsrhupOubcUB9Hhxwt6whYivTe9KB1Vk0UNkkQN0NGQznnxDzBJ2UZ3Cj+ZRmdtcf+9F3D41OmOoiVnaIAxFgpWNnBN+dvk0LkbS3c4t6gurJN+vKJ4OGb/mCb5+qjw8w1WzonFDVzQtBxa/hJHyJm63/eUaUaILEIqOGLszAK4q/9fzsJDskjQcDuUf/ft9DHEh3XxccFCiv4SOcFqX9Xo2pDjVWBfc7KhkIiXfau03ryHV8KJ1ZY88fd2fI9VKTOBU2/KCJcBC+VmL6x4/4mCg27AX1NMiIjs0CD8XEg1v+KcVqROR2d5+elAK32CJi5tAyhXWZTqP0Q7Pd491Gmoww=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(356005)(186003)(1076003)(81166007)(66899015)(478600001)(2616005)(2906002)(82310400005)(40460700003)(70586007)(36756003)(426003)(44832011)(70206006)(54906003)(8676002)(4326008)(36860700001)(26005)(47076005)(41300700001)(86362001)(966005)(82740400003)(6916009)(316002)(8936002)(40480700001)(336012)(5660300002)(6666004)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 08:27:03.4610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b9a125-7db0-4bab-5853-08dab40732c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2IUOjWhutgv9hCuJPwBN92WoVwB/Rrb/wZc5wTIO9I=;
 b=4amyg1+SuoktSfPE1WX8E3JZUUUB81lGiSh8IhFk5/IYOm1EhSW+0azZp6fNmxxyjkHDiomo1SwhWT1aBnp3IkVH19jmJstFuaGcdtcpdUCwZPJpPsi2eC/w1/gkNA1tMra624ZPOjvRq3YpfYYnt8f6jVxWeNDLWJ2+EvRAQdk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4amyg1+S
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host package
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
Cc: ju.o@free.fr, Neal Frager <neal.frager@amd.com>,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds Xilinx bootgen as a host package to buildroot.
bootgen is a required utility for generating a boot.bin for
Xilinx versal products.

In addition, for developers who wish to use secure boot with
Xilinx SoC products such as zynq and zynqmp, bootgen has a
more complete offering in secure boot features than the u-boot
mkimage utility.

https://github.com/Xilinx/bootgen

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/bootgen/Config.in.host | 10 ++++++++++
 package/bootgen/bootgen.mk     | 24 ++++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/bootgen/Config.in.host
 create mode 100644 package/bootgen/bootgen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0e6f8bbef..c8183b2290 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2175,6 +2175,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
+F:	package/bootgen
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in.host b/package/Config.in.host
index d6b9ee0e2d..8ccbf40a84 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -7,6 +7,7 @@ menu "Host utilities"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
+	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/bootgen/Config.in.host b/package/bootgen/Config.in.host
new file mode 100644
index 0000000000..0acb58dee0
--- /dev/null
+++ b/package/bootgen/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_BOOTGEN
+	bool "host bootgen"
+	help
+	  bootgen is a tool to generate a boot.bin firmware
+	  for Xilinx versal, zynqmp and zynq product families.
+
+	  Additional secure boot features are supported beyond
+	  what is included with u-boot mkimage.
+
+	  https://github.com/Xilinx/bootgen
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
new file mode 100644
index 0000000000..8ba91918f7
--- /dev/null
+++ b/package/bootgen/bootgen.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# bootgen
+#
+################################################################################
+
+BOOTGEN_VERSION = xilinx_v2022.2
+BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
+HOST_BOOTGEN_DEPENDENCIES = host-openssl
+BOOTGEN_LICENSE = Apache-2.0
+BOOTGEN_LICENSE_FILES = LICENSE
+
+BOOTGEN_EXTRA_CFLAGS = "LIBS=$(HOST_DIR)/lib/libssl.a $(HOST_DIR)/lib/libcrypto.a -ldl -lpthread"
+BOOTGEN_EXTRA_CFLAGS += "INCLUDE_USER=-I$(HOST_DIR)/include/openssl"
+
+define HOST_BOOTGEN_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(BOOTGEN_EXTRA_CFLAGS) -C $(@D)
+endef
+
+define HOST_BOOTGEN_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/bootgen $(HOST_DIR)/bin/bootgen
+endef
+
+$(eval $(host-generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
