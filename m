Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDACCAC5AE
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 17:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4774884CB0;
	Fri, 26 Sep 2025 17:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zipsKER5RNnX; Fri, 26 Sep 2025 17:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2FC84C57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD2FC84C57;
	Fri, 26 Sep 2025 17:23:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3278A177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB5EF42039
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94xHM-z8YJY8 for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 17:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A237141FEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A237141FEA
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 923DA864F5; Fri, 26 Sep 2025 17:23:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 19:20:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ff963bffd7e90b5a0187c137cae87f9fad1e00c
X-Git-Newrev: ef400f57ae531dd37aee8cfb7f569ee3279776f4
X-Patchwork-Hint: ignore
Message-Id: <20250926172340.923DA864F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal_vek280: bump
 xilinx-prebuilt to xilinx_v2025.1_update1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef400f57ae531dd37aee8cfb7f569ee3279776f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the versal_vek280_defconfig to use version xilinx_v2025.1_update1 of the
xilinx-prebuilt boot pacakge.

As part of this update, the vek280 pdi file has been updated and the memory
map has been corrected to match the Linux intree dts memory node, so the
vek280 dts memory node patch is no longer required.

https://github.com/Xilinx/soc-prebuilt-firmware/commit/f755d022cd9bd2e6a09eed0f80078bca3345279e

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...4-versal-vek280-prebuilt-pdi-is-incorrect.patch | 50 ----------------------
 configs/versal_vek280_defconfig                    |  3 +-
 2 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch b/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
deleted file mode 100644
index 357c0abb2f..0000000000
--- a/board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e79a96ff89b11fea03680633ab830894288ee9f0 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Thu, 28 Nov 2024 07:50:28 +0000
-Subject: [PATCH] arm64: versal: vek280 prebuilt pdi is incorrect
-
-The prebuilt vpl_gen_fixed.pdi for the vek280 is incorrect and does not define
-the DDR memory region for address 0x8 0000 0000 - 0x8 8000 0000.  For this
-reason, the intree Linux dts memory node for the vek280 will not boot.
-
-This patch works around the issue until the prebuilt pdi file is changed.
-
-https://github.com/Xilinx/soc-prebuilt-firmware/blob/xilinx_v2024.2/vek280-versal/vpl_gen_fixed.pdi
-
-Upstream: n/a
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts | 2 +-
- arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
-index ad5d590318e6..a306eacca5b3 100644
---- a/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
-+++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revA.dts
-@@ -19,7 +19,7 @@ / {
- 
- 	memory: memory@0 {
- 		device_type = "memory";
--		reg = <0 0 0 0x80000000>, <0x8 0x0 0x1 0x80000000>; /* 2GB + 6GB */
-+		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
- 	};
- 
- 	chosen {
-diff --git a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
-index a5ee80a373e2..ba54a5ef0c73 100644
---- a/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
-+++ b/arch/arm64/boot/dts/xilinx/versal-vek280-revB.dts
-@@ -19,7 +19,7 @@ / {
- 
- 	memory: memory@0 {
- 		device_type = "memory";
--		reg = <0 0 0 0x80000000>, <0x8 0x00000000 0x1 0x80000000>; /* 2GB + 6GB */
-+		reg = <0 0 0 0x80000000>, <0x8 0x80000000 0x1 0x80000000>; /* 2GB + 6GB */
- 	};
- 
- 	chosen {
--- 
-2.25.1
-
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 5d84a93c72..b2ec718cc9 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -5,7 +5,7 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
@@ -43,6 +43,7 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
