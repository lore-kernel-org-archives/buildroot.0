From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 26 Jan 2018 13:03:18 +0200
Subject: [Buildroot] [PATCH 2/2] ltp-testsuite: drop redundant arch
 dependency entries
In-Reply-To: <944db376505dab7095cf32949160c0d024d92926.1516964598.git.baruch@tkos.co.il>
References: <944db376505dab7095cf32949160c0d024d92926.1516964598.git.baruch@tkos.co.il>
Message-ID: <2f61c63d53f8ba4ea0b65942b57f67a156fbf778.1516964598.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_TOOLCHAIN_HAS_SYNC_4 is enabled for all these architectures except
arc. There is no need to list them explicitly.

Cc: Romain Naour <romain.naour@gmail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ltp-testsuite/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 4c00e40f330e..711c859e6caf 100644
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
 
-- 
2.15.1
