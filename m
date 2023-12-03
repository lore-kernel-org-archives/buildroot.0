Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9822CC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5157542071;
	Mon,  4 Dec 2023 20:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5157542071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBr_vRXxz8lh; Mon,  4 Dec 2023 20:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B73E42032;
	Mon,  4 Dec 2023 20:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B73E42032
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1421BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE8F04175A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8F04175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NvJR1W8SgQG for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87F074174D
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87F074174D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76DE3879B9; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:54:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9e5c1e80eff025768e347efbe5eb4d1dfd81ea9
X-Git-Newrev: 748a217c2521c1dd4248fd1b5507388f664e1984
X-Patchwork-Hint: ignore
Message-Id: <20231204201330.76DE3879B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/linksprite_pcduino_defconfig: bump
 BSP versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=748a217c2521c1dd4248fd1b5507388f664e1984
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to the new Linux LTS release 6.6.3. Switch to the
latest U-Boot 2023.10.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/linksprite_pcduino_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index cf58e021ba..2b215201cb 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -18,16 +18,16 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 # For kernel modules autoloading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-pcduino"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -40,7 +40,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
