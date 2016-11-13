From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 12:23:18 +0100
Subject: [Buildroot] [git commit] package/weston: fix build without EGL
Message-ID: <20161113112336.3AE9C7FF11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bf4bd7ab08db7165439532a0ba3fc8ca1f40108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/378/378ffddcebd0ab3dabfdb268614d1344a38e8dd1/
    http://autobuild.buildroot.org/results/3c2/3c25333d3c5838bea27540d8ac752c8bdf4db843/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...form-include-weston-egl-ext.h-only-if-ENA.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/weston/0002-shared-platform-include-weston-egl-ext.h-only-if-ENA.patch b/package/weston/0002-shared-platform-include-weston-egl-ext.h-only-if-ENA.patch
new file mode 100644
index 0000000..baa3a4f
--- /dev/null
+++ b/package/weston/0002-shared-platform-include-weston-egl-ext.h-only-if-ENA.patch
@@ -0,0 +1,38 @@
+From e338ced1e04bf4b97322d5eed2b5bdf5b052095a Mon Sep 17 00:00:00 2001
+From: Krzysztof Konopko <kris@youview.com>
+Date: Thu, 15 Sep 2016 13:01:49 +0200
+Subject: [PATCH] shared/platform: include weston-egl-ext.h only if ENABLE_EGL
+ is defined
+
+Including `weston-egl-ext.h` causes compilation failure for configurations
+with EGL disabled.
+
+Verified with `--disable-egl`, `--disable-x11-compositor`
+and `--disable-drm-compositor`.
+
+Signed-off-by: Krzysztof Konopko <kris@youview.com>
+Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
+[yann.morin.1998 at free.fr: backported from upstream]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ shared/platform.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/shared/platform.h b/shared/platform.h
+index 1eb96fd..30db1a6 100644
+--- a/shared/platform.h
++++ b/shared/platform.h
+@@ -33,9 +33,9 @@
+ #include <wayland-egl.h>
+ #include <EGL/egl.h>
+ #include <EGL/eglext.h>
+-#endif
+ 
+ #include "weston-egl-ext.h"
++#endif
+ 
+ #ifdef  __cplusplus
+ extern "C" {
+-- 
+2.7.4
+
