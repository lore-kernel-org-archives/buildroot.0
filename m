From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:29:02 +0100
Subject: [Buildroot] [git commit] package/python-logstash: new package
Message-ID: <20191212072102.8F23E8912D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00249f80a6647858029154dad967a1df8faa0144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python logging handler for Logstash.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-logstash/Config.in            |  6 ++++++
 package/python-logstash/python-logstash.hash |  5 +++++
 package/python-logstash/python-logstash.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 61bcd99d43..c8be10dc92 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1142,6 +1142,7 @@ F:	package/python-aiorwlock/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
+F:	package/python-logstash/
 F:	package/python-multidict/
 F:	package/python-pycares/
 F:	package/python-terminaltables/
diff --git a/package/Config.in b/package/Config.in
index 307583d01f..cf004fec63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -963,6 +963,7 @@ menu "External python modules"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-logbook/Config.in"
+	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
 	source "package/python-m2r/Config.in"
 	source "package/python-mad/Config.in"
diff --git a/package/python-logstash/Config.in b/package/python-logstash/Config.in
new file mode 100644
index 0000000000..9d225db810
--- /dev/null
+++ b/package/python-logstash/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_LOGSTASH
+	bool "python-logstash"
+	help
+	  Python logging handler for Logstash.
+
+	  https://github.com/vklochan/python-logstash
diff --git a/package/python-logstash/python-logstash.hash b/package/python-logstash/python-logstash.hash
new file mode 100644
index 0000000000..ba11c7ffaa
--- /dev/null
+++ b/package/python-logstash/python-logstash.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-logstash/json
+md5	26fafa0ea306025fb7644d70cb38982a  python-logstash-0.4.6.tar.gz
+sha256	10943e5df83f592b4d61b63ad1afff855ccc8c9467f78718f0a59809ba1fe68c  python-logstash-0.4.6.tar.gz
+# Locally computed sha256 checksums
+sha256	fea6a5c634ac9d9e047151675adc197c16f45bfba3c26ab113f48fb9fa717fff  LICENSE
diff --git a/package/python-logstash/python-logstash.mk b/package/python-logstash/python-logstash.mk
new file mode 100644
index 0000000000..68930bb1f9
--- /dev/null
+++ b/package/python-logstash/python-logstash.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-logstash
+#
+################################################################################
+
+PYTHON_LOGSTASH_VERSION = 0.4.6
+PYTHON_LOGSTASH_SITE = https://files.pythonhosted.org/packages/4e/8d/7ff2e8e8e2613e7bb7654790480bb4cf51a55721371adbb631b16cb16dce
+PYTHON_LOGSTASH_SETUP_TYPE = distutils
+PYTHON_LOGSTASH_LICENSE = MIT
+PYTHON_LOGSTASH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
