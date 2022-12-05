Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E04C4332F
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 18:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521D5812F5;
	Mon,  5 Dec 2022 18:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 521D5812F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjJs_gdtsTqL; Mon,  5 Dec 2022 18:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45006812A5;
	Mon,  5 Dec 2022 18:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45006812A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7719F1BF357
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 18:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FED5812A5
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 18:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FED5812A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k36uL3Fj0C3F for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 18:35:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5588128D
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD5588128D
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 18:35:08 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout10.t-online.de (Postfix) with SMTP id 20D0C1DACE;
 Mon,  5 Dec 2022 19:35:06 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd74.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p2GIy-0ef2Nl0; Mon, 5 Dec 2022 19:35:04 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:42548)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p2GIy-0003OE-0S;
 Mon, 05 Dec 2022 19:35:04 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 19:35:04 +0100
Message-Id: <20221205183504.2699092-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670265304-C9C89B6F-913B0723/0/0 CLEAN NORMAL
X-TOI-MSGID: 857075ee-894d-4eaa-8ad0-f8b63c26b1e1
Subject: [Buildroot] [PATCH v3 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.3.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed xmvc support due to upstream removal:
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=22.3&id=8cc766d8f7eac26b7c029a2fac1bdfdba4776c29

Removed comment concerning gallium-xlib due to upstream removal:
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=22.3&id=5bed3d4ad659c30cb0ef4b40172f1aab877ccc98

Rebased patch 0004 due to upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/src/util/macros.h?h=22.3&id=c0b891ecca2b92c9ef2945440c77f45345df3290

Please note that patch 0004 can be removed when buildroot toolchains are
updated to uClibc 1.0.42:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=v1.0.42&id=03fbd941e943976bb92cb392882c2ff7ec218704

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: rebased for master branch after -next merge

 Config.in.legacy                           |  6 ++++++
 package/mesa3d-headers/mesa3d-headers.mk   |  2 +-
 package/mesa3d/0004-Fix-uClibc-build.patch |  4 ++--
 package/mesa3d/Config.in                   | 18 ------------------
 package/mesa3d/mesa3d.hash                 |  6 +++---
 package/mesa3d/mesa3d.mk                   | 10 +---------
 6 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 522102a0c0..fd1e1ceeec 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_MESA3D_XVMC
+	bool "mesa Gallium XvMC state tracker removed"
+	select BR2_LEGACY
+	help
+	  The Gallium XvMC state tracker was removed upstream.
+
 config BR2_PACKAGE_USBREDIR_SERVER
 	bool "usbredirserver removed"
 	select BR2_LEGACY
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3712c79db0..d33d492ba7 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 22.2.2
+MESA3D_HEADERS_VERSION = 22.3.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0004-Fix-uClibc-build.patch b/package/mesa3d/0004-Fix-uClibc-build.patch
index c8c82fe0dc..95ca95fd67 100644
--- a/package/mesa3d/0004-Fix-uClibc-build.patch
+++ b/package/mesa3d/0004-Fix-uClibc-build.patch
@@ -58,9 +58,9 @@ index 22b18303826..8f73ee72693 100644
 --- a/src/util/macros.h
 +++ b/src/util/macros.h
 @@ -27,6 +27,7 @@
- #include <stdio.h>
- #include <assert.h>
+ #include <stddef.h>
  #include <stdint.h>
+ #include <stdio.h>
 +#include "util/compiler.h"
  
  /* Compute the size of an array */
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 40f7009492..cae2161aa3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -299,24 +299,6 @@ comment "Gallium VDPAU state tracker needs X.org and gallium drivers r300, r600,
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI)
 
-config BR2_PACKAGE_MESA3D_XVMC
-	bool "Gallium XvMC state tracker"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
-		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
-	select BR2_PACKAGE_MESA3D_NEEDS_X11
-	select BR2_PACKAGE_XLIB_LIBXV
-	select BR2_PACKAGE_XLIB_LIBXVMC
-	help
-	  XvMC state tracker (needs r600 or nouveau gallium drivers).
-
-comment "Gallium XvMC state tracker needs X.org and gallium drivers r600 or nouveau"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_XORG7 || \
-		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
-		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)
-
 comment "Vulkan drivers"
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f10f8fe112..77223676ea 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2022-October/000689.html
-sha256  2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97cdb06a2f4e78948f9  mesa-22.2.2.tar.xz
-sha512  a1eb67e1ae4880c79b1fdc570f4389baba0b8ba796da7e695c9af19a7d92b6c06b95570e6c796548b61355989025fb7efbf9acac74cbd695f7e297dc913b933c  mesa-22.2.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2022-November/000695.html
+sha256  644bf936584548c2b88762111ad58b4aa3e4688874200e5a4eb74e53ce301746  mesa-22.3.0.tar.xz
+sha512  bf4d344459f97d266a5943b33aecf062b0825e13c1617afdab71c4ba6a87a201440761c9a32a6e0060910a0917122e3f4d29f666d6b94a38a71c94b9ff3ab9da  mesa-22.3.0.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index bac071ecb3..c3bd44c2fa 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 22.2.2
+MESA3D_VERSION = 22.3.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -77,7 +77,6 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 # glx:
 #  dri          : dri based GLX requires at least one DRI driver || dri based GLX requires shared-glapi
 #  xlib         : xlib conflicts with any dri driver
-#  gallium-xlib : Gallium-xlib based GLX requires at least one gallium driver || Gallium-xlib based GLX requires softpipe or llvmpipe || gallium-xlib conflicts with any dri driver.
 # Always enable glx-direct; without it, many GLX applications don't work.
 MESA3D_CONF_OPTS += \
 	-Dglx=dri \
@@ -212,13 +211,6 @@ else
 MESA3D_CONF_OPTS += -Dgles1=disabled -Dgles2=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_XVMC),y)
-MESA3D_DEPENDENCIES += xlib_libXv xlib_libXvMC
-MESA3D_CONF_OPTS += -Dgallium-xvmc=enabled
-else
-MESA3D_CONF_OPTS += -Dgallium-xvmc=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_VALGRIND),y)
 MESA3D_CONF_OPTS += -Dvalgrind=enabled
 MESA3D_DEPENDENCIES += valgrind
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
