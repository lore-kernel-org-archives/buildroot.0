From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:40 +0000
Subject: [Buildroot] [RFC PATCH v3 26/30] package/x11r7/xlib_libXtst: Add
 host package.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-27-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

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
