From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 00:18:15 +0200
Subject: [Buildroot] [git commit] wine: Add xlib_libXext dependency
Message-ID: <20150403221841.7B30681774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3ef90f8b244602e5c41c81907c8148d449a5bce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes window size issues.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index bd242cf..188c7cc 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -27,9 +27,7 @@ WINE_CONF_OPTS = \
 	--without-openal \
 	--without-opencl \
 	--without-osmesa \
-	--without-oss \
-	--without-xshape \
-	--without-xshm
+	--without-oss
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
 # construct the filename of the gcc to call.  But for external
@@ -207,6 +205,13 @@ else
 WINE_CONF_OPTS += --without-xcursor
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
+WINE_CONF_OPTS += --with-xshape --with-xshm
+WINE_DEPENDENCIES += xlib_libXext
+else
+WINE_CONF_OPTS += --without-xshape --without-xshm
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 WINE_CONF_OPTS += --with-xinput --with-xinput2
 WINE_DEPENDENCIES += xlib_libXi
