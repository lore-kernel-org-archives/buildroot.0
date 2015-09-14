From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 14:36:19 +0200
Subject: [Buildroot] [git commit] stress-ng: Depend on kernel headers >= 3.3
Message-ID: <20150914125247.5AF1281E67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8064b82c2a0cde40220457eb06ac04b8a1621dd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perf.c need PERF_COUNT_HW_REF_CPU_CYCLES generic PMU event which
is available only since 3.3 kernel version

Fixes:
  http://autobuild.buildroot.net/results/88909b118dc927f31ed5c3b5f3513734a88085a9
  http://autobuild.buildroot.net/results/dac6a85fdd721b959175caf5629b91dee717c3c6
  http://autobuild.buildroot.net/results/88909b118dc927f31ed5c3b5f3513734a88085a9

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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
