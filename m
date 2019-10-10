From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:17 +0100
Subject: [Buildroot] [RFC PATCH v1 22/25] package/x11r7/xlib_libXi: Add host
 package.
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-23-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/x11r7/xlib_libXi/xlib_libXi.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index de7f3a7d3c..96c4487a7f 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -16,7 +16,14 @@ XLIB_LIBXI_DEPENDENCIES = \
 	xlib_libXext \
 	xlib_libXfixes \
 	xorgproto
+HOST_XLIB_LIBXI_DEPENDENCIES = \
+	host-pkgconf \
+	host-xlib_libX11 \
+	host-xlib_libXext \
+	host-xlib_libXfixes \
+	host-xorgproto
 
 XLIB_LIBXI_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
