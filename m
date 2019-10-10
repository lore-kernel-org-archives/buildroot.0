From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:19 +0100
Subject: [Buildroot] [RFC PATCH v1 24/25] package/x11r7/xlib_libXtst: Add
 host package.
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-25-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index e0d7e8217c..38878b0e0e 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -17,4 +17,11 @@ XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libXi \
 	xorgproto
 
+HOST_XLIB_LIBXTST_DEPENDENCIES = \
+	host-xlib_libX11 \
+	host-xlib_libXext \
+	host-xlib_libXi \
+	host-xorgproto
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
