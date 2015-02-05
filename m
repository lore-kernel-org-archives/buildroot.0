From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 5 Feb 2015 13:42:28 +0000
Subject: [Buildroot] [PATCH] libvips: requires C++ support
Message-ID: <1423143748-63093-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libvips requires C++ support, otherwise it will fail with an error
message like this one:

error: ../libvips/.libs/libvips.so: No such file or directory

Fixes:

  http://autobuild.buildroot.net/results/cdc7cf5d3501f80c74b70aa09f93b2ad4e2f8602/
  http://autobuild.buildroot.net/results/39173dbcbbd0a243900ea583cec024b51f8b803a/
  http://autobuild.buildroot.net/results/6794705195bcdb636a8e6582ef5a1e153d4d66b3/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libvips/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libvips/Config.in b/package/libvips/Config.in
index 1a0d35c..8395ffb 100644
--- a/package/libvips/Config.in
+++ b/package/libvips/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBVIPS
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -13,6 +14,7 @@ config BR2_PACKAGE_LIBVIPS
 
 	  http://www.vips.ecs.soton.ac.uk/
 
-comment "libvips needs a toolchain w/ wchar, threads"
+comment "libvips needs a toolchain w/ wchar, threads, C++"
         depends on BR2_USE_MMU
-        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
1.7.1
