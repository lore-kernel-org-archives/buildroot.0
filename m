From: Joel Carlson <joelsoncarl@gmail.com>
Date: Mon,  9 Sep 2019 12:52:14 -0600
Subject: [Buildroot] [PATCH 1/2] package/capnproto: require GCC 5 for C++14
Message-ID: <20190909185215.26744-1-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds dependency on at least GCC 5 to have C++14 language features that
are required starting in version 0.7.0 of capnproto.

Fixes:
http://autobuild.buildroot.org/results/5c09e745cab822d830f73e33647f3b0e765c9181
(capnproto build failure)

Fixes:
http://autobuild.buildroot.org/results/743c750e9932658c20965a25de89c3f21a1d43e9
(host-capnproto build failure)

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>

---
Picking this up from https://patchwork.ozlabs.org/patch/1150841/
which only changed the config comment dependencies and not the actual
build dependencies.
---
 package/capnproto/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.17.1
