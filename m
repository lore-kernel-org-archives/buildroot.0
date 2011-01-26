From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 11:18:50 +0100
Subject: [Buildroot] [git commit master 1/1] package: fix python upgrade
	fallout
Message-ID: <20110126102010.616A98B52D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2c3e18cdd8c215e47855c1b7698609f69ae35d69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of packages depended on the libpython make target for python
support, which no longer exist.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk                  |    2 +-
 package/dbus-python/dbus-python.mk      |    2 +-
 package/multimedia/alsa-lib/alsa-lib.mk |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index c7f9149..205554a 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -127,7 +127,7 @@ AVAHI_CONF_ENV += am_cv_pathless_PYTHON=python \
 		am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 		py_cv_mod_socket_=yes
 
-AVAHI_DEPENDENCIES += libpython
+AVAHI_DEPENDENCIES += python
 AVAHI_CONF_OPT += --enable-python
 else
 AVAHI_CONF_OPT += --disable-python
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 4fd2a45..5c12456 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -19,6 +19,6 @@ DBUS_PYTHON_CONF_ENV = am_cv_pathless_PYTHON=python \
 
 DBUS_PYTHON_CONF_OPT = --disable-html-docs --disable-api-docs
 
-DBUS_PYTHON_DEPENDENCIES = dbus-glib libpython
+DBUS_PYTHON_DEPENDENCIES = dbus-glib python
 
 $(eval $(call AUTOTARGETS,package,dbus-python))
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index a3d5fe4..2085a97 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -56,7 +56,7 @@ ALSA_LIB_CONF_OPT += \
 	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS+=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_DEPENDENCIES = libpython
+ALSA_LIB_DEPENDENCIES = python
 else
 ALSA_LIB_CONF_OPT += --disable-python
 endif
-- 
1.7.3.4
