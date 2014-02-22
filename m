From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 23:10:56 +0100
Subject: [Buildroot] [PATCH] libcec: not available on pure static builds
Message-ID: <1393107056-29830-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcec needs libdl, so it cannot work on pure static builds.

Fixes:

  http://autobuild.buildroot.org/results/670/670ce46627daaa4ae9ecdb8ffb6f97d0574354d4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcec/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 4cfe1ce..8097472 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBCEC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
@@ -10,6 +11,6 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
-comment "libcec needs a toolchain w/ C++, wchar, threads"
+comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR
+		!BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
-- 
1.8.3.2
