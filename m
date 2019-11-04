From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 23:01:13 +0100
Subject: [Buildroot] [git commit] package/gcc: install wrapper for GDC
Message-ID: <20191104215745.737E58128F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22e82f22d127867ca03f9d04feda939dfbf22998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 86e1d4df51..527f30bf22 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -301,7 +301,7 @@ define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 		*-ar|*-ranlib|*-nm) \
 			ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
 			;; \
-		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran|*-gdc) \
 			rm -f $$i.br_real; \
 			mv $$i $$i.br_real; \
 			ln -sf toolchain-wrapper $$i; \
