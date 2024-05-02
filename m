Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D84C04FFE
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF54E4026B;
	Thu,  2 May 2024 16:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMxBEY9jyFZ0; Thu,  2 May 2024 16:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA544177A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA544177A;
	Thu,  2 May 2024 16:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD1321BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A7A4409F1
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9iILCs3nmw0 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE56241B78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE56241B78
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE56241B78
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDvK063663;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRDTp067228
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDPs127933;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:27:00 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-10-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=bb@ti.com;
 h=from:subject:message-id; bh=tfBsK4jAff/SskhcdnnQhoXY3euGs/gnJz7nrQB1sVc=;
 b=owNCWmg5MUFZJlNZ/ihuFwAAXv///v9dfn9/nfqnfyym98Tyvufz1//uP/Zvbrxvntrv+vWwA
 RrQGKBo0AGQ0AGg0DRkYmgAANAaA0NAaGmmgAZANA0AaDRpkBk0zTJpDaZRAAaYgGmCaNAGjTRo
 0MmjJkAGgwJkMmmJpgCDAENNDQABoBoDJoBoGgdNNpBpppoDJoBo0aZDRkGQ0AaNNAaYBNMQYgA
 yGTBABkYQ0YTQDIAaAAADpDGQgXDAEBo7Lo5oLLL18Xox8aChXuVzAhANcEIpTExpn/CBDblJRJ
 VQo/gVwWz03c9GErNVrnVgZxmSULv2vmBfThmtPtGuuD93ZVeQwCPYpIyBjlk9oiC8GHJxKEmu6
 xm73v4Xzqm2RV173CG720hhSp8s+Mdpz8XwPnb30kd2Y+p1YYv16fjmW7Z4HS8G+kZNV4rMPnQu
 5ooUUQrEojZJDUUsLsR4YRvnBjC+bSc3OT4+ugnsmuzM+TrrhRsgDe2q7TAlFBs2Xd5FXKtgITa
 pkTi1HBQnzwTBSJKkgD7hBrKdXW5Xc4gj0llHNTdYB1KaYmH3Nn58D7yblMMzS3XjJGRCHS0uCo
 CTNx7lWC5Ecbwt2XASVq44DSlfAs6WDGD/VUOpYsKqaP9qsrRp2/HHICH3+bU42wQJC9OEvIuWi
 2C/xdyRThQkP4obhcA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=JXS2NYfQhp93TERm4FGFbrgb+gPWllRWumNKJoqlSMc=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=jDsOhSKafZFy2x0dH8taGky5c74fpb1kTB514AmZNeyIJD+o/CIl7PBIH3CyBO+eg
 bw5ZeVtI9Y6uQT4uGk3IMaPkkIoNrMfK0iWrwYhVZehB/MLv8YfLybeyp86aAEzMDf
 fnspiL/VL+ssSmq6zEg+bGpH043fR37vvYJfbnGU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=jDsOhSKa
Subject: [Buildroot] [PATCH RESEND v2 10/11] configs/ti_am64x_sk_defconfig:
 update kernel to v6.8.8
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest kernel to pull in the latest bug fixes and features
for TI's SoCs and reference boards

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 board/ti/am64x-sk/patches/linux/linux.hash | 2 +-
 configs/ti_am64x_sk_defconfig              | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/board/ti/am64x-sk/patches/linux/linux.hash b/board/ti/am64x-sk/patches/linux/linux.hash
index cedae67f33f1c..2e9aad399ebe3 100644
--- a/board/ti/am64x-sk/patches/linux/linux.hash
+++ b/board/ti/am64x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
+sha256  1c4cdcb9d560fad1fb95db2cb8afbedc922f9ead848371fe40363b13f9f631ba  linux-6.8.8.tar.xz
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index bdd85f82a60e6..42df79768d7f7 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,5 +1,4 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
@@ -8,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
