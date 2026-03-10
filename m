Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1162FD88CB
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 23:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F2560EC7;
	Tue, 10 Mar 2026 23:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufanvD9NkeQC; Tue, 10 Mar 2026 23:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 815A960EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773184735;
	bh=rDVfc/ArXkKPWf67Ym/tOgxENW/nfSkFmzEplAUULw4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rt03fzlDfCKieKVEQgDpv95Hcz4RN9SVFFrnGg+On21JopyxgWeIX7ErPivnTb4DK
	 5dpUvNHvLbk7RWb7ZplYAm+LN3gPYdTsuEZkB32TGj3AKO7jsvauEEkF9k0aFjL0A7
	 1vb1oS+XHYvDMGGF+NaVjTEngisKroE2w0x7miggRB8MI49tDlpEo2yE01G8fZ6sm1
	 Bn1sIjfPAWv3lDn5NeNVxcY+wphHned1Xbein0VuxDySE39d1ldP9G6l0OO3N2G4iN
	 +pe5Fu66R7KvqoulKOaSQBJU4i8toPTaVLAOUy9w+QvlhcWEn/04uvuSRUGWL47+Zn
	 f8stIGrNFogJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815A960EC9;
	Tue, 10 Mar 2026 23:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7B8933A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99A5340B77
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1KRwmmd81sY for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C838E40B14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C838E40B14
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0D4186B0C; Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 23:47:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea2a0e5cdb52b9b77f12ac26b9e22b547611470a
X-Git-Newrev: d01645d09f930f3fcbeee04fc5b05395ce2bbb3b
X-Patchwork-Hint: ignore
Message-Id: <20260310231851.E0D4186B0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagley_ai_defconfig: bump linux
 to 6.18.16 and u-boot to 2026.01
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d01645d09f930f3fcbeee04fc5b05395ce2bbb3b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replace OP-TEE TEE binary file tee-pager_v2.bin by tee-raw.bin using
the new option BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN.

Remove unsued linux-headers.hash since we use a prebuilt toolchain.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../beagley-ai/patches/linux-headers/linux-headers.hash          | 1 -
 board/beagleboard/beagley-ai/patches/linux/linux.hash            | 4 ++--
 .../beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash      | 2 +-
 board/beagleboard/beagley-ai/patches/uboot/uboot.hash            | 2 +-
 configs/beagley_ai_defconfig                                     | 9 +++++----
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagley-ai/patches/linux/linux.hash b/board/beagleboard/beagley-ai/patches/linux/linux.hash
index 794837b285..eb4dcee958 100644
--- a/board/beagleboard/beagley-ai/patches/linux/linux.hash
+++ b/board/beagleboard/beagley-ai/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  2bb586c954277d070c8fdf6d7275faa93b4807d9bf3353b491d8149cca02b4fc  linux-6.15.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
diff --git a/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 440526977b..b6a925ea4e 100644
--- a/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/beagleboard/beagley-ai/patches/uboot/uboot.hash b/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
index 440526977b..b6a925ea4e 100644
--- a/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
+++ b/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/beagley_ai_defconfig b/configs/beagley_ai_defconfig
index 67516d8681..d0a3bf58c4 100644
--- a/configs/beagley_ai_defconfig
+++ b/configs/beagley_ai_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagley-ai/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.15.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am67a-beagley-ai"
@@ -28,22 +28,23 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am67a_beagley_ai_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am67a_beagley_ai_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
