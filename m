From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Nov 2014 20:22:49 +0100
Subject: [Buildroot] [git commit] package: add python-httplib2
Message-ID: <20141201104838.4BB187FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8ce24077b68b1fa5422154ae18ed0541be5352e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix the license, it is MIT, not BSD-3c.]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/python-httplib2/Config.in            |   11 +++++++++++
 package/python-httplib2/python-httplib2.hash |    3 +++
 package/python-httplib2/python-httplib2.mk   |   14 ++++++++++++++
 4 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a8128ff..6875d8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -493,6 +493,7 @@ menu "external python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flup/Config.in"
+	source "package/python-httplib2/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
diff --git a/package/python-httplib2/Config.in b/package/python-httplib2/Config.in
new file mode 100644
index 0000000..e42f513
--- /dev/null
+++ b/package/python-httplib2/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_HTTPLIB2
+	bool "python-httplib2"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
+	help
+	  httplib2 is a comprehensive HTTP client library, httplib2.py
+	  supports many features left out of other HTTP libraries.
+
+	  https://pypi.python.org/pypi/httplib2
diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
new file mode 100644
index 0000000..6b128d3
--- /dev/null
+++ b/package/python-httplib2/python-httplib2.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=09d8e8016911fc40e2e4c58f1aa3ec24, sha256 locally computed
+md5	09d8e8016911fc40e2e4c58f1aa3ec24  httplib2-0.9.tar.gz
+sha256	39ea8c6a6d9f595c177a16134fc49a990ad8d382758cbf469c8659662f2f51ab  httplib2-0.9.tar.gz
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
new file mode 100644
index 0000000..ec5c476
--- /dev/null
+++ b/package/python-httplib2/python-httplib2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-httplib2
+#
+################################################################################
+
+PYTHON_HTTPLIB2_VERSION = 0.9
+PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
+PYTHON_HTTPLIB2_SITE = http://pypi.python.org/packages/source/h/httplib2
+PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
+PYTHON_HTTPLIB2_LICENSE = MIT
+PYTHON_HTTPLIB2_LICENSE_FILES = PKG-INFO
+
+$(eval $(python-package))
