From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun, 23 Feb 2014 00:07:29 +0100
Subject: [Buildroot] [PATCH v2 2/2] rt-tests: disable on bfin
In-Reply-To: <1393110449-12710-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1393110449-12710-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1393110449-12710-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rt-tests depends on NPTL which is not available on the bfin
architecture.

Fixes:
  http://autobuild.buildroot.net/results/ac9/ac95f73b2351d46d9a8c48caae7f6c3ea124e8bc

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/rt-tests/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index a8cede0..ff4284e 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_RT_TESTS
 	# priority-inheritance mutex needs NPTL
 	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
 	# no NPTL for these archs
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
+	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc && !BR2_bfin
 	# no _tid field in 'struct sigevent'
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el)
@@ -28,7 +28,7 @@ config BR2_PACKAGE_RT_TESTS
 
 comment "rt-tests needs a toolchain w/ threads"
 	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
+	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc && !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "rt-tests needs an (e)glibc toolchain"
-- 
1.8.3.2
