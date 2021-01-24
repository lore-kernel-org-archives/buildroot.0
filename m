From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Sun, 24 Jan 2021 11:57:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/x11r7/libxcb: Use host-python3
 instead of host-python(2)
In-Reply-To: <20210124105736.33533-1-titouanchristophe@gmail.com>
References: <20210124105736.33533-1-titouanchristophe@gmail.com>
Message-ID: <20210124105736.33533-3-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/x11r7/libxcb/libxcb.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index fb691c2422..fc209a2a1a 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -14,17 +14,17 @@ LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_DEPENDENCIES = \
 	host-libxslt xcb-proto xlib_libXdmcp xlib_libXau \
-	host-xcb-proto host-python host-pkgconf
+	host-xcb-proto host-python3 host-pkgconf
 HOST_LIBXCB_DEPENDENCIES = \
 	host-libxslt host-xcb-proto host-xlib_libXdmcp \
-	host-xlib_libXau host-python host-pkgconf
+	host-xlib_libXau host-python3 host-pkgconf
 
 LIBXCB_CONF_OPTS = --with-doxygen=no
 HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
 
-# libxcb is not python3 friendly, so force the python interpreter
-HOST_LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
-LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
+# Force detection of Buildroot host-python3 over system python
+HOST_LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
+LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.3
