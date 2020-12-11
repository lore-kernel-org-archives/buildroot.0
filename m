From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 11:32:44 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/cage: package
 does not require locale support
Message-ID: <20201211123117.61A5D81944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d4c34750ceaa1ca9eb20c7aed0dfb9df86b0db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Drop dependency on BR2_ENABLE_LOCALE, which was marked as a dependency
of wlroots, but wlroots does not depend on it anymore.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 210e9b7b245d6388097ba0dac0c51b82964d09fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cage/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/cage/Config.in b/package/cage/Config.in
index c8097751f0..3bef08f037 100644
--- a/package/cage/Config.in
+++ b/package/cage/Config.in
@@ -3,16 +3,14 @@ comment "cage needs udev, mesa3d w/ EGL and GLES support"
 		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
 		!BR2_PACKAGE_HAS_UDEV
 
-comment "cage needs a toolchain w/ threads, locale, dynamic library"
+comment "cage needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_ENABLE_LOCALE || \
 		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_CAGE
 	bool "cage"
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
-	depends on BR2_ENABLE_LOCALE # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # wlroots
 	depends on BR2_PACKAGE_MESA3D_OPENGL_ES # wlroots
