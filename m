From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 28 Nov 2014 19:36:10 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xapp_bdftopcf: Fix linking
	error
Message-ID: <1417199770-6206-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/242/24297c948c0eee684e868ad4bd12f11c3a759248/
http://autobuild.buildroot.net/results/464/464fdc71690a437c1782dd8e4c75d78195bf8bfd/
http://autobuild.buildroot.net/results/77c/77c26d14c8906b44f7c3fa1b3d759556c7318a7e/
and many others ( http://autobuild.buildroot.net/?reason=xapp_bdftopcf-1.0.4 )

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Change LDFLAGS to LIBS (Peter)

 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 950d988..64c2103 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -11,5 +11,8 @@ XAPP_BDFTOPCF_LICENSE = MIT
 XAPP_BDFTOPCF_LICENSE_FILES = COPYING
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 
+# needed for linking against libXfont
+XAPP_BDFTOPCF_MAKE_OPTS += LIBS=-ldl
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.10.4
