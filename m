From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:16:56 +0100
Subject: [Buildroot] [PATCH 05/10] package: add python-cached-property
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-6-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A decorator for caching properties in classes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-cached-property/Config.in                   |  6 ++++++
 package/python-cached-property/python-cached-property.hash |  4 ++++
 package/python-cached-property/python-cached-property.mk   | 14 ++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/python-cached-property/Config.in
 create mode 100644 package/python-cached-property/python-cached-property.hash
 create mode 100644 package/python-cached-property/python-cached-property.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b68652b5f..ced3af7169 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1385,6 +1385,7 @@ F:	package/memtool/
 F:	package/mosquitto/
 F:	package/python-alsaaudio/
 F:	package/python-backports-ssl-match-hostname/
+F:	package/python-cached-property/
 F:	package/python-docker/
 F:	package/python-docker-pycreds/
 F:	package/python-enum/
diff --git a/package/Config.in b/package/Config.in
index c1bf7067aa..1043338a7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -737,6 +737,7 @@ menu "External python modules"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bottle/Config.in"
+	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-cbor/Config.in"
 	source "package/python-certifi/Config.in"
diff --git a/package/python-cached-property/Config.in b/package/python-cached-property/Config.in
new file mode 100644
index 0000000000..8343973342
--- /dev/null
+++ b/package/python-cached-property/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CACHED_PROPERTY
+	bool "python-cached-property"
+	help
+	  A decorator for caching properties in classes.
+
+	  https://github.com/pydanny/cached-property
diff --git a/package/python-cached-property/python-cached-property.hash b/package/python-cached-property/python-cached-property.hash
new file mode 100644
index 0000000000..255b2d9ec6
--- /dev/null
+++ b/package/python-cached-property/python-cached-property.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/cached-property/json, sha256 locally computed
+md5	fc7a49d2c4b7987f92b00c7b49128530  cached-property-1.4.0.tar.gz
+sha256	a2fa0f89dd422f7e5dd992a4a3e0ce209d5d1e47a4db28fd0a7b5273ec8da3f0  cached-property-1.4.0.tar.gz
+sha256	ba4756c8039b25b66e3c456cc5bf635aa528cf459b97ee1499d06684ccd89b9a  LICENSE
diff --git a/package/python-cached-property/python-cached-property.mk b/package/python-cached-property/python-cached-property.mk
new file mode 100644
index 0000000000..ccc2037f4f
--- /dev/null
+++ b/package/python-cached-property/python-cached-property.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cached-property
+#
+################################################################################
+
+PYTHON_CACHED_PROPERTY_VERSION = 1.4.0
+PYTHON_CACHED_PROPERTY_SOURCE = cached-property-$(PYTHON_CACHED_PROPERTY_VERSION).tar.gz
+PYTHON_CACHED_PROPERTY_SITE = https://pypi.python.org/packages/ce/87/72b7a5a0504ad8d5d5ea6804ac5b24ce4f07869f61c47ea00cd4382320ba
+PYTHON_CACHED_PROPERTY_SETUP_TYPE = setuptools
+PYTHON_CACHED_PROPERTY_LICENSE = BSD
+PYTHON_CACHED_PROPERTY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
