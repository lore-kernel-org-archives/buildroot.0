Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4889EC7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 13:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7B7641926;
	Sun, 14 May 2023 13:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7B7641926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXj5SYBXE11u; Sun, 14 May 2023 13:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B67F41912;
	Sun, 14 May 2023 13:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B67F41912
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 445271BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E15C60BDE
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E15C60BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYfcKVGHrfKl for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 13:38:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A9660BDB
 for <buildroot@buildroot.org>; Sun, 14 May 2023 13:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A9660BDB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F48C866C3; Sun, 14 May 2023 13:38:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 15:36:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d97088748ad8139ba922ea2ae30cbd9153c9dd5
X-Git-Newrev: ec5fffbca0826e654925b63b5b5d88da97cf0dd3
X-Patchwork-Hint: ignore
Message-Id: <20230514133818.1F48C866C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glmark2: bump to version 2023.01
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
Content-Type: multipart/mixed; boundary="===============5978607204017435672=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5978607204017435672==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ec5fffbca0826e654925b63b5b5d88da97cf0dd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert the package to a meson package as recommanded by upstream.
Drop no longer needed patchs.

Fixes: http://autobuild.buildroot.net/results/b32/b3245c4ee8e0b3592b09e0bc57bc0928018936c2
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[yann.morin.1998@free.fr:
  - drop --prefix=/usr, already passed by the meson-package infra
  - regenerate .checkpackageignore for removed patches
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 -
 ...-use-find_program-to-find-wayland-scanner.patch | 50 ----------------------
 ...002-libmatrix-Add-missing-utility-include.patch | 30 -------------
 package/glmark2/glmark2.hash                       |  2 +-
 package/glmark2/glmark2.mk                         | 11 ++---
 5 files changed, 4 insertions(+), 91 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c916445d38..13f67695f5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -575,8 +575,6 @@ package/giblib/0001-fix-imlib2-detection.patch Upstream
 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
 package/gli/0001-Optional-building-tests.patch Upstream
-package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch Upstream
-package/glmark2/0002-libmatrix-Add-missing-utility-include.patch Upstream
 package/glog/0001-added-emscripten-support.patch Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
diff --git a/package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch b/package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch
deleted file mode 100644
index 681f0c6794..0000000000
--- a/package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 303d5c4fef1760ede5786bc62c7012dd7ae93722 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 Nov 2020 23:46:49 +0100
-Subject: [PATCH] wscript: use find_program to find wayland-scanner
-
-Use find_program instead of check_cfg to find wayland-scanner. This will
-fix the following build failure when cross-compiling:
-
-[ 3/73] Compiling doc/glmark2.1.in
-/bin/sh: 1: /usr/bin/wayland-scanner: not found
-
-Fixes:
- - http://autobuild.buildroot.org/results//361dc40e558e2646cb93f405c7b1f621d400fea3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/wscript_build | 2 +-
- wscript           | 3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/wscript_build b/src/wscript_build
-index bbe7a77..ed3e8d6 100644
---- a/src/wscript_build
-+++ b/src/wscript_build
-@@ -51,7 +51,7 @@ else:
- 
- if 'WAYLAND_SCANNER_wayland_scanner' in bld.env.keys():
-     def wayland_scanner_cmd(arg, src):
--        return '%s %s < %s > ${TGT}' % (bld.env['WAYLAND_SCANNER_wayland_scanner'], arg, src)
-+        return '%s %s < %s > ${TGT}' % (bld.env['WAYLAND_SCANNER_wayland_scanner'][0], arg, src)
- 
-     def wayland_proto_src_path(proto, ver):
-         wp_dir = bld.env['WAYLAND_PROTOCOLS_pkgdatadir']
-diff --git a/wscript b/wscript
-index e09fa78..fe2494f 100644
---- a/wscript
-+++ b/wscript
-@@ -227,8 +227,7 @@ def configure_linux(ctx):
-         # wayland-protocols >= 1.12 required for xdg-shell stable
-         ctx.check_cfg(package = 'wayland-protocols', atleast_version = '1.12',
-                       variables = ['pkgdatadir'], uselib_store = 'WAYLAND_PROTOCOLS')
--        ctx.check_cfg(package = 'wayland-scanner', variables = ['wayland_scanner'],
--                      uselib_store = 'WAYLAND_SCANNER')
-+        ctx.find_program('wayland-scanner', var = 'WAYLAND_SCANNER_wayland_scanner')
- 
-     # Prepend CXX flags so that they can be overriden by the
-     # CXXFLAGS environment variable
--- 
-2.28.0
-
diff --git a/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch b/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
deleted file mode 100644
index 65b6183867..0000000000
--- a/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d1ca3f53c96dc8a4048b17dc16147a8fac782d4a Mon Sep 17 00:00:00 2001
-From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
-Date: Mon, 14 Feb 2022 13:54:09 +0200
-Subject: [PATCH] libmatrix: Add missing <utility> include
-
-Fixes compilation with GCC 12.
-
-Fixes #169
-[Paul: backport upstream d1ca3f53c96dc8a4048b17dc16147a8fac782d4a]
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
----
-
- src/libmatrix/program.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libmatrix/program.h b/src/libmatrix/program.h
-index f95b470..1c9de08 100644
---- a/src/libmatrix/program.h
-+++ b/src/libmatrix/program.h
-@@ -15,6 +15,7 @@
- #include <string>
- #include <vector>
- #include <map>
-+#include <utility>
- #include "mat.h"
- 
- // Simple shader container.  Abstracts all of the OpenGL bits, but leaves
--- 
-2.35.1
-
diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
index 8405819770..5b1d13b468 100644
--- a/package/glmark2/glmark2.hash
+++ b/package/glmark2/glmark2.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  12aef3ce80406bc723542979b9818886a28d0a4c93f62379eaadfd830974790d  glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9.tar.gz
+sha256  8fece3fc323b643644a525be163dc4931a4189971eda1de8ad4c1712c5db3d67  glmark2-2023.01.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  16fbc228292bd774b263b212ae422c524cbf3b2078bcf21b22f8bdd4373be617  COPYING.SGI
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index bac9d9ff6f..c98df7e688 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-GLMARK2_VERSION = 06e78b67702b5413335ecdf1ae816da9c20f6ed9
+GLMARK2_VERSION = 2023.01
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
-# The bundled waf script is too old for >= python3.11
-GLMARK2_NEEDS_EXTERNAL_WAF = YES
-
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
 GLMARK2_DEPENDENCIES += libdrm libgbm libgles udev
 GLMARK2_FLAVORS += drm-glesv2
@@ -43,8 +40,6 @@ GLMARK2_DEPENDENCIES += libgl wayland wayland-protocols
 GLMARK2_FLAVORS += wayland-gl
 endif
 
-GLMARK2_CONF_OPTS += \
-	--prefix=/usr \
-	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
+GLMARK2_CONF_OPTS = -Dflavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
 
-$(eval $(waf-package))
+$(eval $(meson-package))

--===============5978607204017435672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5978607204017435672==--
