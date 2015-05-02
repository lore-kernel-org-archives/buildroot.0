From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 20:09:52 +0200
Subject: [Buildroot] [git commit] sdl_sound: add patch to remove -Werror
	when --enable-debug is passed
Message-ID: <20150502185527.1FC1E81612@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fe0183c5076169b4be739bcb652ebd05e35cb79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/37d/37d0ae47902c5fa6f749e8b832f31924ad03b7af/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_sound/0002-remove-werror.patch |   29 ++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/sdl_sound/0002-remove-werror.patch b/package/sdl_sound/0002-remove-werror.patch
new file mode 100644
index 0000000..c08bbdb
--- /dev/null
+++ b/package/sdl_sound/0002-remove-werror.patch
@@ -0,0 +1,29 @@
+Do not add -Werror when --enable-debug is used
+
+Using -Werror causes some problems due to warnings in the SDL_sound
+code, so let's disable it.
+
+We patch configure directly, because:
+
+ 1/ configure.in doesn't autoreconf properly out of the box.
+
+ 2/ the length of the configure or configure.in patch would be exactly
+    the same (one line), or maybe more for the configure.in patch if
+    we want the package to autoreconf properly
+
+ 3/ the patch will never go upstream, because upstream is dead.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure
+===================================================================
+--- a/configure
++++ b/configure
+@@ -19561,7 +19561,6 @@
+   else
+     CFLAGS="-O0"
+   fi
+-  CFLAGS="$CFLAGS -Werror"
+ 
+ cat >>confdefs.h <<\_ACEOF
+ #define DEBUG 1
