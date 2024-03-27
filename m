Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D2CC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 14:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4491740225;
	Wed, 27 Mar 2024 14:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKRF2eD9q9LP; Wed, 27 Mar 2024 14:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E6E64023F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E6E64023F;
	Wed, 27 Mar 2024 14:03:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E86C41BF41D
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 14:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1946400DB
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 14:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2Zv9D8DUqQ1 for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 14:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E94BB400C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E94BB400C7
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 14:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2C3784308; Wed, 27 Mar 2024 14:03:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 15:02:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd44a480e154693c5352bf9119cbb02c0f7a6f25
X-Git-Newrev: dde89fe703507798e52c8250e3a38dd4d4fa5a36
X-Patchwork-Hint: ignore
Message-Id: <20240327140322.D2C3784308@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/lafrite_defconfig: bump kernel to
 6.6.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=dde89fe703507798e52c8250e3a38dd4d4fa5a36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add a hash for it / enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../librecomputer/lafrite/patches/linux-headers/linux-headers.hash  | 1 +
 board/librecomputer/lafrite/patches/linux/linux.hash                | 2 ++
 configs/lafrite_defconfig                                           | 6 ++++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/board/librecomputer/lafrite/patches/linux-headers/linux-headers.hash b/board/librecomputer/lafrite/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/librecomputer/lafrite/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/librecomputer/lafrite/patches/linux/linux.hash b/board/librecomputer/lafrite/patches/linux/linux.hash
new file mode 100644
index 0000000000..899adefd07
--- /dev/null
+++ b/board/librecomputer/lafrite/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index b3326f6b49..19fca02c54 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/librecomputer/lafrite/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/librecomputer/lafrite/overlay/"
@@ -8,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/librecomputer/lafrite/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s805x-libretech-ac"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
