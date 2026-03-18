Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C88103E16A
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED6ED608D5;
	Wed, 18 Mar 2026 12:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HQPgGhYr92X; Wed, 18 Mar 2026 12:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10AD9608E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773835779;
	bh=1KbFs1GKhZs3M9g/BUEj6VvBYJEqupAy2p8S7CYRN+A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XduedzeMKa0bpjS5KE/Ac/MByuiRT7qmNM0cIpNWTBxo2eLK4SmL2BMKXCH18whb9
	 1/GY9wBXSwEunK6l21HapsZp1biI2twa5sFOWXPe0Gi6Kf/7qSOjTH9Q6Amvp8B42G
	 nNaBjFmz4K3xltd946XXRnSCauofa/4lNlQbySFeGNZoJRTWXgXwf5+drJBa+Fz0+O
	 pcxJN6w085m9thSlmkmv4m4DbDh1JB+L2MBfdiPJ7QFNuizz9nwh/Oie1uw634/TmH
	 UMHFsD9fF1kag8DCjT9QsxhwG4Gx5bN/UtE7GPBbphegkBDrATCBUUEZiTZisnzNq5
	 nao5ew6I+aRAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10AD9608E3;
	Wed, 18 Mar 2026 12:09:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23BB93DB
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0905A4039A
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnZGmkXPOk56 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1384C4009E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1384C4009E
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CF7A842BE; Wed, 18 Mar 2026 12:09:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 13:01:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 367e9bb04bc301fced2846f0f81b0440cc10b317
X-Git-Newrev: ec58c67e5f112c89616c3d1cfdecce29b06ac908
X-Patchwork-Hint: ignore
Message-Id: <20260318120933.2CF7A842BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imxrt1050-evk: bump u-boot to fix
 the build and bump linux too
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec58c67e5f112c89616c3d1cfdecce29b06ac908
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Python setuptools has removed the obsolete pkg_resources python module in
v82.0.0. This module is used by the binman command in U-Boot until
v2025.10.
Since the python-setuptools package has been updated to v82.0.0 in
Buildroot, the imxrt1050-evk_defconfig (using U-Boot v2025.07 and
binman) fails to build with the following error [1]:

  ModuleNotFoundError: No module named 'pkg_resources'

Update the defconfig to use a more recent U-Boot v2026.01, to fix the
build and at the same time bump Linux to version 6.18.18.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922027

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix defconfig name in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/imxrt1050evk/patches/linux/linux.hash | 2 +-
 board/freescale/imxrt1050evk/patches/uboot/uboot.hash | 2 +-
 configs/imxrt1050-evk_defconfig                       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/imxrt1050evk/patches/linux/linux.hash b/board/freescale/imxrt1050evk/patches/linux/linux.hash
index 216d9b9d39..020dc72386 100644
--- a/board/freescale/imxrt1050evk/patches/linux/linux.hash
+++ b/board/freescale/imxrt1050evk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
index 440526977b..b6a925ea4e 100644
--- a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
+++ b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 7a70c42afa..813be65e52 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
