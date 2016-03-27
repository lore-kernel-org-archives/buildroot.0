From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Mar 2016 11:16:54 +0200
Subject: [Buildroot] [PATCH v2 09/18] package/vlc: mark as broken due to
	incompatibility with ffmpeg 3.0
In-Reply-To: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459070223-5901-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upcoming vlc 3.0 will have support for ffmpeg 3.0 again, backporting
the changes to 2.2.x is not easily possible:
https://trac.macports.org/ticket/50697#comment:3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 166e7d2..d25305b 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_VLC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on BROKEN # ffmpeg 3.0
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
-- 
2.8.0.rc3
