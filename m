Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD1EC3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 15:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EC0E40231;
	Wed, 31 Jul 2024 15:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLw_q4_tXsRL; Wed, 31 Jul 2024 15:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 650484056F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 650484056F;
	Wed, 31 Jul 2024 15:02:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F35981BF4E3
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 15:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF4A88143E
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 15:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMX9EeAu4bSg for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 15:02:36 +0000 (UTC)
X-Greylist: delayed 401 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 31 Jul 2024 15:02:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A512780FC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A512780FC6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.15;
 helo=smtp-190f.mail.infomaniak.ch; envelope-from=philip-dylan@gleonec.bzh;
 receiver=<UNKNOWN> 
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch
 [185.125.25.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A512780FC6
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 15:02:36 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WYwBx4czQzR5b;
 Wed, 31 Jul 2024 16:55:53 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WYwBx22Q2zVsv; Wed, 31 Jul 2024 16:55:53 +0200 (CEST)
From: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 16:55:03 +0200
Message-Id: <20240731145504.365492-2-philip-dylan@gleonec.bzh>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gleonec.bzh
Subject: [Buildroot] [PATCH 1/2] configs/mx6sx_udoo_neo_defconfig: bump
 kernel to 6.6.43
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current 5.15.13 kernel fails to build.
This commit fixes this by using the opportunity to bump the kernel to
the latest LTS version.
While bumping the kernel, the headers to use are also updated, and the
selected device trees are updated to use the new dts per vendor
organization.
This update does not introduce any new error or warning with the
current configuration.

Signed-off-by: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
---
 configs/mx6sx_udoo_neo_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 793d992ce7..71a7473307 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -19,10 +19,10 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.43"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sx-udoo-neo-basic nxp/imx/imx6sx-udoo-neo-full nxp/imx/imx6sx-udoo-neo-extended"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # required tools to create the SD card image
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
