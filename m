From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Sep 2014 17:24:58 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Add optional dependency
	xlib_libXxf86vm
Message-ID: <20140904152909.9FF309D5CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fe492a05ddf4dbe2a9700d76226239ba7b986e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib_libXxf86vm is an optional dependency for the DRI drivers,
quote from mesa3d/configure.ac:

    # add xf86vidmode if available
    PKG_CHECK_MODULES([XF86VIDMODE], [xxf86vm], HAVE_XF86VIDMODE=yes, HAVE_XF86VIDMODE=no)
    if test "$HAVE_XF86VIDMODE" = yes ; then
        dri_modules="$dri_modules xxf86vm"
    fi

Add the package as an optional dependency to have reproducable builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index aea78c3..c2f2b9b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -82,6 +82,9 @@ MESA3D_CONF_OPT += --enable-dri3
 else
 MESA3D_CONF_OPT += --disable-dri3
 endif
+ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
+MESA3D_DEPENDENCIES += xlib_libXxf86vm
+endif
 MESA3D_PROVIDES += libgl
 MESA3D_CONF_OPT += \
 	--enable-dri \
