From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 31 Dec 2017 09:55:04 -0200
Subject: [Buildroot] [PATCH] curlpp: new package
Message-ID: <1514721304-12634-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/curlpp/Config.in   | 12 ++++++++++++
 package/curlpp/curlpp.hash |  5 +++++
 package/curlpp/curlpp.mk   | 18 ++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/curlpp/Config.in
 create mode 100644 package/curlpp/curlpp.hash
 create mode 100644 package/curlpp/curlpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6cc7a095002..32194307c925 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1566,6 +1566,7 @@ F:	package/rtl8189fs/
 F:	package/xr819-xradio/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
+F:	package/curlpp/
 F:	package/libgdiplus/
 F:	package/mongodb/
 F:	package/pimd/
diff --git a/package/Config.in b/package/Config.in
index bd39a374f06f..62242b2ee8ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1337,6 +1337,7 @@ menu "Networking"
 	source "package/canfestival/Config.in"
 	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
+	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
diff --git a/package/curlpp/Config.in b/package/curlpp/Config.in
new file mode 100644
index 000000000000..a23e5d939bd6
--- /dev/null
+++ b/package/curlpp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CURLPP
+	bool "curlpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBCURL
+	help
+	  cURLpp is a C++ wrapper for libcURL.
+
+	  http://www.curlpp.org/
+
+comment "curlpp needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/curlpp/curlpp.hash b/package/curlpp/curlpp.hash
new file mode 100644
index 000000000000..2b14a235ee77
--- /dev/null
+++ b/package/curlpp/curlpp.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256 97e3819bdcffc3e4047b6ac57ca14e04af85380bd93afe314bee9dd5c7f46a0a  v0.8.1.tar.gz
+
+# Hash for license files:
+sha256 8b9e3afd4d06ad3c169e788e5187a3e9f4f35671e9a7322f7e74bea9643b5b5a  doc/LICENSE
diff --git a/package/curlpp/curlpp.mk b/package/curlpp/curlpp.mk
new file mode 100644
index 000000000000..97717100c446
--- /dev/null
+++ b/package/curlpp/curlpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# curlpp
+#
+################################################################################
+
+CURLPP_VERSION = 0.8.1
+CURLPP_SITE = https://github.com/jpbarrette/curlpp/archive
+CURLPP_SOURCE = v$(CURLPP_VERSION).tar.gz
+
+CURLPP_LICENSE = MIT
+CURLPP_LICENSE_FILES = doc/LICENSE
+
+CURLPP_INSTALL_STAGING = YES
+
+CURLPP_DEPENDENCIES = libcurl
+
+$(eval $(cmake-package))
-- 
1.9.1
