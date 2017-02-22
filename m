From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 22 Feb 2017 16:10:10 +0300
Subject: [Buildroot] [PATCH] vlc: disable on ARC
Message-ID: <1487769010-17746-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package fails when building for ARC due to ARC toolchain issue.

Marking this with special comment "# ARC toolchain issue" as the package
is to be enabled as soon as issue with ARC toolchain is solved.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/vlc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 166e7d2..34c6cc0 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_VLC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	# ARC toolchain issue
+	depends on !BR2_arc
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
-- 
2.7.4
