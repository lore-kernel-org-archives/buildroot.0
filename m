From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:10:40 +0100
Subject: [Buildroot] [git commit] guile: use libltdl, needs dynamic libraries
Message-ID: <20151125222250.4B3B07FC4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1ad7a74587843925b85adb2cfb6d35bfb3247f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/8d0/8d0e8ab0e7a83fda9ee65f973b5b749b246f1c1a/
http://autobuild.buildroot.net/results/381/38137ccf29023f38c540483a6655c4b8d6778abd/
http://autobuild.buildroot.net/results/1d8/1d864588f71b8c13a67781cf91ad058c74eb7abc/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/guile/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index d24f318..acb0974 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GUILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc
 	depends on BR2_USE_WCHAR # libunistring
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBUNISTRING
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
@@ -14,6 +15,7 @@ config BR2_PACKAGE_GUILE
 
 	  http://www.gnu.org/software/guile
 
-comment "guile needs a toolchain w/ threads, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "guile needs a toolchain w/ threads, wchar, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS
 
