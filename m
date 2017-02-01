From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:39:26 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-trident:
	bump version to 1.3.8
Message-ID: <20170201204118.F2B998212C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=558f5c181c54683f373c750ac658e849515c5dc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0001-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-trident/0001-abi23.patch    | 33 ----------------------
 .../xdriver_xf86-video-trident.hash                |  4 +--
 .../xdriver_xf86-video-trident.mk                  |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-trident/0001-abi23.patch b/package/x11r7/xdriver_xf86-video-trident/0001-abi23.patch
deleted file mode 100644
index d9aecd5..0000000
--- a/package/x11r7/xdriver_xf86-video-trident/0001-abi23.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b5f4d35327863a14224d2a63885cd8b3b83a1815 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-trident/patch/?id=b5f4d35327863a14224d2a63885cd8b3b83a1815
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index 6bc946f..89976e4 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -75,8 +75,13 @@
- 
- #define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
- 
-+#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(23, 0)
-+#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout
-+#define BLOCKHANDLER_ARGS arg, pTimeout
-+#else
- #define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
- #define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
-+#endif
- 
- #define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
- #define CLOSE_SCREEN_ARGS pScreen
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
index e92c948..04a559a 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002558.html
-sha256	ecd518de627a0d49e17c158bfc72ab657386c6907c91ef89fa09332558e413ae	xf86-video-trident-1.3.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002762.html
+sha256 9e5119d974c3e2221994542d35e3a0b3426a441869ddd6dd08a84f324856ac3f  xf86-video-trident-1.3.8.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index a136e87..727744c 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.7
+XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.8
 XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_LICENSE = MIT
