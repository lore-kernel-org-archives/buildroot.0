Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58804C44507
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE0281196;
	Sun, 12 Jul 2026 14:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eW1Ds-Tyeiv; Sun, 12 Jul 2026 14:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F900812B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783865969;
	bh=yLTGA/gr8Gw8SC5EvVVhlQIdS7+/oJoGceAVs2TvS/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bB4IlZ4AakLHkYe9TOD64qDQCBI0aSOAEWxENum+aDbhDAYC6AhdHoOMj/d7m7sLS
	 kpCgJOw4oj4mEhhT7VhKwW6l3AGe4XXyeED+BwLr8ss3iKm8dvPu9b+/jE6hdqhCtR
	 4NWR9emmKT9WVlVhDLsjUMU7zJwyXmZOVaRQ0XZ34hGGyfJcLxTJ7BLl8kuXgYHsLM
	 +68fPuyDkVMIyIdctIwxwqhIubmGnWE4UNkZNgFd5MXKKdeNGthyM5kEKwuM5IymB3
	 QWvGCCEnlCXki+CO8oc4OlmMaPnGBoNTq6UloAh25blP4QbbeoBODbZ3JtDYfepzkr
	 Nxdww82Zye7FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F900812B4;
	Sun, 12 Jul 2026 14:19:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5745F2EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48381810CC
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggcJsjwC3l8i for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A84A81167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A84A81167
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4E548866C; Sun, 12 Jul 2026 14:18:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 16:18:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a97e3acbd6912f83dbf305def5d87f6a7a32114
X-Git-Newrev: eb9e52a5dad503f50e3d03a37dc693310938f552
X-Patchwork-Hint: ignore
Message-Id: <20260712141842.A4E548866C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-embeddedsw: bump default to
 xilinx_v2026.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb9e52a5dad503f50e3d03a37dc693310938f552
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that all Xilinx board configs have been bumped to xilinx_v2026.1, bump the
default version of xilinx-embeddedsw to xilinx_v2026.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-embeddedsw/Config.in                             | 2 +-
 boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash | 5 -----
 configs/versal2_vek385_defconfig                             | 1 -
 configs/versal_vck190_defconfig                              | 1 -
 configs/versal_vek280_defconfig                              | 1 -
 configs/versal_vpk120_defconfig                              | 1 -
 configs/versal_vpk180_defconfig                              | 1 -
 configs/zynqmp_kria_kd240_defconfig                          | 1 -
 configs/zynqmp_kria_kr260_defconfig                          | 1 -
 configs/zynqmp_kria_kv260_defconfig                          | 1 -
 configs/zynqmp_zcu102_defconfig                              | 1 -
 configs/zynqmp_zcu104_defconfig                              | 1 -
 configs/zynqmp_zcu106_defconfig                              | 1 -
 13 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 674238fd0a..03488a18ce 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -22,7 +22,7 @@ if BR2_TARGET_XILINX_EMBEDDEDSW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 	string "xilinx-embeddedsw version"
-	default "xilinx_v2025.2"
+	default "xilinx_v2026.1"
 	help
 	  Release version of Xilinx/embeddedsw.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash
deleted file mode 100644
index 77b4c2467c..0000000000
--- a/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  fb9a705a2974fa4d8d79142baea204d388389b9b37d6f26194b7b759f8978457  xilinx-embeddedsw-xilinx_v2025.2.tar.gz
-
-# Locally calculated
-sha256  5ed583a37f9592d4bef73061f14f85c2ca70b8b7a12ffe1ef8ea808fbb764425  license.txt
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 0b1834fa4a..5a09e855d3 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal2-vek385-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 481dfd7656..9b59d1c9fb 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 0da0210306..f76ac682fc 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index d988865846..ebb944a27a 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk120-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index cd37287a27..c904602fcd 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 28e6b45281..600abb4b04 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK24_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index adbb001e8f..1895dc7261 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d7b2dc9a16..7a87463365 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 7b4c30a43b..77e69cf014 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index b97cec437d..985dfd01c4 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 8b7d96a0d9..ddacd2d98e 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
