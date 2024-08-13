Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9BBC52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 12:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 031A440A1F;
	Tue, 13 Aug 2024 12:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPgqYn8gJZut; Tue, 13 Aug 2024 12:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F4C4015E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0F4C4015E;
	Tue, 13 Aug 2024 12:12:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 795091BF3DD
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 12:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71E4F403B6
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 12:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SN8OOk1ZRf4t for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 12:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF1FF403A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1FF403A5
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF1FF403A5
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 12:12:41 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2345A3520C16; Tue, 13 Aug 2024 14:12:37 +0200 (CEST)
Date: Tue, 13 Aug 2024 14:12:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrtNtCb1TTpfQ7q6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723551157; bh=cZpJbhP2Ev6jHJkuJ4luv8ojGCkcUWuge46kg7FLmVc=;
 h=Date:From:To:Subject:From;
 b=qhwIxtX0OuJiLzjR1Q0i66BlqdgFP7piIlPWY7Fyj6jUJy2embd4iHW28K9dn1VAX
 SZWjNzHfnLtjnJirIUHXz+d2WOeM1YXqaZtbiGp0Uu78CbeQmJk9I1W0U48QuoRLXi
 zv8Em/dmdn/LugNxC7/GdcgzPnJ1KrTqPgzoTMh6BmLJSAlGaO5v/wSGQqX42/YYhk
 GvFBoJcxL2KMsHPqTBYBuvGiUCiMH0T0Zp5KaRNuFS+7Jykb+YDh9qphb+dClBkSbG
 yBpZMMNCQFIN45YZfSB49RX2a8ZkH+oA3M2BYKU9qeRNQYUsQBbbGVxjske4M9obrq
 9exnFUwap6XhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=qhwIxtX0
Subject: [Buildroot] [PATCH v3] configs/solidrun_clearfog: update U-Boot and
 Linux
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on Solidrun Clearfog.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:                                                                                                                                                               
 - update .checkignorepatch requested by Baruch Siach

v2->v3:
 - use add-custom-hashes to create hashes requested by Thomas
   Petazzoni
---
 .checkpackageignore                                    |  1 -
 board/solidrun/clearfog/genimage.cfg                   |  2 +-
 .../clearfog/patches/linux-headers/linux-headers.hash  |  1 +
 board/solidrun/clearfog/patches/linux/linux.hash       |  2 ++
 board/solidrun/clearfog/patches/uboot/uboot.hash       |  2 ++
 configs/solidrun_clearfog_defconfig                    | 10 +++++++---
 6 files changed, 13 insertions(+), 5 deletions(-)
 create mode 120000 board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
 create mode 100644 board/solidrun/clearfog/patches/linux/linux.hash
 create mode 100644 board/solidrun/clearfog/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 8fe4a16eb8..a44817578d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -255,7 +255,6 @@ configs/snps_archs38_axs103_defconfig lib_defconfig.ForceCheckHash
 configs/snps_archs38_haps_defconfig lib_defconfig.ForceCheckHash
 configs/snps_archs38_hsdk_defconfig lib_defconfig.ForceCheckHash
 configs/socrates_cyclone5_defconfig lib_defconfig.ForceCheckHash
-configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/solidrun/clearfog/genimage.cfg b/board/solidrun/clearfog/genimage.cfg
index 8963619cc5..35aab62a8c 100644
--- a/board/solidrun/clearfog/genimage.cfg
+++ b/board/solidrun/clearfog/genimage.cfg
@@ -4,7 +4,7 @@ image sdcard.img {
 
 	partition u-boot {
 		in-partition-table = "no"
-		image = "u-boot-spl.kwb"
+		image = "u-boot-with-spl.kwb"
 		offset = 512
 	}
 
diff --git a/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash b/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/solidrun/clearfog/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/solidrun/clearfog/patches/linux/linux.hash b/board/solidrun/clearfog/patches/linux/linux.hash
new file mode 100644
index 0000000000..b8935a250a
--- /dev/null
+++ b/board/solidrun/clearfog/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
diff --git a/board/solidrun/clearfog/patches/uboot/uboot.hash b/board/solidrun/clearfog/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/solidrun/clearfog/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
index 7f633d30d5..56d5c1d354 100644
--- a/configs/solidrun_clearfog_defconfig
+++ b/configs/solidrun_clearfog_defconfig
@@ -5,6 +5,10 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_NEON=y
 
+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/solidrun/clearfog/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
@@ -16,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.43"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -33,10 +37,10 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.kwb"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
