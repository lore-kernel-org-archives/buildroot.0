From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:12 +0100
Subject: [Buildroot] [PATCH/next 8/9] package/optee-benchmark: drop
 constraint on !BR2_STATIC_LIBS
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <27ab55286213ad91fe440c0596f6c3866ce86ab6.1551458062.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Optee-client recently supports BR2_STATIC_LIBS and
BR2_SHARED_LIBS directives. This change removes the constraint
on package optee-benchmarktest that now supports static linking of
embedded binaries.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-benchmark/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
index 0e36549..a4af645 100644
--- a/package/optee-benchmark/Config.in
+++ b/package/optee-benchmark/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_OPTEE_BENCHMARK
 	bool "optee-benchmark"
-	depends on !BR2_STATIC_LIBS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_PACKAGE_LIBYAML
 	help
@@ -10,6 +9,3 @@ config BR2_PACKAGE_OPTEE_BENCHMARK
 	  by the OP-TEE project.
 
 	  http://github.com/linaro-swg/optee_benchmark
-
-comment "optee-benchmark needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-- 
1.9.1
