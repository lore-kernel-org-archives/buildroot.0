From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:44:02 +0100
Subject: [Buildroot] [git commit] package/fftw: enable OpenMP if the
	compiler has that
Message-ID: <20150316184431.B29567FA25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84183b3ec32723527434e93224e5914e2ab469bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately, this is limited to internal toolchains; we currently have
no way to know if an external toolchain has support for OpenMP.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fftw/fftw.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
