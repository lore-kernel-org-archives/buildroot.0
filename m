From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:17:13 +0200
Subject: [Buildroot] [git commit] package/glmark2: remove unneeded comment
Message-ID: <20160425192429.BDB44803C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c933a5824a90fdd16d264674422919e70610f2bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glmark2 depends on mesa3d which already depends on BR2_INSTALL_LIBSTDCPP
and BR2_TOOLCHAIN_HAS_THREADS_NPTL, glmark2 does not depend on udev so
the comment stating all these dependencies is not needed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
