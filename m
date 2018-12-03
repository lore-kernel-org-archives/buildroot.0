From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 23:03:31 +0100
Subject: [Buildroot] [git commit] package/python-wtforms: new package
Message-ID: <20181203220139.B5EFE8A62C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e521845af49d7d8e6adabf7282a4e77b54889702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A flexible forms validation and rendering library for
Python web development.

https://wtforms.readthedocs.io/

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-wtforms/Config.in           |  7 +++++++
 package/python-wtforms/python-wtforms.hash |  5 +++++
 package/python-wtforms/python-wtforms.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cd13fb7b98..84f846b39a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -906,6 +906,7 @@ F:	package/pigpio/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
 F:	package/python-pigpio/
+F:	package/python-wtforms/
 
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
 F:	package/c-icap/
diff --git a/package/Config.in b/package/Config.in
index 912d31d6b8..d34b0c6171 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1072,6 +1072,7 @@ menu "External python modules"
 	source "package/python-wrapt/Config.in"
 	source "package/python-ws4py/Config.in"
 	source "package/python-wsaccel/Config.in"
+	source "package/python-wtforms/Config.in"
 	source "package/python-xlib/Config.in"
 	source "package/python-xlrd/Config.in"
 	source "package/python-xlsxwriter/Config.in"
diff --git a/package/python-wtforms/Config.in b/package/python-wtforms/Config.in
new file mode 100644
index 0000000000..96ed96da0a
--- /dev/null
+++ b/package/python-wtforms/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WTFORMS
+	bool "python-wtforms"
+	help
+	  A flexible forms validation and rendering library for
+	  Python web development.
+
+	  https://wtforms.readthedocs.io/
diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
new file mode 100644
index 0000000000..34beb08010
--- /dev/null
+++ b/package/python-wtforms/python-wtforms.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/wtforms/json
+md5	41c0008dbe7bd98892c58f7457a46a4a  WTForms-2.2.1.tar.gz
+sha256	0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a69309b3b61  WTForms-2.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256	64cba207423f4478e3262c2e54209f8cd2057d687e200a50e0203db5659947a5  LICENSE.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
new file mode 100644
index 0000000000..2715320d27
--- /dev/null
+++ b/package/python-wtforms/python-wtforms.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wtforms
+#
+################################################################################
+
+PYTHON_WTFORMS_VERSION = 2.2.1
+PYTHON_WTFORMS_SOURCE = WTForms-$(PYTHON_WTFORMS_VERSION).tar.gz
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/cd/1d/7221354ebfc32b868740d02e44225c2ce00769b0d3dc370e463e2bc4b446
+PYTHON_WTFORMS_SETUP_TYPE = setuptools
+PYTHON_WTFORMS_LICENSE = BSD-3-Clause
+PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst
+
+$(eval $(python-package))
