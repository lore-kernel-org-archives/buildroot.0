From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 11:34:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/glmark2: remove unneeded comment
Message-ID: <1461576857-25683-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glmark2 depends on mesa3d which already depends on BR2_INSTALL_LIBSTDCPP
and BR2_TOOLCHAIN_HAS_THREADS_NPTL, glmark2 does not depend on udev so
the comment stating all these dependencies is not needed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/glmark2/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 052e820..9167fc5 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -21,7 +21,3 @@ config BR2_PACKAGE_GLMARK2
 	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
 
 	  https://github.com/glmark2/glmark2
-
-comment "glmark2 needs udev /dev management and a toolchain w/ C++, NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
-- 
2.8.0.rc3
