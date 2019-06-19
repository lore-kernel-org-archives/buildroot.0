From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 14:35:22 +0200
Subject: [Buildroot] [git commit] package/stress-ng: re-enable package on
 microblaze
Message-ID: <20190619123537.9821E81484@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f9d78a4c4b5d3300aac923a372d14b9e4aa25e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package stress-ng has a dependency to keyutils, but keyutils has been
re-enabled with previous patch. Re-enable package by removing 'depends
on !BR_microblaze' from stress-ng Config.in.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stress-ng/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index fe92a7eb40..4fcfa3554c 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_STRESS_NG
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
-	depends on !BR2_microblaze # keyutils
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2 and ARC
 	depends on !BR2_nios2
 	depends on !BR2_arc
@@ -21,7 +20,7 @@ config BR2_PACKAGE_STRESS_NG
 	  http://kernel.ubuntu.com/~cking/stress-ng/
 
 comment "stress-ng needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.3"
-	depends on !BR2_microblaze && !BR2_nios2 && !BR2_arc
+	depends on !BR2_nios2 && !BR2_arc
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 \
 		|| BR2_TOOLCHAIN_USES_MUSL
