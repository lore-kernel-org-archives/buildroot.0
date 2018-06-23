From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Jun 2018 17:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf: add dependency on gcc >= 4.8
Message-ID: <20180623153232.3782-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 3.6.0, protobuf requires C++11

Fixes:
 - http://autobuild.buildroot.net/results/bb299008423edf4c65ade6c159e33c4216428bf1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in         |  8 ++++----
 package/mosh/Config.in             |  8 ++++----
 package/protobuf-c/Config.in       |  6 +++---
 package/protobuf/Config.in         | 10 +++++-----
 package/python-protobuf/Config.in  |  2 +-
 package/riemann-c-client/Config.in |  6 +++---
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ccd3fbe13f..c9e61a5622 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -559,7 +559,7 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	# riemann-c-client -> protobuf-c
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_HOST_GCC_AT_LEAST_4_5
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
@@ -588,15 +588,15 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 	bool "write_prometheus"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
-	depends on BR2_HOST_GCC_AT_LEAST_4_5 # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf-c
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Publishes values using an embedded HTTP server, in a format
 	  compatible with Prometheus' collectd_exporter.
 
-comment "write_prometheus needs a toolchain w/ C++, host gcc >= 4.5"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_5
+comment "write_prometheus needs a toolchain w/ C++, host gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_COLLECTD_WRITESENSU
diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index da8a305a06..00da41c794 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,7 +1,7 @@
-comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.5"
+comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+		|| !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
@@ -9,8 +9,8 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
-	depends on BR2_HOST_GCC_AT_LEAST_4_5 # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # protobuf
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index 6f916c57fe..6d7e7e11df 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -4,14 +4,14 @@ config BR2_PACKAGE_PROTOBUF_C
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_HOST_GCC_AT_LEAST_4_5 # host-protobuf
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-protobuf
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
 
 	  https://github.com/protobuf-c/protobuf-c
 
-comment "protobuf-c needs a toolchain w/ C++, threads, host gcc >= 4.5"
+comment "protobuf-c needs a toolchain w/ C++, threads, host gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_HOST_GCC_AT_LEAST_4_5
+		|| !BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index c91e401508..2829b2a5a7 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -30,8 +30,8 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_5
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_STATIC_LIBS
 	help
 	  Protocol buffers are Google's language-neutral,
@@ -40,8 +40,8 @@ config BR2_PACKAGE_PROTOBUF
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.5"
+comment "protobuf needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_5 \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 500c82a531..8a70e80ad7 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_HOST_GCC_AT_LEAST_4_5 # host-protobuf
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-protobuf
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python implementation of the Google Protocol Buffers.
diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
index 91b13b7901..c241487c7f 100644
--- a/package/riemann-c-client/Config.in
+++ b/package/riemann-c-client/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
-	depends on BR2_HOST_GCC_AT_LEAST_4_5 # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf-c
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Riemann-c-client is a C client library for the Riemann
@@ -13,7 +13,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 
 	  https://github.com/algernon/riemann-c-client
 
-comment "riemann-c-client needs a toolchain w/ C++, threads, host gcc >= 4.5"
+comment "riemann-c-client needs a toolchain w/ C++, threads, host gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_HOST_GCC_AT_LEAST_4_5
+		|| !BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
2.14.1
