From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 21:34:36 +0100
Subject: [Buildroot] [git commit] Revert "ltp-testsuite: don't select
	libtirpc"
Message-ID: <20151211203817.B607182529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edc47efb12de6acd83e150b3a9c59395b3c18fe8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit fc366046429471228c74be7f09d0645256649fd3 in favor of an
alternative solution in a subsequent patch.

Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in | 1 +
 1 file changed, 1 insertion(+)

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
