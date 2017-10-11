From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 11 Oct 2017 15:50:05 +0300
Subject: [Buildroot] [PATCH] vlc: enable package on ARC
Message-ID: <20171011125005.25545-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now using arc-2017.09-rc1 toolchain it is possible to
build vlc package.

Note this patch has a prerequisite that updates ARC prebuilt toolchain,
http://patchwork.ozlabs.org/patch/824311/

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
CC: Alexey Brodkin <abrodkin@synopsys.com>
CC: arc-buildroot at synopsys.com
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 78023fb500..166e7d256a 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -11,8 +11,6 @@ config BR2_PACKAGE_VLC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-	# ARC toolchain issue
-	depends on !BR2_arc
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
@@ -36,6 +34,5 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
 
 comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-- 
2.11.0
