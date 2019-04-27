From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 14:24:36 +0200
Subject: [Buildroot] [git commit] package/xapp_xfd: fix build with NLS
Message-ID: <20190427121956.EBE1A8156E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73661a7550f426b9c816c30fc122bd4ee775b547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/e6009f0232eb60ed10eb46b39edf125369eb12e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xfd/xapp_xfd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 8bea7a2fa7..149e24b79a 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -9,8 +9,14 @@ XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
 XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFD_LICENSE = MIT
 XAPP_XFD_LICENSE_FILES = COPYING
-XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
+XAPP_XFD_DEPENDENCIES = \
+	freetype \
+	fontconfig \
+	xlib_libXaw \
+	xlib_libXft \
+	$(TARGET_NLS_DEPENDENCIES)
 XAPP_XFD_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
+XAPP_XFD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
 XAPP_XFD_CONF_OPTS += --with-xkb
