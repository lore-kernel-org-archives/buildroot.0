From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 May 2018 13:32:36 +0200
Subject: [Buildroot] [PATCH-NEXT 1/2] package: add python-webob
Message-ID: <20180523113237.31269-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-webob/Config.in         |  9 +++++++++
 package/python-webob/python-webob.hash |  5 +++++
 package/python-webob/python-webob.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-webob/Config.in
 create mode 100644 package/python-webob/python-webob.hash
 create mode 100644 package/python-webob/python-webob.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 78c356fed9..63d554bf28 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1493,6 +1493,7 @@ F:	package/python-ipaddr/
 F:	package/python-pam/
 F:	package/python-psutil/
 F:	package/python-texttable/
+F:	package/python-webob/
 F:	package/python-websocket-client/
 F:	package/triggerhappy/
 
diff --git a/package/Config.in b/package/Config.in
index b66f27a083..277186becb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -969,6 +969,7 @@ menu "External python modules"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
 	source "package/python-web2py/Config.in"
+	source "package/python-webob/Config.in"
 	source "package/python-webpy/Config.in"
 	source "package/python-websocket-client/Config.in"
 	source "package/python-websockets/Config.in"
diff --git a/package/python-webob/Config.in b/package/python-webob/Config.in
new file mode 100644
index 0000000000..fe77723f95
--- /dev/null
+++ b/package/python-webob/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_WEBOB
+	bool "python-webob"
+	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  WSGI request and response object.
+
+	  http://webob.org/
diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
new file mode 100644
index 0000000000..41e8af34fe
--- /dev/null
+++ b/package/python-webob/python-webob.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/WebOb/json
+md5	afea95e4f08330a0529ae33137caf4f0  WebOb-1.8.1.tar.gz
+sha256	54f35073d2fdcddd7a98c2a1dedeede49739150737164a787220f30283139ba6  WebOb-1.8.1.tar.gz
+# Locally computed sha256 checksums
+sha256	27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
new file mode 100644
index 0000000000..fdf4793898
--- /dev/null
+++ b/package/python-webob/python-webob.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-webob
+#
+################################################################################
+
+PYTHON_WEBOB_VERSION = 1.8.1
+PYTHON_WEBOB_SOURCE = WebOb-$(PYTHON_WEBOB_VERSION).tar.gz
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/ea/93/675ec37b631c823877718164b74fc057203c8979fd771bf60f711d64550b
+PYTHON_WEBOB_SETUP_TYPE = setuptools
+PYTHON_WEBOB_LICENSE = MIT
+PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
+
+$(eval $(python-package))
-- 
2.11.0
