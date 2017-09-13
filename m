From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 20:45:42 +0200
Subject: [Buildroot] [PATCH 1/3] package/libglu: needs host-pkgconf
Message-ID: <20170913184544.5670-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build error

>>> libglu 9.0.0 Autoreconfiguring
configure.ac:50: error: Could not locate the pkg-config autoconf macros.
  These are usually located in /usr/share/aclocal/pkg.m4. If your macros
  are in a different location, try setting the environment variable
  ACLOCAL="aclocal -I/other/macro/dir" before running autoreconf.
configure.ac:50: the top level
autom4te: /home/buildroot/br4/output/host/bin/m4 failed with exit status: 1

using this defconfig

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_NVIDIA_DRIVER=y
BR2_PACKAGE_LIBGLU=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglu/libglu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
index 038d281c59..0e5242f85e 100644
--- a/package/libglu/libglu.mk
+++ b/package/libglu/libglu.mk
@@ -12,6 +12,6 @@ LIBGLU_LICENSE_FILES = include/GL/glu.h
 LIBGLU_INSTALL_STAGING = YES
 # upstream does not distribute a autoconf?ed configure script
 LIBGLU_AUTORECONF = YES
-LIBGLU_DEPENDENCIES = libgl
+LIBGLU_DEPENDENCIES = libgl host-pkgconf
 
 $(eval $(autotools-package))
-- 
2.11.0
