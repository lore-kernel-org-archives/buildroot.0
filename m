From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:32 +0100
Subject: [Buildroot] [PATCH 14/38] package/kodi: add mips64el support
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index aab8c624c..cd24fa8b5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libcdio, and others
 	default y if (BR2_aarch64 || BR2_arm || \
 		(BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || \
+		(BR2_mips64el && BR2_TOOLCHAIN_USES_GLIBC) || \
 		BR2_powerpc64 || BR2_powerpc64le || \
 		BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
-- 
2.11.0
