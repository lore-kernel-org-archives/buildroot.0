From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 11:17:20 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: drop redundant arch
 dependency entries
Message-ID: <20180127101815.9D67183F56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb2bb6648fa09a7b59973a9f889e74d098058bd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TOOLCHAIN_HAS_SYNC_4 is enabled for all these architectures except
arc. There is no need to list them explicitly.

Cc: Romain Naour <romain.naour@gmail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 4c00e40..711c859 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -5,11 +5,6 @@ config BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	# provided in ltp-testsuite
 	default y if BR2_TOOLCHAIN_HAS_SYNC_4
 	default y if BR2_arc
-	default y if BR2_i386
-	default y if BR2_powerpc
-	default y if BR2_powepc64
-	default y if BR2_powerpc64le
-	default y if BR2_x86_64
 	# does not build on nios2, cachectl.h issue
 	depends on !BR2_nios2
 
