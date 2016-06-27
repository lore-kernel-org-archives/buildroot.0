From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:13:53 +0100
Subject: [Buildroot] [PATCH 13/13] package/fftw: add fortran support
In-Reply-To: <1467040433-40356-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040433-40356-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467040433-40356-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/fftw/fftw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 5045ab6..2c7c2c3 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -10,7 +10,7 @@ FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPLv2+
 FFTW_LICENSE_FILES = COPYING
 
-FFTW_CONF_OPTS = --disable-fortran
+FFTW_CONF_OPTS = $(if $(BR2_TOOLCHAIN_HAS_FORTRAN),--enable,--disable)-fortran
 
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
-- 
2.7.3
