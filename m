Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12197C27C50
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 13:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA8761015;
	Tue,  4 Jun 2024 13:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqfWAthU_Q_x; Tue,  4 Jun 2024 13:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68EC9605A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68EC9605A0;
	Tue,  4 Jun 2024 13:28:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 485881BF2A2
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33600847EB
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sNyonWKAJ8K for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545D6847FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 545D6847FB
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F13E87AB0; Tue,  4 Jun 2024 13:28:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 15:19:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7f2c8249662ea3a2076af31aae3fa0a7f819dac
X-Git-Newrev: b71c5936ad60c9a3d084f5a7b1a7f8ade1cd4c63
X-Patchwork-Hint: ignore
Message-Id: <20240604132830.3F13E87AB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx6cubox: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=b71c5936ad60c9a3d084f5a7b1a7f8ade1cd4c63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                              | 1 -
 board/solidrun/mx6cubox/patches/linux-headers/linux-headers.hash | 1 +
 board/solidrun/mx6cubox/patches/linux/linux.hash                 | 2 ++
 board/solidrun/mx6cubox/patches/uboot/uboot.hash                 | 2 ++
 configs/mx6cubox_defconfig                                       | 6 +++++-
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fad6ff5c8b..8825d644ab 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -221,7 +221,6 @@ configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
 configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
-configs/mx6cubox_defconfig lib_defconfig.ForceCheckHash
 configs/mx6sx_udoo_neo_defconfig lib_defconfig.ForceCheckHash
 configs/mx6udoo_defconfig lib_defconfig.ForceCheckHash
 configs/nexbox_a95x_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/solidrun/mx6cubox/patches/linux-headers/linux-headers.hash b/board/solidrun/mx6cubox/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/solidrun/mx6cubox/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/solidrun/mx6cubox/patches/linux/linux.hash b/board/solidrun/mx6cubox/patches/linux/linux.hash
new file mode 100644
index 0000000000..8b8381e619
--- /dev/null
+++ b/board/solidrun/mx6cubox/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  639e50060e3c8f23ed017cb10cfeacc6ba88ff5583812bb76859b4cc6a128291  linux-6.6.27.tar.xz
diff --git a/board/solidrun/mx6cubox/patches/uboot/uboot.hash b/board/solidrun/mx6cubox/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..c1aeddf06c
--- /dev/null
+++ b/board/solidrun/mx6cubox/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index 46a1400d9f..bd94f3fc86 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -9,6 +9,10 @@ BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/solidrun/mx6cubox/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System configuration
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/solidrun/mx6cubox/rootfs_overlay"
@@ -36,10 +40,10 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
