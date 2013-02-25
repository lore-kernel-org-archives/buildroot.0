From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Feb 2013 22:31:31 +0100
Subject: [Buildroot] [PATCH 11/11] Manual: add empty line after header in
	.mk files
In-Reply-To: <cover.1361827174.git.s.martin49@gmail.com>
References: <cover.1361827174.git.s.martin49@gmail.com>
Message-ID: <72489a607185be4b7e1e443ef340fc28395a54a0.1361827174.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stephan Hoffmann <sho@relinux.de>

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Acked-by: Samuel Martin <s.martin49@gmail.com>

---
[Samuel: fix typo in commit message]
---
 docs/manual/adding-packages-autotools.txt | 33 ++++++------
 docs/manual/adding-packages-cmake.txt     | 33 ++++++------
 docs/manual/adding-packages-generic.txt   | 83 ++++++++++++++++---------------
 3 files changed, 76 insertions(+), 73 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 5a0d27f..1d5f30b 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -18,24 +18,25 @@ package, with an example :
 03: # libfoo
 04: #
 05: #############################################################
-06: LIBFOO_VERSION = 1.0
-07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
-08: LIBFOO_SITE = http://www.foosoftware.org/download
-09: LIBFOO_INSTALL_STAGING = YES
-10: LIBFOO_INSTALL_TARGET = NO
-11: LIBFOO_CONF_OPT = --disable-shared
-12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
-13:
-14: $(eval $(autotools-package))
+06:
+07: LIBFOO_VERSION = 1.0
+08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+09: LIBFOO_SITE = http://www.foosoftware.org/download
+10: LIBFOO_INSTALL_STAGING = YES
+11: LIBFOO_INSTALL_TARGET = NO
+12: LIBFOO_CONF_OPT = --disable-shared
+13: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
+14:
+15: $(eval $(autotools-package))
 ------------------------
 
-On line 6, we declare the version of the package.
+On line 7, we declare the version of the package.
 
-On line 7 and 8, we declare the name of the tarball and the location
+On line 8 and 9, we declare the name of the tarball and the location
 of the tarball on the Web. Buildroot will automatically download the
 tarball from this location.
 
-On line 9, we tell Buildroot to install the package to the staging
+On line 10, we tell Buildroot to install the package to the staging
 directory. The staging directory, located in +output/staging/+
 is the directory where all the packages are installed, including their
 development files, etc. By default, packages are not installed to the
@@ -45,7 +46,7 @@ other libraries or applications depending on them. Also by default, when
 staging installation is enabled, packages are installed in this location
 using the +make install+ command.
 
-On line 10, we tell Buildroot to not install the package to the
+On line 11, we tell Buildroot to not install the package to the
 target directory. This directory contains what will become the root
 filesystem running on the target. For purely static libraries, it is
 not necessary to install them in the target directory because they will
@@ -53,14 +54,14 @@ not be used at runtime. By default, target installation is enabled; setting
 this variable to NO is almost never needed. Also by default, packages are
 installed in this location using the +make install+ command.
 
-On line 11, we tell Buildroot to pass a custom configure option, that
+On line 12, we tell Buildroot to pass a custom configure option, that
 will be passed to the +./configure+ script before configuring
 and building the package.
 
-On line 12, we declare our dependencies, so that they are built
+On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
-Finally, on line line 14, we invoke the +autotools-package+
+Finally, on line line 15, we invoke the +autotools-package+
 macro that generates all the Makefile rules that actually allows the
 package to be built.
 
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 44c38e9..6ac073c 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -18,24 +18,25 @@ with an example :
 03: # libfoo
 04: #
 05: #############################################################
-06: LIBFOO_VERSION = 1.0
-07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
-08: LIBFOO_SITE = http://www.foosoftware.org/download
-09: LIBFOO_INSTALL_STAGING = YES
-10: LIBFOO_INSTALL_TARGET = NO
-11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
-12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
-13:
-14: $(eval $(cmake-package))
+06:
+07: LIBFOO_VERSION = 1.0
+08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+09: LIBFOO_SITE = http://www.foosoftware.org/download
+10: LIBFOO_INSTALL_STAGING = YES
+11: LIBFOO_INSTALL_TARGET = NO
+12: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
+13: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
+14:
+15: $(eval $(cmake-package))
 ------------------------
 
-On line 6, we declare the version of the package.
+On line 7, we declare the version of the package.
 
-On line 7 and 8, we declare the name of the tarball and the location
+On line 8 and 9, we declare the name of the tarball and the location
 of the tarball on the Web. Buildroot will automatically download the
 tarball from this location.
 
-On line 9, we tell Buildroot to install the package to the staging
+On line 10, we tell Buildroot to install the package to the staging
 directory. The staging directory, located in +output/staging/+
 is the directory where all the packages are installed, including their
 development files, etc. By default, packages are not installed to the
@@ -45,7 +46,7 @@ other libraries or applications depending on them. Also by default, when
 staging installation is enabled, packages are installed in this location
 using the +make install+ command.
 
-On line 10, we tell Buildroot to not install the package to the
+On line 11, we tell Buildroot to not install the package to the
 target directory. This directory contains what will become the root
 filesystem running on the target. For purely static libraries, it is
 not necessary to install them in the target directory because they will
@@ -53,13 +54,13 @@ not be used at runtime. By default, target installation is enabled; setting
 this variable to NO is almost never needed. Also by default, packages are
 installed in this location using the +make install+ command.
 
