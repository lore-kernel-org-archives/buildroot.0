From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:19:31 +0200
Subject: [Buildroot] [git commit] libv4l: add optional sdl2_image dependency
Message-ID: <20180630161639.C0AD983740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1ef2944a356c648ee04309de1b21bdfe5f46b4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure.ac script simply uses PKG_CHECK_MODULES(), so there is
not --enable/--disable option.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
