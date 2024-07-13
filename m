Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EB3C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 717A541347;
	Sat, 13 Jul 2024 14:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9lS8nUtwIC6; Sat, 13 Jul 2024 14:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B90340B47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B90340B47;
	Sat, 13 Jul 2024 14:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02FD71BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE3D140974
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 341ml6CWhFRg for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F8EA408C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F8EA408C1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85CC38650A; Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:52:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5896d00d975c52176536c0704a9aacfbdc687f6
X-Git-Newrev: 50a0634c47a5d4c007ec0b6a5c1e9caa0a06c436
X-Patchwork-Hint: ignore
Message-Id: <20240713145315.85CC38650A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai_defconfig: move board
 files to board/beagleboard/beagleboneai
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

commit: https://git.buildroot.net/buildroot/commit/?id=50a0634c47a5d4c007ec0b6a5c1e9caa0a06c436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The beagleboneai board files from beagleboard.org project should be
moved to board/beagleboard directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                 | 4 ++--
 DEVELOPERS                                                          | 2 +-
 board/{ => beagleboard}/beagleboneai/genimage.cfg                   | 0
 .../beagleboneai/patches/linux-headers/linux-headers.hash           | 0
 board/{ => beagleboard}/beagleboneai/patches/linux/linux.hash       | 0
 .../beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch          | 0
 board/{ => beagleboard}/beagleboneai/patches/uboot/uboot.hash       | 0
 board/beagleboard/beagleboneai/post-build.sh                        | 4 ++++
 board/{ => beagleboard}/beagleboneai/readme.txt                     | 0
 board/{ => beagleboard}/beagleboneai/uEnv.txt                       | 0
 board/beagleboneai/post-build.sh                                    | 4 ----
 configs/beagleboneai_defconfig                                      | 6 +++---
 12 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3fea2d9b39..b29f290dd8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -10,8 +10,8 @@ board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
 board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
 board/beaglebone/post-build.sh Shellcheck
-board/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
-board/beagleboneai/post-build.sh Shellcheck
+board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
+board/beagleboard/beagleboneai/post-build.sh Shellcheck
 board/beaglev/post-build.sh Shellcheck
 board/beelink/gs1/post-build.sh Shellcheck
 board/boundarydevices/common/post-build.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index 5974ba4bc5..4f60a6b239 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2505,7 +2505,7 @@ F:	package/libunistring/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/arrow/avenger96/
-F:	board/beagleboneai/
+F:	board/beagleboard/beagleboneai/
 F:	board/minnowboard/
 F:	board/nezha/
 F:	board/librecomputer/lafrite/
diff --git a/board/beagleboneai/genimage.cfg b/board/beagleboard/beagleboneai/genimage.cfg
similarity index 100%
rename from board/beagleboneai/genimage.cfg
rename to board/beagleboard/beagleboneai/genimage.cfg
diff --git a/board/beagleboneai/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleboneai/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/beagleboneai/patches/linux-headers/linux-headers.hash
rename to board/beagleboard/beagleboneai/patches/linux-headers/linux-headers.hash
diff --git a/board/beagleboneai/patches/linux/linux.hash b/board/beagleboard/beagleboneai/patches/linux/linux.hash
similarity index 100%
rename from board/beagleboneai/patches/linux/linux.hash
rename to board/beagleboard/beagleboneai/patches/linux/linux.hash
diff --git a/board/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch b/board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch
similarity index 100%
rename from board/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch
rename to board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch
diff --git a/board/beagleboneai/patches/uboot/uboot.hash b/board/beagleboard/beagleboneai/patches/uboot/uboot.hash
similarity index 100%
rename from board/beagleboneai/patches/uboot/uboot.hash
rename to board/beagleboard/beagleboneai/patches/uboot/uboot.hash
diff --git a/board/beagleboard/beagleboneai/post-build.sh b/board/beagleboard/beagleboneai/post-build.sh
new file mode 100755
index 0000000000..384b4d8745
--- /dev/null
+++ b/board/beagleboard/beagleboneai/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+cp board/beagleboard/beagleboneai/uEnv.txt $BINARIES_DIR/uEnv.txt
diff --git a/board/beagleboneai/readme.txt b/board/beagleboard/beagleboneai/readme.txt
similarity index 100%
rename from board/beagleboneai/readme.txt
rename to board/beagleboard/beagleboneai/readme.txt
diff --git a/board/beagleboneai/uEnv.txt b/board/beagleboard/beagleboneai/uEnv.txt
similarity index 100%
rename from board/beagleboneai/uEnv.txt
rename to board/beagleboard/beagleboneai/uEnv.txt
diff --git a/board/beagleboneai/post-build.sh b/board/beagleboneai/post-build.sh
deleted file mode 100755
index 34a86cc746..0000000000
--- a/board/beagleboneai/post-build.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-BOARD_DIR="$(dirname $0)"
-
-cp board/beagleboneai/uEnv.txt $BINARIES_DIR/uEnv.txt
diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index a002869984..9c5c3d165a 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_GLOBAL_PATCH_DIR="board/beagleboneai/patches"
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboneai/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleboneai/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboneai/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.217"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
