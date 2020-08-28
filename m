From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:43:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mpv: atomic is
 mandatory
Message-ID: <20200828164650.7E7B7862C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44dff152c67cfba62d92d7c3d3faa3cfc27bd0db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

__sync builtins have been dropped since version 0.24.0 and
https://github.com/mpv-player/mpv/commit/c3205d294e519f994829d9355eb133670729aab4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c6c381c483712bd193b621e70fc2e14579f91231)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/Config.in   | 4 ++--
 package/tovid/Config.in | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 32910f2245..697ad57ba6 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MPV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
@@ -25,6 +25,6 @@ config BR2_PACKAGE_MPV
 
 comment "mpv needs a toolchain w/ threads, gcc >= 4.5"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index d5b7a28314..f4ddcfa4a0 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # mpv
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mpv
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # mpv
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC # mpv
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
@@ -31,7 +31,7 @@ config BR2_PACKAGE_TOVID
 comment "tovid needs a toolchain w/ threads, C++, wchar, gcc >= 4.5"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 \
 		|| !BR2_INSTALL_LIBSTDCPP \
@@ -41,7 +41,7 @@ comment "tovid needs a toolchain w/ threads, C++, wchar, gcc >= 4.5"
 comment "tovid depends on python or python3"
 	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
