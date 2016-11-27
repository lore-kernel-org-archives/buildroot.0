From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Nov 2016 12:06:12 +0100
Subject: [Buildroot] [PATCH/next 09/13] package/x11r7/xdriver_xf86-video-*:
	mass addition of patches for ABI 23 support
	(xserver_xorg-server 1.19+)
In-Reply-To: <20161127110616.3451-1-bernd.kuhls@t-online.de>
References: <20161127110616.3451-1-bernd.kuhls@t-online.de>
Message-ID: <20161127110616.3451-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-glint/0002-abi23.patch      | 33 ++++++++++++++++++
 .../x11r7/xdriver_xf86-video-mga/0002-abi23.patch  | 33 ++++++++++++++++++
 .../x11r7/xdriver_xf86-video-nv/0002-abi23.patch   | 39 ++++++++++++++++++++++
 .../x11r7/xdriver_xf86-video-r128/0002-abi23.patch | 33 ++++++++++++++++++
 .../xdriver_xf86-video-savage/0002-abi23.patch     | 39 ++++++++++++++++++++++
 .../0001-abi23.patch                               | 33 ++++++++++++++++++
 .../x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch | 39 ++++++++++++++++++++++
 .../xdriver_xf86-video-trident/0001-abi23.patch    | 33 ++++++++++++++++++
 8 files changed, 282 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-glint/0002-abi23.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-nv/0002-abi23.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-r128/0002-abi23.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-savage/0002-abi23.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-siliconmotion/0001-abi23.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-trident/0001-abi23.patch

diff --git a/package/x11r7/xdriver_xf86-video-glint/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-glint/0002-abi23.patch
new file mode 100644
index 0000000..1d8f7f2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-glint/0002-abi23.patch
@@ -0,0 +1,33 @@
+From 2eb4d03d2280deec4d6f1b06aaa16477a641af9a Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from:
+https://cgit.freedesktop.org/xorg/driver/xf86-video-glint/commit/?id=2eb4d03d2280deec4d6f1b06aaa16477a641af9a
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
diff --git a/package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch
new file mode 100644
index 0000000..b2b6917
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-mga/0002-abi23.patch
@@ -0,0 +1,33 @@
+From df094bfffe4ef097bfd9a569f2d2e35649c1a3c7 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-mga/commit/?id=df094bfffe4ef097bfd9a569f2d2e35649c1a3c7
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
diff --git a/package/x11r7/xdriver_xf86-video-nv/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-nv/0002-abi23.patch
new file mode 100644
index 0000000..7b7bb34
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-nv/0002-abi23.patch
@@ -0,0 +1,39 @@
+From 42e260a7ab630fdfa4664f467dad25e7178ff809 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-nv/commit/?id=42e260a7ab630fdfa4664f467dad25e7178ff809
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index 0a87cf5..62d9481 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -78,11 +78,19 @@
+ 
+ #define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
+ 
++#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(23, 0)
++#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout
++#define BLOCKHANDLER_ARGS arg, pTimeout
++
++#define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result
++#define WAKEUPHANDLER_ARGS arg, result
++#else
+ #define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
+ #define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
+ 
+ #define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result, pointer read_mask
+ #define WAKEUPHANDLER_ARGS arg, result, read_mask
++#endif
+ 
+ #define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
+ #define CLOSE_SCREEN_ARGS pScreen
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-r128/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-r128/0002-abi23.patch
new file mode 100644
index 0000000..e79ffdf
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-r128/0002-abi23.patch
@@ -0,0 +1,33 @@
+From 5ab23b3a8ef18ab9ff96ac8be174380d36e185e5 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-r128/commit/?id=5ab23b3a8ef18ab9ff96ac8be174380d36e185e5
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
diff --git a/package/x11r7/xdriver_xf86-video-savage/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-savage/0002-abi23.patch
new file mode 100644
index 0000000..2487585
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-savage/0002-abi23.patch
@@ -0,0 +1,39 @@
+From de3e1803314820968502156703d5bfe3fab24972 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-savage/commit/?id=de3e1803314820968502156703d5bfe3fab24972
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index 98ba435..44daea4 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -78,11 +78,19 @@
+ 
+ #define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
+ 
++#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(23, 0)
++#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout
++#define BLOCKHANDLER_ARGS arg, pTimeout
++
++#define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result
++#define WAKEUPHANDLER_ARGS arg, result
++#else
+ #define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
+ #define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
+ 
+ #define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result, pointer read_mask
+ #define WAKEUPHANDLER_ARGS arg, result, read_mask
++#endif
+ 
+ #define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
+ #define CLOSE_SCREEN_ARGS pScreen
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/0001-abi23.patch b/package/x11r7/xdriver_xf86-video-siliconmotion/0001-abi23.patch
new file mode 100644
index 0000000..2cd6e63
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/0001-abi23.patch
@@ -0,0 +1,33 @@
+From e67f3949648c20e16ac756ae28ea4a2b4a1d0f4c Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-siliconmotion/patch/?id=e67f3949648c20e16ac756ae28ea4a2b4a1d0f4c
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
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch b/package/x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch
new file mode 100644
index 0000000..7e5d650
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-tdfx/0002-abi23.patch
@@ -0,0 +1,39 @@
+From b99390efcb55d7d4a68e8c595119c1af4426fc0b Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-tdfx/patch/?id=b99390efcb55d7d4a68e8c595119c1af4426fc0b
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index 98ba435..44daea4 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -78,11 +78,19 @@
+ 
+ #define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
+ 
++#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(23, 0)
++#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout
++#define BLOCKHANDLER_ARGS arg, pTimeout
++
++#define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result
++#define WAKEUPHANDLER_ARGS arg, result
++#else
+ #define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
+ #define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
+ 
+ #define WAKEUPHANDLER_ARGS_DECL ScreenPtr arg, unsigned long result, pointer read_mask
+ #define WAKEUPHANDLER_ARGS arg, result, read_mask
++#endif
+ 
+ #define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
+ #define CLOSE_SCREEN_ARGS pScreen
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-trident/0001-abi23.patch b/package/x11r7/xdriver_xf86-video-trident/0001-abi23.patch
new file mode 100644
index 0000000..d9aecd5
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-trident/0001-abi23.patch
@@ -0,0 +1,33 @@
+From b5f4d35327863a14224d2a63885cd8b3b83a1815 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 19 Jul 2016 10:03:56 -0400
+Subject: Adapt Block/WakeupHandler signature for ABI 23
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-trident/patch/?id=b5f4d35327863a14224d2a63885cd8b3b83a1815
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
-- 
2.10.2
