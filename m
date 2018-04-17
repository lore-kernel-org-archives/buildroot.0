From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 17 Apr 2018 20:22:08 +0200
Subject: [Buildroot] [PATCH] package/wmctrl: x-includes and x-libraries must
 be set for cross-compiling
Message-ID: <20180417182208.8404-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

set x-includes and x-libraries configure option for cross-compiling.
wmctrl can use poisoned paths if these options are not passed to
configure script.

Fixes:
http://autobuild.buildroot.net/results/7e5/7e5cba8a5650a00e10d1a5528f38cb2bf772aee1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: J?r?me Pouiller <jezz@sysmic.org>
---
 package/wmctrl/wmctrl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
index 0d4aeebc1d..36ad3513ff 100644
--- a/package/wmctrl/wmctrl.mk
+++ b/package/wmctrl/wmctrl.mk
@@ -11,4 +11,8 @@ WMCTRL_LICENSE_FILES = COPYING
 
 WMCTRL_DEPENDENCIES = libglib2 xlib_libX11 xlib_libXmu
 
+WMCTRL_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+
 $(eval $(autotools-package))
-- 
2.14.3
