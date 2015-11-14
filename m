From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 09:39:51 +0100
Subject: [Buildroot] [git commit branch/next] libxmlpp: bump to version
	2.40.1
Message-ID: <20151114084218.AE66B8046B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7f2977eb6b17713f9741db26a8efe9083849b05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxmlpp/Config.in     |    7 ++++---
 package/libxmlpp/libxmlpp.hash |    4 ++--
 package/libxmlpp/libxmlpp.mk   |    4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index cb5f3c0..0f2da98 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBXMLPP
 	bool "libxml++"
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GLIBMM
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glibmm -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
@@ -11,7 +12,7 @@ config BR2_PACKAGE_LIBXMLPP
 
 	  http://libxmlplusplus.sourceforge.net/
 
-comment "libxml++ needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-	!BR2_TOOLCHAIN_HAS_THREADS
+comment "libxml++ needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+		||!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU
diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index 9e1ae18..5fc7f5b 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/2.34/libxml++-2.34.2.sha256sum
-sha256	77daba20ab76631071d4ed4cc18fa2e981160ca05ae661e8d146f2b0728f9baa	libxml++-2.34.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/2.40/libxml++-2.40.1.sha256sum
+sha256	4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f35463e9	libxml++-2.40.1.tar.xz
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index d9dd862..d428199 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXMLPP_VERSION_MAJOR = 2.34
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).2
+LIBXMLPP_VERSION_MAJOR = 2.40
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
 LIBXMLPP_LICENSE = LGPLv2.1 (library), LGPLv2+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
