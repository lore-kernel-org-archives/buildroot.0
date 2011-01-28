From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jan 2011 09:17:52 +0100
Subject: [Buildroot] [git commit master 1/1] dbus-python: fix build after
	python upgrade
Message-ID: <20110128081845.95FBE8D475@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=51c5af67a6c87660eba8454bb924cf5f2ee08a33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Point it at host-python, and ensure it gets built in advance.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus-python/dbus-python.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 5c12456..b2e9f56 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -10,7 +10,7 @@ DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_INSTALL_TARGET = YES
 
 DBUS_PYTHON_CONF_ENV = am_cv_pathless_PYTHON=python \
-		ac_cv_path_PYTHON=$(PYTHON_DIR)/hostpython \
+		ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
 		am_cv_python_version=$(PYTHON_VERSION) \
 		am_cv_python_platform=linux2 \
 		am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
@@ -19,6 +19,6 @@ DBUS_PYTHON_CONF_ENV = am_cv_pathless_PYTHON=python \
 
 DBUS_PYTHON_CONF_OPT = --disable-html-docs --disable-api-docs
 
-DBUS_PYTHON_DEPENDENCIES = dbus-glib python
+DBUS_PYTHON_DEPENDENCIES = dbus-glib python host-python
 
 $(eval $(call AUTOTARGETS,package,dbus-python))
-- 
1.7.3.4
