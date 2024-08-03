Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051CAC52D6D
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 11:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E429404DF;
	Sat,  3 Aug 2024 11:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtVPGdrIyKtI; Sat,  3 Aug 2024 11:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D374740425
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D374740425;
	Sat,  3 Aug 2024 11:19:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51EE81BF37C
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 11:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F97A606B1
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 11:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBrHo6tEvzew for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 11:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD2DC606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD2DC606A5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD2DC606A5
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 11:19:19 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 89311B0053D;
 Sat,  3 Aug 2024 13:19:11 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 13:18:55 +0200
Message-ID: <20240803111855.1726141-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722683956;
 bh=l3rmL8u4DS8ZyFOydqxK7T7KkiWOjK4MKVQnhcYSs7I=;
 h=From:To:Cc:Subject:Date:From;
 b=ceWC13R9qKhb73ZhbF1yo+4Y11WXr0F6HxdHI+EltTxJlDGESBfkN0fkfOSL3lINw
 3/hewn61FYMQi9o5L0NPgStB9Ebejwm/1zglezDHYcLhLlffGWhdq2+Z6KuaewM6Ne
 Jd07M5bD5mfdTeEDb5E7OMAgcSAbe+EYC78W1WQIu3+9zBCqZnyX+o30BFQdEVnfa5
 FheEvrBLjK8YxDfmBK4gtTSU3Qrr5jMrMJe19K3ZLR563LXQJ6cpTgogLL7sKZKr82
 fXZShXwgYpHax0jjN20QOUjlcSAF/4WHhZqtm5D0AeRs+cKN9eVQnSXzRX/oB0PQdm
 Dw0KGJqFQyc3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ceWC13R9
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx6ullevk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
versions.

This commit also adds the custom version package hashes. Therefore,
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is added in the defconfig, a
BR2_GLOBAL_PATCH_DIR is also added in the board specific directory and
the hash files are added. The corresponding ".checkpackageignore"
entry is also removed.

The Kernel DTS name is also updated by adding the new "nxp/imx/"
prefix, to follow the upstream reorganization in [1], first included
in v6.5.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                    |  1 -
 .../patches/linux-headers/linux-headers.hash           |  1 +
 board/freescale/imx6ullevk/patches/linux/linux.hash    |  2 ++
 board/freescale/imx6ullevk/patches/uboot/uboot.hash    |  2 ++
 configs/freescale_imx6ullevk_defconfig                 | 10 ++++++----
 5 files changed, 11 insertions(+), 5 deletions(-)
 create mode 120000 board/freescale/imx6ullevk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx6ullevk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx6ullevk/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 10662bb11e..9335dca0e7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -151,7 +151,6 @@ configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx28evk_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx93evk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx6ullevk/patches/linux-headers/linux-headers.hash b/board/freescale/imx6ullevk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx6ullevk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash b/board/freescale/imx6ullevk/patches/linux/linux.hash
new file mode 100644
index 0000000000..3c4223976b
--- /dev/null
+++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx6ullevk/patches/uboot/uboot.hash b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4e0d729ca0
--- /dev/null
+++ b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index fd4254edbf..e29a9898fc 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -1,16 +1,18 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ullevk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.36-2.1.0)/linux-imx-lf-6.1.36-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6ullevk/linux_sdma.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL=y
@@ -20,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.36-2.1.0)/uboot-imx-lf-6.1.36-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
