Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9E4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:50:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7270961040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7270961040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C5340328;
	Tue,  3 Aug 2021 23:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDs3eEjfytK0; Tue,  3 Aug 2021 23:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03C9F4062F;
	Tue,  3 Aug 2021 23:50:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 077B81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C9FA40E6F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bute9FP07MUJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1888F40653
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 61DEC87059; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 23:41:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 861775ebbe34d4548259e58a3af6b725c62a2a4b
X-Git-Newrev: 1176ed86f5e27ea21ba80648356537e843c803ee
X-Patchwork-Hint: ignore
Message-Id: <20210803211009.61DEC87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/wandboard: switch to
 extlinux.conf
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1176ed86f5e27ea21ba80648356537e843c803ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently wandboard uses a custom boot.scr.txt script
and custom image generation scripts, genimage.cfg and
post-build.sh.

Switch to using the more standard extlinux.conf solution
and remove the custom scripts in favor of the standard
board/freescale/common/imx/post-image.sh one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/wandboard/boot.scr.txt                       |  7 -----
 board/wandboard/genimage.cfg                       | 32 ----------------------
 board/wandboard/post-build.sh                      |  8 ------
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  4 +++
 configs/wandboard_defconfig                        |  5 ++--
 5 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/board/wandboard/boot.scr.txt b/board/wandboard/boot.scr.txt
deleted file mode 100644
index 7a8aa4bd54..0000000000
--- a/board/wandboard/boot.scr.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv finduuid "part uuid mmc 0:1 uuid"
-run finduuid
-run findfdt
-setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
-load mmc 0:1 ${fdt_addr} boot/${fdtfile}
-load mmc 0:1 ${loadaddr} boot/zImage
-bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
deleted file mode 100644
index ad4a6a55d5..0000000000
--- a/board/wandboard/genimage.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-# Minimal SD card image for the Wandboard
-#
-# The SD card must have at least 1 MB free at the beginning.
-# U-Boot and its environment are dumped as is.
-# A single root filesystem partition is required (Ext4 in this case).
-#
-# For details about the layout, see:
-# http://wiki.wandboard.org/index.php/Boot-process
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition spl {
-    in-partition-table = "no"
-    image = "SPL"
-    offset = 1024
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.img"
-    offset = 70656
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-    offset = 1M
-    size = 512M
-  }
-}
diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
deleted file mode 100755
index 6ddc113702..0000000000
--- a/board/wandboard/post-build.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -d -m 755 $TARGET_DIR/boot
-
-$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
-	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
diff --git a/board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf b/board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..e3b90660c0
--- /dev/null
+++ b/board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6qdl-wandboard Buildroot
+	kernel ../zImage
+	fdtdir ../
+	append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate} 
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 7915248cf1..37628ea403 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -12,9 +12,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
 # Image
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/wandboard/genimage.cfg"
+BR2_ROOTFS_OVERLAY="board/wandboard/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
