Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23BFC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70DE481241;
	Thu,  6 Jun 2024 08:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJDN7Zts4i4k; Thu,  6 Jun 2024 08:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13C684327
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13C684327;
	Thu,  6 Jun 2024 08:45:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9291BF95C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36C2482ED2
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMhXm6bFDV_0 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410DF82D57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 410DF82D57
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 08:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AEBD87C31; Thu,  6 Jun 2024 08:45:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 10:42:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3137e5bf8f06343e60096ef9e89b1d0788fb6c0f
X-Git-Newrev: 49fa6ebb71f89e3c9e13d12070bea41ccf6ed700
X-Patchwork-Hint: ignore
Message-Id: <20240606084551.2AEBD87C31@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/zynq_*: move hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=49fa6ebb71f89e3c9e13d12070bea41ccf6ed700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch moves the linux and uboot hashes from 'board/zynq/patches' to
'board/xilinx/patches'.  The reason for this is that all of the Xilinx boards
including zynq, zynqmp and versal will be using the same linux and uboot repo.
By putting the hashes in 'board/xilinx/patches', the same hashes can be shared
amongst all of the Xilinx boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/{zynq => xilinx}/patches/linux-headers/linux-headers.hash | 0
 board/{zynq => xilinx}/patches/linux/linux.hash                 | 0
 board/{zynq => xilinx}/patches/uboot/uboot.hash                 | 0
 configs/zynq_microzed_defconfig                                 | 2 +-
 configs/zynq_zc702_defconfig                                    | 2 +-
 configs/zynq_zc706_defconfig                                    | 2 +-
 configs/zynq_zed_defconfig                                      | 2 +-
 7 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/zynq/patches/linux-headers/linux-headers.hash b/board/xilinx/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/zynq/patches/linux-headers/linux-headers.hash
rename to board/xilinx/patches/linux-headers/linux-headers.hash
diff --git a/board/zynq/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
similarity index 100%
rename from board/zynq/patches/linux/linux.hash
rename to board/xilinx/patches/linux/linux.hash
diff --git a/board/zynq/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
similarity index 100%
rename from board/zynq/patches/uboot/uboot.hash
rename to board/xilinx/patches/uboot/uboot.hash
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index c6ca5a6244..f955a0c4ad 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 9e37678d9b..75ebc2a3ba 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 9ccf23f6e1..ce539eefaf 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 95606caf5c..925faeac8e 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
