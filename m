Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F72EF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C7C81105;
	Sat, 14 Feb 2026 19:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJ0QSxu9-mjY; Sat, 14 Feb 2026 19:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE795811AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098582;
	bh=k/CFCNL9ij+wS3u4dTNMJ+DcBdaguMAS4GjPb7tZUys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KdllHIWZDlEKzX43xg1gtHqhr4CzVmWv/d0BQZBPuwblZgEj+zgRS/WdjF1i8yLXg
	 QSZbvLuPWq7ivp2vw+t11aaz+uQNhIGppomzzV56szGaOpoKcMY4K/q7ZaeIHQoL9Z
	 SsikxuzG9Sor/Cq0O8x3QdeAdQ4yzsu3XZloLzjzJ2TMmLj5tTePCZ4CqktLRfqZWf
	 7vSCN+9SCmBjT8sCAmro/AQtGWgMzA1/EqOQuqeLt02M6RAW2FJUmov/XGQYgCTB3p
	 iWZOr+YkmRermwkSOgoKZfwr/hoRaXMASMYt1uPSeWszRo4oxvXENTK4XkUVfJ1RQw
	 2sqoxxDlrXFnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE795811AA;
	Sat, 14 Feb 2026 19:49:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0396531F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E883D811C4
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg0O_mpeB9A6 for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183F081105
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 183F081105
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF18586D5A; Sat, 14 Feb 2026 19:49:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 19:17:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d8d7ba2c83d8a9060b9856fe39e607fd1b8af53
X-Git-Newrev: 3a442287cc21ac8408172975d5b82b587d3f457e
X-Patchwork-Hint: ignore
Message-Id: <20260214194939.EF18586D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx6ullevk: bump Linux
 and U-Boot to lf-6.12.49-2.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a442287cc21ac8408172975d5b82b587d3f457e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch:
* bumps Linux kernel to version lf-6.12.49-2.2.0
* bumps U-Boot to version lf-6.12.49-2.2.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/imx6ullevk/patches/linux/linux.hash | 2 +-
 board/freescale/imx6ullevk/patches/uboot/uboot.hash | 2 +-
 configs/freescale_imx6ullevk_defconfig              | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash b/board/freescale/imx6ullevk/patches/linux/linux.hash
index b4f534dcc8..b138642633 100644
--- a/board/freescale/imx6ullevk/patches/linux/linux.hash
+++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
+sha256  2166d92e5631ee11bd249d492a1f4009c7635ee36b835fa55384b4ce41e8a63f  linux-imx-lf-6.12.49-2.2.0.tar.gz
diff --git a/board/freescale/imx6ullevk/patches/uboot/uboot.hash b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
index 309a684c2d..5d57adfa22 100644
--- a/board/freescale/imx6ullevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
+sha256  212ea4d8d442153ab732ab724282fef64450e9dab5cfe9565eec4f618e305a80  uboot-imx-lf-6.12.49-2.2.0.tar.gz
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index 3d9e0869ac..99bbff605b 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.49-2.2.0)/linux-imx-lf-6.12.49-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6ullevk/linux_sdma.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,9 +22,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.49-2.2.0)/uboot-imx-lf-6.12.49-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
