From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 22:13:31 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_bdftopcf: Fix linking
	error
Message-ID: <20141128222144.DE5D57FF1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da654a7b65b1f7da70b3c0fd1685272c255d893f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/242/24297c948c0eee684e868ad4bd12f11c3a759248/
http://autobuild.buildroot.net/results/464/464fdc71690a437c1782dd8e4c75d78195bf8bfd/
http://autobuild.buildroot.net/results/77c/77c26d14c8906b44f7c3fa1b3d759556c7318a7e/
and many others ( http://autobuild.buildroot.net/?reason=xapp_bdftopcf-1.0.4 )

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
