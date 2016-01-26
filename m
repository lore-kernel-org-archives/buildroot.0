From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:20:05 +0100
Subject: [Buildroot] [git commit] package/mesa3d: fix musl build
Message-ID: <20160201224702.44CE17F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca108a803e8b265c975fd5bd4e09d8953ba61481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compile error occured using an allyesconfig, it seems it has not been
caught by the autobuilders yet.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/0003-musl.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

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
