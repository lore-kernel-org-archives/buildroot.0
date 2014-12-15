From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 15 Dec 2014 09:56:59 +0100
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
Message-ID: <1418633819-26569-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/lxc/Config.in           |    2 +-
 package/python-ipaddr/Config.in |    4 ++--
 package/qemu/Config.in          |   10 +++++-----
 package/qt5/qt5base/Config.in   |    4 ++--
 package/squid/Config.in         |    2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index a90e58e..cf715ab 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -23,4 +23,4 @@ comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS \
-                || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+		|| !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/python-ipaddr/Config.in b/package/python-ipaddr/Config.in
index cce67c1..746d720 100644
--- a/package/python-ipaddr/Config.in
+++ b/package/python-ipaddr/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_IPADDR
-       depends on BR2_PACKAGE_PYTHON # included since python3.3
-       bool "python-ipaddr"
+	depends on BR2_PACKAGE_PYTHON # included since python3.3
+	bool "python-ipaddr"
 	help
 	  An IPv4/IPv6 manipulation library in Python. This library is
 	  used to create/poke/manipulate IPv4 and IPv6 addresses and
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ff11208..5882571 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -85,11 +85,11 @@ config BR2_PACKAGE_QEMU_SDL
 comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_FDT
-        bool "Enable FDT"
-        select BR2_PACKAGE_DTC
-        help
-          Say 'y' here to have QEMU capable of constructing Device Trees,
-          and passing them to the VMs.
+	bool "Enable FDT"
+	select BR2_PACKAGE_DTC
+	help
+	  Say 'y' here to have QEMU capable of constructing Device Trees,
+	  and passing them to the VMs.
 
 endif # BR2_PACKAGE_QEMU_HAS_EMULS
 
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 7b334b4..30f9a49 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -37,7 +37,7 @@ config BR2_PACKAGE_QT5BASE_EXAMPLES
 	  If unsure, say N.
 
 config BR2_PACKAGE_QT5BASE_NETWORK
-       def_bool y
+	def_bool y
 
 config BR2_PACKAGE_QT5BASE_CONCURRENT
 	bool "concurrent module"
@@ -45,7 +45,7 @@ config BR2_PACKAGE_QT5BASE_CONCURRENT
 	  This options enables the Qt5Concurrent library.
 
 config BR2_PACKAGE_QT5BASE_SQL
-       def_bool y
+	def_bool y
 
 if BR2_PACKAGE_QT5BASE_SQL
 config BR2_PACKAGE_QT5BASE_MYSQL
diff --git a/package/squid/Config.in b/package/squid/Config.in
index ce38371..9953b0d 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -2,7 +2,7 @@ comment "squid needs a toolchain w/ C++, IPv6, headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # toolchain too old
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 \
-        || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
-- 
1.7.9.5
