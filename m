From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Jun 2017 23:47:44 +0200
Subject: [Buildroot] [PATCH] package/libiconv: bump to 1.15
Message-ID: <20170603214744.20344-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libiconv doesn't build with gcc 6 due to a macro in stdio.h using gets()
which has been removed with the C11 standard.

_GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");

With libiconv 1.15, this macro is protected by

 #if HAVE_RAW_DECL_GETS && !defined __cplusplus
 _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
 #endif

Fixes:
http://autobuild.buildroot.net/results/61b/61bbfc839f99feb043d3456f107429d6e5319258

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libiconv/libiconv.hash | 2 +-
 package/libiconv/libiconv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiconv/libiconv.hash b/package/libiconv/libiconv.hash
index 83de76f..440daee 100644
--- a/package/libiconv/libiconv.hash
+++ b/package/libiconv/libiconv.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	72b24ded17d687193c3366d0ebe7cde1e6b18f0df8c55438ac95be39e8a30613	libiconv-1.14.tar.gz
+sha256	ccf536620a45458d26ba83887a983b96827001e92a13847b45e4925cc8913178	libiconv-1.15.tar.gz
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index af8f345..9a81336 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBICONV_VERSION = 1.14
+LIBICONV_VERSION = 1.15
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
 LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
-- 
2.9.4
