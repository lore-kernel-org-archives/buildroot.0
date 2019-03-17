From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 12:15:34 +0100
Subject: [Buildroot] [git commit] package/xapp_xfd: add optional
 xlib_libxkbfile dependency
Message-ID: <20190317111240.A312783C82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38b0aabea070e9e0d48ae28f25f38b472e5f617d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/6a487750c0f08f1a87ae4e30e139e5a1a6004b81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xfd/xapp_xfd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 84b4a77770..8bea7a2fa7 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -12,4 +12,11 @@ XAPP_XFD_LICENSE_FILES = COPYING
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
 XAPP_XFD_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
+XAPP_XFD_CONF_OPTS += --with-xkb
+XAPP_XFD_DEPENDENCIES += xlib_libxkbfile
+else
+XAPP_XFD_CONF_OPTS += --without-xkb
+endif
+
 $(eval $(autotools-package))
