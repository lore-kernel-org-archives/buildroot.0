Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D759C83F10
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 14:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0958402E5;
	Thu, 31 Aug 2023 14:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0958402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OcfWf1sfqOfz; Thu, 31 Aug 2023 14:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C619740C27;
	Thu, 31 Aug 2023 14:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C619740C27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84FFA1BF418
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5140D402E5
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5140D402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2h1Sf_-9R579 for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 14:52:04 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9FF2417F6
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 14:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9FF2417F6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILy8NqYekEBD+B6mE6Oo2XZL2X7UYK1l5CrXZw354Rfe1CozLG1rCfXpREnuqWUuzyKUZMcfojKMufflnuPXceXNwo0fWBvFaQmchbipHeKvJ5Rwm+O5wmokclZeMEDifxO/mo97QTqqJSSEsTNu79oGKn94eeVKGv1xtCams37ufcmEUH5kJoguthbtOljBTzbuGsl5KAVeUdZ+BTXSIiW4kDdX0DhAbeJMLH8Up8UPhwFTYO1JW3WKQxE5WfM0z94Qsh7FTnbQ2JYrpWwt8iz8GRlnmi4sn9Vj6F7t1R32bv/zSJTs1CQW1IfUWqG0kggim+Vz0XKBOFdlEVEs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj8EQ8S4Nxz0i/meS6x7MYcKqQ/B6DaXk5kyIgoC91s=;
 b=ULtezx1u/FXSF2GXHIqr9yqMs6F8jIA1JpSZZ875ImBG0DzVav9K0jOQWtAwWkcp723g9yTZpLrtlMeDBKgIBYzYZDARY6VFahMRuFJEKT/0uSTiNQPVTOXocDKsQaU8kTU8kbw9OyJEjeSYmlT+wJF9yOw7FIagH1Uwf20e3Psxz8rtYzzqZ4uQqj6xQo8hWyCm7n8bNS/kNwthEKToiyUpI6lNeK5s77V53BsLwPDjsZYjOSHI/kTq/l9fPG0res4i3w2K7rKb6FFkI/xmN79+ZsKJ/DVXi7GeefOYxGkts6U9cr5y0aU5jV4mkv8PwjZQkNqgEQbtJzxuf5TRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CH2PR08CA0027.namprd08.prod.outlook.com (2603:10b6:610:5a::37)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Thu, 31 Aug
 2023 14:51:59 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::c0) by CH2PR08CA0027.outlook.office365.com
 (2603:10b6:610:5a::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Thu, 31 Aug 2023 14:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.20 via Frontend Transport; Thu, 31 Aug 2023 14:51:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 09:51:57 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 09:51:57 -0500
To: <buildroot@buildroot.org>
Date: Thu, 31 Aug 2023 15:51:36 +0100
Message-ID: <20230831145140.2537382-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831145140.2537382-1-neal.frager@amd.com>
References: <20230831145140.2537382-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 09253b85-f77f-40f1-7612-08dbaa31d3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hE2OyhKYGyDdJW9J7quimonYxWhqdpjwygJiYrA+4fAIE16cG6HrdeOciYCaynPvkyBWeGXVKRXQemlCVlVBptR5De3XEbYPmuXtdIybGXdlmVOVI+rZ4xi8D+vMwCcWQiMRNFo/mBks8wvz3+JuvuCSbyFmQm7Yz6IJbFKzjqzaxLRnWT0C523AwUWrWZ4lm2FJttqZk3yURFBEF74eKFqr4RhUmQCmrl40NhTZBTP6M381PwRuUptWgbIrVWw2Xtpfle8uYFT/op9JT517mHLELaOPd4si828kuBjfmXAT6mU+k6+LFiUSI5JMcwwxFFewhmG9Qt5WYjMFnz5lSAtvXtXYLPOizwyoDjv5I/rkVQxa35/YQz1TGNwOTparDx5ISJmYAUM+AoNOoBdJfYN9mrag//JnIBzVnchH68i9tNBCxvcILmoTO+PWtAokV33HJ0Qg8AsMCLC/3M45B5k3XiY5uN4so9Cllg7Bd4gNW6GiY5NXHmYmK2swsfHzJMNuUL/UB9LpJsWdb5TOxAuE+ORAuYuNn4S19cVDbU0OWSBqNM6ah/Gj2eCBEtqlTTa4n8mlyevBnubtYxGXqUn9mahf1aPlvU1YhNnToMjGVV7KqKQHnnAiVIMJ2o7i4ZZfG8bACYxuJ+PmQGr04Zj7Rj3dfHdV3uHNH6EcN0HQFFG2DDeQazGVq0QXbiloVGQfwqfz7T3Vnu+K598qq9UD/MZY3ukbrHIMcSDR+EqpndfHjqR3re3gte2xOGzRooeOLk/T1+QJqDol0Zq6V7UJTUb+rakVZRKGHnSgwhA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(6666004)(2906002)(86362001)(5660300002)(316002)(6916009)(478600001)(2616005)(4326008)(47076005)(8676002)(36860700001)(44832011)(8936002)(966005)(40460700003)(26005)(1076003)(82740400003)(40480700001)(66574015)(41300700001)(336012)(426003)(36756003)(356005)(83380400001)(81166007)(54906003)(70206006)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 14:51:58.8736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09253b85-f77f-40f1-7612-08dbaa31d3f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj8EQ8S4Nxz0i/meS6x7MYcKqQ/B6DaXk5kyIgoC91s=;
 b=uY81WfOaFB5eYh9h7ThheR012qGAnX1gxk30/M17joocLmJNBRhCwzEX5R96yT8Zppz7vPMTASKP7BaNK3abFWDQd8lBczC3UbK5TIqSzpSGK1Qy9w+u+pamXoJw2O1lfycShSTx0ibwEzt7zpTiDmFDJKlJ/ovYmn+KLO3ChFY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uY81WfOa
Subject: [Buildroot] [PATCH v2 2/6] package/gcc-bare-metal: new package
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: multipart/mixed; boundary="===============3892477424119160698=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3892477424119160698==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

This patch adds a new package for building gcc for a bare-metal toolchain.
The cpu architecture is defined by a toolchain-bare-metal virtual package.
While any cpu architecture could be used, the default configuration will be a
Xilinx microblaze little endian architecture, so that buildroot will be able
to build the microblaze firmware applications for zynqmp and versal.

When configured for the Xilinx microblaze architecture, all of the gcc
patches that are applied to the Xilinx distributed toolchain will be applied
in order to generate a toolchain that is equivalent to what Xilinx distributes.

Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - removed default enable to be replaced with toolchain select config
---
 DEVELOPERS                                 |  2 +
 package/gcc-bare-metal/Config.in.host      | 18 ++++++
 package/gcc-bare-metal/gcc-bare-metal.hash |  5 ++
 package/gcc-bare-metal/gcc-bare-metal.mk   | 67 ++++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 package/gcc-bare-metal/Config.in.host
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal.hash
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e37101c51..a0b2ccfe4b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1328,6 +1328,7 @@ F:	package/python-rpi-gpio/
 
 N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
+F:	package/gcc-bare-metal/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
@@ -2195,6 +2196,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/binutils-bare-metal/
 F:	package/bootgen/
+F:	package/gcc-bare-metal/
 F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/gcc-bare-metal/Config.in.host b/package/gcc-bare-metal/Config.in.host
new file mode 100644
index 0000000000..9e28e862ec
--- /dev/null
+++ b/package/gcc-bare-metal/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HOST_GCC_BARE_METAL
+	bool "host gcc-bare-metal"
+	help
+	  gcc-bare-metal is a host utility for a bare-metal toolchain
+
+if BR2_PACKAGE_HOST_GCC_BARE_METAL
+
+config BR2_PACKAGE_HOST_GCC_BARE_METAL_VERSION
+	string
+	default "12.2.0"
+	
+config BR2_PACKAGE_HOST_GCC_BARE_METAL_EXTRA_CONFIG_OPTIONS
+	string "Additional gcc options"
+	default ""
+	help
+	  Any additional gcc options you may want to include.
+
+endif #BR2_PACKAGE_HOST_GCC_BARE_METAL
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
new file mode 100644
index 0000000000..d505540bf9
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -0,0 +1,5 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.2.0/sha512.sum
+sha512  e9e857bd81bf7a370307d6848c81b2f5403db8c7b5207f54bce3f3faac3bde63445684092c2bc1a2427cddb6f7746496d9fbbef05fbbd77f2810b2998f1f9173  gcc-12.2.0.tar.xz
+
+# locally computed
+sha512  bf3561c3495dd112b269a2c21dd758c1e5e7a73f959052f63511313e44222ce85b8db81e8de3b60b2c0bb8668ee834ac85036517fb6970e06fe352765dd127d0  xlnx-rel-v2023.1.tar.gz
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
new file mode 100644
index 0000000000..fd84450007
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# gcc-bare-metal
+#
+################################################################################
+
+HOST_GCC_BARE_METAL_VERSION = $(call qstrip,$(BR2_PACKAGE_GCC_BARE_METAL_VERSION))
+ifeq ($(HOST_GCC_BARE_METAL_VERSION),)
+HOST_GCC_BARE_METAL_VERSION = 12.2.0
+endif
+
+HOST_GCC_BARE_METAL_SITE ?= https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
+HOST_GCC_BARE_METAL_SOURCE ?= gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
+
+HOST_GCC_BARE_METAL_DEPENDENCIES = host-binutils-bare-metal host-gmp host-mpc host-mpfr host-isl
+
+# if toolchain is for microblazeel-xilinx, apply Xilinx patch set
+ifeq ($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx")
+HOST_GCC_BARE_METAL_EXTRA_DOWNLOADS = https://github.com/Xilinx/meta-xilinx/archive/refs/tags/xlnx-rel-v2023.1.tar.gz
+
+define HOST_GCC_BARE_METAL_EXTRACT_PATCHES
+  mkdir -p $(@D)/patches
+  tar -xf $(HOST_GCC_BARE_METAL_DL_DIR)/xlnx-rel-v2023.1.tar.gz --strip-components=5 -C $(@D)/patches meta-xilinx-xlnx-rel-v2023.1/meta-microblaze/recipes-devtools/gcc/gcc-12
+endef
+HOST_GCC_BARE_METAL_POST_EXTRACT_HOOKS += HOST_GCC_BARE_METAL_EXTRACT_PATCHES
+
+define HOST_GCC_BARE_METAL_APPLY_LOCAL_PATCHES
+        $(APPLY_PATCHES) $(@D) $(@D)/patches *.patch;
+endef
+HOST_GCC_BARE_METAL_POST_PATCH_HOOKS += HOST_GCC_BARE_METAL_APPLY_LOCAL_PATCHES
+endif
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+define GCC_BARE_METAL_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/build
+	ln -sf ../configure $(@D)/build/configure
+endef
+
+HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += GCC_BARE_METAL_CONFIGURE_SYMLINK
+HOST_GCC_BARE_METAL_SUBDIR = build
+
+HOST_GCC_BARE_METAL_MAKE_OPTS = $(HOST_GCC_COMMON_MAKE_OPTS) all-gcc all-target-libgcc
+HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
+
+HOST_GCC_BARE_METAL_CONF_OPTS = \
+	--target=$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf \
+	--disable-initfini_array \
+	--disable-__cxa_atexit \
+	--disable-libstdcxx-pch \
+	--with-newlib \
+	--disable-threads \
+	--enable-plugins \
+	--with-gnu-as \
+	--disable-libitm \
+	--without-long-double-128 \
+	--without-headers \
+	--enable-languages=c \
+	--disable-multilib \
+	--with-gmp=$(HOST_DIR) \
+	--with-mpc=$(HOST_DIR) \
+	--with-mpfr=$(HOST_DIR) \
+	--with-isl=$(HOST_DIR) \
+	AR_FOR_TARGET=$(O)/host/bin/$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf-ar \
+	RANLIB_FOR_TARGET=$(O)/host/bin/$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf-ranlib
+
+$(eval $(host-autotools-package))
-- 
2.25.1


--===============3892477424119160698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3892477424119160698==--
