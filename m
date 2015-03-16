From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 01:31:42 +0100
Subject: [Buildroot] [PATCH 2/7 v5] package/fftw: add x86 optimisations
In-Reply-To: <cover.1426465664.git.yann.morin.1998@free.fr>
References: <cover.1426465664.git.yann.morin.1998@free.fr>
Message-ID: <5937b885898d3862c2b504792fded1e201d85392.1426465664.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
---
 package/fftw/fftw.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 78d36e9..fd21fd4 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -14,4 +14,8 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
 
+# x86 optimisations
+FFTW_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE),--enable,--disable)-sse
+FFTW_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
+
 $(eval $(autotools-package))
-- 
1.9.1
