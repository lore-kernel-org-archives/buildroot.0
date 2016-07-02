From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:16 +0200
Subject: [Buildroot] [PATCH 47/69] xlib_libXcursor: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-48-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 508b5e21c522..c59c01a51f77 100644
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
-- 
2.1.0
