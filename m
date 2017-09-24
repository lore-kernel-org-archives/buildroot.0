From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:36:11 +0200
Subject: [Buildroot] [git commit] package/libglu: needs host-pkgconf
Message-ID: <20170924124819.D2FAD8004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fe55978e62eff9897482ad47298a575aaf54381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libglu/libglu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
index 038d281..0e5242f 100644
--- a/package/libglu/libglu.mk
+++ b/package/libglu/libglu.mk
@@ -12,6 +12,6 @@ LIBGLU_LICENSE_FILES = include/GL/glu.h
 LIBGLU_INSTALL_STAGING = YES
 # upstream does not distribute a autoconf??ed configure script
 LIBGLU_AUTORECONF = YES
-LIBGLU_DEPENDENCIES = libgl
+LIBGLU_DEPENDENCIES = libgl host-pkgconf
 
 $(eval $(autotools-package))
