From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:12:14 +0100
Subject: [Buildroot] [git commit] python-psutil: new package
Message-ID: <20141207221225.9888B800BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5be4d61943ce283da75dabb684a13fcc039c2faa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/python-psutil/Config.in          |    8 ++++++++
 package/python-psutil/python-psutil.hash |    3 +++
 package/python-psutil/python-psutil.mk   |   14 ++++++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1ebf853..f06a486 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -517,6 +517,7 @@ menu "external python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
+	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pygame/Config.in"
diff --git a/package/python-psutil/Config.in b/package/python-psutil/Config.in
new file mode 100644
index 0000000..c64eeee
--- /dev/null
+++ b/package/python-psutil/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PSUTIL
+	bool "python-psutil"
+	help
+	  psutil is a cross-platform library for retrieving
+	  information on running processes and system utilization
+	  (CPU, memory, disks, network) in Python.
+
+	  https://pypi.python.org/pypi/psutil
diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
new file mode 100644
index 0000000..7897b15
--- /dev/null
+++ b/package/python-psutil/python-psutil.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=015a013c46bb9bc30b5c344f26dea0d3, sha256 locally computed
+md5	015a013c46bb9bc30b5c344f26dea0d3  psutil-2.1.3.tar.gz
+sha256	b434c75f01715777391f10f456002e33d0ca14633f96fdbd9ff9139b42d9452c  psutil-2.1.3.tar.gz
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
new file mode 100644
index 0000000..870984d
--- /dev/null
+++ b/package/python-psutil/python-psutil.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-psutil
+#
+################################################################################
+
+PYTHON_PSUTIL_VERSION = 2.1.3
+PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
+PYTHON_PSUTIL_SITE = http://pypi.python.org/packages/source/p/psutil
+PYTHON_PSUTIL_SETUP_TYPE = setuptools
+PYTHON_PSUTIL_LICENSE = BSD-3c
+PYTHON_PSUTIL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
