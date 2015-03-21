From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 21 Mar 2015 16:38:23 +0100
Subject: [Buildroot] [PATCH 1/4] wine: Add opengl dependency
Message-ID: <550D906F.5030609@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index a699fff..bd242cf 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -26,7 +26,6 @@ WINE_CONF_OPTS = \
 	--without-netapi \
 	--without-openal \
 	--without-opencl \
-	--without-opengl \
 	--without-osmesa \
 	--without-oss \
 	--without-xshape \
@@ -110,6 +109,13 @@ else
 WINE_CONF_OPTS += --without-cms
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+WINE_CONF_OPTS += --with-opengl
+WINE_DEPENDENCIES += libgl
+else
+WINE_CONF_OPTS += --without-opengl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLU),y)
 WINE_CONF_OPTS += --with-glu
 WINE_DEPENDENCIES += libglu
-- 
1.9.1
