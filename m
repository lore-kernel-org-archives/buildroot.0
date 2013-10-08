From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:17:08 +0200
Subject: [Buildroot] [git commit] rpi-userland: needs threads
Message-ID: <20131008203903.E51869B989@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7f43d42bfa1a2d5866a5a9df5462111b694adb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c3b4c09edee2499e811808018be1858bdee70436/

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
