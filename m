From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 22:41:57 +0100
Subject: [Buildroot] [git commit] package/wlroots: package does not require
 locale support
Message-ID: <20201123213324.F187681171@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae9d6fc6f40e417c603a769ed0e23a35b7f27cb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop dependency on BR2_ENABLE_LOCALE, which was marked as a dependency of
libinput which is selected by wlroots.  However, libinput does not depend on
BR2_ENABLE_LOCALE since commit bef6b92b67e (package/libinput: remove
dependency on BR2_ENABLE_LOCALE).

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wlroots/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index eb4c4725ac..2f72fd4945 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -3,16 +3,14 @@ comment "wlroots needs udev, mesa3d w/ EGL and GLES support"
 		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
 		!BR2_PACKAGE_HAS_UDEV
 
-comment "wlroots needs a toolchain w/ threads, locale, dynamic library"
+comment "wlroots needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_ENABLE_LOCALE || \
 		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_WLROOTS
 	bool "wlroots"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
-	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	# Technically wlroots should work with any OpenGL implementation
 	# which provides EGL, GLES2, and libgbm; but in practice only
