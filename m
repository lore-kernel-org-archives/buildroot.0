From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 15:37:59 +0200
Subject: [Buildroot] [PATCH] xlib_libxshmfence: drop AUTORECONF
Message-ID: <20180923133759.30626-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 2524acd4179fccc627a72ff188bf51c95fed9876
("package/x11r7/xlib_libxshmfence: bump version to 1.3"), the patch
0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch was dropped, but
the corresponding AUTORECONF = YES was not dropped.

This causes a build issue if just xlib_libxshmfence is built (using
"make xlib_libxshmfence" or using per-package host/target directories):

  >>> xlib_libxshmfence 1.3 Autoreconfiguring
  configure.ac:40: error: must install xorg-macros 1.3 or later before running autoconf/autogen
  configure.ac:40: the top level

This commit fixes that by dropping the no longer needed
AUTORECONF = YES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index f395ebe172..605408fff7 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -12,7 +12,4 @@ XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
 XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
 XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xorgproto
 
-# 0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch
-XLIB_LIBXSHMFENCE_AUTORECONF = YES
-
 $(eval $(autotools-package))
-- 
2.14.4
