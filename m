From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 14:57:38 +0200
Subject: [Buildroot] [git commit] package: drop unneeded
	HOST_<pkg>_AUTORECONF = YES
Message-ID: <20131004125913.60D499B93E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d341b76c167e51fe10f5b64308f52ca48e2b4e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 97c687000 (pkg-autotools.mk: default host AUTORECONF{,_OPT} to the
target values) we automatically enable autoreconf for host builds if it
is enabled for the target, so these can go.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext/gettext.mk       |    1 -
 package/gutenprint/gutenprint.mk |    1 -
 package/kmod/kmod.mk             |    1 -
 package/libffi/libffi.mk         |    1 -
 package/libftdi/libftdi.mk       |    1 -
 package/libglib2/libglib2.mk     |    1 -
 package/libgtk2/libgtk2.mk       |    1 -
 package/python/python.mk         |    1 -
 package/python3/python3.mk       |    1 -
 9 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 7af2035..4874a82 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -10,7 +10,6 @@ GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
 GETTEXT_AUTORECONF = YES
-HOST_GETTEXT_AUTORECONF = YES
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 978675f..33abf48 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -12,7 +12,6 @@ GUTENPRINT_LICENSE_FILES = COPYING
 
 # Needed, as we touch Makefile.am
 GUTENPRINT_AUTORECONF = YES
-HOST_GUTENPRINT_AUTORECONF = YES
 
 GUTENPRINT_DEPENDENCIES = cups host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index a1ad7d6..77fbe0b 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -13,7 +13,6 @@ HOST_KMOD_DEPENDENCIES = host-pkgconf
 
 # Some patches are touching configure.ac
 KMOD_AUTORECONF = YES
-HOST_KMOD_AUTORECONF = YES
 
 # license info for libkmod only, conditionally add more below
 KMOD_LICENSE = LGPLv2.1+
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 8c84924..7463547 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -22,7 +22,6 @@ endef
 
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
-HOST_LIBFFI_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 3cf11a2..b31d14b 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -11,7 +11,6 @@ LIBFTDI_DEPENDENCIES = libusb-compat libusb
 LIBFTDI_INSTALL_STAGING = YES
 LIBFTDI_CONFIG_SCRIPTS = libftdi-config
 LIBFTDI_AUTORECONF = YES
-HOST_LIBFTDI_AUTORECONF = YES
 
 LIBFDTI_CONF_OPT = --without-examples
 
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b07b2c6..689e417 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -13,7 +13,6 @@ LIBGLIB2_LICENSE = LGPLv2+
 LIBGLIB2_LICENSE_FILES = COPYING
 
 LIBGLIB2_AUTORECONF = YES
-HOST_LIBGLIB2_AUTORECONF = YES
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 94cfd4c..50d0510 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -157,7 +157,6 @@ endif
 # for the target.
 
 HOST_LIBGTK2_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
-HOST_LIBGTK2_AUTORECONF = YES
 HOST_LIBGTK2_CONF_OPT = \
 		--disable-static \
 		--disable-glibtest \
diff --git a/package/python/python.mk b/package/python/python.mk
index df02b35..6a6aaac 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -38,7 +38,6 @@ HOST_PYTHON_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
 	PYTHON_MODULES_LIB="$(HOST_DIR)/lib $(HOST_DIR)/usr/lib"
 
-HOST_PYTHON_AUTORECONF = YES
 
 # Building host python in parallel sometimes triggers a "Bus error"
 # during the execution of "./python setup.py build" in the
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a8a1942..b5e9689 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -31,7 +31,6 @@ HOST_PYTHON3_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
 	PYTHON_MODULES_LIB="$(HOST_DIR)/lib $(HOST_DIR)/usr/lib"
 
-HOST_PYTHON3_AUTORECONF = YES
 
 define HOST_PYTHON3_CONFIGURE_CMDS
 	(cd $(@D) && rm -rf config.cache; \
