Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6287DC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E731F819D1;
	Sat, 14 Jan 2023 21:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E731F819D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZOdxhicq2-i; Sat, 14 Jan 2023 21:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 140CF81970;
	Sat, 14 Jan 2023 21:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 140CF81970
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7581BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 115594098F
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 115594098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmfjPpvIiX6Z for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:54:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA9F2408F7
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 21:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA9F2408F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C620B87B77; Sat, 14 Jan 2023 21:54:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 22:54:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4db36b268d8978b65bb5ed46e8f7e57412f3097f
X-Git-Newrev: 424f53ac0730ea8e8aac4f3341f25a9829582cbb
X-Patchwork-Hint: ignore
Message-Id: <20230114215440.C620B87B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: drop
 X11 output
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

commit: https://git.buildroot.net/buildroot/commit/?id=424f53ac0730ea8e8aac4f3341f25a9829582cbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
the X11 folder is no longer included in the archive.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                 |  6 ++++++
 package/freescale-imx/imx-gpu-viv/Config.in      | 22 ++++------------------
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 16 +---------------
 3 files changed, 11 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6d66f1b958..41c5fdefb3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
+	bool "imx-gpu-viv X11 output has been removed"
+	select BR2_LEGACY
+	help
+	  The X11 output was dropped by NXP.
+
 config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
 	string "the QEMU specific targets option has been removed"
 	help
diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 9ba3d0428e..9372b6313f 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -27,9 +27,9 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	  Userspace libraries for Vivante GPU on i.MX platforms
 
 	  It contains libraries and headers for GLES, OpenCL, and
-	  OpenVG. It also contains a DRI plugin for X11. It also
-	  contains a plugin for DirectFB-1.4.0, but that doesn't work
-	  together with buildroot's DirectFB version.
+	  OpenVG. It also contains a plugin for DirectFB-1.4.0, but
+	  that doesn't work together with buildroot's DirectFB
+	  version.
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
@@ -40,22 +40,9 @@ choice
 	prompt "Output option"
 	help
 	  There are two versions of this library: one for
-	  direct framebuffer access, one for X11 rendering.
+	  direct framebuffer access, one for wayland rendering.
 	  Choose here which version to install.
 
-config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
-	bool "X11"
-	depends on BR2_PACKAGE_XORG7
-	# The i.MX8 blob doesn't support X11 output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-
-comment "X11 backend needs Xorg package"
-	depends on !BR2_PACKAGE_XORG7
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
-
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
 	# The i.MX8 blob doesn't support FB output
@@ -70,7 +57,6 @@ endchoice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT
 	string
-	default "x11" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	default "fb" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	default "wayland" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 06fbbc7343..e0e8a31533 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -26,14 +26,6 @@ endif
 
 IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
-# The libGAL.so library provided by imx-gpu-viv uses X functions. Packages
-# may want to link against libGAL.so (QT5 Base with OpenGL and X support
-# does so). For this to work we need build dependencies to libXdamage,
-# libXext and libXfixes so that X functions used in libGAL.so are referenced.
-IMX_GPU_VIV_DEPENDENCIES += xlib_libXdamage xlib_libXext xlib_libXfixes
-endif
-
 # Libraries are linked against libdrm, except framebuffer output on ARM
 ifneq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
 IMX_GPU_VIV_DEPENDENCIES += libdrm
@@ -55,12 +47,6 @@ else ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
-else ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
-define IMX_GPU_VIV_FIXUP_PKGCONFIG
-	$(foreach lib,egl glesv1_cm glesv2 vg, \
-		ln -sf $(lib)_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$(lib).pc
-	)
-endef
 endif
 
 # Instead of building, we fix up the inconsistencies that exist
@@ -68,7 +54,7 @@ endif
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
 	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
-	$(foreach backend,fb x11 wayland, \
+	$(foreach backend,fb wayland, \
 		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
 	)
 	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
