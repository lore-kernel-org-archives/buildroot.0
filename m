From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Jun 2018 21:52:47 +0200
Subject: [Buildroot] [PATCH 1/2] libv4l: add optional sdl2_image dependency
Message-ID: <20180629195248.4008-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 11061306c7..95a700b2d5 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -73,6 +73,10 @@ else
 LIBV4L_CONF_OPTS += --disable-v4l-utils
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
+LIBV4L_DEPENDENCIES += sdl2_image
+endif
+
 LIBV4L_CONF_ENV += LIBS="$(LIBV4L_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.14.1
