From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 01:31:43 +0100
Subject: [Buildroot] [PATCH 3/7 v5] package/fftw: add ARM optimisations
In-Reply-To: <cover.1426465664.git.yann.morin.1998@free.fr>
References: <cover.1426465664.git.yann.morin.1998@free.fr>
Message-ID: <571d54234d6782550cbf3ecfe3df20d886ec9d01.1426465664.git.yann.morin.1998@free.fr>
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
index fd21fd4..856adad 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -18,4 +18,7 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-qu
 FFTW_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE),--enable,--disable)-sse
 FFTW_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
 
+# ARM optimisations
+FFTW_CONF_OPTS += $(if $(BR2_ARM_CPU_HAS_NEON),--enable,--disable)-neon
+
 $(eval $(autotools-package))
-- 
1.9.1
