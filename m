Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D57C3ABBE
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 20:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2476960E18;
	Tue,  6 May 2025 20:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5qf8DBrBXTa; Tue,  6 May 2025 20:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4782660BDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4782660BDC;
	Tue,  6 May 2025 20:42:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D4C21D72
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C7A40028
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co6evHCw0DJD for <buildroot@buildroot.org>;
 Tue,  6 May 2025 20:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8090D40A3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8090D40A3A
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:42:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A98286432; Tue,  6 May 2025 20:42:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 May 2025 22:40:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8ba9da529e69e1d594c6babb10ce67f8273e7ce
X-Git-Newrev: 683681261b19a0ea541e55ae7d5497ccf05e40a9
X-Patchwork-Hint: ignore
Message-Id: <20250506204247.6A98286432@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx28evk: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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

commit: https://git.buildroot.net/buildroot/commit/?id=683681261b19a0ea541e55ae7d5497ccf05e40a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig
and adds custom hash files. The exception entry in .checkpackageignore
is also removed.

Cc: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                               | 1 -
 board/freescale/imx28evk/patches/linux-headers/linux-headers.hash | 1 +
 board/freescale/imx28evk/patches/linux/linux.hash                 | 2 ++
 board/freescale/imx28evk/patches/uboot/uboot.hash                 | 2 ++
 configs/imx28evk_defconfig                                        | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7bfc457c90..038e3d6dc6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -139,7 +139,6 @@ configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
-configs/imx28evk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx28evk/patches/linux/linux.hash b/board/freescale/imx28evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..8aeb3785b4
--- /dev/null
+++ b/board/freescale/imx28evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  af54b449f4fb93b8e8daa346144a7309e8e95174bd962c4b5917cf56120456d9  linux-6.6.26.tar.xz
diff --git a/board/freescale/imx28evk/patches/uboot/uboot.hash b/board/freescale/imx28evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/freescale/imx28evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/imx28evk_defconfig b/configs/imx28evk_defconfig
index 8c428e3fec..d34f413440 100644
--- a/configs/imx28evk_defconfig
+++ b/configs/imx28evk_defconfig
@@ -1,5 +1,7 @@
 BR2_arm=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx28evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
