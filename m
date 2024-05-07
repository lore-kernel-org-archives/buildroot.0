Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E111C25B75
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AC4741522;
	Tue,  7 May 2024 07:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POpMGDyMdJ2A; Tue,  7 May 2024 07:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94965415A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94965415A3;
	Tue,  7 May 2024 07:12:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6796A1BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4501F41560
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLPPHdQruaOp for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7905141522
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7905141522
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65123869B9; Tue,  7 May 2024 07:11:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 09:10:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26b054083d36a0fb16340b10a9df239879a2c573
X-Git-Newrev: c3e17c407a39ee4d576540c86b4b3b0549e81136
X-Patchwork-Hint: ignore
Message-Id: <20240507071154.65123869B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_sparc_ss10: re-introduce
 defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3e17c407a39ee4d576540c86b4b3b0549e81136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- With uClibc-ng-1.0.48 we can restore this defconfig because uClibc-ng
  now provides the fix for SPARC.

- The instructions in board/qemu/sparc-ss10/readme.txt are still valid
  without any corrections.  The system boots properly ang the login
  prompt appears.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  4 ++++
 board/qemu/sparc-ss10/patches/linux/linux.hash |  2 ++
 configs/qemu_sparc_ss10_defconfig              | 32 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c5ad1e42a..77971e03db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -846,6 +846,10 @@ F:	package/wolftpm/
 N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/wireless-regdb/
 
+N:	Dmitry Chestnykh <dm.chestnykh@gmail.com>
+F:	board/qemu/sparc-ss10/
+F:	configs/qemu_sparc_ss10_defconfig
+
 N:	Dominik Faessler <faessler@was.ch>
 F:	package/logsurfer/
 
diff --git a/board/qemu/sparc-ss10/patches/linux/linux.hash b/board/qemu/sparc-ss10/patches/linux/linux.hash
new file mode 100644
index 0000000000..762f8575e7
--- /dev/null
+++ b/board/qemu/sparc-ss10/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  1973e6fc3e8617fc8b0e24b33180449f1a39fa6a607f8dba61cf91b4c5bba466  linux-6.8.6.tar.gz
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
new file mode 100644
index 0000000000..67d6cf67f6
--- /dev/null
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -0,0 +1,32 @@
+# Architecture
+BR2_sparc=y
+BR2_sparc_v8=y
+
+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+
+# Linux kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
