From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Jul 2019 14:12:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: bump version to 1.0.5
Message-ID: <20190707121232.4333-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, switched _SITE to github.

Removed --with-glib=no, glib support was removed upstream:
https://github.com/fribidi/fribidi/commit/03ba9fc5358bb3dd78c4e8708abefaad106475d0

Autoreconf is not needed anymore after upstream fixed
https://github.com/fribidi/fribidi/issues/35

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Please note that this patch does not switch to meson compared to
http://patchwork.ozlabs.org/patch/1111286/

 package/libfribidi/libfribidi.hash |  5 +++--
 package/libfribidi/libfribidi.mk   | 11 ++---------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 79b5dd3185..d4bdd9657c 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,2 +1,3 @@
-# From http://www.fribidi.org/download/fribidi-0.19.7.tar.bz2.sha256
-sha256	08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e	fribidi-0.19.7.tar.bz2
+# Locally computed
+sha256 6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d723107e8a7e6158e4ce  fribidi-1.0.5.tar.bz2
+sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index a7a8519181..b90f4e31e6 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,19 +4,12 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 0.19.7
+LIBFRIBIDI_VERSION = 1.0.5
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
-LIBFRIBIDI_SITE = http://www.fribidi.org/download
+LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
-# Ships a beta libtool version hence our patch doesn't apply.
-# Run autoreconf to regenerate ltmain.sh.
-LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
-# libglib2 dependency causes a build failure, and this optional
-# dependency is going to be removed upstream, see
-# https://github.com/behdad/fribidi/pull/14
-LIBFRIBIDI_CONF_OPTS = --with-glib=no
 
 $(eval $(autotools-package))
-- 
2.20.1
