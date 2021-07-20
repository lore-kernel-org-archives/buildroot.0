Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28F3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:55:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33A261037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A33A261037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8CB60AD4;
	Tue,  3 Aug 2021 23:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAo2Nt-D-H54; Tue,  3 Aug 2021 23:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B61A660AC5;
	Tue,  3 Aug 2021 23:55:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 855111BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCF4B40EEB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWkcqXhoHq5e for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6707E406AB
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B015A82B50; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:23:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 24f62318dbdcd8c95401005248d8b7e8791b9371
X-Git-Newrev: f0d270ccfb0a9b486ea5907f6e86c5d9c07f93e2
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.B015A82B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/olimex_a20_olinuxino:
 switch to extlinux.conf
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0d270ccfb0a9b486ea5907f6e86c5d9c07f93e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

a10_olinuxino is not switched to extlinux.conf, so the broken symlinks
are replaced by the previous content from a20_olinuxino.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olimex/a10_olinuxino/boot.cmd                                 | 6 +++++-
 board/olimex/a10_olinuxino/post-build.sh                            | 4 +++-
 board/olimex/a20_olinuxino/boot.cmd                                 | 5 -----
 board/olimex/a20_olinuxino/post-build.sh                            | 3 ---
 .../olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf | 4 ++++
 configs/olimex_a20_olinuxino_lime2_defconfig                        | 4 +---
 configs/olimex_a20_olinuxino_lime_defconfig                         | 4 +---
 7 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
deleted file mode 120000
index 612c745500..0000000000
--- a/board/olimex/a10_olinuxino/boot.cmd
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/boot.cmd
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
new file mode 100644
index 0000000000..44d9239a94
--- /dev/null
+++ b/board/olimex/a10_olinuxino/boot.cmd
@@ -0,0 +1,5 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+ext4load mmc 0 0x49000000 /boot/${fdtfile}
+ext4load mmc 0 0x46000000 /boot/zImage
+env set fdt_high ffffffff
+bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
deleted file mode 120000
index b346896024..0000000000
--- a/board/olimex/a10_olinuxino/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/post-build.sh
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
new file mode 100755
index 0000000000..d3f612f811
--- /dev/null
+++ b/board/olimex/a10_olinuxino/post-build.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a20_olinuxino/boot.cmd b/board/olimex/a20_olinuxino/boot.cmd
deleted file mode 100644
index 44d9239a94..0000000000
--- a/board/olimex/a20_olinuxino/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-ext4load mmc 0 0x49000000 /boot/${fdtfile}
-ext4load mmc 0 0x46000000 /boot/zImage
-env set fdt_high ffffffff
-bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
deleted file mode 100755
index d3f612f811..0000000000
--- a/board/olimex/a20_olinuxino/post-build.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..f754da3623
--- /dev/null
+++ b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index d149f04bfb..dca6123c18 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 
@@ -52,8 +52,6 @@ BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 8d759ca98a..0eaacc9ec1 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 
@@ -52,8 +52,6 @@ BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
