From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:42 +0100
Subject: [Buildroot] [PATCH 08/16] package/x11r7/xdriver_xf86-video-savage:
	bump version to 2.3.9
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0002-abi23.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-savage/0002-abi23.patch     | 39 ----------------------
 .../xdriver_xf86-video-savage.hash                 |  4 +--
 .../xdriver_xf86-video-savage.mk                   |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-savage/0002-abi23.patch

diff --git a/package/x11r7/xdriver_xf86-video-savage/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-savage/0002-abi23.patch
deleted file mode 100644
index 248758545..000000000
--- a/package/x11r7/xdriver_xf86-video-savage/0002-abi23.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From de3e1803314820968502156703d5bfe3fab24972 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 19 Jul 2016 10:03:56 -0400
-Subject: Adapt Block/WakeupHandler signature for ABI 23
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-savage/commit/?id=de3e1803314820968502156703d5bfe3fab24972
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index 98ba435..44daea4 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -78,11 +78,19 @@
- 
- #define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
- 
-+#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(23, 0)
-+#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout
-+#define BLOCKHANDLER_ARGS arg, pTimeout
-+
-+#define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result
-+#define WAKEUPHANDLER_ARGS arg, result
-+#else
- #define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
- #define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
- 
- #define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result, pointer read_mask
- #define WAKEUPHANDLER_ARGS arg, result, read_mask
-+#endif
- 
- #define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
- #define CLOSE_SCREEN_ARGS pScreen
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
index 25afb1313..4f155359a 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-May/002603.html
-sha256	fdcea4a86532bceb50095eaf0fe2f38bbfa160e98463b815f4b549eb9985fa63	xf86-video-savage-2.3.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002760.html
+sha256 2c93c4db1f71e725dda0caee5821253129d4b52d7aa0fd720593e7769bceec86  xf86-video-savage-2.3.9.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 95bca7e3b..ae1dea34a 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.8
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.9
 XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
-- 
2.11.0
