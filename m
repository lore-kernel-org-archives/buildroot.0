From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:19:26 +0100
Subject: [Buildroot] [git commit] python: add an option to make the
	ossaudiodev module optional for the target
Message-ID: <20150110153345.500A8803D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b79f2a637f6fa9a42ebabc6605ff3bbed792e47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a configure option in Python to enable/disable the
ossaudiodev module, this commit adds a configuration option to the
target Python to explicitly enable/disable this module.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/Config.in |    5 +++++
 package/python/python.mk |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 8b27630..87defad 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -60,6 +60,11 @@ config BR2_PACKAGE_PYTHON_CURSES
 	help
 	  curses module for Python.
 
+config BR2_PACKAGE_PYTHON_OSSAUDIODEV
+	bool "ossaudiodev module"
+	help
+	  ossaudiodev module for Python.
+
 config BR2_PACKAGE_PYTHON_PYEXPAT
 	select BR2_PACKAGE_EXPAT
 	bool "pyexpat"
diff --git a/package/python/python.mk b/package/python/python.mk
index bf063e9..4a3e71c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -120,6 +120,12 @@ ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
 PYTHON_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON_OSSAUDIODEV),y)
+PYTHON_CONF_OPTS += --enable-ossaudiodev
+else
+PYTHON_CONF_OPTS += --disable-ossaudiodev
+endif
+
 PYTHON_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_file__dev_ptmx=yes \
