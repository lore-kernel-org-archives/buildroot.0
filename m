Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D4C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA144182D;
	Thu, 11 Aug 2022 20:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA144182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUiswg96DkQ6; Thu, 11 Aug 2022 20:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA11A417FA;
	Thu, 11 Aug 2022 20:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA11A417FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61BD31BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D11481D67
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D11481D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xz6wRNw6G1_l for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:42:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F411181D3A
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F411181D3A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E96F487348; Thu, 11 Aug 2022 20:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 22:42:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dd179d43ffe9be98035f921a0db2bf051b632fb
X-Git-Newrev: f78fae8c9c8941e9f424191c9c9df26ff1d588f2
X-Patchwork-Hint: ignore
Message-Id: <20220811202816.E96F487348@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/riscv/nommu: bump kernel version and
 drop no longer needed patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f78fae8c9c8941e9f424191c9c9df26ff1d588f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the kernel version for all riscv nommu configs from 5.18 to 5.19.
That way, we can remove the one and only riscv nommu patch,
since this patch is included in kernel 5.19.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-do-not-stop-relocating-GOT-entries-prema.patch | 110 ---------------------
 board/riscv/nommu/patches/linux/readme.txt         |   3 -
 configs/canaan_kd233_defconfig                     |   5 +-
 configs/qemu_riscv64_nommu_virt_defconfig          |   5 +-
 configs/sipeed_maix_bit_defconfig                  |   5 +-
 configs/sipeed_maix_bit_sdcard_defconfig           |   5 +-
 configs/sipeed_maix_dock_defconfig                 |   5 +-
 configs/sipeed_maix_dock_sdcard_defconfig          |   5 +-
 configs/sipeed_maix_go_defconfig                   |   5 +-
 configs/sipeed_maix_go_sdcard_defconfig            |   5 +-
 configs/sipeed_maixduino_defconfig                 |   5 +-
 configs/sipeed_maixduino_sdcard_defconfig          |   5 +-
 12 files changed, 10 insertions(+), 153 deletions(-)

