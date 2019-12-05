From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:09 +0000
Subject: [Buildroot] [PATCH v1 22/30] package/xlib_libXdamage: Add host
 package
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-23-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index cc5493ff6c..c98c28412a 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -11,5 +11,10 @@ XLIB_LIBXDAMAGE_LICENSE = MIT
 XLIB_LIBXDAMAGE_LICENSE_FILES = COPYING
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
 XLIB_LIBXDAMAGE_DEPENDENCIES = xlib_libX11 xlib_libXfixes xorgproto
+HOST_XLIB_LIBXDAMAGE_DEPENDENCIES = \
+	host-xlib_libX11 \
+	host-xlib_libXfixes \
+	host-xorgproto
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
