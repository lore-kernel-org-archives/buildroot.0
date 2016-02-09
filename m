From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 9 Feb 2016 23:04:11 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xapp_xf86dga: remove dependencies
	on Xt/Xaw/Xmu
Message-ID: <1455055451-19200-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.0.3, xapp_xf86dga no longer uses libXt, libXaw and
libXmu. So these dependencies should be removed from the .mk file.

They were already removed from Config.in, leading to messages like:
Makefile:475: *** xlib_libXaw is in the dependency chain of xapp_xf86dga
that has added it to its _DEPENDENCIES variable without selecting it or
depending on it from Config.in.  Stop.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index a2e08da..fe8e427 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -12,9 +12,6 @@ XAPP_XF86DGA_LICENSE_FILES = COPYING
 XAPP_XF86DGA_DEPENDENCIES = \
 	host-pkgconf \
 	xlib_libX11 \
-	xlib_libXxf86dga \
-	xlib_libXt \
-	xlib_libXaw \
-	xlib_libXmu
+	xlib_libXxf86dga
 
 $(eval $(autotools-package))
-- 
2.7.0
