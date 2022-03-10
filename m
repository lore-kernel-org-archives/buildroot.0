Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AAFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6122841967;
	Thu, 10 Mar 2022 20:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmFsfURP2p4z; Thu, 10 Mar 2022 20:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5709C41927;
	Thu, 10 Mar 2022 20:46:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C40C51BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 951D3405A4
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJjrHMGRlu1s for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:45:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7949040103
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:45:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F0E8B83B7B; Thu, 10 Mar 2022 20:37:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 21:39:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 933447c27c41ebcdb5eb9fa2a374456699ae33f2
X-Git-Newrev: b72db519e69491e3c37074e2c526310f12d0faa9
X-Patchwork-Hint: ignore
Message-Id: <20220310203713.F0E8B83B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/arcturus/aarch64-ucls1012a: bump
 u-boot and kernel version
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

commit: https://git.buildroot.net/buildroot/commit/?id=b72db519e69491e3c37074e2c526310f12d0faa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Linux to version 5.4.137
- Bump U-Boot to add new targets, version remains the same
- Drop BR2_ROOTFS_OVERLAY and remove S09modload script because it was
  only used by PFE and now PFE is loaded directly by the kernel
- Use Image.gz instead of Image to have a compressed kernel
- Rename ucls1012a.its to br2-ucls1012a.its since post-build.sh and
  post-image.sh use different name. This fixes the bug that didn't
  allow the creation of the part0-000000.itb file.

Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/arcturus/aarch64-ucls1012a/post-build.sh             |  1 -
 board/arcturus/aarch64-ucls1012a/readme.txt                |  4 ++--
 .../aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload | 14 --------------
 configs/arcturus_ucls1012a_defconfig                       | 10 +++++-----
 4 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/board/arcturus/aarch64-ucls1012a/post-build.sh b/board/arcturus/aarch64-ucls1012a/post-build.sh
index f8ba78095f..372df59c61 100755
--- a/board/arcturus/aarch64-ucls1012a/post-build.sh
+++ b/board/arcturus/aarch64-ucls1012a/post-build.sh
@@ -1,5 +1,4 @@
 #!/bin/sh
 
 mkdir -p ${TARGET_DIR}/lib/firmware
-cp -f ${BUILD_DIR}/linux-custom/firmware/ppfe/* ${TARGET_DIR}/lib/firmware/
 cp -f ${BUILD_DIR}/linux-custom/br2-ucls1012a.its ${BINARIES_DIR}/
diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt b/board/arcturus/aarch64-ucls1012a/readme.txt
index 483d5e9aef..b486ecebc7 100644
--- a/board/arcturus/aarch64-ucls1012a/readme.txt
+++ b/board/arcturus/aarch64-ucls1012a/readme.txt
@@ -24,13 +24,13 @@ After building, you should obtain this tree:
 
     output/images/
     +-- arc-ucls1012a.dtb
-    +-- Image
+    +-- Image.gz
     +-- part0-000000.itb
     +-- rootfs.cpio
     +-- rootfs.cpio.gz
     +-- rootfs.tar
     +-- u-boot.bin
-    +-- ucls1012a.its
+    +-- br2-ucls1012a.its
 
 Flashing
 --------
diff --git a/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload b/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
deleted file mode 100755
index c87ffda14f..0000000000
--- a/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-#
-case "$1" in
-       start)
-                modprobe pfe
-                ;;
-        stop)
-                ;;
-        restart|reload)
-                ;;
-        *)
-                echo "Usage: $0 {start|stop|restart}"
-                exit 1
-esac
diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
index fd33ebf1f6..124cc3ff94 100644
--- a/configs/arcturus_ucls1012a_defconfig
+++ b/configs/arcturus_ucls1012a_defconfig
@@ -1,22 +1,22 @@
 # Architecture
 BR2_aarch64=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # System settings
 BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
 BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/arcturus/aarch64-ucls1012a/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-kernel,v.20.31)/linux-v.20.31.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-kernel,v.22.06)/linux-v.22.06.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
+BR2_LINUX_KERNEL_IMAGEGZ=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
 
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-uboot,v.20.31)/uboot-v.20.31.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-uboot,v.22.06)/uboot-v.22.06.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI128"
 
 # Tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
