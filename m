From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 17:54:28 +0100
Subject: [Buildroot] [git commit] package: add python-requests
Message-ID: <20141201104835.BAE6A7FCD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2b538bda710f750c1e534e516964dc5795af14e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |    1 +
 package/python-requests/Config.in            |    7 +++++++
 package/python-requests/python-requests.hash |    3 +++
 package/python-requests/python-requests.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1d132af..d59876f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ menu "external python modules"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyzmq/Config.in"
+	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
new file mode 100644
index 0000000..3367cf0
--- /dev/null
+++ b/package/python-requests/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_REQUESTS
+	bool "python-requests"
+	help
+	  Requests is an Apache2 Licensed HTTP library, written in
+	  Python, for human beings.
+
+	  http://www.python-requests.org/
diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
new file mode 100644
index 0000000..d187dcd
--- /dev/null
+++ b/package/python-requests/python-requests.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=02214b3a179e445545de4b7a98d3dd17, sha256 locally computed
+md5	02214b3a179e445545de4b7a98d3dd17  requests-2.4.3.tar.gz
+sha256	53c68313c5c6149b1a899234c000296e60a8900682accf73d6f0c6d608afc6b1  requests-2.4.3.tar.gz
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
new file mode 100644
index 0000000..5c12f1b
--- /dev/null
+++ b/package/python-requests/python-requests.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-requests
+#
+################################################################################
+
+PYTHON_REQUESTS_VERSION = 2.4.3
+PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
+PYTHON_REQUESTS_SITE = http://pypi.python.org/packages/source/r/requests
+PYTHON_REQUESTS_SETUP_TYPE = setuptools
+PYTHON_REQUESTS_LICENSE = Apache-2.0
+PYTHON_REQUESTS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
