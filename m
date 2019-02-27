From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Feb 2019 23:13:10 +0100
Subject: [Buildroot] [PATCH/next v1] zbar: bump version to 0.22
Message-ID: <20190227221310.19394-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change from git download to official release and
  download site (drop need for autoreconf)

- drop dependency on kernel headers >= 3.17 (should
  be fixed with commit 'v4l2: make ZBar build and run on
  Kernels < 3.16' (see [1])

[1] https://git.linuxtv.org/zbar.git/commit/?id=fa5c48127ec1e3670e28540c2e6a03431ebac5b8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/zbar/Config.in | 6 ++----
 package/zbar/zbar.hash | 2 +-
 package/zbar/zbar.mk   | 6 +++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/zbar/Config.in b/package/zbar/Config.in
index e850c1f02b..e0b28365fc 100644
--- a/package/zbar/Config.in
+++ b/package/zbar/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_ZBAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
 	depends on BR2_USE_MMU # libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # libv4l
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # v4l2_query_ext_ctrl
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBV4L
 	help
@@ -11,7 +10,6 @@ config BR2_PACKAGE_ZBAR
 
 	  https://git.linuxtv.org/zbar.git/about/
 
-comment "zbar needs a toolchain w/ threads, C++ and headers >= 3.17"
+comment "zbar needs a toolchain w/ threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index 6735bc67d6..0f44d0f5c0 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 94c71c6110c705f07ba5ba2803583d09b3853e8773169c86bdcf831443156aaa zbar-57d601e82089f2f31de9e1683c3834f237421f5d.tar.gz
+sha256 1ba9e94c7217a8bd3800f9f3abddf3ed393a62cdf141a709765aad2788744eb7 zbar-0.22.tar.bz2
 sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89 LICENSE
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index c3f0797c55..d2423df696 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 57d601e82089f2f31de9e1683c3834f237421f5d
-ZBAR_SITE = git://linuxtv.org/zbar.git
+ZBAR_VERSION = 0.22
+ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
+ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE
 ZBAR_INSTALL_STAGING = YES
-ZBAR_AUTORECONF = YES
 ZBAR_DEPENDENCIES = libv4l jpeg
 # add host-gettext for AM_ICONV macro
 ZBAR_DEPENDENCIES += host-gettext
-- 
2.20.1
