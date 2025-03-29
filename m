Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260FFC36013
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 12:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 850D94115B;
	Sat, 29 Mar 2025 12:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHJFuwtW7oU2; Sat, 29 Mar 2025 12:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 381B141117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 381B141117;
	Sat, 29 Mar 2025 12:38:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AEB219C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ACBD410A1
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8QY_h-I__X1 for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7132840B59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7132840B59
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EF1683867; Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 12:44:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 185c0ba4b93a2647b41ed0afe9ea3f5cfdbfbe77
X-Git-Newrev: ec8120af81aa62e9ffd4e43867974ca7f60c37db
X-Patchwork-Hint: ignore
Message-Id: <20250329123758.5EF1683867@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unleashed: extract common
 configuration
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec8120af81aa62e9ffd4e43867974ca7f60c37db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the generic part of the configuration into a new "common" directory
so that it is easier to add similar boards without duplicating the files.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/sifive/{hifive-unleashed => common}/genimage_sdcard.cfg   | 0
 board/sifive/{hifive-unleashed => common}/genimage_spi-nor.cfg  | 0
 board/sifive/{hifive-unleashed => common}/linux.config.fragment | 0
 board/sifive/{hifive-unleashed => common}/post-build.sh         | 0
 board/sifive/hifive-unleashed/readme.txt                        | 2 +-
 configs/hifive_unleashed_defconfig                              | 6 +++---
 6 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/common/genimage_sdcard.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_sdcard.cfg
rename to board/sifive/common/genimage_sdcard.cfg
diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/common/genimage_spi-nor.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_spi-nor.cfg
rename to board/sifive/common/genimage_spi-nor.cfg
diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/common/linux.config.fragment
similarity index 100%
rename from board/sifive/hifive-unleashed/linux.config.fragment
rename to board/sifive/common/linux.config.fragment
diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/common/post-build.sh
similarity index 100%
rename from board/sifive/hifive-unleashed/post-build.sh
rename to board/sifive/common/post-build.sh
diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
index e9ccb26fa6..45cb8ece55 100644
--- a/board/sifive/hifive-unleashed/readme.txt
+++ b/board/sifive/hifive-unleashed/readme.txt
@@ -97,7 +97,7 @@ Adjust Buildroot configuration by:
   $ make menuconfig
 
 Change "System configuration" -> "Extra arguments passed to custom scripts"
-value to "-c board/sifive/hifive-unleashed/genimage_spi-nor.cfg", save the
+value to "-c board/sifive/common/genimage_spi-nor.cfg", save the
 configuration and build. This creates a output/images/spi-nor.img that can
 be programmed to the on-board SPI flash.
 
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index cb217a5af1..f96e171e43 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -8,14 +8,14 @@ BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/hifive-unleashed/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage_sdcard.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unleashed-a00"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
