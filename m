From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Thu, 30 Aug 2018 20:51:26 -0600
Subject: [Buildroot] [PATCH 1/1] SDL fixed the DirectFB renderer not being
 enabled in autoconf builds fixes "SDL2+DirectFB does not work as built for
 Beaglebone Black" Fetched From:
 <https://hg.libsdl.org/SDL/raw-rev/751cdc74d55c>
Message-ID: <1535683886-4552-1-git-send-email-peter.macleod.thompson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2/0001-sdl2directfb.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/sdl2/0001-sdl2directfb.patch

diff --git a/package/sdl2/0001-sdl2directfb.patch b/package/sdl2/0001-sdl2directfb.patch
new file mode 100644
index 0000000..9758958
--- /dev/null
+++ b/package/sdl2/0001-sdl2directfb.patch
@@ -0,0 +1,32 @@
+
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1535395865 25200
+# Node ID 751cdc74d55c91f0d010d13c18315c192d7fc881
+# Parent  2a9b4339468b9d722a58587c9a72ca8bc9f3c563
+Fixed the DirectFB renderer not being enabled in autoconf builds
+
+diff -r 2a9b4339468b -r 751cdc74d55c configure
+--- a/configure	Sun Aug 26 20:37:23 2018 -0700
++++ b/configure	Mon Aug 27 11:51:05 2018 -0700
+@@ -21501,6 +21501,9 @@
+ 
+ $as_echo "#define SDL_VIDEO_DRIVER_DIRECTFB 1" >>confdefs.h
+ 
++
++$as_echo "#define SDL_VIDEO_RENDER_DIRECTFB 1" >>confdefs.h
++
+             SOURCES="$SOURCES $srcdir/src/video/directfb/*.c"
+             EXTRA_CFLAGS="$EXTRA_CFLAGS $DIRECTFB_CFLAGS"
+ 
+diff -r 2a9b4339468b -r 751cdc74d55c configure.in
+--- a/configure.in	Sun Aug 26 20:37:23 2018 -0700
++++ b/configure.in	Mon Aug 27 11:51:05 2018 -0700
+@@ -2163,6 +2163,7 @@
+                               , enable_directfb_shared=yes)
+ 
+             AC_DEFINE(SDL_VIDEO_DRIVER_DIRECTFB, 1, [ ])
++            AC_DEFINE(SDL_VIDEO_RENDER_DIRECTFB, 1, [ ])
+             SOURCES="$SOURCES $srcdir/src/video/directfb/*.c"
+             EXTRA_CFLAGS="$EXTRA_CFLAGS $DIRECTFB_CFLAGS"
+ 
-- 
1.9.1
