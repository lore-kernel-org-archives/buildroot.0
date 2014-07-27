From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 16:01:31 +0200
Subject: [Buildroot] [git commit] python-daemon: new package
Message-ID: <20140727140248.3C1D99D2EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5d4b2515d0599bb6342130f04218dc6ca2cd6c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: adjust license information to use SPDX code for Python
license, add GPLv2+ which is used for the tests, and fix the license
file variable.]

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/python-daemon/Config.in        |    7 +++++++
 package/python-daemon/python-daemon.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6b80ee2..559b895 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -471,6 +471,7 @@ menu "external python modules"
 	source "package/python-bottle/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-flup/Config.in"
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
index 0000000..d66842c
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
+PYTHON_DAEMON_SITE = https://pypi.python.org/packages/source/p/python-daemon/
+PYTHON_DAEMON_LICENSE = Python-2.0 (library), GPLv2+ (test)
+PYTHON_DAEMON_LICENSE_FILES = LICENSE.PSF-2 LICENSE.GPL-2
+PYTHON_DAEMON_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
