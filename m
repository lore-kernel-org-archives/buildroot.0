Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7BFC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 21:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0132C41D04;
	Mon,  9 Jun 2025 21:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imPR-V86X33W; Mon,  9 Jun 2025 21:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DB9141DE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DB9141DE3;
	Mon,  9 Jun 2025 21:34:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB0601A4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 21:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1F4141D84
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 21:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzquNcbMx1IE for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 21:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE4D41D04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAE4D41D04
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 21:34:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A46C281034; Mon,  9 Jun 2025 21:34:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 20:21:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f91854dfaf38d3ee5f5a24541c3138e956a6c3f4
X-Git-Newrev: 93c4e7bdbfd50d4ac1bb23ff48147728881eda7a
X-Patchwork-Hint: ignore
Message-Id: <20250609213415.A46C281034@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/xilinx: add
 xilinx_v2025.1 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=93c4e7bdbfd50d4ac1bb23ff48147728881eda7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hashes for xilinx_v2025.1 release.

xilinx_v2025.1 release includes:
 - atf 2.12
 - linux 6.12.10
 - uboot 2025.01

In addition, the xilinx_v2025.1 linux kernel release tag has a Kconfig leak
of the CONFIG_XILINX_AIE option.  This patch adds a patch that is specific to
the Xilinx Linux 6.12.10 release which fixes the problem by moving the changes
implemented by the CONFIG_XILINX_AIE option from the exposed uapi header file
to the Linux internal header file.

The patch has been added to the board/xilinx/linux_6.12/patches directory, so
that it will only be applied when a user specifies they wish to build the
xilinx_v2025.1 release or they use a defconfig that has migrated to this
release.

Since the header file that causes the issue is not yet mainline, this patch
has been "upstreamed" to the Xilinx linux-xlnx repo via the AMD internal jira
process.

Upstream: internal AMD jira process

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Julien: fix check-package errors:
 - remove numbering in patch subject
 - add "Upstream:" tag in patch
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...i-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch | 127 +++++++++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |   1 +
 board/xilinx/patches/linux/linux.hash              |   1 +
 board/xilinx/patches/uboot/uboot.hash              |   1 +
 4 files changed, 130 insertions(+)

diff --git a/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch b/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
new file mode 100644
index 0000000000..e9dfee9f97
--- /dev/null
+++ b/board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch
@@ -0,0 +1,127 @@
+From 333678d7b9edc29e8148411d48f70950b1b614c1 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 2 Jun 2025 11:07:03 +0100
+Subject: [PATCH] include/uapi/linux/xlnx-ai-engine.h: fix
+ CONFIG_XILINX_AIE leak
+
+Linux Kconfig options should not be exposed to user space.  This patch fixes
+a Linux kernel leak of the CONFIG_XILINX_AIE option by moving the changes
+implemented by the CONFIG_XILINX_AIE from the uapi header file to the local
+Linux kernel header file.
+
+Upstream: internal AMD jira process
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ include/linux/xlnx-ai-engine.h      | 37 +++++++++++++++++++++++++
+ include/uapi/linux/xlnx-ai-engine.h | 42 -----------------------------
+ 2 files changed, 37 insertions(+), 42 deletions(-)
+
+diff --git a/include/linux/xlnx-ai-engine.h b/include/linux/xlnx-ai-engine.h
+index 44a1e40ef9b8..10905dc84ae9 100644
+--- a/include/linux/xlnx-ai-engine.h
++++ b/include/linux/xlnx-ai-engine.h
+@@ -171,6 +171,13 @@ static inline u32 aie_get_error_category(struct aie_error *err)
+ 	return err->category;
+ }
+ 
++int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
++int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
++bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
++int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
++int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
++int aie_load_cert(struct device *dev, unsigned char *elf_addr);
++
+ #else
+ static inline bool aie_partition_is_available(struct aie_partition_req *req)
+ {
+@@ -271,5 +278,35 @@ static inline int aie_part_rscmgr_set_static_range(struct device *dev,
+ 	return -EINVAL;
+ }
+ 
++int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
++{
++	return -EINVAL;
++}
++
++int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
++{
++	return -EINVAL;
++}
++
++bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
++{
++	return false;
++}
++
++int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
++{
++	return 0;
++}
++
++int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
++{
++	return -EINVAL;
++}
++
++int aie_load_cert(struct device *dev, unsigned char *elf_addr)
++{
++	return -EINVAL;
++}
++
+ #endif /* CONFIG_XILINX_AIE */
+ #endif
+diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
+index 424c5f4c4097..1680aed8ad85 100644
+--- a/include/uapi/linux/xlnx-ai-engine.h
++++ b/include/uapi/linux/xlnx-ai-engine.h
+@@ -781,47 +781,5 @@ struct aie_rsc_user_stat_array {
+  */
+ #define AIE_UPDATE_SHIMDMA_DMABUF_BD_ADDR_IOCTL	_IOW(AIE_IOCTL_BASE, 0x1e, \
+ 						struct aie_dmabuf_bd_args)
+-#if IS_ENABLED(CONFIG_XILINX_AIE)
+-
+-int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
+-int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data);
+-bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc);
+-int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc);
+-int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval);
+-int aie_load_cert(struct device *dev, unsigned char *elf_addr);
+-
+-#else /* IS_ENABLED(CONFIG_XILINX_AIE) */
+-
+-int aie_partition_write_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
+-{
+-	return -EINVAL;
+-}
+-
+-int aie_partition_read_privileged_mem(struct device *dev, size_t offset, size_t len, void *data)
+-{
+-	return -EINVAL;
+-}
+-
+-bool aie_partition_check_noc_aximm(struct device *dev, struct aie_location *loc)
+-{
+-	return false;
+-}
+-
+-int aie_partition_check_uc_aximm(struct device *dev, struct aie_location *loc)
+-{
+-	return 0;
+-}
+-
+-int aie_partition_uc_zeroize_mem(struct device *dev, struct aie_location *loc, u32 regval)
+-{
+-	return -EINVAL;
+-}
+-
+-int aie_load_cert(struct device *dev, unsigned char *elf_addr)
+-{
+-	return -EINVAL;
+-}
+-
+-#endif /* IS_ENABLED(CONFIG_XILINX_AIE) */
+ 
+ #endif
+-- 
+2.25.1
+
diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 15cceebb80..2ef3825bb9 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  xlnx_rebase_v2.10_2024.2.tar.gz
+sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index a970a878c2..0022390aa6 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  b726226e8784d92049190f19768d393eccf3ad111c7a2e685bb29cfa1bdf1f70  xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz
+sha256  25795c354f30a3358506ab02deeac99e7f79850804c52d6c3d5539fd310f0491  xlnx_rebase_v6.12_LTS_2025.1.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index de0e6adad1..56ee166378 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  xlnx_rebase_v2024.01_2024.2.tar.gz
+sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
