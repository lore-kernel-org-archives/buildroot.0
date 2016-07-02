From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Jul 2016 18:46:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: needs
	BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1467477991-13051-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also propagate as reverse dependency to libplayer & tovid.

Fixes
http://autobuild.buildroot.net/results/630/6306757da3be9bb7e3cdcbfc8abb4e64a3fb7913/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libplayer/Config.in | 1 +
 package/mplayer/Config.in   | 2 ++
 package/tovid/Config.in     | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 665b947..37fbb26 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_LIBPLAYER
 config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mplayer
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 97b1f38..76bb6f0 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  MPlayer is a movie player which runs on many systems and supports
@@ -19,6 +20,7 @@ config BR2_PACKAGE_MPLAYER
 
 comment "mplayer needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_MPLAYER
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index 1288f84..d8052ea 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mplayer
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
 	select BR2_PACKAGE_DVDAUTHOR
@@ -30,6 +31,7 @@ comment "tovid needs a toolchain w/ threads, C++, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR
-- 
2.8.1
