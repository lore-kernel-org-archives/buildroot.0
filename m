From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:31:06 +0200
Subject: [Buildroot] [git commit] rygel: bump to version 0.36.2
Message-ID: <20180908133032.E86468363F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76f86c409d016851d4d63216ada969e6cd81dd56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-Allow-UI-build-without-gstreamer-video.patch | 37 ----------------------
 package/rygel/rygel.hash                           |  4 +--
 package/rygel/rygel.mk                             |  2 +-
 3 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/package/rygel/0001-Allow-UI-build-without-gstreamer-video.patch b/package/rygel/0001-Allow-UI-build-without-gstreamer-video.patch
deleted file mode 100644
index 6e1f528719..0000000000
--- a/package/rygel/0001-Allow-UI-build-without-gstreamer-video.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f3a49ad1a4ba172e97bd860bc067f7e9ebe69509 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 8 Jan 2018 13:27:42 +0100
-Subject: [PATCH] Allow UI build without gstreamer-video
-
-If EXAMPLE_UI dependencies are not met, only display a warning.
-Indeed, currently, we can't build rygel UI without gstreamer-video which
-is only a dependency of fullscreen-renderer application.
-
-fullscreen-renderer won't be build without gstreamer as HAVE_GSTREAMER
-has to be true to check HAVE_UI in examples/Makefile.am
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 00b94da..d140a27 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -359,7 +359,11 @@ if test x$try_ui = xyes ; then
-                           [$RYGEL_COMMON_MODULES gio-2.0 >= $GIO_REQUIRED
-                            gssdp-1.0 >= $GSSDP_REQUIRED
-                            gstreamer-video-1.0 >= $GSTREAMER_REQUIRED
--                           gtk+-3.0 >= $GTK_REQUIRED])
-+                           gtk+-3.0 >= $GTK_REQUIRED],,
-+                          [
-+                           AC_MSG_WARN([Example UI dependencies not found.])
-+                           AC_MSG_WARN([Example UI applications will not be built.])
-+                          ])
-       ],
-       [
-         AC_MSG_WARN([UI dependencies not found.])
--- 
-2.7.4
-
diff --git a/package/rygel/rygel.hash b/package/rygel/rygel.hash
index 879cbd714b..0d8c95a697 100644
--- a/package/rygel/rygel.hash
+++ b/package/rygel/rygel.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.36/rygel-0.36.1.sha256sum:
-sha256	a67fdd801f6e4121ae44cfffabc0f35fff487cab173b6c6f052449ad7b5fb820	rygel-0.36.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.36/rygel-0.36.2.sha256sum:
+sha256	d332c76c76716de1e5085f0ca0c152174352efd652a80e5b94ec7df797f92244	rygel-0.36.2.tar.xz
 
 # Locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index d1bc30589c..1f917b207e 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RYGEL_VERSION_MAJOR = 0.36
-RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).1
+RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).2
 RYGEL_SOURCE = rygel-$(RYGEL_VERSION).tar.xz
 RYGEL_SITE = http://ftp.gnome.org/pub/gnome/sources/rygel/$(RYGEL_VERSION_MAJOR)
 RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
