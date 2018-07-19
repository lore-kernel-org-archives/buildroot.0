From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:53:32 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libv4l: add optional
 sdl2_image dependency
Message-ID: <20180719095055.471CA88E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d190b3a3645caab679471afffc2d8774422d2498
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The configure.ac script simply uses PKG_CHECK_MODULES(), so there is
not --enable/--disable option.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1ef2944a356c648ee04309de1b21bdfe5f46b4e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
