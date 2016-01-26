From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 20:56:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix musl build
Message-ID: <1453838206-10048-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compile error occured using an allyesconfig, it seems it has not been
caught by the autobuilders yet.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/0003-musl.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/mesa3d/0003-musl.patch

diff --git a/package/mesa3d/0003-musl.patch b/package/mesa3d/0003-musl.patch
new file mode 100644
index 0000000..8f7ba77
--- /dev/null
+++ b/package/mesa3d/0003-musl.patch
@@ -0,0 +1,18 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/plain/main/mesa/musl-fixes.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- ./src/gallium/winsys/svga/drm/vmw_screen.h.orig
++++ ./src/gallium/winsys/svga/drm/vmw_screen.h
+@@ -34,7 +34,7 @@
+ #ifndef VMW_SCREEN_H_
+ #define VMW_SCREEN_H_
+ 
+-
++#include <sys/stat.h>
+ #include "pipe/p_compiler.h"
+ #include "pipe/p_state.h"
+ 
-- 
2.7.0.rc3
