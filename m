Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5F9D59D7F
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 21:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5980261633;
	Mon, 25 Nov 2024 21:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9i16b_PIScxw; Mon, 25 Nov 2024 21:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E0161631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E0161631;
	Mon, 25 Nov 2024 21:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9953C280B
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 21:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB6B850C1
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 21:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVSJ764O_GX4 for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 21:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FB03850C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FB03850C0
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 21:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66FF1865F6; Mon, 25 Nov 2024 21:58:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 25 Nov 2024 22:50:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c0a5fcf781f4dceb85e6a5c5a98b2ff373ff245f
X-Git-Newrev: 45d74a3fe1295b9da71d067de217457b2e510eff
X-Patchwork-Hint: ignore
Message-Id: <20241125215849.66FF1865F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/imx7d-sdb: bump linux to
 6.6.58 and uboot to 2024.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=45d74a3fe1295b9da71d067de217457b2e510eff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
[Julien:
  - add uboot dependencies to openssl and gnutls
  - change linux.hash comment to use upstream hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                      | 1 -
 board/imx7d-sdb/patches/linux-headers/linux-headers.hash | 1 +
 board/imx7d-sdb/patches/linux/linux.hash                 | 2 ++
 board/imx7d-sdb/patches/uboot/uboot.hash                 | 2 ++
 configs/imx7d-sdb_defconfig                              | 8 ++++++--
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f897565718..45fb516137 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -162,7 +162,6 @@ configs/imx6sx-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
-configs/imx7d-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/imx7d-sdb/patches/linux-headers/linux-headers.hash b/board/imx7d-sdb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/imx7d-sdb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/imx7d-sdb/patches/linux/linux.hash b/board/imx7d-sdb/patches/linux/linux.hash
new file mode 100644
index 0000000000..5fb7057e04
--- /dev/null
+++ b/board/imx7d-sdb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  e7df81e588d70fab5ec3ec3bb04ac53d51f0860fc3b1ec45e0a4167a026899db  linux-6.6.58.tar.xz
diff --git a/board/imx7d-sdb/patches/uboot/uboot.hash b/board/imx7d-sdb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/imx7d-sdb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index 541a689ddc..6520a41cf9 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -2,12 +2,14 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/imx7d-sdb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/freescale/imx7dsdb/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
@@ -18,7 +20,9 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
