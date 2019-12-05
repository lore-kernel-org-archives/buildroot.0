From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:07 +0000
Subject: [Buildroot] [PATCH v1 20/30] package/x11r7/xlib_libXScrnSaver: Add
 host package.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-21-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 92abb902eb..0e37c49338 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -11,6 +11,11 @@ XLIB_LIBXSCRNSAVER_LICENSE = MIT
 XLIB_LIBXSCRNSAVER_LICENSE_FILES = COPYING
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
+HOST_XLIB_LIBXSCRNSAVER_DEPENDENCIES = \
+	host-xlib_libX11 \
+	host-xlib_libXext \
+	host-xorgproto
 XLIB_LIBXSCRNSAVER_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
