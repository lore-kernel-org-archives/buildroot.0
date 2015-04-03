From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 00:18:05 +0200
Subject: [Buildroot] [git commit] wine: Add opengl dependency
Message-ID: <20150403221841.727D9819B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=981d614d9f60985a7f54968673d2e1e6b8799038
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

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
