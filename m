From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:09 +0200
Subject: [Buildroot] [PATCH 40/69] xapp_xcursorgen: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-41-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index f9ca39d2e71d..4bee26b5dcda 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -10,6 +10,8 @@ XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_LICENSE = MIT
 XAPP_XCURSORGEN_LICENSE_FILES = COPYING
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
+HOST_XAPP_XCURSORGEN_DEPENDENCIES = \
+	host-libpng host-xlib_libX11 host-xlib_libXcursor
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
