From: daggs <daggs@gmx.com>
Date: Mon, 23 May 2016 20:03:54 +0200
Subject: [Buildroot] [PATCH v1 2/3] add support for odroid mali GL in kodi
Message-ID: <trinity-706efa54-6bd9-477c-8338-38db661c3d22-1464026634841@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Dagg <daggs@gmx.com>

---
 package/kodi/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ff2e75c..7b26abf 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
+	default y if (BR2_arm || BR2_aarch64 || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
@@ -24,7 +24,7 @@ config BR2_PACKAGE_KODI_GL
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on !BR2_arm # kodi needs egl/gles on arm
+	depends on !BR2_arm || !BR2_aarch64 # kodi needs egl/gles on arm
 
 comment "kodi needs an OpenGL or an openGL ES and EGL backend"
 	depends on BR2_i386 || BR2_x86_64
-- 
2.8.3
