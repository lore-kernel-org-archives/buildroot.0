From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 4 Jul 2016 16:22:59 +0100
Subject: [Buildroot] [PATCH] openblas: build only C-language BLAS if the
	toolchain doesn't have Fortran
Message-ID: <1467645779-35133-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openblas/openblas.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index d07d09d..609169f 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -19,9 +19,10 @@ OPENBLAS_MAKE_OPTS += CROSS=1
 # Set OpenBLAS target
 OPENBLAS_MAKE_OPTS += TARGET=$(BR2_PACKAGE_OPENBLAS_TARGET)
 
-# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
-# hidden symbol to our toolchain infrastructure
+# Build only C-language BLAS if the toolchain doesn't have Fortran
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),)
 OPENBLAS_MAKE_OPTS += ONLY_CBLAS=1
+endif
 
 # Enable/Disable multi-threading (not for static-only since it uses dlfcn.h)
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_STATIC_LIBS),y:)
-- 
2.7.3
