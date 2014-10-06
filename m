From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Oct 2014 00:35:09 +0200
Subject: [Buildroot] [PATCH 3/7 v2] package/freerdp: add missing dependency
In-Reply-To: <cover.1412634775.git.yann.morin.1998@free.fr>
References: <cover.1412634775.git.yann.morin.1998@free.fr>
Message-ID: <35304aa84aa03868090a87e415cb996f56b0ce72.1412634775.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To build the server, FreeRDP needs the Xdamage library.

It seems we were (un)lucky so far, because the server is not built (by
default?), even if Xdamage is enabled.

Add this missing dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/Config.in  | 1 +
 package/freerdp/freerdp.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 81a67ea..23d0b0f 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -17,5 +17,6 @@ config BR2_PACKAGE_FREERDP_NEEDS_XLIBS
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 
 endif
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 49347fa..b50fd1e 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -14,7 +14,7 @@ FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
 
 ifeq ($(BR2_PACKAGE_FREERDP_NEEDS_XLIBS),y)
-FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
+FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor xlib_libXdamage
 FREERDP_CONF_OPTS += -DWITH_X11=ON
 else
 FREERDP_CONF_OPTS += -DWITH_X11=OFF
-- 
1.9.1
