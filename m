From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Nov 2016 12:06:14 +0100
Subject: [Buildroot] [PATCH/next 11/13]
	package/x11r7/xdriver_xf86-video-sis: Add patch for ABI 23
	support (xserver_xorg-server 1.19+)
In-Reply-To: <20161127110616.3451-1-bernd.kuhls@t-online.de>
References: <20161127110616.3451-1-bernd.kuhls@t-online.de>
Message-ID: <20161127110616.3451-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-numbered patches as well.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-sis/0002-abi23.patch  | 33 ++++++++++++++++++++++
 .../{0007-xi.patch => 0003-xi.patch}               |  0
 2 files changed, 33 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/0002-abi23.patch
 rename package/x11r7/xdriver_xf86-video-sis/{0007-xi.patch => 0003-xi.patch} (100%)

diff --git a/package/x11r7/xdriver_xf86-video-sis/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-sis/0002-abi23.patch
new file mode 100644
index 0000000..109f745
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/0002-abi23.patch
@@ -0,0 +1,33 @@
+From 96fee560cd8bf7bf27048ce5fe67b7af6838c8d0 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=96fee560cd8bf7bf27048ce5fe67b7af6838c8d0
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index 6bc946f..89976e4 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -75,8 +75,13 @@
+ 
+ #define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
+ 
++#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(23, 0)
++#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout
++#define BLOCKHANDLER_ARGS arg, pTimeout
++#else
+ #define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
+ #define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
++#endif
+ 
+ #define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
+ #define CLOSE_SCREEN_ARGS pScreen
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-sis/0007-xi.patch b/package/x11r7/xdriver_xf86-video-sis/0003-xi.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/0007-xi.patch
rename to package/x11r7/xdriver_xf86-video-sis/0003-xi.patch
-- 
2.10.2
