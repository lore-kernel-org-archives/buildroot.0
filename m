Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8860EC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 15:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46DFF60A81;
	Sat,  9 Dec 2023 15:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46DFF60A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cU4ZV41j47KX; Sat,  9 Dec 2023 15:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E5960ABD;
	Sat,  9 Dec 2023 15:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E5960ABD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32F5F1BF860
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AA8F4097C
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA8F4097C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USHRFlN9qBre for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 15:12:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B855409BD
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 15:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B855409BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1B4E877FD; Sat,  9 Dec 2023 15:12:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Dec 2023 16:11:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 857be240e0c6a6e2904678f40d195770a99e8ae0
X-Git-Newrev: 1cb61e5d0a646aef63c95610472f5fdf07c372b1
X-Patchwork-Hint: ignore
Message-Id: <20231209151206.F1B4E877FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx6ullevk_defconfig:
 bump Linux and U-Boot to lf-6.1.36-2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cb61e5d0a646aef63c95610472f5fdf07c372b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's also enable NXP firmware package to let latest SDMA firmware to be
loaded.  To achieve this we also need to enable dynamic eudev to let it to
load the firmware as it is requested early before the rootfs is mounted.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Peter: explain why eudev is needed]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/imx6ullevk/linux_sdma.fragment |  1 +
 configs/freescale_imx6ullevk_defconfig         | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/board/freescale/imx6ullevk/linux_sdma.fragment b/board/freescale/imx6ullevk/linux_sdma.fragment
new file mode 100644
index 0000000000..6f1c8b4313
--- /dev/null
+++ b/board/freescale/imx6ullevk/linux_sdma.fragment
@@ -0,0 +1 @@
+CONFIG_IMX_SDMA=m
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index db4fa69f71..fd4254edbf 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -1,21 +1,26 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.15.71-2.2.0)/linux-imx-lf-5.15.71-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.36-2.1.0)/linux-imx-lf-6.1.36-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6ullevk/linux_sdma.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL=y
+BR2_PACKAGE_FIRMWARE_IMX=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.15.71-2.2.0)/uboot-imx-lf-5.15.71-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.36-2.1.0)/uboot-imx-lf-6.1.36-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
