From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:22:42 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump version to 1.16.1
Message-ID: <20191005142430.0BBCF886EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c95776d2ed4b230c9a894db717bfcfd54d9639a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove 0001-meson-Link-to-objects-instea-of-static-helper-librar.patch
  (Taken from upstream [1])

[1] https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=b19de413b94d228b1460b0899f9b41b2b5233943

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...to-objects-instea-of-static-helper-librar.patch | 42 ----------------------
 package/gstreamer1/gstreamer1/gstreamer1.hash      |  4 +--
 package/gstreamer1/gstreamer1/gstreamer1.mk        |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/0001-meson-Link-to-objects-instea-of-static-helper-librar.patch b/package/gstreamer1/gstreamer1/0001-meson-Link-to-objects-instea-of-static-helper-librar.patch
deleted file mode 100644
index 2bbc069f2b..0000000000
--- a/package/gstreamer1/gstreamer1/0001-meson-Link-to-objects-instea-of-static-helper-librar.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 060fef075d6e614cc4dabb6d4fe62ce9b3e0f299 Mon Sep 17 00:00:00 2001
-From: Nirbheek Chauhan <nirbheek@centricular.com>
-Date: Mon, 13 May 2019 13:24:42 +0530
-Subject: [PATCH] meson: Link to objects instea of static helper library
-
-Otherwise the objects from that static helper library are not included
-in the gstreamer-1.0 static library. This was supposed to be fixed in
-Meson, but the pull request hasn't been merged yet:
-https://github.com/mesonbuild/meson/pull/3939
-
-Closes https://gitlab.freedesktop.org/gstreamer/gstreamer/issues/398
-
-Upstream: https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=b19de413b94d228b1460b0899f9b41b2b5233943
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- gst/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/meson.build b/gst/meson.build
-index 145e97a89..c753ff5e3 100644
---- a/gst/meson.build
-+++ b/gst/meson.build
-@@ -237,6 +237,7 @@ gst_incdirs = [configinc]
- gst_gen_sources = [gstenum_h]
- libgst = library('gstreamer-1.0', gst_sources,
-   gstenum_h, gstenum_c, gst_parse_sources, gst_registry_sources,
-+  objects : printf_lib.extract_all_objects(),
-   version : libversion,
-   soversion : soversion,
-   darwin_versions : osxversion,
-@@ -244,7 +245,6 @@ libgst = library('gstreamer-1.0', gst_sources,
-   include_directories : [configinc,
-     # HACK, change include paths in .y and .l in final version.
-     include_directories('parse')],
--  link_with : printf_lib,
-   install : true,
-   dependencies : [gobject_dep, gmodule_dep, glib_dep, mathlib, dl_dep] + backtrace_deps
-                    + platform_deps,
---
-2.22.0
-
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 588526c5c2..88d08d4686 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.16.0.tar.xz.sha256sum
-sha256 0e8e2f7118be437cba879353970cf83c2acced825ecb9275ba05d9186ef07c00 gstreamer-1.16.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.16.1.tar.xz.sha256sum
+sha256 02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d gstreamer-1.16.1.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 023cf4e85e..f073a020e8 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.16.0
+GSTREAMER1_VERSION = 1.16.1
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
