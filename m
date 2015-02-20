From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Feb 2015 18:22:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xfs: Fix linking error
Message-ID: <1424452969-6166-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/a0b/a0bd6312d450fb78db7f57d3db9e01ba2b26687d//
http://autobuild.buildroot.net/results/534/5347293cdcd7eb2e84b762ee9d073f3b937b5312//
http://autobuild.buildroot.net/results/b5e/b5e7599ba33dc43a8f7e81bfa6d7ad9cb0ac68a1//

and many others (microblazeel only)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xfs/xapp_xfs.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 3e70455..2284fba 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -11,4 +11,7 @@ XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
+# needed for linking against libXfont
+XAPP_XFS_MAKE_OPTS += LIBS=-ldl
+
 $(eval $(autotools-package))
-- 
1.7.10.4
