From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 01:31:45 +0100
Subject: [Buildroot] [PATCH 5/7 v5] package/fftw: enable threads when the
	tooclhain has them
In-Reply-To: <cover.1426465664.git.yann.morin.1998@free.fr>
References: <cover.1426465664.git.yann.morin.1998@free.fr>
Message-ID: <09c4654fae8ef69436c60b7ab6c80e654d1d03ff.1426465664.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[based on a patch by Guillaume]
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/fftw/fftw.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 0d15945..7b4e64a 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -23,4 +23,7 @@ FFTW_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
 # ARM optimisations
 FFTW_CONF_OPTS += $(if $(BR2_ARM_CPU_HAS_NEON),--enable,--disable)-neon
 
+# Generic optimisations
+FFTW_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads)
+
 $(eval $(autotools-package))
-- 
1.9.1
