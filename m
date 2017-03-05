From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:10:04 +0100
Subject: [Buildroot] [PATCH 9/9] package/darktable: add libgphoto2 optional
	dependency
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305151004.2815-9-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
---
 package/darktable/darktable.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/darktable/darktable.mk b/package/darktable/darktable.mk
index de08af0..fab5fdd 100644
--- a/package/darktable/darktable.mk
+++ b/package/darktable/darktable.mk
@@ -29,7 +29,6 @@ DARKTABLE_DEPENDENCIES = host-gettext host-intltool host-libxml2 host-libxslt \
 
 # Disable cmstest: needs colord.
 # Disable print module: needs cups.
-# Disable Camera support: needs Gphoto2.
 # Disable colord: needs libcolord-gtk.
 # Disable Map View parts: needs libosmgpsmap.
 # Disable OpenCL support (needs llvm compiler).
@@ -40,7 +39,6 @@ DARKTABLE_CONF_OPTS = \
 	-DBUILD_PRINT=OFF \
 	-DBUILD_USERMANUAL=OFF \
 	-DCUSTOM_CFLAGS=ON \
-	-DUSE_CAMERA_SUPPORT=OFF \
 	-DUSE_COLORD=OFF \
 	-DUSE_GRAPHICSMAGICK=OFF \
 	-DUSE_KWALLET=OFF \
@@ -64,6 +62,13 @@ else
 DARKTABLE_CONF_OPTS += -DUSE_FLICKR=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGPHOTO2),y)
+DARKTABLE_CONF_OPTS += -DUSE_CAMERA_SUPPORT=ON
+DARKTABLE_DEPENDENCIES += libgphoto2
+else
+DARKTABLE_CONF_OPTS += -DUSE_CAMERA_SUPPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECRET),y)
 DARKTABLE_CONF_OPTS += -DUSE_LIBSECRET=ON
 DARKTABLE_DEPENDENCIES += libsecret
-- 
2.9.3
