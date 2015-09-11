From: Julien Corjon <corjon.j@ecagroup.com>
Date: Fri, 11 Sep 2015 18:19:11 +0200
Subject: [Buildroot] [PATCH 1/1] stress-ng: Depend on kernel headers >= 3.3
Message-ID: <1441988351-9923-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perf.c need PERF_COUNT_HW_REF_CPU_CYCLES instruction which is available
only since 3.3 kernel version

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/stress-ng/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index cdf9984..1e475b1 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_STRESS_NG
 	# disabled on musl: stress-malloc.c needs mallopt() and M_MMAP_THRESHOLD
 	# disabled on uClibc: stress-aio.c needs aio.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	# perf.c needs PERF_COUNT_HW_STALLED_CYCLES_FRONTEND
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	depends on !BR2_microblaze # keyutils
 	depends on !BR2_STATIC_LIBS # keyutils
 	select BR2_PACKAGE_KEYUTILS # stress-key.c needs keyutils.h
@@ -18,8 +18,8 @@ config BR2_PACKAGE_STRESS_NG
 
 	  http://kernel.ubuntu.com/~cking/stress-ng/
 
-comment "stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.0"
+comment "stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.3"
 	depends on !BR2_microblaze
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 \
 		|| !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.1.4
