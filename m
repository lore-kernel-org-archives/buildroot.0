From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jan 2019 17:47:11 +0100
Subject: [Buildroot] [PATCH 1/1] motion: bump to version 4.2.1
Message-ID: <20190110164711.11052-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../motion/0001-fix-static-linking-with-webp.patch | 32 ----------------------
 package/motion/motion.hash                         |  2 +-
 package/motion/motion.mk                           |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/motion/0001-fix-static-linking-with-webp.patch

diff --git a/package/motion/0001-fix-static-linking-with-webp.patch b/package/motion/0001-fix-static-linking-with-webp.patch
deleted file mode 100644
index 201ef3d8a5..0000000000
--- a/package/motion/0001-fix-static-linking-with-webp.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3e59613c286316e963d98ea99ded35ded4361c48 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 21 Nov 2018 18:55:31 +0100
-Subject: [PATCH] fix static linking with webp
-
-Static build with webp fails because webp is put before webpmux
-
-Fixes:
- - http://autobuild.buildroot.org/results/4d4e72808300ba1ff79ca794930112b554eb2533
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Motion-Project/motion/pull/850]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 89179e5..60147fb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -276,7 +276,7 @@ if test "${WEBP}" = "yes"; then
-     AC_MSG_RESULT(found)
-     AC_DEFINE([HAVE_WEBP], 1, [Define to 1 if WEBP is around])
-     HAVE_WEBP="yes"
--    TEMP_LIBS="$TEMP_LIBS -lwebp -lwebpmux"
-+    TEMP_LIBS="$TEMP_LIBS -lwebpmux -lwebp"
-   else
-     AC_MSG_RESULT(not found)
-   fi
--- 
-2.14.1
-
diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 9c6a2b7fbe..679defa3d3 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	6ef8504fc5be00a49c82c4045c0004fbf575d9a5df8687025a9b06923efda2a9	motion-release-4.2.tar.gz
+sha256	d97ec6ae766adfd478b6f7f9cc0da5f2fe21faa9366d98664be255714c1cf81d	motion-release-4.2.1.tar.gz
 sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 1bbb548fd7..6dfc5a5619 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = release-4.2
+MOTION_VERSION = release-4.2.1
 MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = COPYING
-- 
2.14.1
