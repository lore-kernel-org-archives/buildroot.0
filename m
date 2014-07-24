From: David Bachelart <david.bachelart@bbright.com>
Date: Thu, 24 Jul 2014 17:43:23 +0200
Subject: [Buildroot] [PATCH 1/1] python-daemon: new package
Message-ID: <1406216603-965-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in                      |    1 +
 package/python-daemon/Config.in        |    7 +++++++
 package/python-daemon/python-daemon.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/python-daemon/Config.in
 create mode 100644 package/python-daemon/python-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index b232284..4aceaeb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -471,6 +471,7 @@ menu "external python modules"
 	source "package/python-bottle/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-id3/Config.in"
diff --git a/package/python-daemon/Config.in b/package/python-daemon/Config.in
new file mode 100644
index 0000000..b3cc8a2
--- /dev/null
+++ b/package/python-daemon/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DAEMON
+	bool "python-daemon"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Library to implement a well-behaved Unix daemon process.
+
+	  https://pypi.python.org/pypi/python-daemon/
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
new file mode 100644
index 0000000..bb1c286
--- /dev/null
+++ b/package/python-daemon/python-daemon.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-daemon
+#
+################################################################################
+
+PYTHON_DAEMON_VERSION = 1.5.5
+PYTHON_DAEMON_SITE    = https://pypi.python.org/packages/source/p/python-daemon/
+PYTHON_DAEMON_LICENSE = PSF-2+
+PYTHON_DAEMON_LICENSE_FILES = COPYING
+PYTHON_DAEMON_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
1.7.10.4
