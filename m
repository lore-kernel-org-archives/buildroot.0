From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 14:07:41 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] xlib_libxshmfence: drop
 AUTORECONF
Message-ID: <20181005120646.D79D98D322@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=932781d2af352905af8c41073e37a9441bb90267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

In commit 2524acd4179fccc627a72ff188bf51c95fed9867
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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bcf4b72def49ce82fef2582f45414594f6b8dffa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index f51cf0d5cb..8ae1379596 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -12,7 +12,4 @@ XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
 XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
 XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xproto_xproto
 
-# 0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch
-XLIB_LIBXSHMFENCE_AUTORECONF = YES
-
 $(eval $(autotools-package))
