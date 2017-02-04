From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:25 +0100
Subject: [Buildroot] [PATCH v3 12/38] package/kodi: add aarch64 support
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure support was added by this commit:
https://github.com/xbmc/xbmc/commit/62c160c23ed4c074d106f30a43638fac66568ac6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 84319b91a..a16bcc6c5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	depends on BR2_USE_MMU # libcdio, and others
-	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
+	default y if (BR2_aarch64 || BR2_arm || \
+		(BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || \
+		BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
@@ -27,14 +29,14 @@ config BR2_PACKAGE_KODI_GL_EGL
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on !BR2_arm # kodi needs egl/gles on arm
+	depends on !BR2_aarch64 && !BR2_arm # kodi needs egl/gles on arm
 
 comment "kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_KODI_GL_EGL && !BR2_PACKAGE_KODI_EGL_GLES
 
 comment "kodi requires an OpenGL ES and EGL backend"
-	depends on BR2_arm
+	depends on BR2_aarch64 || BR2_arm
 	depends on !BR2_PACKAGE_KODI_EGL_GLES
 
 menuconfig BR2_PACKAGE_KODI
-- 
2.11.0
