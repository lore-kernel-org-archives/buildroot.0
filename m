From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Mon,  8 Jun 2020 23:30:43 +0200
Subject: [Buildroot] [PATCH 1/1] python-pybind: new package
Message-ID: <20200608213043.3443-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PyBind is a light (headers only) package
for C++/Python and Python/C++ bindings.

host-python-pybind is a dependency
of my future contribution, so I added this feature.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-pybind/Config.in          | 10 ++++++++++
 package/python-pybind/python-pybind.hash |  4 ++++
 package/python-pybind/python-pybind.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-pybind/Config.in
 create mode 100644 package/python-pybind/python-pybind.hash
 create mode 100644 package/python-pybind/python-pybind.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f697c96ce4..9a94307082 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1052,6 +1052,7 @@ F:	package/sdl2/
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
 F:	package/pixiewps/
+F:	package/python-pybind/
 F:	package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
diff --git a/package/Config.in b/package/Config.in
index 520e5d5570..b0a7da2f5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1070,6 +1070,7 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
new file mode 100644
index 0000000000..832a9fb971
--- /dev/null
+++ b/package/python-pybind/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PYBIND
+	bool "python-pybind"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  PyBind is a lightweight header-only library
+	  that exposes C++ types in Python and vice versa,
+	  mainly to create Python bindings of existing C++
+	  code.
+
+	  http://pybind11.readthedocs.org/en/master
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
new file mode 100644
index 0000000000..6578f60c88
--- /dev/null
+++ b/package/python-pybind/python-pybind.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  97504db65640570f32d3fdf701c25a340c8643037c3b69aec469c10c93dc8504   v2.5.0.tar.gz
+# License files, locally calculated
+sha256  9a37ea54aa3cf12c7f3292799f20822ffd4b9b7142b36a7a9997b28c39264dc9   LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
new file mode 100644
index 0000000000..03cea1c060
--- /dev/null
+++ b/package/python-pybind/python-pybind.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pybind
+#
+################################################################################
+
+PYTHON_PYBIND_VERSION = 2.5.0
+PYTHON_PYBIND_SOURCE = v$(PYTHON_PYBIND_VERSION).tar.gz
+PYTHON_PYBIND_SITE = https://github.com/pybind/pybind11/archive
+PYTHON_PYBIND_LICENSE = BSD-3-Clause
+PYTHON_PYBIND_LICENSE_FILES = LICENSE
+PYTHON_PYBIND_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.20.1
