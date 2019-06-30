From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Jun 2019 15:30:52 +0200
Subject: [Buildroot] [git commit] python-inflection: new package
Message-ID: <20190630133322.65C97821D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fb3a0409bbaf761c6d76eeb0820e014a3604661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A string transformation library that singularizes and pluralizes English
words, and transforms strings from CamelCase to underscored string.
Inflection is a port of Ruby on Rails' inflector to Python.

https://github.com/jpvanhal/inflection

Signed-off-by: John Faith <jfaith@impinj.com>
[Arnout: select unicodedata, add hash for license file]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                       |  3 +++
 package/Config.in                                |  1 +
 package/python-inflection/Config.in              | 12 ++++++++++++
 package/python-inflection/python-inflection.hash |  5 +++++
 package/python-inflection/python-inflection.mk   | 15 +++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ce3fcb2de8..e9c521f400 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1174,6 +1174,9 @@ F:	package/nginx-dav-ext/
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
 
+N:	John Faith <jfaith@impinj.com>
+F:	package/python-inflection/
+
 N:	Jonathan Ben Avraham <yba@tkos.co.il>
 F:	arch/Config.in.xtensa
 F:	package/autofs/
diff --git a/package/Config.in b/package/Config.in
index bc529e0b56..d501b5a65b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -909,6 +909,7 @@ menu "External python modules"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-incremental/Config.in"
+	source "package/python-inflection/Config.in"
 	source "package/python-influxdb/Config.in"
 	source "package/python-iniparse/Config.in"
 	source "package/python-iowait/Config.in"
diff --git a/package/python-inflection/Config.in b/package/python-inflection/Config.in
new file mode 100644
index 0000000000..427275bc71
--- /dev/null
+++ b/package/python-inflection/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_INFLECTION
+	bool "python-inflection"
+	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
+	help
+	  A string transformation library that singularizes and
+	  pluralizes English words, and transforms strings from
+	  CamelCase to underscored string.
+
+	  Inflection is a port of Ruby on Rails' inflector to Python
+
+	  https://github.com/jpvanhal/inflection
diff --git a/package/python-inflection/python-inflection.hash b/package/python-inflection/python-inflection.hash
new file mode 100644
index 0000000000..bdad35ad25
--- /dev/null
+++ b/package/python-inflection/python-inflection.hash
@@ -0,0 +1,5 @@
+# Hashes from https://pypi.python.org/pypi/inflection/json
+md5     7941165e9f148e0520023941c0886b40  inflection-0.3.1.tar.gz
+sha256  18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca  inflection-0.3.1.tar.gz
+# License file, locally calculated
+sha256  4a3f52ac1012a90db398e4c55f1d1bea501dddafef8a4b3adb7533b1d820e148  LICENSE
diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
new file mode 100644
index 0000000000..7309880c6a
--- /dev/null
+++ b/package/python-inflection/python-inflection.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-inflection
+#
+################################################################################
+
+PYTHON_INFLECTION_VERSION = 0.3.1
+PYTHON_INFLECTION_SOURCE = inflection-$(PYTHON_INFLECTION_VERSION).tar.gz
+PYTHON_INFLECTION_SITE = https://pypi.python.org/packages/d5/35/a6eb45b4e2356fe688b21570864d4aa0d0a880ce387defe9c589112077f8
+PYTHON_INFLECTION_SETUP_TYPE = setuptools
+PYTHON_INFLECTION_LICENSE = MIT
+PYTHON_INFLECTION_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
