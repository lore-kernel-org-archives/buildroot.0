From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 18:27:42 +0100
Subject: [Buildroot] [git commit] libraw: add dependency on host-pkgconf
Message-ID: <20160214205002.6930B81801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c51bddcdda2794a6b5a1e441c0d6cb030ed5b64f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise, it fails to autoreconf with a weird error message:

configure.ac:15: error: possibly undefined macro: AC_SUBST
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:40: error: possibly undefined macro: AC_MSG_WARN

Indeed, the configure.ac uses PKG_CHECK_MODULES(), so we need to have
the corresponding m4 file installed by host-pkgconf.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw/libraw.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 03f09f9..7fc4709 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -17,6 +17,7 @@ LIBRAW_CONF_OPTS += \
 	--disable-demosaic-pack-gpl3
 LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
+LIBRAW_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_JASPER),y)
 LIBRAW_CONF_OPTS += --enable-jasper
