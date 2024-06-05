Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D6C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1328B81412;
	Wed,  5 Jun 2024 20:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCjz_LrzN_fn; Wed,  5 Jun 2024 20:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070D681362
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 070D681362;
	Wed,  5 Jun 2024 20:39:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58ED21BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45C8841675
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zx5i5YXHq0Qn for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8CC41671
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C8CC41671
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:39:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 176BE87B84; Wed,  5 Jun 2024 20:39:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 22:37:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 407b25219d1d8abe1ce4c71c008ec3e455b45483
X-Git-Newrev: 5f576c3142257f3f8647029c72364411fcbe886b
X-Patchwork-Hint: ignore
Message-Id: <20240605203901.176BE87B84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone_qt5_defconfig: add
 hashes for Linux/headers/U-Boot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f576c3142257f3f8647029c72364411fcbe886b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch adds .hash files for Linux, Linux headers and U-Boot and then
enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                       | 1 -
 board/beaglebone/patches/linux-headers/linux-headers.hash | 1 +
 board/beaglebone/patches/linux/linux.hash                 | 2 ++
 board/beaglebone/patches/uboot/uboot.hash                 | 2 ++
 configs/beaglebone_qt5_defconfig                          | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8825d644ab..7de60f6946 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -145,7 +145,6 @@ configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
 configs/bananapro_defconfig lib_defconfig.ForceCheckHash
 configs/beagleboardx15_defconfig lib_defconfig.ForceCheckHash
 configs/beaglebone_defconfig lib_defconfig.ForceCheckHash
-configs/beaglebone_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/beaglev_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/beaglebone/patches/linux-headers/linux-headers.hash b/board/beaglebone/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beaglebone/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beaglebone/patches/linux/linux.hash b/board/beaglebone/patches/linux/linux.hash
new file mode 100644
index 0000000000..72d5bfff98
--- /dev/null
+++ b/board/beaglebone/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  394523e61eabf24bf920981ba967799ff90b6099a72dc1d1b92c918433439f61  linux-4.19.94-ti-r72.tar.gz
diff --git a/board/beaglebone/patches/uboot/uboot.hash b/board/beaglebone/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4b82872f31
--- /dev/null
+++ b/board/beaglebone/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0d438b1bb5cceb57a18ea2de4a0d51f7be5b05b98717df05938636e0aadfe11a  u-boot-2021.04.tar.bz2
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index b83ef54fa8..ae46fff228 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -4,6 +4,7 @@ BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/beaglebone/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
