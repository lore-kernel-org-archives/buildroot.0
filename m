From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:28:01 +0200
Subject: [Buildroot] [git commit] package/setools: remove C++ dependency on
 comment
Message-ID: <20200723142337.C9FC284051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=478462ca72aabe4e9cee3fc385526b13badd7371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to 4.1.1 (commit 96d3d017963b) removed setools' dependency on
BR2_INSTALL_LIBSTDCPP, but the corresponding inverse dependency on one
of its Kconfig comment was not removed. This led to have the package
being available while a Kconfig comment on non-matched dependencies is
shown. Fix this by removing the dependency on !BR2_INSTALL_LIBSTDCPP on
the Kconfig comment.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/setools/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 9475bbef65..46b3d4525b 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -19,10 +19,10 @@ config BR2_PACKAGE_SETOOLS
 
 	  https://github.com/TresysTechnology/setools
 
-comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
+comment "setools needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+		!BR2_USE_WCHAR
 
 comment "setools needs python3"
 	depends on BR2_USE_MMU
