From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 23:05:41 +0200
Subject: [Buildroot] [PATCH] clapack: disable for m68k coldfire
Message-ID: <20160731210541.GA15636@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Either a assembler bug or a platform limitation.
Fixes:
http://autobuild.buildroot.net/results/d24a2e9b35c98a10585cd28b3306a09c49163296/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/clapack/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index ff7f8a7..7d1f940 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_CLAPACK
 	# because of the "_" symbol prefix:
 	# http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/
 	depends on !BR2_bfin
+	# assembler: Error: value out of range
+	depends on !BR2_m68k_cf
 	help
 	  BLAS and LAPACK C implementation (f2c'ed version of).
 
-- 
1.7.10.4
