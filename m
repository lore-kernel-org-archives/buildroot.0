From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 12:00:34 +0200
Subject: [Buildroot] [git commit] package/capnproto: require GCC 5 for C++14
Message-ID: <20190910095650.B21CA8D9F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edc482d2c5b19231569f19bb754055bf8df5148f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds dependency on at least GCC 5 to have C++14 language features that
are required starting in version 0.7.0 of capnproto.

Fixes:
http://autobuild.buildroot.org/results/5c09e745cab822d830f73e33647f3b0e765c9181
(capnproto build failure)

Fixes:
http://autobuild.buildroot.org/results/743c750e9932658c20965a25de89c3f21a1d43e9
(host-capnproto build failure)

This updated dependency is propagated to capnproto unique reverse
dependency, c-capnproto.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-capnproto/Config.in | 10 +++++-----
 package/capnproto/Config.in   | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
index acad5a69c8..293e4483cd 100644
--- a/package/c-capnproto/Config.in
+++ b/package/c-capnproto/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_C_CAPNPROTO
 	bool "c-capnproto"
 	depends on BR2_USE_MMU # capnproto
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # capnproto
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # capnproto
+	depends on BR2_HOST_GCC_AT_LEAST_5 # capnproto
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # capnproto
 	depends on BR2_INSTALL_LIBSTDCPP # capnproto
 	depends on BR2_TOOLCHAIN_HAS_THREADS # capnproto
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # capnproto
@@ -12,10 +12,10 @@ config BR2_PACKAGE_C_CAPNPROTO
 	  plugin for C. Requires regular Cap'n Proto and only
 	  provides serialization (no RPC).
 
-comment "c-capnproto needs host and target gcc >= 4.8 w/ C++, threads, atomic"
+comment "c-capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic"
 	depends on BR2_USE_MMU
-	depends on!BR2_HOST_GCC_AT_LEAST_4_8 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+	depends on!BR2_HOST_GCC_AT_LEAST_5 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
index a979a334ff..cd9cb647af 100644
--- a/package/capnproto/Config.in
+++ b/package/capnproto/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_CAPNPROTO
 	bool "capnproto"
 	depends on BR2_USE_MMU
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_HOST_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
@@ -15,10 +15,10 @@ config BR2_PACKAGE_CAPNPROTO
 
 	  https://capnproto.org/index.html
 
-comment "capnproto needs host and target gcc >= 4.8 w/ C++, threads, atomic"
+comment "capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic"
 	depends on BR2_USE_MMU
-	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+	depends on !BR2_HOST_GCC_AT_LEAST_5 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_ATOMIC
