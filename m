Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C510C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 20:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4113D608C9;
	Wed, 14 Aug 2024 20:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vpxwl06Nai7C; Wed, 14 Aug 2024 20:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F50608CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F50608CD;
	Wed, 14 Aug 2024 20:09:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1B81BF471
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19A8140DD0
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTUnufAVD8xW for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 20:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEA3D40DCE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEA3D40DCE
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 20:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C85CA82238; Wed, 14 Aug 2024 20:09:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 22:09:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 101e7b69da88148fa8333af05444e47bae631833
X-Git-Newrev: 439ddbc5bbd56ab15d4edc0573092af3a724d7fb
X-Patchwork-Hint: ignore
Message-Id: <20240814200953.C85CA82238@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/solidrun_clearfog:
 update U-Boot and Linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=439ddbc5bbd56ab15d4edc0573092af3a724d7fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Tested on Solidrun Clearfog.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                            |  1 -
 board/solidrun/clearfog/genimage.cfg                           |  2 +-
 .../solidrun/clearfog/patches/linux-headers/linux-headers.hash |  1 +
 board/solidrun/clearfog/patches/linux/linux.hash               |  2 ++
 board/solidrun/clearfog/patches/uboot/uboot.hash               |  2 ++
 configs/solidrun_clearfog_defconfig                            | 10 +++++++---
 6 files changed, 13 insertions(+), 5 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
