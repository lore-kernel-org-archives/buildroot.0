From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Jun 2018 12:11:14 +0200
Subject: [Buildroot] [PATCH 1/1] zmqpp: depends on exception_ptr
Message-ID: <20180603101114.12722-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/20475346bfcb0cff019ad2e98a0e0ab432a6e5bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zmqpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index b9d4dcfd64..e9209543a6 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_ZMQPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
@@ -17,6 +18,9 @@ comment "zmqpp needs a toolchain w/ C++, NPTL, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
+comment "zmqpp needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 if BR2_PACKAGE_ZMQPP
 
 config BR2_PACKAGE_ZMQPP_CLIENT
-- 
2.14.1
