From: Joel Carlson <joelsoncarl@gmail.com>
Date: Mon,  9 Sep 2019 12:52:15 -0600
Subject: [Buildroot] [PATCH 2/2] package/c-capnproto: require GCC 5 for C++14
In-Reply-To: <20190909185215.26744-1-JoelsonCarl@gmail.com>
References: <20190909185215.26744-1-JoelsonCarl@gmail.com>
Message-ID: <20190909185215.26744-2-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds a dependency on GCC 5 to have C++14. Since c-capnproto is useless
without having capnproto, must keep dependencies matched so you aren't
able to select c-capnproto when you can't select capnproto.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
 package/c-capnproto/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.17.1
