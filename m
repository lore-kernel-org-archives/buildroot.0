From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Mar 2019 08:54:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/optee-benchmark: needs fork
Message-ID: <20190315075454.22670-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ea61442275d1790a29e02e2fa27f072e4c12daa7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/optee-benchmark/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
index b9326e0432..07de2a3f80 100644
--- a/package/optee-benchmark/Config.in
+++ b/package/optee-benchmark/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPTEE_BENCHMARK
 	bool "optee-benchmark"
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # optee-client
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
@@ -13,4 +14,5 @@ config BR2_PACKAGE_OPTEE_BENCHMARK
 	  http://github.com/linaro-swg/optee_benchmark
 
 comment "optee-benchmark needs a toolchain w/ dynamic library and threads"
+	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.14.1
