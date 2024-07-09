Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF4FC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9398A409DD;
	Tue,  9 Jul 2024 21:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeDo1hOH7eJe; Tue,  9 Jul 2024 21:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A4A410D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54A4A410D6;
	Tue,  9 Jul 2024 21:49:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D12E1BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62DAC81826
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DTGR1K9p_af for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 770DE81779
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 770DE81779
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:49:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61DE983B27; Tue,  9 Jul 2024 21:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 23:36:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 390f8262f5c3c40d8c38e44100c1d8e8cd74c41b
X-Git-Newrev: e2073a6d2a3851752e54a8f4282cde9dd0481e31
X-Patchwork-Hint: ignore
Message-Id: <20240709214940.61DE983B27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino_lime*: add
 hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2073a6d2a3851752e54a8f4282cde9dd0481e31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                 | 2 --
 board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash | 1 +
 board/olimex/a20_olinuxino/patches/linux/linux.hash                 | 2 ++
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash                 | 2 ++
 configs/olimex_a20_olinuxino_lime2_defconfig                        | 4 ++++
 configs/olimex_a20_olinuxino_lime_defconfig                         | 4 ++++
 6 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 471b049ca6..8517ede49e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -234,8 +234,6 @@ configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
 configs/odroidxu4_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a10_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a13_olinuxino_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a20_olinuxino_lime2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a20_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..8ffd3e4fbc
--- /dev/null
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b9676828b737e8fb8eaa5198303d35d35e8df019550be153c8a42c99afe0cdd5  linux-6.6.36.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..7269980104
--- /dev/null
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index f71d2d3a05..765504d1fa 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -10,6 +10,10 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 # glibc is needed for sunxi-mali-utgard package.
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/olimex/a20_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 6546cac0dd..27cd87d9a1 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -10,6 +10,10 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 # glibc is needed for sunxi-mali-utgard package.
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/olimex/a20_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
