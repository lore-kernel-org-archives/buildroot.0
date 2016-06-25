From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Jun 2016 00:49:04 +0200
Subject: [Buildroot] [PATCH] package/x11r7/libxcb: force the use of python2
Message-ID: <1466894944-15317-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libxcb in its current state is not python3-compatible:
https://bugs.freedesktop.org/show_bug.cgi?id=96395

Fixes
http://autobuild.buildroot.net/results/c74/c74fa243bf319472dca66982323df6c2a983642b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/libxcb/libxcb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index a740638..7f7823b 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -19,5 +19,9 @@ LIBXCB_DEPENDENCIES = \
 LIBXCB_CONF_OPTS = --with-doxygen=no
 HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
 
+# libxcb is not python3 friendly, so force the python interpreter
+HOST_LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.8.1