-On line 11, we tell Buildroot to pass custom options to CMake when it is
+On line 12, we tell Buildroot to pass custom options to CMake when it is
 configuring the package.
 
-On line 12, we declare our dependencies, so that they are built
+On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
-Finally, on line line 14, we invoke the +cmake-package+
+Finally, on line line 15, we invoke the +cmake-package+
 macro that generates all the Makefile rules that actually allows the
 package to be built.
 
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 74d379b..a615ae2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -20,42 +20,43 @@ system is based on hand-written Makefiles or shell scripts.
 03: # libfoo
 04: #
 05: #############################################################
-06: LIBFOO_VERSION = 1.0
-07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
-08: LIBFOO_SITE = http://www.foosoftware.org/download
-09: LIBFOO_LICENSE = GPLv3+
-10: LIBFOO_LICENSE_FILES = COPYING
-11: LIBFOO_INSTALL_STAGING = YES
-12: LIBFOO_CONFIG_SCRIPTS = libfoo-config
-13: LIBFOO_DEPENDENCIES = host-libaaa libbbb
-14:
-15: define LIBFOO_BUILD_CMDS
-16:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
-17: endef
-18:
-19: define LIBFOO_INSTALL_STAGING_CMDS
-20:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
-21:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
-22:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
-23: endef
-24:
-25: define LIBFOO_INSTALL_TARGET_CMDS
-26:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
-27:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
-28: endef
-29:
-30: define LIBFOO_DEVICES
-31:	/dev/foo  c  666  0  0	42  0  -  -  -
-32: endef
-33:
-34: define LIBFOO_PERMISSIONS
-35:	/bin/foo  f  4755  0  0	 -  -  -  -  -
-36: endef
-37:
-38: $(eval $(generic-package))
+06:
+07: LIBFOO_VERSION = 1.0
+08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+09: LIBFOO_SITE = http://www.foosoftware.org/download
+10: LIBFOO_LICENSE = GPLv3+
+11: LIBFOO_LICENSE_FILES = COPYING
+12: LIBFOO_INSTALL_STAGING = YES
+13: LIBFOO_CONFIG_SCRIPTS = libfoo-config
+14: LIBFOO_DEPENDENCIES = host-libaaa libbbb
+15:
+16: define LIBFOO_BUILD_CMDS
+17:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+18: endef
+19:
+20: define LIBFOO_INSTALL_STAGING_CMDS
+21:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
+22:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
+23:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
+24: endef
+25:
+26: define LIBFOO_INSTALL_TARGET_CMDS
+27:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
+28:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
+29: endef
+30:
+31: define LIBFOO_DEVICES
+32:	/dev/foo  c  666  0  0	42  0  -  -  -
+33: endef
+34:
+35: define LIBFOO_PERMISSIONS
+36:	/bin/foo  f  4755  0  0	 -  -  -  -  -
+37: endef
+38:
+39: $(eval $(generic-package))
 --------------------------------
 
-The Makefile begins on line 6 to 10 with metadata information: the
+The Makefile begins on line 7 to 11 with metadata information: the
 version of the package (+LIBFOO_VERSION+), the name of the
 tarball containing the package (+LIBFOO_SOURCE+) the
 Internet location at which the tarball can be downloaded from
@@ -65,13 +66,13 @@ the same prefix, +LIBFOO_+ in this case. This prefix is always the
 uppercased version of the package name (see below to understand where
 the package name is defined).
 
-On line 11, we specify that this package wants to install something to
+On line 12, we specify that this package wants to install something to
 the staging space. This is often needed for libraries, since they must
 install header files and other development files in the staging space.
 This will ensure that the commands listed in the
 +LIBFOO_INSTALL_STAGING_CMDS+ variable will be executed.
 
-On line 12, we specify that there is some fixing to be done to some
+On line 13, we specify that there is some fixing to be done to some
 of the 'libfoo-config' files that were installed during
 +LIBFOO_INSTALL_STAGING_CMDS+ phase.
 These *-config files are executable shell script files that are
@@ -113,14 +114,14 @@ IMAGEMAGICK_CONFIG_SCRIPTS = \
    Magick-config Magick++-config \
    MagickCore-config MagickWand-config Wand-config
 
-On line 13, we specify the list of dependencies this package relies
+On line 14, we specify the list of dependencies this package relies
 on. These dependencies are listed in terms of lower-case package names,
 which can be packages for the target (without the +host-+
 prefix) or packages for the host (with the +host-+) prefix).
 Buildroot will ensure that all these packages are built and installed
 'before' the current package starts its configuration.
 
-The rest of the Makefile, lines 14..27, defines what should be done
+The rest of the Makefile, lines 16..29, defines what should be done
 at the different steps of the package configuration, compilation and
 installation.
 +LIBFOO_BUILD_CMDS+ tells what steps should be performed to
@@ -133,13 +134,13 @@ All these steps rely on the +$(@D)+ variable, which
 contains the directory where the source code of the package has been
 extracted.
 
-On line 29..31, we define a device-node file used by this package
+On line 31..33, we define a device-node file used by this package
 (+LIBFOO_DEVICES+).
 
-On line 33..35, we define the permissions to set to specific files
+On line 35..37, we define the permissions to set to specific files
 installed by this package (+LIBFOO_PERMISSIONS+).
 
-Finally, on line 37, we call the +generic-package+ function, which
+Finally, on line 39, we call the +generic-package+ function, which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
 
-- 
1.8.1.4
