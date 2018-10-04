From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 13:59:58 +0200
Subject: [Buildroot] [git commit] python-pyhamcrest: new package
Message-ID: <20181004120009.461DD8C564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c91461834be3b69dde199ec64ad8af966872b5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hamcrest framework for matcher objects.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-pyhamcrest/Config.in              |  8 ++++++++
 package/python-pyhamcrest/python-pyhamcrest.hash |  5 +++++
 package/python-pyhamcrest/python-pyhamcrest.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b2718b82c4..74bc703a6b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -208,6 +208,7 @@ F:	package/python-paramiko/
 F:	package/python-passlib/
 F:	package/python-pyasn1/
 F:	package/python-pyasn1-modules/
+F:	package/python-pyhamcrest/
 F:	package/python-pyroute2/
 F:	package/python-pytz/
 F:	package/python-reentry/
diff --git a/package/Config.in b/package/Config.in
index 13b24f1815..17627ad840 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -929,6 +929,7 @@ menu "External python modules"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
+	source "package/python-pyhamcrest/Config.in"
 	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pylibftdi/Config.in"
diff --git a/package/python-pyhamcrest/Config.in b/package/python-pyhamcrest/Config.in
new file mode 100644
index 0000000000..c2a4dc06f7
--- /dev/null
+++ b/package/python-pyhamcrest/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYHAMCREST
+	bool "python-pyhamcrest"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Hamcrest framework for matcher objects.
+
+	  https://github.com/hamcrest/PyHamcrest
diff --git a/package/python-pyhamcrest/python-pyhamcrest.hash b/package/python-pyhamcrest/python-pyhamcrest.hash
new file mode 100644
index 0000000000..0c1660e08a
--- /dev/null
+++ b/package/python-pyhamcrest/python-pyhamcrest.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyhamcrest/json
+md5	8b833a3fa30197455df79424f30c8c3f  PyHamcrest-1.9.0.tar.gz
+sha256	8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd  PyHamcrest-1.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256	ec76c04449607010d061b1e29c9d20a5ffae74db9d04670ae82538ccfe68b941  LICENSE.txt
diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
new file mode 100644
index 0000000000..244aa8c606
--- /dev/null
+++ b/package/python-pyhamcrest/python-pyhamcrest.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyhamcrest
+#
+################################################################################
+
+PYTHON_PYHAMCREST_VERSION = 1.9.0
+PYTHON_PYHAMCREST_SOURCE = PyHamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
+PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/a4/89/a469aad9256aedfbb47a29ec2b2eeb855d9f24a7a4c2ff28bd8d1042ef02
+PYTHON_PYHAMCREST_SETUP_TYPE = setuptools
+PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
+PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
