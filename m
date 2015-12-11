From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Dec 2015 09:51:42 +0100
Subject: [Buildroot] [PATCHv2 3/3] Revert "ltp-testsuite: don't select
	libtirpc"
In-Reply-To: <1449823902-3309-1-git-send-email-patrickdepinguin@gmail.com>
References: <1449823902-3309-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1449823902-3309-3-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This reverts commit fc366046429471228c74be7f09d0645256649fd3 in favor of an
alternative solution in a subsequent patch.

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/ltp-testsuite/Config.in | 1 +
 1 file changed, 1 insertion(+)

v2: reorder patches only

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index bd540f2..8475902 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
 	help
-- 
1.9.5
