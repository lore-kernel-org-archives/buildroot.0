From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 14:31:09 +0100
Subject: [Buildroot] [git commit] package/swig: bump version to 3.0.7
Message-ID: <20151201232123.520E481952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d21e5cfc443fe699501c16c4008c50083f1e7d69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the swig package to the current major release, the
comment about the CMake fix was also updated to reflect the version
bump. Swig 3.0.7 was positively tested using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_LIBCEC=y
BR2_PACKAGE_TRACE_CMD=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LIBFTDI1=y
BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS=y
BR2_PACKAGE_LIBSEMANAGE=y
BR2_PACKAGE_GNURADIO=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swig/swig.hash |  2 +-
 package/swig/swig.mk   | 21 +++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 98baaa2..62e3d20 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  65e13f22a60cecd7279c59882ff8ebe1ffe34078e85c602821a541817a4317f7  swig-2.0.12.tar.gz
+sha256	06dc8816a225667ce1eee545af3caf87e1bbaa379c32838d4cea53152514348d	swig-3.0.7.tar.gz
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 6b9b8ae..cd816b4 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 2.0
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).12
+SWIG_VERSION_MAJOR = 3.0
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).7
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPTS = \
@@ -15,14 +15,15 @@ HOST_SWIG_CONF_OPTS = \
 SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
-# CMake looks first at swig2.0 and then swig. However, when doing the
-# search, it will look into the PATH for swig2.0 first, and then for
-# swig. While the PATH contains first our $(HOST_DIR)/usr/bin, it also
-# contains /usr/bin and other system directories. Therefore, if there
-# is an installed swig2.0 on the system, it will get the preference
-# over the swig installed in $(HOST_DIR)/usr/bin, which isn't nice. To
-# prevent this from happening we create a symbolic link swig2.0 ->
-# swig, so that our swig always gets used.
+# CMake looks first at swig3.0, then swig2.0 and then swig. However,
+# when doing the search, it will look into the PATH for swig2.0 first,
+# and then for swig.
+# While the PATH contains first our $(HOST_DIR)/usr/bin, it also contains
+# /usr/bin and other system directories. Therefore, if there is an
+# installed swig3.0 on the system, it will get the preference over the
+# swig installed in $(HOST_DIR)/usr/bin, which isn't nice. To prevent
+# this from happening we create a symbolic link swig3.0 -> swig, so that
+# our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
 	ln -fs swig $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
