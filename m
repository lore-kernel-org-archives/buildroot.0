From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 01:31:46 +0100
Subject: [Buildroot] [PATCH 6/7 v5] package/fftw: enable OpenMP if the
	compiler has that
In-Reply-To: <cover.1426465664.git.yann.morin.1998@free.fr>
References: <cover.1426465664.git.yann.morin.1998@free.fr>
Message-ID: <531b7e2f32850460b86fb190d6268558f845f89f.1426465664.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately, this is limited to internal toolchains; we currently have
no way to know if an external toolchain has support for OpenMP.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/fftw/fftw.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 7b4e64a..8ae0824 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -25,5 +25,6 @@ FFTW_CONF_OPTS += $(if $(BR2_ARM_CPU_HAS_NEON),--enable,--disable)-neon
 
 # Generic optimisations
 FFTW_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads)
+FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable-openmp,--disable-openmp)
 
 $(eval $(autotools-package))
-- 
1.9.1
