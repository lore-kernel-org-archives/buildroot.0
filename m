From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:16:58 +0100
Subject: [Buildroot] [PATCH 07/10] package: add python-dockerpty
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-8-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Library to use the pseudo-tty of a docker container.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-dockerpty/Config.in             |  7 +++++++
 package/python-dockerpty/python-dockerpty.hash |  4 ++++
 package/python-dockerpty/python-dockerpty.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-dockerpty/Config.in
 create mode 100644 package/python-dockerpty/python-dockerpty.hash
 create mode 100644 package/python-dockerpty/python-dockerpty.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 10dab1d2e4..1119f78ccc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1387,6 +1387,7 @@ F:	package/python-alsaaudio/
 F:	package/python-backports-ssl-match-hostname/
 F:	package/python-cached-property/
 F:	package/python-docker/
+F:	package/python-dockerpty/
 F:	package/python-docker-pycreds/
 F:	package/python-enum/
 F:	package/python-enum34/
diff --git a/package/Config.in b/package/Config.in
index 6068ef573e..b7e0da6dd4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -768,6 +768,7 @@ menu "External python modules"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-docker/Config.in"
+	source "package/python-dockerpty/Config.in"
 	source "package/python-docker-pycreds/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-docutils/Config.in"
diff --git a/package/python-dockerpty/Config.in b/package/python-dockerpty/Config.in
new file mode 100644
index 0000000000..f0bd85a68f
--- /dev/null
+++ b/package/python-dockerpty/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DOCKERPTY
+	bool "python-dockerpty"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Python library to use the pseudo-tty of a docker container.
+
+	  https://github.com/d11wtq/dockerpty
diff --git a/package/python-dockerpty/python-dockerpty.hash b/package/python-dockerpty/python-dockerpty.hash
new file mode 100644
index 0000000000..f5ed252bcf
--- /dev/null
+++ b/package/python-dockerpty/python-dockerpty.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/dockerpty/json, sha256 locally computed
+md5	028bacb34536f3ee6a2ccd668c27e8e4  dockerpty-0.4.1.tar.gz
+sha256	69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce  dockerpty-0.4.1.tar.gz
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-dockerpty/python-dockerpty.mk b/package/python-dockerpty/python-dockerpty.mk
new file mode 100644
index 0000000000..e6fe6e3b49
--- /dev/null
+++ b/package/python-dockerpty/python-dockerpty.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dockerpty
+#
+################################################################################
+
+PYTHON_DOCKERPTY_VERSION = 0.4.1
+PYTHON_DOCKERPTY_SOURCE = dockerpty-$(PYTHON_DOCKERPTY_VERSION).tar.gz
+PYTHON_DOCKERPTY_SITE = https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
+PYTHON_DOCKERPTY_SETUP_TYPE = setuptools
+PYTHON_DOCKERPTY_LICENSE = Apache-2.0
+PYTHON_DOCKERPTY_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.11.0
