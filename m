From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 17:31:26 +0100
Subject: [Buildroot] [PATCH 7/7 v7] package/fftw: enable OpenMP if the
	compiler has that
In-Reply-To: <cover.1426523417.git.yann.morin.1998@free.fr>
References: <cover.1426523417.git.yann.morin.1998@free.fr>
Message-ID: <d316f0f87e1a502eef6d85b9a4d515ad1da8c5ae.1426523417.git.yann.morin.1998@free.fr>
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
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

---
Changes v6 -> v7:
  - treat openmp like all other options
---
 package/fftw/fftw.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index aea3910..1148909 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -35,6 +35,7 @@ FFTW_CONF_OPTS += --enable-threads --with-combined-threads
 else
 FFTW_CONF_OPTS += --disable-threads
 endif
+FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
 
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
-- 
1.9.1
