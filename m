From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 19:00:50 +0100
Subject: [Buildroot] [PATCH 1/3] package/gcc: install wrapper for GDC
In-Reply-To: <20191102180052.23080-1-eric.le.bihan.dev@free.fr>
References: <20191102180052.23080-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191102180052.23080-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
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
-- 
2.21.0
