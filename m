From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:34:50 +0200
Subject: [Buildroot] [git commit] xlib_libXcursor: add explicit dependencies
	for host variant
Message-ID: <20160703073819.61AF2807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f941549ccb48c69eeedb946ef3aad0d72a19e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 508b5e2..c59c01a 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -11,6 +11,9 @@ XLIB_LIBXCURSOR_LICENSE = MIT
 XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
+HOST_XLIB_LIBXCURSOR_DEPENDENCIES = \
+	host-xlib_libX11 host-xlib_libXfixes host-xlib_libXrender \
+	host-xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
