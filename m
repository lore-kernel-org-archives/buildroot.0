Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08650C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 15:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA9860EF3;
	Tue, 22 Feb 2022 15:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hn9hazhVmzoY; Tue, 22 Feb 2022 15:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9588660A84;
	Tue, 22 Feb 2022 15:38:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D936D1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 15:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4E2540917
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 15:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wM-2Z2a0tZmc for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 15:38:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.arcturusgroup.com (mx92.arcturusgroup.com [68.179.103.92])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92D0740911
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 15:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.arcturusgroup.com (Postfix) with ESMTP id 0AC4FD529DB;
 Tue, 22 Feb 2022 10:38:35 -0500 (EST)
X-Virus-Scanned: amavisd-new at arcturusgroup.com
Received: from mail.arcturusgroup.com ([127.0.0.1])
 by localhost (mail.arcturusgroup.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0Yoz7j-f7Jq; Tue, 22 Feb 2022 10:38:34 -0500 (EST)
Received: from Argus.arcturusnetworks.com (gw.arcturusgroup.net [66.11.68.6])
 by mail.arcturusgroup.com (Postfix) with ESMTPSA id 54F68D529D6;
 Tue, 22 Feb 2022 10:38:34 -0500 (EST)
From: Michael Durrant <mdurrant@arcturusnetworks.com>
To: buildroot <buildroot@buildroot.org>
Date: Tue, 22 Feb 2022 10:37:41 -0500
Message-Id: <20220222153741.15815-1-mdurrant@arcturusnetworks.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5] board/arcturus/aarch64-ucls1012a: bump
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
Cc: Michael Durrant <mdurrant@arcturusnetworks.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
V1->V2:
- Bump the kernel to "Linux version 5.4.137"
- Bootloader version is still "U-Boot 2019.10" but new targets added.
- Remove the /etc/init.d/S09modload script to load the pfe firmware
  module because now the pfe firmware module is loaded by the kernel
- New compressed Image.gz is used 
V2->V3:
- Moved SoB to top of patch
- The use of Image.gz replace Image to force use of compression.
- Our scripts use br2-ucls1012a.its in error ucls1012a.its was used
  in original readme.
- Removing extra newline
- The NXP Packet Forward Engine (PFE) firmware loader was the only 
  file used in the overlay.  As the PFE is now loaded directly by 
  the kernel the BR2_ROOTFS_OVERLAY script has been removed.
V3->V4:
- Improved commit log by listing all the changed as suggested by Giulio.
- Updated header version comment in defconfig to reflect 5.4 series.
V4->V5:
- Adding Reviewed-by & Tested-by by Giulio.
- Wrapping commit log.
---
 board/arcturus/aarch64-ucls1012a/post-build.sh     |  1 -
 board/arcturus/aarch64-ucls1012a/readme.txt        |  4 ++--
 .../rootfs_overlay/etc/init.d/S09modload           | 14 --------------
 configs/arcturus_ucls1012a_defconfig               | 10 +++++-----
 4 files changed, 7 insertions(+), 22 deletions(-)
 delete mode 100755 board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload

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
-- 
2.26.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
