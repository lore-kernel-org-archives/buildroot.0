Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3918DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 22:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B093409DB;
	Wed,  9 Feb 2022 22:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQXHI5Yzj-3K; Wed,  9 Feb 2022 22:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80DB040A1C;
	Wed,  9 Feb 2022 22:23:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCF421BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F6F40A04
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkt7V4Kzn_JH for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 22:23:07 +0000 (UTC)
X-Greylist: delayed 00:05:02 by SQLgrey-1.8.0
Received: from mail.arcturusgroup.com (mx92.arcturusgroup.com [68.179.103.92])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6F75415EE
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 22:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.arcturusgroup.com (Postfix) with ESMTP id A8955D05DED;
 Wed,  9 Feb 2022 17:17:59 -0500 (EST)
X-Virus-Scanned: amavisd-new at arcturusgroup.com
Received: from mail.arcturusgroup.com ([127.0.0.1])
 by localhost (mail.arcturusgroup.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhJ3Ug7HafDm; Wed,  9 Feb 2022 17:17:59 -0500 (EST)
Received: from Argus.arcturusnetworks.com (gw.arcturusgroup.net [66.11.68.6])
 by mail.arcturusgroup.com (Postfix) with ESMTPSA id 2D124D05DE8;
 Wed,  9 Feb 2022 17:17:59 -0500 (EST)
From: Michael PDQ <mdurrant@arcturusnetworks.com>
To: buildroot <buildroot@buildroot.org>
Date: Wed,  9 Feb 2022 17:17:31 -0500
Message-Id: <20220209221731.51116-1-mdurrant@arcturusnetworks.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] board/arcturus/aarch64-ucls1012a: bump
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
Cc: Michael Durrant <mdurrant@arcturusnetworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>

---
V1->V2:
- Bump the kernel to "Linux version 5.4.137"
- Bootloader version is still "U-Boot 2019.10" but new targets added.
- Remove the /etc/init.d/S09modload script to load the pfe firmware
  module because now the pfe firmware module is loaded by the kernel
- New compressed Image.gz is used 

---
Signed-off-by: Oleksandr Zhadan<oleks@arcturusnetworks.com>
Signed-off-by: Michael Durrant<mdurrant@arcturusnetworks.com>
---
 board/arcturus/aarch64-ucls1012a/post-build.sh     |  2 --
 board/arcturus/aarch64-ucls1012a/readme.txt        |  5 +++--
 .../rootfs_overlay/etc/init.d/S09modload           | 14 --------------
 configs/arcturus_ucls1012a_defconfig               |  9 ++++-----
 4 files changed, 7 insertions(+), 23 deletions(-)
 delete mode 100755 board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload

diff --git a/board/arcturus/aarch64-ucls1012a/post-build.sh b/board/arcturus/aarch64-ucls1012a/post-build.sh
index f8ba78095f..ca3862988d 100755
--- a/board/arcturus/aarch64-ucls1012a/post-build.sh
+++ b/board/arcturus/aarch64-ucls1012a/post-build.sh
@@ -1,5 +1,3 @@
 #!/bin/sh
 
-mkdir -p ${TARGET_DIR}/lib/firmware
-cp -f ${BUILD_DIR}/linux-custom/firmware/ppfe/* ${TARGET_DIR}/lib/firmware/
 cp -f ${BUILD_DIR}/linux-custom/br2-ucls1012a.its ${BINARIES_DIR}/
diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt b/board/arcturus/aarch64-ucls1012a/readme.txt
index 483d5e9aef..cb91716b34 100644
--- a/board/arcturus/aarch64-ucls1012a/readme.txt
+++ b/board/arcturus/aarch64-ucls1012a/readme.txt
@@ -23,14 +23,15 @@ Result of the build
 After building, you should obtain this tree:
 
     output/images/
+    +-- Image.gz
     +-- arc-ucls1012a.dtb
-    +-- Image
+    +-- br2-ucls1012a.its
     +-- part0-000000.itb
     +-- rootfs.cpio
     +-- rootfs.cpio.gz
     +-- rootfs.tar
     +-- u-boot.bin
-    +-- ucls1012a.its
+
 
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
index fd33ebf1f6..2a9c1e0582 100644
--- a/configs/arcturus_ucls1012a_defconfig
+++ b/configs/arcturus_ucls1012a_defconfig
@@ -1,22 +1,21 @@
 # Architecture
 BR2_aarch64=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
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
 
@@ -28,7 +27,7 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
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
