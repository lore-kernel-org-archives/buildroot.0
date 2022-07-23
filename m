Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214BBC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE0FC61B15;
	Sat, 23 Jul 2022 20:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0FC61B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sVTcpragqPz; Sat, 23 Jul 2022 20:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BAEF61B04;
	Sat, 23 Jul 2022 20:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BAEF61B04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8019D1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5810540AE3
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5810540AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDEgJMHgWV0U for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:30:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7465B4049B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7465B4049B
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D4243852B4; Sat, 23 Jul 2022 20:16:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:30:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c25d1099ac238c3c5a2ce75fc91c3842a50e2cd
X-Git-Newrev: b9bc22ee8a1b98e3d2ab2a4c135e969423eb9d62
X-Patchwork-Hint: ignore
Message-Id: <20220723201652.D4243852B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/minnowboard_max-graphical: remove
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b9bc22ee8a1b98e3d2ab2a4c135e969423eb9d62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig uses mesa3d's i965 DRI driver, but mesa3d no longer has
any DRI driver now, so this defconfig no longer builds.

Switching to the Gallium driver would require access to an actual board
to test, and that was not available when applying the mesa3d bump.

So, better drop this defconfig, and let an interested party reinstate
it, using the Gallium driver.

Note that we do still have the defconfig for the basic, non-graphical
Minnowbaord Max.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../fs-overlay-graphical/etc/X11/Xsession          |  7 --
 .../etc/X11/xorg.conf.d/01-modules.conf            | 11 ----
 .../fs-overlay-graphical/etc/asound.conf           |  4 --
 configs/minnowboard_max-graphical_defconfig        | 75 ----------------------
 4 files changed, 97 deletions(-)

diff --git a/board/minnowboard/fs-overlay-graphical/etc/X11/Xsession b/board/minnowboard/fs-overlay-graphical/etc/X11/Xsession
deleted file mode 100755
index d8862f170c..0000000000
--- a/board/minnowboard/fs-overlay-graphical/etc/X11/Xsession
+++ /dev/null
@@ -1,7 +0,0 @@
-# Start a terminal on the top left corner
-xterm -geom 80x30+0+0 &
-
-# OpenGL demo
-glmark2 &
-
-exec /usr/bin/openbox-session
diff --git a/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf b/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf
deleted file mode 100644
index 91659baa65..0000000000
--- a/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-
-# Xorg does not implement real dynamic linking and requires that its
-# modules get loaded in the right order.
-# https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
-Section "Module"
-   Load "vgahw"
-   Load "fb"
-   Load "shadowfb"
-   Load "int10"
-   Load "vbe"
-EndSection
diff --git a/board/minnowboard/fs-overlay-graphical/etc/asound.conf b/board/minnowboard/fs-overlay-graphical/etc/asound.conf
deleted file mode 100644
index b75b238364..0000000000
--- a/board/minnowboard/fs-overlay-graphical/etc/asound.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-# Customize ALSA:
-# the HDMI PCM is at card=0, device=3 (i.e. hw:0,3)
-defaults.pcm.card 0
-defaults.pcm.device 3
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
deleted file mode 100644
index 051c7584dc..0000000000
--- a/configs/minnowboard_max-graphical_defconfig
+++ /dev/null
@@ -1,75 +0,0 @@
-# Architecture
-BR2_x86_64=y
-BR2_x86_silvermont=y
-
-# Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-# needed for TARGET_GRUB2
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-
-# System configuration
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_ROOTFS_OVERLAY="board/minnowboard/fs-overlay-graphical"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/minnowboard/genimage.cfg"
-
-# Host packages
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-
-# Linux
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.11"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
-
-# Bootloader
-BR2_TARGET_GRUB2=y
-BR2_TARGET_GRUB2_X86_64_EFI=y
-
-# ALSA
-BR2_PACKAGE_ALSA_UTILS=y
-BR2_PACKAGE_ALSA_UTILS_APLAY=y
-
-# OpenGL
-BR2_PACKAGE_GLMARK2=y
-BR2_PACKAGE_MESA3D_DEMOS=y
-BR2_PACKAGE_MESA3D=y
-BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
-BR2_PACKAGE_MESA3D_OPENGL_GLX=y
-
-# Framebuffer (just for testing purposes)
-BR2_PACKAGE_FB_TEST_APP=y
-
-# X
-BR2_PACKAGE_XORG7=y
-BR2_PACKAGE_XSERVER_XORG_SERVER=y
-BR2_PACKAGE_XAPP_XRANDR=y
-BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
-BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
-BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
-BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
-BR2_PACKAGE_NODM=y
-BR2_PACKAGE_XTERM=y
-BR2_PACKAGE_OPENBOX=y
-
-# Firmware
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
-
-# Libraries
-BR2_PACKAGE_IMLIB2=y
-BR2_PACKAGE_IMLIB2_JPEG=y
-BR2_PACKAGE_IMLIB2_PNG=y
-BR2_PACKAGE_STARTUP_NOTIFICATION=y
-
-# Filesystem image
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-# BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
