From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Dec 2016 21:04:16 +0100
Subject: [Buildroot] [PATCH 1/1] gupnp-tools: bump to version 0.8.13
Message-ID: <1481400256-117578-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 ...-Fix-compiling-when-using-recent-GUPnP-AV.patch | 27 ----------------------
 package/gupnp-tools/gupnp-tools.hash               |  4 ++--
 package/gupnp-tools/gupnp-tools.mk                 |  2 +-
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 package/gupnp-tools/0001-Fix-compiling-when-using-recent-GUPnP-AV.patch

diff --git a/package/gupnp-tools/0001-Fix-compiling-when-using-recent-GUPnP-AV.patch b/package/gupnp-tools/0001-Fix-compiling-when-using-recent-GUPnP-AV.patch
deleted file mode 100644
index 6d3769f..0000000
--- a/package/gupnp-tools/0001-Fix-compiling-when-using-recent-GUPnP-AV.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e9ec9634207e4c2eea6d268ee29b57e687c1f178 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sun, 16 Oct 2016 21:51:39 +0200
-Subject: av-cp: Fix compiling when using recent GUPnP-AV
-
-Include gupnp.h ourselves, gupnp-av.h doesn't drag it in anymore
-
-Signed-off-by: Jens Georg <mail@jensge.org>
----
- src/av-cp/playlist-treeview.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/av-cp/playlist-treeview.h b/src/av-cp/playlist-treeview.h
-index 8637ae8..16b131e 100644
---- a/src/av-cp/playlist-treeview.h
-+++ b/src/av-cp/playlist-treeview.h
-@@ -23,6 +23,8 @@
- 
- #include <config.h>
- #include <gtk/gtk.h>
-+
-+#include <libgupnp/gupnp.h>
- #include <libgupnp-av/gupnp-av.h>
- 
- typedef void (* MetadataFunc) (const char *metadata,
--- 
-cgit v0.12
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index 0d37a87..f08b4f5 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.12.sha256sum:
-sha256	658de96953608c4b1f47578ae563a7066d1f1983565daf22ad52b7b328ef97b1	gupnp-tools-0.8.12.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.13.sha256sum:
+sha256	aa3decb9d532c0e2e505adc592f431fd81c0231ded2981129e87da13712479ed	gupnp-tools-0.8.13.tar.xz
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 75920db..07b5d3c 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.8
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).12
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).13
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
-- 
2.5.0
