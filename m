From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:38 +0000
Subject: [Buildroot] [RFC PATCH v3 24/30] package/x11r7/xlib_libXi: Add host
 package.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-25-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

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
