From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Jun 2020 22:31:25 +0200
Subject: [Buildroot] [PATCH v2, 2/3] package/libupnpp: bump to version 0.19.2
In-Reply-To: <20200623203126.1024202-1-fontaine.fabrice@gmail.com>
References: <20200623203126.1024202-1-fontaine.fabrice@gmail.com>
Message-ID: <20200623203126.1024202-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting from this version libupnp has been replaced with libnpupnp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnpp/Config.in     | 4 ++--
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 5 ++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index a71eff5423..41afa9300f 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBUPNPP
 	bool "libupnpp"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_LIBNPUPNP
 	help
 	  The libupnpp C++ library wraps libupnp for easier use by
 	  upmpdcli and upplay.
diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 993dbc89ae..fb510236a3 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.17.2.tar.gz.sha256
-sha256  5abaaf353a1e9c3482d61ef2627b650285d59f27c1ee60d35b8951952261374f  libupnpp-0.17.2.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.19.2.tar.gz.sha256
+sha256  c9623533271605c92dfa603f5fe0ab6d3d5b4384a0c9173800784f4aa643a190  libupnpp-0.19.2.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index c9c103d9b5..ef1816166e 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.17.2
+LIBUPNPP_VERSION = 0.19.2
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
-LIBUPNPP_DEPENDENCIES = host-pkgconf expat libcurl \
-	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
+LIBUPNPP_DEPENDENCIES = host-pkgconf expat libcurl libnpupnp
 
 $(eval $(autotools-package))
-- 
2.26.2
