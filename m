Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3EAC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 05:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5656077C;
	Mon,  8 Jul 2024 05:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUBIPyup1nCk; Mon,  8 Jul 2024 05:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B646081E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B646081E;
	Mon,  8 Jul 2024 05:36:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60A331BF48D
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 05:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFD3D403AE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 05:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPnM-w-wrgcs for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 05:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95EC7400E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95EC7400E5
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 05:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9015883D28; Mon,  8 Jul 2024 05:36:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 07:26:19 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a157cf854f75fc5ebe347447582dd28dc2735fa3
X-Git-Newrev: 1a8676d72cf7ada93b56a48407ba9862d5f6b50e
X-Patchwork-Hint: ignore
Message-Id: <20240708053622.9015883D28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a8676d72cf7ada93b56a48407ba9862d5f6b50e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2024-May/000761.html
https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html

Removed two patches which are included in this version 24.0.8.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c8057515a429d531f735c72042656c3bd0efa700)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 .../mesa3d/0006-drisw-fix-build-without-dri3.patch | 58 ----------------------
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch | 42 ----------------
 package/mesa3d/mesa3d.hash                         |  6 +--
 package/mesa3d/mesa3d.mk                           |  2 +-
 5 files changed, 5 insertions(+), 105 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index e35774a942..33c60b285f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.7
+MESA3D_HEADERS_VERSION = 24.0.9
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0006-drisw-fix-build-without-dri3.patch b/package/mesa3d/0006-drisw-fix-build-without-dri3.patch
deleted file mode 100644
index ab27d384cf..0000000000
--- a/package/mesa3d/0006-drisw-fix-build-without-dri3.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 3ab46dcfda9edf5c9bc27c8f5031146d9d9d8ade Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Thu, 18 Jan 2024 22:50:16 +0100
-Subject: [PATCH] drisw: fix build without dri3
-
-commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
-added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
-can be build without dri3.
-
-  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
-  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
-  collect2: error: ld returned 1 exit status
-
-Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
-dri3_check_multibuffer().
-
-Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
-
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/glx/drisw_glx.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f75259bc..4b19e2d7707 100644
---- a/src/glx/drisw_glx.c
-+++ b/src/glx/drisw_glx.c
-@@ -32,7 +32,9 @@
- #include <dlfcn.h>
- #include "dri_common.h"
- #include "drisw_priv.h"
-+#ifdef HAVE_DRI3
- #include "dri3_priv.h"
-+#endif
- #include <X11/extensions/shmproto.h>
- #include <assert.h>
- #include <vulkan/vulkan_core.h>
-@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-        goto handle_error;
-    }
- 
-+#ifdef HAVE_DRI3
-    if (pdpyp->zink) {
-       bool err;
-       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-          goto handle_error;
-       }
-    }
-+#endif
- 
-    glx_config_destroy_list(psc->base.configs);
-    psc->base.configs = configs;
--- 
-2.43.0
-
diff --git a/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
deleted file mode 100644
index f9e4d50fd7..0000000000
--- a/package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 83b4ff6616708bd7ba5981d22cd5211ca6787d58 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Wed, 24 Jan 2024 14:28:32 +0100
-Subject: [PATCH] glxext: don't try zink if not enabled in mesa
-
-Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
-added an automatic zink fallback even when the zink gallium is not
-enabled at build time.
-
-It leads to unexpected error log while loading drisw driver and
-zink is not installed on the rootfs:
-
-  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
-
-Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
-
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/glx/glxext.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 39d5f08bdcf..e106eb40046 100644
---- a/src/glx/glxext.c
-+++ b/src/glx/glxext.c
-@@ -904,9 +904,11 @@ __glXInitialize(Display * dpy)
- #endif /* HAVE_DRI3 */
-       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
-          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
-+#if defined(HAVE_ZINK)
-       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
-          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
-                     !getenv("GALLIUM_DRIVER");
-+#endif /* HAVE_ZINK */
-    }
- #endif /* GLX_USE_DRM */
-    if (glx_direct)
--- 
-2.43.0
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f2c25464f4..d506d398b8 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-May/000758.html
-sha256  7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a  mesa-24.0.7.tar.xz
-sha512  77b0fae80ab0a07e2e528c113eadef0e3004b8df3e6e98fffe6fc2d8ac39f5ce7fa38ebe5c2ae32bfbac993dd7cbe288ace18ebb03cf2fb445fe7114f74dd45c  mesa-24.0.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
+sha256  51aa686ca4060e38711a9e8f60c8f1efaa516baf411946ed7f2c265cd582ca4c  mesa-24.0.9.tar.xz
+sha512  de2ee6c9df1fc106ee10befe0a76be1e9cfe83d65dbdb83bad6d8d7cfaa085232fb115293a1a790b37b50b1fe14bd58aafbcfe5a15e953b5901a7105d57569a5  mesa-24.0.9.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6bccdaed04..ce460c4475 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.7
+MESA3D_VERSION = 24.0.9
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
