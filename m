From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:25:34 +0200
Subject: [Buildroot] [git commit] zmqpp: depends on exception_ptr
Message-ID: <20180603182359.D3ACA7FC34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ab3f47c83e561827d689caf0860951ab933bdce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/20475346bfcb0cff019ad2e98a0e0ab432a6e5bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
