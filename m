From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 May 2014 13:47:31 +0100
Subject: [Buildroot] [PATCH v2] clapack: Disable for MIPS platforms
Message-ID: <1399380451-25912-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable this package for MIPS because it needs IRIX headers and
libraries.

Fixes:
   http://autobuild.buildroot.net/results/370/370f964441722675820c644403dde7fbc683a315/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/armadillo/Config.in |    2 ++
 package/clapack/Config.in   |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 2251d91..b3ba2fc 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,10 +1,12 @@
 comment "armadillo needs a toolchain w/ C++, largefile"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
+	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # clapack
+	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 	select BR2_PACKAGE_CLAPACK
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index a77094f..68a6dde 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CLAPACK
 	bool "cblas/clapack"
 	depends on BR2_LARGEFILE
+	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	help
 	  BLAS and LAPACK C implementation (f2c'ed version of).
 
@@ -20,3 +21,4 @@ config BR2_PACKAGE_CLAPACK_ARITH_H
 
 comment "cblas/clapack needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
+	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
-- 
1.7.1
