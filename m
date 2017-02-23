From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:05:39 +0100
Subject: [Buildroot] [git commit] vlc: disable on ARC
Message-ID: <20170223210711.477568184E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07d43820f28a523f09a4885b9a13b26833999f37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package fails when building for ARC due to ARC toolchain issue.

Marking this with special comment "# ARC toolchain issue" as the package
is to be enabled as soon as the issue with the ARC toolchain is
resolved.

Fixes:

  http://autobuild.buildroot.net/results/ebae0ed90b88db5a3b34a46f2ca1ff97e01fe83c/

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
[Thomas:
 - add autobuilder reference
 - propagate dependency to Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 166e7d2..78023fb 100644
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
@@ -34,5 +36,6 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
 
 comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
 	depends on BR2_USE_MMU
+	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
