From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 19:41:48 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/mesa3d: depend on udev
In-Reply-To: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402508508-437-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

checking for LIBUDEV... no
configure: error: libudev-dev required for building DRI

Fixes
http://autobuild.buildroot.net/results/16d/16d12b986051db884eae86e9658e6c4fc0f28885/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index fc96cc5..d3ded82 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -10,6 +10,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
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
-- 
1.7.10.4
