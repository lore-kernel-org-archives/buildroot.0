From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 22:11:31 +0200
Subject: [Buildroot] [git commit] package/mesa3d: depend on udev
Message-ID: <20140611202619.0DA409CF49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f95cecf5865ae68788ff3d0d8429c95c6ea2d9f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

checking for LIBUDEV... no
configure: error: libudev-dev required for building DRI

Fixes
http://autobuild.buildroot.net/results/16d/16d12b986051db884eae86e9658e6c4fc0f28885/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 6621154..e698b3e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -10,6 +10,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XSERVER_XORG_SERVER
+	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -125,6 +126,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs a toolchain w/ C++, largefile, NPTL"
+comment "mesa3d needs udev /dev management and a toolchain w/ C++, largefile, NPTL"
 	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
