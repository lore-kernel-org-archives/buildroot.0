Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8586CCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A29060640;
	Thu,  4 Sep 2025 16:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQLRtGOh3tNM; Thu,  4 Sep 2025 16:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0293A6066C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0293A6066C;
	Thu,  4 Sep 2025 16:53:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90B30111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CA56404F9
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5yXg7MmhtS9 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8326D40525
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8326D40525
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CD3B87F83; Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:45:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfed1003d9684d59dd1a48052003fa6212566d63
X-Git-Newrev: 9e0bb3db39cc31adf11c4887e9dc632ba8f669c5
X-Patchwork-Hint: ignore
Message-Id: <20250904165346.5CD3B87F83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal_*: bump to Linux 6.12.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e0bb3db39cc31adf11c4887e9dc632ba8f669c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The memory leak patch is included with the Linux 6.12.40 release tag, so it no
longer needs to be applied to these defconfigs:
https://github.com/Xilinx/linux-xlnx/commit/9691533f6e6fd0a596ac7688e82eeea53f22c434

Also, since all Xilinx defconfigs have been bumped to Linux 6.12.40 with this
patch, the Linux 6.12.10 (2025.1) hash can be removed along with the
Linux 6.12.10 memory leak patch.

This patch has been run tested on the versal vek280 evaluation board.
This patch has been run tested on the versal vck190 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...i-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch | 127 ---------------------
 board/xilinx/patches/linux/linux.hash              |   1 -
 configs/versal_vck190_defconfig                    |   4 +-
 configs/versal_vek280_defconfig                    |   4 +-
 configs/versal_vpk180_defconfig                    |   4 +-
 5 files changed, 6 insertions(+), 134 deletions(-)

diff --git a/board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch b/board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
deleted file mode 100644
index e9dfee9f97..0000000000
--- a/board/xilinx/linux_6.12.10/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 333678d7b9edc29e8148411d48f70950b1b614c1 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Mon, 2 Jun 2025 11:07:03 +0100
-Subject: [PATCH] include/uapi/linux/xlnx-ai-engine.h: fix
- CONFIG_XILINX_AIE leak
-
-Linux Kconfig options should not be exposed to user space.  This patch fixes
-a Linux kernel leak of the CONFIG_XILINX_AIE option by moving the changes
-implemented by the CONFIG_XILINX_AIE from the uapi header file to the local
-Linux kernel header file.
-
-Upstream: internal AMD jira process
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- include/linux/xlnx-ai-engine.h      | 37 +++++++++++++++++++++++++
- include/uapi/linux/xlnx-ai-engine.h | 42 -----------------------------
- 2 files changed, 37 insertions(+), 42 deletions(-)
-
-diff --git a/include/linux/xlnx-ai-engine.h b/include/linux/xlnx-ai-engine.h
-index 44a1e40ef9b8..10905dc84ae9 100644
---- a/include/linux/xlnx-ai-engine.h
-+++ b/include/linux/xlnx-ai-engine.h
-@@ -171,6 +171,13 @@ static inline u32 aie_get_error_category(struct aie_error *err)
- 	return err->category;
- }
- 
-+int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
-+int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
-+bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
-+int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
-+int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
-+int aie_load_cert(struct device *dev, unsigned char *elf_addr);
-+
- #else
- static inline bool aie_partition_is_available(struct aie_partition_req *req)
- {
-@@ -271,5 +278,35 @@ static inline int aie_part_rscmgr_set_static_range(struct device *dev,
- 	return -EINVAL;
- }
- 
-+int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
-+{
-+	return -EINVAL;
-+}
-+
-+int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
-+{
-+	return -EINVAL;
-+}
-+
-+bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
-+{
-+	return false;
-+}
-+
-+int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
-+{
-+	return 0;
-+}
-+
-+int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
-+{
-+	return -EINVAL;
-+}
-+
-+int aie_load_cert(struct device *dev, unsigned char *elf_addr)
-+{
-+	return -EINVAL;
-+}
-+
- #endif /* CONFIG_XILINX_AIE */
- #endif
-diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
-index 424c5f4c4097..1680aed8ad85 100644
---- a/include/uapi/linux/xlnx-ai-engine.h
-+++ b/include/uapi/linux/xlnx-ai-engine.h
-@@ -781,47 +781,5 @@ struct aie_rsc_user_stat_array {
-  */
- #define AIE_UPDATE_SHIMDMA_DMABUF_BD_ADDR_IOCTL	_IOW(AIE_IOCTL_BASE, 0x1e, \
- 						struct aie_dmabuf_bd_args)
--#if IS_ENABLED(CONFIG_XILINX_AIE)
--
--int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
--int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
--bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
--int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
--int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
--int aie_load_cert(struct device *dev, unsigned char *elf_addr);
--
--#else /* IS_ENABLED(CONFIG_XILINX_AIE) */
--
--int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
--{
--	return -EINVAL;
--}
--
--int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
--{
--	return -EINVAL;
--}
--
--bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
--{
--	return false;
--}
--
--int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
--{
--	return 0;
--}
--
--int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
--{
--	return -EINVAL;
--}
--
--int aie_load_cert(struct device *dev, unsigned char *elf_addr)
--{
--	return -EINVAL;
--}
--
--#endif /* IS_ENABLED(CONFIG_XILINX_AIE) */
- 
- #endif
--- 
-2.25.1
-
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index b14fa3d7ee..994d637d50 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  25795c354f30a3358506ab02deeac99e7f79850804c52d6c3d5539fd310f0491  xlnx_rebase_v6.12_LTS_2025.1.tar.gz
 sha256  ea55acf69bead3d4cf121de414cccfbe75a3c36465c93d9500cc00688d9b8d9d  xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index c9d99876d5..8640d65582 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 4aa25f8d67..6c434199fc 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 500298c2f4..c2d52d7e33 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
