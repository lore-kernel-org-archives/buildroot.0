Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091CDC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD3360F01
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FD3360F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AAFD406CE;
	Tue,  7 Sep 2021 12:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKJPArXt1i-r; Tue,  7 Sep 2021 12:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC103406CA;
	Tue,  7 Sep 2021 12:24:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB5C81BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9A4081D16
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Lr1TnVKQ6R9 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:23:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB7848177A
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:23:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 50D85887C8; Tue,  7 Sep 2021 12:21:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 12:08:11 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0635b823392e8ff3c0363dff80f16a54da83b636
X-Git-Newrev: 69ce56a989347b197bd0e7a7f271d62800909075
X-Patchwork-Hint: ignore
Message-Id: <20210907122158.50D85887C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] configs/pc_x86_64_{efi,
 bios}_defconfig: update kernel to 4.19.204
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=69ce56a989347b197bd0e7a7f271d62800909075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

gcc 10.x is now used by default but the kernel 4.18.10 used by
pc_x86_64_{efi,bios}_defconfig doesn't build with it.

Bump the kernel to 4.19.204 release that contains a lot of
fixes for newer gcc.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1525741062
https://gitlab.com/kubu93/buildroot/-/jobs/1525741060

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 206c098f78da33cade7c2b8b6f8b71368c937c74)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pc_x86_64_bios_defconfig | 6 +++---
 configs/pc_x86_64_efi_defconfig  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 1c1f7a3666..3290a1dda0 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -23,13 +23,13 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 984fc8f92f..18d2c477d5 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -25,13 +25,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
 
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
