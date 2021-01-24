From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:08:22 +0100
Subject: [Buildroot] [git commit] package/x11r7/libxcb: Use host-python3
 instead of host-python(2)
Message-ID: <20210124154916.0B67F7F98E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd46d08fa2f116cc08d8f53278b89f7bd8e4240f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/libxcb/libxcb.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index fb691c2422..9a35a72995 100644
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
+LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
+HOST_LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
