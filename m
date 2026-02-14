Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D7EEF5855
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F30740B74;
	Sat, 14 Feb 2026 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfCHMY9S9OpP; Sat, 14 Feb 2026 19:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E2840B85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098588;
	bh=DWIj+eHR00LOHlA2mPhJt0pbNxdDgM5GjDK5y+DJKh8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hLGoJICd/JphD8I5G3Cl+CJ/DDCx8BV6PEhFgb5dd7eaEJKo2U0BKNGEaCMKg2/nL
	 Pp82Go2lvokLMfbPAYpkGUf+YnpbJ2uDrOfdVGcYrekrUoh6Z73cLQPwVwt4WYL8zR
	 y3ddZ5optNd2apiu4J6FD5d898qId0ElJ2G/w8j3/66RqwD/FwbVJfbQmwqaojmux6
	 O7cWFCLaSrptY21sMfZmNMYqdk/+jVgkWssSclzIH4wMpaqt5djauOpEfAqUVluugI
	 M3cBWYLk7MrFUNN8akm5KPaSj3JAg4K8Y59pT+Wt7aSf9wjDyWUzfnKBFthU2OdH1H
	 QQqJKLWywoQ7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E2840B85;
	Sat, 14 Feb 2026 19:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58F07353
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1491440A33
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gy_vPmEhLw1T for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3096E40B6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3096E40B6C
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14BF486D61; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 20:34:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2459821be6855cdc9e8aa6202dbd9db75f22012f
X-Git-Newrev: a28d5a488e347cd9318e14cb95c4a80c29ec2940
X-Patchwork-Hint: ignore
Message-Id: <20260214194940.14BF486D61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a10_olinuxino_lime: bump
 Linux to 6.18.8 and U-Boot to 2026.01
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a28d5a488e347cd9318e14cb95c4a80c29ec2940
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien:
 - change linux.hash comment to use hash from upstream
 - add "_lime" in commit title
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                      |  1 -
 board/olimex/a10_olinuxino/boot.cmd                      |  1 -
 .../patches/linux-headers/linux-headers.hash             |  1 +
 board/olimex/a10_olinuxino/patches/linux/linux.hash      |  2 ++
 board/olimex/a10_olinuxino/patches/uboot/uboot.hash      |  2 ++
 board/olimex/a10_olinuxino/post-build.sh                 |  1 -
 .../rootfs_overlay/boot/extlinux/extlinux.conf           |  4 ++++
 configs/olimex_a10_olinuxino_lime_defconfig              | 16 ++++++++--------
 8 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 85658c778a..625716a5e4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -134,7 +134,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a10_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a13_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
deleted file mode 120000
index 612c745500..0000000000
--- a/board/olimex/a10_olinuxino/boot.cmd
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/boot.cmd
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a10_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/a10_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/patches/linux/linux.hash b/board/olimex/a10_olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..f83883b936
--- /dev/null
+++ b/board/olimex/a10_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/olimex/a10_olinuxino/patches/uboot/uboot.hash b/board/olimex/a10_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/olimex/a10_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
deleted file mode 120000
index b346896024..0000000000
--- a/board/olimex/a10_olinuxino/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/post-build.sh
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a10_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..24a3e18b5c
--- /dev/null
+++ b/board/olimex/a10_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label A10-Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index 101796cc12..625491d69b 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -1,18 +1,20 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/a10_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a10-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a10_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a10_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a10_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-olinuxino-lime"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-olinuxino-lime"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -20,14 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A10-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a10_olinuxino/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
