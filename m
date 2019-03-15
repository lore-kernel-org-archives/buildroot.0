From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:58:27 +0100
Subject: [Buildroot] [git commit] package/optee-benchmark: needs fork
Message-ID: <20190315205531.1AFD77FFDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae08209ba1e3c9016c17c24168c65a598561ffdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ea61442275d1790a29e02e2fa27f072e4c12daa7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-benchmark/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
index 0bc4af4d3a..5fd365a9e3 100644
--- a/package/optee-benchmark/Config.in
+++ b/package/optee-benchmark/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPTEE_BENCHMARK
 	bool "optee-benchmark"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_PACKAGE_LIBYAML
@@ -12,4 +13,5 @@ config BR2_PACKAGE_OPTEE_BENCHMARK
 	  http://github.com/linaro-swg/optee_benchmark
 
 comment "optee-benchmark needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
