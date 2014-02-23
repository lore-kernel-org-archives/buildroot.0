From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 16:47:05 +0100
Subject: [Buildroot] [git commit] rt-tests: disable on bfin
Message-ID: <20140223154754.EA5BC99B79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b1edc6490f6f72ce19d8fa6b7986a044359aa0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rt-tests depends on NPTL which is not available on the bfin
architecture.

Fixes:
  http://autobuild.buildroot.net/results/ac9/ac95f73b2351d46d9a8c48caae7f6c3ea124e8bc

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
