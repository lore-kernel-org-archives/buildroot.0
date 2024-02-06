Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8B9C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 23:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1FF9408B1;
	Tue,  6 Feb 2024 23:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9FjMmkaEneu; Tue,  6 Feb 2024 23:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA3F42096
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA3F42096;
	Tue,  6 Feb 2024 23:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE301BF2C4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 674094209B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZqe_x5CZNZi for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 23:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F32042096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F32042096
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 23:01:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8914E874A9; Tue,  6 Feb 2024 23:01:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 00:01:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f20fbc9c28cfbe077b4d446f868dbf17c594aa5b
X-Git-Newrev: 842f19849edeadd5846df3723e906b347383b164
X-Patchwork-Hint: ignore
Message-Id: <20240206230133.8914E874A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/asus_tinker_rk3288_defconfig:
 switch to zImage and bump Linux to 6.1.44, U-Boot to 2023.07
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=842f19849edeadd5846df3723e906b347383b164
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uImage is almost deprecated so let's switch to zImage. Let's also bump
Linux version to 6.1.44, U-Boot to 2023.07 and remove
BR2_TARGET_UBOOT_NEEDS_PYTHON3 since it's selected by
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/asus/tinker/extlinux.conf      | 2 +-
 configs/asus_tinker_rk3288_defconfig | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/board/asus/tinker/extlinux.conf b/board/asus/tinker/extlinux.conf
index bb96ddb893..be21e246ec 100644
--- a/board/asus/tinker/extlinux.conf
+++ b/board/asus/tinker/extlinux.conf
@@ -1,4 +1,4 @@
 label Tinker linux
-  kernel /boot/uImage
+  kernel /boot/zImage
   devicetree /boot/rk3288-tinker.dtb
   append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 40f4125880..b3e4502a45 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -10,10 +10,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
@@ -23,10 +22,8 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
