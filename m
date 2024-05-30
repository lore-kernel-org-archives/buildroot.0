Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6D4C25B7E
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 19:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9E24415E6;
	Thu, 30 May 2024 19:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id naAOZa4kMC79; Thu, 30 May 2024 19:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34DC0415D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34DC0415D9;
	Thu, 30 May 2024 19:13:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 849D01D4A13
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D2578135C
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1P5RhiKByJVt for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 19:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF5081354
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DF5081354
 for <buildroot@buildroot.org>; Thu, 30 May 2024 19:13:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7579F8777F; Thu, 30 May 2024 19:13:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 21:11:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14bb97ff9d23359ffa0dd9078f0efb94f1f6a8c2
X-Git-Newrev: 84a9ab91d3deaf341b47e69a2ce50c8d5965ec86
X-Patchwork-Hint: ignore
Message-Id: <20240530191341.7579F8777F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/at91sam9x5ek*_defconfig: add
 hashes for at91bootstrap3/Linux/headers/u-boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=84a9ab91d3deaf341b47e69a2ce50c8d5965ec86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Furthermore, the use of the directory board/atmel/at91sam9x5ek/patches
for all 4 at91sam9x5ek*_defconfig configurations automatically fixes the
Linux compilation failure for the at91sam9x5ek_defconfig,
at91sam9x5ek_mmc_defconfig, and at91sam9x5ek_mmc_dev_defconfig
configurations as well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Peter: fix u-boot hash]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                   | 4 ----
 board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash   | 2 ++
 board/atmel/at91sam9x5ek/patches/linux-headers/linux-headers.hash     | 1 +
 .../0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch   | 0
 board/atmel/at91sam9x5ek/patches/linux/linux.hash                     | 2 ++
 board/atmel/at91sam9x5ek/patches/uboot/uboot.hash                     | 2 ++
 configs/at91sam9x5ek_defconfig                                        | 2 ++
 configs/at91sam9x5ek_dev_defconfig                                    | 3 ++-
 configs/at91sam9x5ek_mmc_defconfig                                    | 4 ++++
 configs/at91sam9x5ek_mmc_dev_defconfig                                | 2 ++
 10 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bb27977d8c..8f5fc0a476 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -134,10 +134,6 @@ configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9g20dfc_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9g45m10ek_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_dev_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_mmc_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash b/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash
new file mode 100644
index 0000000000..6edf3d3345
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/atmel/at91sam9x5ek/patches/linux-headers/linux-headers.hash b/board/atmel/at91sam9x5ek/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/atmel/at91sam9x5ek/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
similarity index 100%
rename from board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
rename to board/atmel/at91sam9x5ek/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
diff --git a/board/atmel/at91sam9x5ek/patches/linux/linux.hash b/board/atmel/at91sam9x5ek/patches/linux/linux.hash
new file mode 100644
index 0000000000..ef899fbbc9
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  6cc67b3d2d550c3f0b201d7850bdb25503bc6a51e41b98d2c0fbd531b56f3a20  linux-linux4sam_6.1.tar.gz
diff --git a/board/atmel/at91sam9x5ek/patches/uboot/uboot.hash b/board/atmel/at91sam9x5ek/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..723ce137f2
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c7c08f44487c97ade41966ed6cd639258d124e781580ea0a82d96b6b5ca230a5  uboot-linux4sam_6.1-git4.tar.gz
diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
index 70e2d94826..a87b2cb8d7 100644
--- a/configs/at91sam9x5ek_defconfig
+++ b/configs/at91sam9x5ek_defconfig
@@ -2,6 +2,8 @@ BR2_arm=y
 BR2_arm926t=y
 # Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.1)/linux-linux4sam_6.1.tar.gz"
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index bc034019b4..7c95ec5683 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -8,7 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
-BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek_dev/patches"
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index 79a300a81b..2ddf8d64b0 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -9,6 +9,10 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/at91sam9x5ek_mmc/genimage.cfg"
 
+# System Configuration
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 3b2016b970..d261985b18 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -8,6 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 # Creation of the SD card image
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
