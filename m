From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:13 -0000
Subject: [Buildroot] [git commit branch/next] rpi-userland: not available
	for static only builds
Message-ID: <20150808105600.DA44E7FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa4d2a66d7d7ef7bd43df492995f00f58aef3097
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/e9e/e9ea569b5fe6fd875b3fa8f4eee82e3fddd95e90/
http://autobuild.buildroot.net/results/c97/c97f7df043469bc51ebbb41ddf30f8e82d4e6bb5/
http://autobuild.buildroot.net/results/ba8/ba82769109f205123834627bbf782bd1811ea43e/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 6adb9e3..0e88908 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_arm
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_LIBOPENVG
@@ -39,6 +40,7 @@ config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
 
 endif
 
-comment "rpi-userland needs a toolchain w/ C++, threads"
+comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
 	depends on BR2_arm
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
