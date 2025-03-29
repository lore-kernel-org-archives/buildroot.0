Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194CCC36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 12:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22BC60B56;
	Sat, 29 Mar 2025 12:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiMjz-NzP4zu; Sat, 29 Mar 2025 12:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B33B60B27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B33B60B27;
	Sat, 29 Mar 2025 12:38:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B3619C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C88D410A1
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5whgELWYKt6 for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CC0D40D5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CC0D40D5C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C2BF83863; Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 12:44:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9cc5dbd453c80790c1f2f7e9b19a85ded5979be
X-Git-Newrev: 1ba1055d3da2d98874aae1eedf1983a2ed933605
X-Patchwork-Hint: ignore
Message-Id: <20250329123758.7C2BF83863@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unleashed: bump Linux to
 6.12.20 and U-Boot to 2025.01
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ba1055d3da2d98874aae1eedf1983a2ed933605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps Linux to 6.12.20 and U-Boot to 2025.01, to
align versions to those used in the Hifive Unmatched defconfig
to make maintenance easier. The new U-Boot version needs gnutls.

This commit also enabled BR2_DOWNLOAD_FORCE_CHECK_HASHES in
defconfigs. The .checkpackageignore is updated to reflect that change.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
[Julien:
 - reword commit log
 - add missing BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 - change linux.hash comment to take hash from upstream
 - change linux-headers.hash file to a symlink
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                              | 1 -
 .../hifive-unleashed/patches/linux-headers/linux-headers.hash    | 1 +
 board/sifive/hifive-unleashed/patches/linux/linux.hash           | 2 ++
 board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash       | 2 ++
 configs/hifive_unleashed_defconfig                               | 9 ++++++---
 5 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7b02d2a8d0..1a61aa1ac0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -146,7 +146,6 @@ configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
 configs/friendlyarm_nanopi_r2s_defconfig lib_defconfig.ForceCheckHash
 configs/galileo_defconfig lib_defconfig.ForceCheckHash
 configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
-configs/hifive_unleashed_defconfig lib_defconfig.ForceCheckHash
 configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabresd_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash b/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/sifive/hifive-unleashed/patches/linux/linux.hash b/board/sifive/hifive-unleashed/patches/linux/linux.hash
new file mode 100644
index 0000000000..b356207dc4
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7  linux-6.12.20.tar.xz
diff --git a/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash b/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..1408f547b8
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index f96e171e43..e83af773f7 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -5,7 +5,9 @@ BR2_RISCV_ISA_RVA=y
 BR2_RISCV_ISA_RVF=y
 BR2_RISCV_ISA_RVD=y
 BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/sifive/hifive-unleashed/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
@@ -13,7 +15,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.20"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,11 +31,12 @@ BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unleashed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
