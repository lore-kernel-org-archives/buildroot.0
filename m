From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Fri, 27 May 2016 18:21:41 +0200
Subject: [Buildroot] [PATCH] fftw: Disable combined threads when building
	with OpenMP support
Message-ID: <1464366101-637-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/fftw/fftw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 5045ab6..f4b1794 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -35,7 +35,7 @@ FFTW_CONF_OPTS += --enable-threads --with-combined-threads
 else
 FFTW_CONF_OPTS += --disable-threads
 endif
-FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
+FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without-combined-threads --enable,--disable)-openmp
 
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
-- 
1.9.1
