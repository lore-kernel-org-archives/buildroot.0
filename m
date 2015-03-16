From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:44:02 +0100
Subject: [Buildroot] [git commit] package/fftw: disable fortran
Message-ID: <20150316184431.A090C7FA25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10ce987aa5f5dc9a4a3c5cd8fda60431a7a79772
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do not have any fortran package and we do not build a fortran
compiler.

Still, an external toolchain may have a fortran compiler and that is
totally useless to us, since we anyway have no fortran package...

So, entirely disable fortran support; that will at least slightly speed
up the build in case an external toolchain has a fortran compiler.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[based on a patch by Guillaume]
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fftw/fftw.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 154f522..3acde57 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -10,6 +10,8 @@ FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPLv2+
 FFTW_LICENSE_FILES = COPYING
 
+FFTW_CONF_OPTS = --disable-fortran
+
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
