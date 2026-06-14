Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AD7CD98C5
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A17411CB;
	Sun, 14 Jun 2026 10:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJJEw5LQZ_fJ; Sun, 14 Jun 2026 10:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B0FF41193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781432009;
	bh=4jkcOa0e0Zaucy4GsIEAF4TypD5jtGg94iCsuZW9hVs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FFd8M1dlSqbYNzkpS1NjS2IqO9bcaTgkfetX6rwFaCrp9DfmzYNp2lXNMdGZtIj/U
	 DYnotpJsQHFyKevj0SBylJFwdjWXr2H2poEkRVPpyTC3y97nXrzuhDf0gCZnKL8ZMT
	 E+yUGsjAk8eMT6oMQRWiQ59qANsB9SICCAoey3E0nLOgCxUdfzVFva5FMXs4DhIs9b
	 sUadpUoMVW2C8+Ex/RFIJz0S4Ozrr3oWH3M3+cKSk0WkxTPqnOD5R5FddOMLBmDS7w
	 IucNVDJCPIpZqgc6nDyO/Irq+3Ui86Bs5vpkJVwKp2C1nXM7Y+I410+TdAf/tBAljc
	 IZHq6g+MUBrRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B0FF41193;
	Sun, 14 Jun 2026 10:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3031169
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C51FA80E03
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syEpUuRRwDnP for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 016F080D83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 016F080D83
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B94EF88254; Sun, 14 Jun 2026 10:13:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jun 2026 12:08:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94a72b1922950581c00cefb64ede598359c16a94
X-Git-Newrev: 82d1a378d3f682c235cf0081de3816d18bbbcd16
X-Patchwork-Hint: ignore
Message-Id: <20260614101305.B94EF88254@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am{62ax, 62px, 62x,
 64x}_sk: switch to Bootlin stable toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82d1a378d3f682c235cf0081de3816d18bbbcd16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the ti_am6x configurations to use the Bootlin glibc stable
prebuilt external toolchain, as recommended in the Buildroot meeting
report from ELCE 2024: https://elinux.org/Buildroot:DeveloperDaysELCE2024

This will reduce the number of Gilab-CI minute used to tests each
defconfig (1h10 -> 52 minutes).

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/ti_am62ax_sk_defconfig | 4 +++-
 configs/ti_am62px_sk_defconfig | 4 +++-
 configs/ti_am62x_sk_defconfig  | 4 +++-
 configs/ti_am64x_sk_defconfig  | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 0b3ebe6242..da60d93435 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62ax-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
diff --git a/configs/ti_am62px_sk_defconfig b/configs/ti_am62px_sk_defconfig
index e53b41ed5e..876734bf4e 100644
--- a/configs/ti_am62px_sk_defconfig
+++ b/configs/ti_am62px_sk_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62px-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index ac73a2da5c..6af64404c2 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index a9ec5e3d53..f31989e1e7 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
