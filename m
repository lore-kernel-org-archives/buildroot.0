Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F285C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 14:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C4B9608D4;
	Mon, 27 May 2024 14:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pooMNwDnKQjG; Mon, 27 May 2024 14:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E11D608DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E11D608DB;
	Mon, 27 May 2024 14:38:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C76A1D1DD7
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26A31606A9
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1BpbUcxRzkK for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 14:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A47C60690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A47C60690
 for <buildroot@buildroot.org>; Mon, 27 May 2024 14:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23399876C7; Mon, 27 May 2024 14:38:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 16:32:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5746b8b37148f553a5b907735e9f3237cb682ed9
X-Git-Newrev: f5e82c2235bda420a180d62d2707971edf0229d8
X-Patchwork-Hint: ignore
Message-Id: <20240527143833.23399876C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynq_*: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5e82c2235bda420a180d62d2707971edf0229d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
[Peter: use symlink for linux-headers.hash]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                 | 4 ----
 board/zynq/patches/linux-headers/linux-headers.hash | 1 +
 board/zynq/patches/linux/linux.hash                 | 2 ++
 board/zynq/patches/uboot/uboot.hash                 | 2 ++
 configs/zynq_microzed_defconfig                     | 2 ++
 configs/zynq_zc702_defconfig                        | 2 ++
 configs/zynq_zc706_defconfig                        | 2 ++
 configs/zynq_zed_defconfig                          | 2 ++
 8 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 68c0ea83dd..dbed0fdc34 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -379,10 +379,6 @@ configs/versal_vck190_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
-configs/zynq_microzed_defconfig lib_defconfig.ForceCheckHash
-configs/zynq_zc702_defconfig lib_defconfig.ForceCheckHash
-configs/zynq_zc706_defconfig lib_defconfig.ForceCheckHash
-configs/zynq_zed_defconfig lib_defconfig.ForceCheckHash
 configs/zynqmp_kria_kd240_defconfig lib_defconfig.ForceCheckHash
 configs/zynqmp_kria_kr260_defconfig lib_defconfig.ForceCheckHash
 configs/zynqmp_kria_kv260_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/zynq/patches/linux-headers/linux-headers.hash b/board/zynq/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/zynq/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/zynq/patches/linux/linux.hash b/board/zynq/patches/linux/linux.hash
new file mode 100644
index 0000000000..8ed4bbead4
--- /dev/null
+++ b/board/zynq/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  56acddefc6f6fdc00df5b75ceb4f86a9d0af9a4fef78cf57f9f2c274b22f006f  xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz
diff --git a/board/zynq/patches/uboot/uboot.hash b/board/zynq/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..35e54e0baf
--- /dev/null
+++ b/board/zynq/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  32a997a748697ff27e5e6db8edaff5ba893077214bc18b5267daff0b708dab53  xlnx_rebase_v2023.01_2023.2.tar.gz
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 7ada84cb6c..8fb9bc49dc 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 7f762abc58..84c8843ced 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index ffa734348a..e22ba7a3d9 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 4bc1880481..33e7aa02e0 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
