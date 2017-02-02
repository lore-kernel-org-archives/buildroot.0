From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:31 +0100
Subject: [Buildroot] [PATCH 13/38] package/kodi: add powerpc64 support
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure support was added by this commit:
https://github.com/xbmc/xbmc/commit/7e3b5672cc425ab9161f4b33e7f2cd77637cd6fc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a16bcc6c5..aab8c624c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libcdio, and others
 	default y if (BR2_aarch64 || BR2_arm || \
 		(BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || \
+		BR2_powerpc64 || BR2_powerpc64le || \
 		BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
@@ -32,7 +33,7 @@ config BR2_PACKAGE_KODI_GL_EGL
 	depends on !BR2_aarch64 && !BR2_arm # kodi needs egl/gles on arm
 
 comment "kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend"
-	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_aarch64 && !BR2_arm # kodi needs egl/gles on arm
 	depends on !BR2_PACKAGE_KODI_GL_EGL && !BR2_PACKAGE_KODI_EGL_GLES
 
 comment "kodi requires an OpenGL ES and EGL backend"
-- 
2.11.0
