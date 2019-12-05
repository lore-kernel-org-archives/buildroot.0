From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:08 +0000
Subject: [Buildroot] [PATCH v1 21/30] package/x11r7/xlib_libXcomposite: Add
 host package.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-22-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index 80e94fe37c..f790d6fd3a 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -11,5 +11,11 @@ XLIB_LIBXCOMPOSITE_LICENSE = MIT
 XLIB_LIBXCOMPOSITE_LICENSE_FILES = COPYING
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
 XLIB_LIBXCOMPOSITE_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXfixes xorgproto
+HOST_XLIB_LIBXCOMPOSITE_DEPENDENCIES = \
+	host-xlib_libX11 \
+	host-xlib_libXext \
+	host-xlib_libXfixes \
+	host-xorgproto
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
