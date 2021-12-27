Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFD7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD3414035A;
	Mon, 27 Dec 2021 20:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doD8cdglUjAf; Mon, 27 Dec 2021 20:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C88740673;
	Mon, 27 Dec 2021 20:09:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7311BF3C6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1407460A8C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CbUvsnLQNwZJ for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:07:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40A5D60A9C
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7BF1E82BA8; Mon, 27 Dec 2021 20:02:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 21:06:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f6bac8b041880106e085b4154ef599c45675a2c
X-Git-Newrev: ec822bc670c80b2b70f6ecb5952c11ecac587123
X-Patchwork-Hint: ignore
Message-Id: <20211227200202.7BF1E82BA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6sx-sdb: bump U-Boot and kernel
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec822bc670c80b2b70f6ecb5952c11ecac587123
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to version 2021.10 and kernel to 5.15.11.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6sx-sdb_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/imx6sx-sdb_defconfig b/configs/imx6sx-sdb_defconfig
index 7ad662aa2c..c36520a165 100644
--- a/configs/imx6sx-sdb_defconfig
+++ b/configs/imx6sx-sdb_defconfig
@@ -3,19 +3,20 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.55"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb imx6sx-sdb-reva"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
