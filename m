From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 20:51:09 +0100
Subject: [Buildroot] [git commit] package/python-sentry-sdk: new package
Message-ID: <20181210194901.9E6C28BCE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af3e16949e2ab21e4148c6d9b13a244bc4ca49b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-sentry-sdk/Config.in              |  8 ++++++++
 package/python-sentry-sdk/python-sentry-sdk.hash |  5 +++++
 package/python-sentry-sdk/python-sentry-sdk.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a2a4c16ff..9a7045cf7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1153,6 +1153,7 @@ F:	package/llvm/
 F:	package/python-cython/
 F:	package/python-raven/
 F:	package/python-schedule/
+F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
 
diff --git a/package/Config.in b/package/Config.in
index 5dbf7a510e..512b2c4bf1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1024,6 +1024,7 @@ menu "External python modules"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
 	source "package/python-semver/Config.in"
+	source "package/python-sentry-sdk/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-serial-asyncio/Config.in"
 	source "package/python-service-identity/Config.in"
diff --git a/package/python-sentry-sdk/Config.in b/package/python-sentry-sdk/Config.in
new file mode 100644
index 0000000000..5bddabe282
--- /dev/null
+++ b/package/python-sentry-sdk/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SENTRY_SDK
+	bool "python-sentry-sdk"
+	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	help
+	  Python client for Sentry (https://getsentry.com).
+
+	  https://github.com/getsentry/sentry-python
diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
new file mode 100644
index 0000000000..34acf6ec14
--- /dev/null
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
+md5	78642322818c1ce47e80938fe1f40b5f  sentry-sdk-0.6.2.tar.gz
+sha256	56118f4c3bd3412e47d1969997580df2f27ae951df949d07f0c2120cefe40b00  sentry-sdk-0.6.2.tar.gz
+# Locally computed sha256 checksums
+sha256	59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
new file mode 100644
index 0000000000..ae218de1cf
--- /dev/null
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sentry-sdk
+#
+################################################################################
+
+PYTHON_SENTRY_SDK_VERSION = 0.6.2
+PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/92/6f/b7b74d7635e220660c06897213fc6df894d291900c8e2710d72fb67528a7
+PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
+PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
+PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
