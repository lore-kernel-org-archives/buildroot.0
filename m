From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:35:19 +0200
Subject: [Buildroot] [git commit] libv4l: needs thread support
Message-ID: <20130528214154.E6D2E9A3F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb71e79f410e9a9d391a8bd83046a4df50b2b1ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/c74/c741ca445a63ce9ab8b0e5b87f3126d7b6051009/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libv4l/Config.in |    5 +++--
 package/opencv/Config.in |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index cb0f43c..70f20ac 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBV4L
 	bool "libv4l"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_JPEG
 	help
 	  libv4l is an accompanying collection of libraries that adds a thin
@@ -58,5 +59,5 @@ comment "v4l2-dbg requires a toolchain with C++ support enabled"
 
 endif
 
-comment "libv4l requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+comment "libv4l requires a toolchain with LARGEFILE and thread support"
+        depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 55b86a0..6a47ac5 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -182,12 +182,13 @@ config BR2_PACKAGE_OPENCV_WITH_TIFF
 config BR2_PACKAGE_OPENCV_WITH_V4L
 	bool "v4l support"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBV4L
 	help
 	  Enable Video 4 Linux support.
 
-comment "v4l support requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "v4l support requires a toolchain with LARGEFILE and thread support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "Install options"
 
