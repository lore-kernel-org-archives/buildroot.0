From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:57:48 +0200
Subject: [Buildroot] [git commit] package/x11r7/libxcb: force the use of
	python2
Message-ID: <20160626125758.4014E81D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcfbff46ab6f125065e4e2a7b8b82cb1f5a8f762
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libxcb in its current state is not python3-compatible:
https://bugs.freedesktop.org/show_bug.cgi?id=96395

Fixes
http://autobuild.buildroot.net/results/c74/c74fa243bf319472dca66982323df6c2a983642b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
