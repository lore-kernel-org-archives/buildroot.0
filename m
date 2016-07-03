From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:36:21 +0200
Subject: [Buildroot] [git commit] xlib_libXrender: add explicit dependencies
	for host variant
Message-ID: <20160703073819.C7324807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20c127a7f157588a457b09885b1c0f384d2d627d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 949dea3..72626cf 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -11,6 +11,9 @@ XLIB_LIBXRENDER_LICENSE = MIT
 XLIB_LIBXRENDER_LICENSE_FILES = COPYING
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
+HOST_XLIB_LIBXRENDER_DEPENDENCIES = \
+	host-xlib_libX11 host-xproto_renderproto host-xproto_xproto
+
 XLIB_LIBXRENDER_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
