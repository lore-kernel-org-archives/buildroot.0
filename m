From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:15 +0200
Subject: [Buildroot] [PATCH 46/69] xlib_libXau: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-47-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xlib_libXau/xlib_libXau.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 8ef48e4a7b30..1c50cb2e4e56 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -11,6 +11,8 @@ XLIB_LIBXAU_LICENSE = MIT
 XLIB_LIBXAU_LICENSE_FILES = COPYING
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xproto_xproto
+HOST_XLIB_LIBXAU_DEPENDENCIES = \
+	host-pkgconf host-xutil_util-macros host-xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
