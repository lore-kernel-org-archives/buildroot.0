From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue,  8 Oct 2013 10:36:48 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-userland: needs threads
Message-ID: <1381221408-15700-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/rpi-userland/Config.in |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index da5726f..d4e28a1 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_arm
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_HAS_OPENGL_EGL
 	select BR2_PACKAGE_HAS_OPENGL_ES
 	select BR2_PACKAGE_HAS_OPENVG
@@ -16,5 +17,5 @@ config BR2_PACKAGE_RPI_USERLAND
 
 	  https://github.com/raspberrypi/userland/
 
-comment "rpi-userland requires a toolchain with C++ and LARGEFILE support"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
+comment "rpi-userland requires a toolchain with C++, LARGEFILE and threads support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.10.4
