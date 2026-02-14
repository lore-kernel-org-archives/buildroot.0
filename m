Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6071BEF584C
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD6B60E8A;
	Sat, 14 Feb 2026 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvMeFmGPF2Ao; Sat, 14 Feb 2026 19:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E542606ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098587;
	bh=+BiDXCuChfmSFavc1KnpbnOzuuvj6fue5GaqFQU3mxI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RDevHZ88vrejWuXcjVlViiaOs0cflV45TEVf0DF0VTeVnm6XDzT4ZTa0hGhsbckFI
	 j97wpwQ7SWDEYdtlStTgN8S6FeGwyj08GRXYGJw1EKzxEvENuXXJXbBkJ4tyHzWaZ1
	 r9cfb+HMLFDKDCW7OxoUFJI52IOvSNuFsSPPomj0fS1bAwwiuxmDatoywvBePkcxoh
	 m5aw3pqvERCaVpgkns+glti3FrJ6zWiSTjUQGXdkfd2UOeSkwE9bS7wdRdsStMa09X
	 g5Xf+BiWfDxzLwZz9Rbk5pE7fpOmguaaG3oOc8s1RslbRRhA59DBSWPynxqlZiLv3d
	 yu0/6V7HldNDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E542606ED;
	Sat, 14 Feb 2026 19:49:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30934270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1742081105
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjI74PASN1r8 for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E578F810FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E578F810FE
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D35CE86D61; Sat, 14 Feb 2026 19:49:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 19:17:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c11fb84b0c74f8037585b1b19b42687addbae37c
X-Git-Newrev: c7a50f035e78cfeae5305c0d0a49e5676fcc3356
X-Patchwork-Hint: ignore
Message-Id: <20260214194939.D35CE86D61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/bananapi_m2_berry: bump Linux to
 6.18.8 and U-Boot to 2026.01
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7a50f035e78cfeae5305c0d0a49e5676fcc3356
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: change linux.hash comment to use hash from upstream]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                           |  1 -
 .../patches/linux-headers/linux-headers.hash                  |  1 +
 board/bananapi/bananapi-m2-berry/patches/linux/linux.hash     |  2 ++
 board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash     |  2 ++
 configs/bananapi_m2_berry_defconfig                           | 11 +++++++----
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 62e3998a66..38cd0b2711 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -90,7 +90,6 @@ configs/atmel_sama5d4_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/avenger96_defconfig lib_defconfig.ForceCheckHash
 configs/avnet_rzboard_v2l_defconfig lib_defconfig.ForceCheckHash
-configs/bananapi_m2_berry_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_ultra_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/bananapi/bananapi-m2-berry/patches/linux-headers/linux-headers.hash b/board/bananapi/bananapi-m2-berry/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/bananapi/bananapi-m2-berry/patches/linux/linux.hash b/board/bananapi/bananapi-m2-berry/patches/linux/linux.hash
new file mode 100644
index 0000000000..f83883b936
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash b/board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index 200257ac0d..35909fbb99 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -1,16 +1,18 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_TOOLCHAIN_EXTERNAL=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/bananapi/bananapi-m2-berry/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Berry"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/bananapi-m2-berry/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-berry/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.57"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v40-bananapi-m2-berry"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-v40-bananapi-m2-berry"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -18,11 +20,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
