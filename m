From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Feb 2018 23:23:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: Switch _SITE to github
Message-ID: <20180203222346.19803-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old site is not available anymore, fribidi.org redirects to
gihub.com now. Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libfribidi/Config.in       | 2 +-
 package/libfribidi/libfribidi.hash | 5 +++--
 package/libfribidi/libfribidi.mk   | 3 +--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libfribidi/Config.in b/package/libfribidi/Config.in
index 74d9c5b431..34cc38e8be 100644
--- a/package/libfribidi/Config.in
+++ b/package/libfribidi/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBFRIBIDI
 	  GNU FriBidi is an implementation of the Unicode
 	  Bidirectional Algorithm (bidi).
 
-	  http://www.fribidi.org/
+	  https://github.com/fribidi/fribidi/
diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 79b5dd3185..660e4f9a07 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,2 +1,3 @@
-# From http://www.fribidi.org/download/fribidi-0.19.7.tar.bz2.sha256
-sha256	08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e	fribidi-0.19.7.tar.bz2
+# Locally computed
+sha256 3fc96fa9473bd31dcb5500bdf1aa78b337ba13eb8c301e7c28923fea982453a8  libfribidi-0.19.7.tar.gz
+sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index a7a8519181..70d9633b21 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBFRIBIDI_VERSION = 0.19.7
-LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
-LIBFRIBIDI_SITE = http://www.fribidi.org/download
+LIBFRIBIDI_SITE = $(call github,fribidi,fribidi,$(LIBFRIBIDI_VERSION))
 LIBFRIBIDI_LICENSE = LGPL-2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
-- 
2.11.0
