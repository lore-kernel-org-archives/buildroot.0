From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:58:28 +0100
Subject: [Buildroot] [git commit] package: cleanup whitespace of assignments
Message-ID: <20141218220056.879387F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8314ddf584197f618d776c9df7488c782a6d6761
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk      |    2 +-
 package/atk/atk.mk                     |    2 +-
 package/avahi/avahi.mk                 |    2 +-
 package/bcusdk/bcusdk.mk               |    2 +-
 package/dropbear/dropbear.mk           |    2 +-
 package/open2300/open2300.mk           |    6 +++---
 package/python-enum34/python-enum34.mk |    2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 87a36df..2452a6b 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -7,7 +7,7 @@
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
 	MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
 	MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
-	MXS_BOOTLETS_SOURCE  = $(notdir $(MXS_BOOTLETS_TARBALL))
+	MXS_BOOTLETS_SOURCE = $(notdir $(MXS_BOOTLETS_TARBALL))
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
 	MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
 	MXS_BOOTLETS_SITE_METHOD = git
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 18fe688..95f52c7 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -41,7 +41,7 @@ ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
 		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
 		gl_cv_c_restrict=no ac_cv_prog_F77=no
 
-ATK_CONF_OPTS =  --disable-glibtest --enable-explicit-deps=no
+ATK_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
 ATK_DEPENDENCIES = libglib2 host-pkgconf
 
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index e42f78d..e8944d6 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -145,7 +145,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_DBUS_PYTHON),y)
 AVAHI_CONF_OPTS += --enable-python-dbus
-AVAHI_CONF_ENV  += py_cv_mod_dbus_=yes
+AVAHI_CONF_ENV += py_cv_mod_dbus_=yes
 AVAHI_DEPENDENCIES += dbus-python
 else
 AVAHI_CONF_OPTS += --disable-python-dbus
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 7cf821a..bbf988d 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -10,7 +10,7 @@ BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib
 BCUSDK_LICENSE = GPLv2+
 BCUSDK_LICENSE_FILES = COPYING
 BCUSDK_INSTALL_STAGING = YES
-BCUSDK_CONF_OPTS =  --enable-onlyeibd --enable-ft12 --enable-pei16 \
+BCUSDK_CONF_OPTS = --enable-onlyeibd --enable-ft12 --enable-pei16 \
 		 --enable-eibnetip --enable-eibnetipserver \
 		 --enable-eibnetiptunnel --without-pth-test \
 		 --with-pth=$(STAGING_DIR)/usr
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index f897d1c..c8e9a27 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -8,7 +8,7 @@ DROPBEAR_VERSION = 2014.66
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
+DROPBEAR_MAKE = $(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 5ea0a70..db848b9 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -17,9 +17,9 @@ OPEN2300_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 	OPEN2300_DEPENDENCIES += mysql
-	OPEN2300_BINS         += mysql2300 mysqlhistlog2300
-	OPEN2300_CFLAGS       += -I$(STAGING_DIR)/usr/include/mysql
-	OPEN2300_LDFLAGS      += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
+	OPEN2300_BINS += mysql2300 mysqlhistlog2300
+	OPEN2300_CFLAGS += -I$(STAGING_DIR)/usr/include/mysql
+	OPEN2300_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
 endif
 
 define OPEN2300_BUILD_CMDS
diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index 9d50e95..13c529d 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_ENUM34_VERSION = 1.0.4
-PYTHON_ENUM34_SOURCE =enum34-$(PYTHON_ENUM34_VERSION).tar.gz
+PYTHON_ENUM34_SOURCE = enum34-$(PYTHON_ENUM34_VERSION).tar.gz
 PYTHON_ENUM34_SITE = http://pypi.python.org/packages/source/e/enum34
 PYTHON_ENUM34_SETUP_TYPE = distutils
 PYTHON_ENUM34_LICENSE = BSD-3c
