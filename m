From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 21:55:54 +0200
Subject: [Buildroot] [git commit] package/python-jedi: new package
Message-ID: <20190420195618.9D18788274@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca443b49b5b0212ff5038c443a49ce636b17cb7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An autocompletion tool for Python that can be used for text
editors.

https://github.com/davidhalter/jedi

python-jedi is a runtime dependency of ipython 7.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: add license for the flask theme]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-jedi/Config.in        |  8 ++++++++
 package/python-jedi/python-jedi.hash |  6 ++++++
 package/python-jedi/python-jedi.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 52b9f1fe56..ea6b802de4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -834,6 +834,7 @@ F:	package/oniguruma/
 F:	package/oprofile/
 F:	package/pcmanfm/
 F:	package/python-backcall/
+F:	package/python-jedi/
 F:	package/python-parso/
 F:	package/rygel/
 F:	package/safeclib/
diff --git a/package/Config.in b/package/Config.in
index 0a7a058953..4f3836ae10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -914,6 +914,7 @@ menu "External python modules"
 	source "package/python-iso8601/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jaraco-classes/Config.in"
+	source "package/python-jedi/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-jedi/Config.in b/package/python-jedi/Config.in
new file mode 100644
index 0000000000..8ceaa1530c
--- /dev/null
+++ b/package/python-jedi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_JEDI
+	bool "python-jedi"
+	select BR2_PACKAGE_PYTHON_PARSO # runtime
+	help
+	  An autocompletion tool for Python that can be used for text
+	  editors.
+
+	  https://github.com/davidhalter/jedi
diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
new file mode 100644
index 0000000000..83ff196f40
--- /dev/null
+++ b/package/python-jedi/python-jedi.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/jedi/json
+md5	46c12589de9df839ff6be79c5009766d  jedi-0.13.3.tar.gz
+sha256	2bb0603e3506f708e792c7f4ad8fc2a7a9d9c2d292a358fbbd58da531695595b  jedi-0.13.3.tar.gz
+# Locally computed sha256 checksums
+sha256	78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
+sha256	9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
new file mode 100644
index 0000000000..84c9427d96
--- /dev/null
+++ b/package/python-jedi/python-jedi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jedi
+#
+################################################################################
+
+PYTHON_JEDI_VERSION = 0.13.3
+PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/96/fb/e99fc0442f8a0fa4bf5d34162c2d98131489017f661bf8a331857844b145
+PYTHON_JEDI_SETUP_TYPE = setuptools
+PYTHON_JEDI_LICENSE = MIT, BSD-3-Clause (flask theme)
+PYTHON_JEDI_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE
+
+$(eval $(python-package))
