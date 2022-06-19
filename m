Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27221C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F718247F;
	Sun, 19 Jun 2022 16:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F718247F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5gv8OwaBc2i; Sun, 19 Jun 2022 16:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B31AD81C40;
	Sun, 19 Jun 2022 16:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B31AD81C40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4141BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65EE860A90
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65EE860A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6HHUT67DrDa for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:47:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0928D60B15
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0928D60B15
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A523987424; Sun, 19 Jun 2022 16:35:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:39:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86c68fa6bae5ef99afedfe6630835d3fb092f2dd
X-Git-Newrev: 9bba9f1062b25f0117b5eefa5d415f75609d251a
X-Patchwork-Hint: ignore
Message-Id: <20220619163529.A523987424@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_kria_kv260_defconfig: add
 parameters to generate extlinux.conf
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bba9f1062b25f0117b5eefa5d415f75609d251a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch enables the zynqmp_kria_kv260_defconfig to auto-generate the
extlinux.conf file.

The board/zynqmp/kria/extlinux.conf and board/zynqmp/kria/post-build.sh have
been removed as they are no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/zynqmp/kria/extlinux.conf     | 4 ----
 board/zynqmp/kria/post-build.sh     | 8 --------
 configs/zynqmp_kria_kv260_defconfig | 3 ++-
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/board/zynqmp/kria/extlinux.conf b/board/zynqmp/kria/extlinux.conf
deleted file mode 100644
index 663aabb7c3..0000000000
--- a/board/zynqmp/kria/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label linux
-  kernel /Image
-  devicetree /system.dtb
-  append console=ttyPS1,115200 root=/dev/mmcblk1p2 rw rootwait
diff --git a/board/zynqmp/kria/post-build.sh b/board/zynqmp/kria/post-build.sh
deleted file mode 100755
index 9fd8bbf2c8..0000000000
--- a/board/zynqmp/kria/post-build.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-# genimage will need to find the extlinux.conf
-# in the binaries directory
-
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d4a72a0d19..c1366b705c 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,7 +1,8 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/kria/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
