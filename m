From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 11:09:58 +0200
Subject: [Buildroot] [git commit] libv4l: needs mmu
Message-ID: <20140522091015.DF0CB9CD33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3e412f72e072fe1fd82fb746ad6239eeac0e3d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/989/989d32f3532283817e9439aa78cceff5983dc421/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/Config.in |    2 ++
 package/opencv/Config.in |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 9d04921..2c9a919 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBV4L
 	bool "libv4l"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_JPEG
 	help
 	  libv4l is an accompanying collection of libraries that adds a thin
@@ -61,3 +62,4 @@ endif
 
 comment "libv4l needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 49ada5d..f9ee416 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -189,12 +189,14 @@ config BR2_PACKAGE_OPENCV_WITH_V4L
 	bool "v4l support"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # libv4l fork
 	select BR2_PACKAGE_LIBV4L
 	help
 	  Enable Video 4 Linux support.
 
 comment "v4l support needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
 
 comment "Install options"
 
