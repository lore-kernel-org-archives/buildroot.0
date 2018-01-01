From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 17:05:40 +0100
Subject: [Buildroot] [git commit] vlc: enable package on ARC
Message-ID: <20180101160619.C49A2839DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6681eeb8f7291930e4855268ae66a8164164511
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
CC: Alexey Brodkin <abrodkin@synopsys.com>
CC: arc-buildroot at synopsys.com
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 78023fb..166e7d2 100644
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
