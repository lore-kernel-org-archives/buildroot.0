From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Oct 2014 07:00:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/sdl_sound: Fix build with
	BR2_ENABLE_DEBUG=yes
Message-ID: <1413781229-23932-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
speex.c: In function 'process_header':
speex.c:140:10: error: assignment discards 'const' qualifier from pointer target type [-Werror]
     mode = speex_mode_list[header.mode];
          ^
cc1: all warnings being treated as errors

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sdl_sound/sdl_sound-0001-debug.patch |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/sdl_sound/sdl_sound-0001-debug.patch

diff --git a/package/sdl_sound/sdl_sound-0001-debug.patch b/package/sdl_sound/sdl_sound-0001-debug.patch
new file mode 100644
index 0000000..023e9b4
--- /dev/null
+++ b/package/sdl_sound/sdl_sound-0001-debug.patch
@@ -0,0 +1,21 @@
+Fix compile error when debug is enabled
+
+speex.c: In function 'process_header':
+speex.c:140:10: error: assignment discards 'const' qualifier from pointer target type [-Werror]
+     mode = speex_mode_list[header.mode];
+          ^
+cc1: all warnings being treated as errors
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr SDL_sound-1.0.3.org/configure SDL_sound-1.0.3/configure
+--- SDL_sound-1.0.3.org/configure	2008-04-20 22:33:52.000000000 +0200
++++ SDL_sound-1.0.3/configure	2014-10-20 06:57:27.887688027 +0200
+@@ -19561,7 +19561,6 @@
+   else
+     CFLAGS="-O0"
+   fi
+-  CFLAGS="$CFLAGS -Werror"
+ 
+ cat >>confdefs.h <<\_ACEOF
+ #define DEBUG 1
-- 
1.7.10.4