diff --git a/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch b/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
deleted file mode 100644
index e5513b729b..0000000000
--- a/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 6045ab5fea4c849153ebeb0acb532da5f29d69c4 Mon Sep 17 00:00:00 2001
-From: Niklas Cassel <niklas.cassel@wdc.com>
-Date: Thu, 14 Apr 2022 11:10:18 +0200
-Subject: binfmt_flat: do not stop relocating GOT entries prematurely on riscv
-
-Upstream commit 6045ab5fea4c849153ebeb0acb532da5f29d69c4.
-
-bFLT binaries are usually created using elf2flt.
-
-The linker script used by elf2flt has defined the .data section like the
-following for the last 19 years:
-
-.data : {
-	_sdata = . ;
-	__data_start = . ;
-	data_start = . ;
-	*(.got.plt)
-	*(.got)
-	FILL(0) ;
-	. = ALIGN(0x20) ;
-	LONG(-1)
-	. = ALIGN(0x20) ;
-	...
-}
-
-It places the .got.plt input section before the .got input section.
-The same is true for the default linker script (ld --verbose) on most
-architectures except x86/x86-64.
-
-The binfmt_flat loader should relocate all GOT entries until it encounters
-a -1 (the LONG(-1) in the linker script).
-
-The problem is that the .got.plt input section starts with a GOTPLT header
-(which has size 16 bytes on elf64-riscv and 8 bytes on elf32-riscv), where
-the first word is set to -1. See the binutils implementation for riscv [1].
-
-This causes the binfmt_flat loader to stop relocating GOT entries
-prematurely and thus causes the application to crash when running.
-
-Fix this by skipping the whole GOTPLT header, since the whole GOTPLT header
-is reserved for the dynamic linker.
-
-The GOTPLT header will only be skipped for bFLT binaries with flag
-FLAT_FLAG_GOTPIC set. This flag is unconditionally set by elf2flt if the
-supplied ELF binary has the symbol _GLOBAL_OFFSET_TABLE_ defined.
-ELF binaries without a .got input section should thus remain unaffected.
-
-Tested on RISC-V Canaan Kendryte K210 and RISC-V QEMU nommu_virt_defconfig.
-
-[1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c;hb=binutils-2_38#l3275
-
-Cc: <stable@vger.kernel.org>
-Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
-Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
-Link: https://lore.kernel.org/r/20220414091018.896737-1-niklas.cassel@wdc.com
-Fixed-by: kernel test robot <lkp@intel.com>
-Link: https://lore.kernel.org/lkml/202204182333.OIUOotK8-lkp@intel.com
-Signed-off-by: Kees Cook <keescook@chromium.org>
----
- fs/binfmt_flat.c | 27 ++++++++++++++++++++++++++-
- 1 file changed, 26 insertions(+), 1 deletion(-)
-
-diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
-index 6268981500112..dca0b6875f9c3 100644
---- a/fs/binfmt_flat.c
-+++ b/fs/binfmt_flat.c
-@@ -440,6 +440,30 @@ static void old_reloc(unsigned long rl)
- 
- /****************************************************************************/
- 
-+static inline u32 __user *skip_got_header(u32 __user *rp)
-+{
-+	if (IS_ENABLED(CONFIG_RISCV)) {
-+		/*
-+		 * RISC-V has a 16 byte GOT PLT header for elf64-riscv
-+		 * and 8 byte GOT PLT header for elf32-riscv.
-+		 * Skip the whole GOT PLT header, since it is reserved
-+		 * for the dynamic linker (ld.so).
-+		 */
-+		u32 rp_val0, rp_val1;
-+
-+		if (get_user(rp_val0, rp))
-+			return rp;
-+		if (get_user(rp_val1, rp + 1))
-+			return rp;
-+
-+		if (rp_val0 == 0xffffffff && rp_val1 == 0xffffffff)
-+			rp += 4;
-+		else if (rp_val0 == 0xffffffff)
-+			rp += 2;
-+	}
-+	return rp;
-+}
-+
- static int load_flat_file(struct linux_binprm *bprm,
- 		struct lib_info *libinfo, int id, unsigned long *extra_stack)
- {
-@@ -789,7 +813,8 @@ static int load_flat_file(struct linux_binprm *bprm,
- 	 * image.
- 	 */
- 	if (flags & FLAT_FLAG_GOTPIC) {
--		for (rp = (u32 __user *)datapos; ; rp++) {
-+		rp = skip_got_header((u32 __user *) datapos);
-+		for (; ; rp++) {
- 			u32 addr, rp_val;
- 			if (get_user(rp_val, rp))
- 				return -EFAULT;
--- 
-cgit 
-
diff --git a/board/riscv/nommu/patches/linux/readme.txt b/board/riscv/nommu/patches/linux/readme.txt
deleted file mode 100644
index ea754c9920..0000000000
--- a/board/riscv/nommu/patches/linux/readme.txt
+++ /dev/null
@@ -1,3 +0,0 @@
-RISC-V NOMMU Common Support
-
-This directory provides Linux kernel patches common to all RISC-V NO-MMU builds.
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 278fb883bf..3aa5dccf08 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 691cf31748..5fab255d88 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -3,9 +3,6 @@ BR2_riscv=y
 BR2_RISCV_64=y
 # BR2_RISCV_USE_MMU is not set
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # Busybox with hush
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 
@@ -22,7 +19,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
 BR2_LINUX_KERNEL_IMAGE=y
 
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index b31bc1309b..d2bac9e0b8 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index e42c3ee425..e1c9dc417e 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # System
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index d071e5d380..a7f0441e53 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index d1a1b2886d..6b7f8d9c68 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # System
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index 3055379db4..a68f9d3b72 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-go/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 65a6815c20..a127872cd8 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # System
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index 50c59bd4ad..c52adb5db7 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maixduino/linux-cpio.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 5785d7acf3..baaa2bc7bb 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
-
 # System
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
@@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
 BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
