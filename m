From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:16:52 +0100
Subject: [Buildroot] [PATCH 01/10] package: add python-docker-pycreds
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python bindings for the docker credentials store API.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-docker-pycreds/Config.in                  |  7 +++++++
 package/python-docker-pycreds/python-docker-pycreds.hash |  4 ++++
 package/python-docker-pycreds/python-docker-pycreds.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-docker-pycreds/Config.in
 create mode 100644 package/python-docker-pycreds/python-docker-pycreds.hash
 create mode 100644 package/python-docker-pycreds/python-docker-pycreds.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dba0e58757..2cd2ac85ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1384,6 +1384,7 @@ F:	package/lzop/
 F:	package/memtool/
 F:	package/mosquitto/
 F:	package/python-alsaaudio/
+F:	package/python-docker-pycreds/
 F:	package/python-enum/
 F:	package/python-enum34/
 F:	package/python-ipaddr/
diff --git a/package/Config.in b/package/Config.in
index f455e74735..a5604fc36b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ menu "External python modules"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
+	source "package/python-docker-pycreds/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-docutils/Config.in"
 	source "package/python-dominate/Config.in"
diff --git a/package/python-docker-pycreds/Config.in b/package/python-docker-pycreds/Config.in
new file mode 100644
index 0000000000..584c1dbc0e
--- /dev/null
+++ b/package/python-docker-pycreds/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DOCKER_PYCREDS
+	bool "python-docker-pycreds"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Python bindings for the docker credentials store API.
+
+	  https://github.com/shin-/dockerpy-creds
diff --git a/package/python-docker-pycreds/python-docker-pycreds.hash b/package/python-docker-pycreds/python-docker-pycreds.hash
new file mode 100644
index 0000000000..9e1182d4a4
--- /dev/null
+++ b/package/python-docker-pycreds/python-docker-pycreds.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/docker-pycreds/json, sha256 locally computed
+md5	ae63c7def3e58cb51a4d8f5810683030  docker-pycreds-0.2.2.tar.gz
+sha256	c7ab85de2894baff6ee8f15160cbbfa2fd3a04e56f0372c5793d24060687b299  docker-pycreds-0.2.2.tar.gz
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-docker-pycreds/python-docker-pycreds.mk b/package/python-docker-pycreds/python-docker-pycreds.mk
new file mode 100644
index 0000000000..e7ffd0eb51
--- /dev/null
+++ b/package/python-docker-pycreds/python-docker-pycreds.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-docker-pycreds
+#
+################################################################################
+
+PYTHON_DOCKER_PYCREDS_VERSION = 0.2.2
+PYTHON_DOCKER_PYCREDS_SOURCE = docker-pycreds-$(PYTHON_DOCKER_PYCREDS_VERSION).tar.gz
+PYTHON_DOCKER_PYCREDS_SITE = https://pypi.python.org/packages/db/73/42d4c698e70633d99f7f7c4c87c6de45ead5ad7b36dcfccd998fd1556ac9
+PYTHON_DOCKER_PYCREDS_SETUP_TYPE = setuptools
+PYTHON_DOCKER_PYCREDS_LICENSE = Apache-2.0
+PYTHON_DOCKER_PYCREDS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
