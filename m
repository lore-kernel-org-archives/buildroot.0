From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Thu, 18 Jun 2020 13:02:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: rename package to
 python-pybind11
Message-ID: <20200618110209.5750-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---

python-pybind only allows C++ -> python bindings at the moment.

As pointed by Asaf, we will face issues if we try to activate
Python->C++ bindings in the future, because Cmake will
search for 'pybind11' as a key word.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                                          |  2 +-
 package/Config.in                                   |  2 +-
 package/python-pybind/python-pybind.mk              | 13 -------------
 .../{python-pybind => python-pybind11}/Config.in    |  6 +++---
 .../python-pybind11.hash}                           |  2 +-
 package/python-pybind11/python-pybind11.mk          | 13 +++++++++++++
 6 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 package/python-pybind/python-pybind.mk
 rename package/{python-pybind => python-pybind11}/Config.in (53%)
 rename package/{python-pybind/python-pybind.hash => python-pybind11/python-pybind11.hash} (83%)
 create mode 100644 package/python-pybind11/python-pybind11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cbe6bc1856..147381bf0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1053,7 +1053,7 @@ F:	package/sdl2/
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
 F:	package/pixiewps/
-F:	package/python-pybind/
+F:	package/python-pybind11/
 F:	package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
diff --git a/package/Config.in b/package/Config.in
index 1f44fe7ca9..36e9c606c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1070,7 +1070,7 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
-	source "package/python-pybind/Config.in"
+	source "package/python-pybind11/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
deleted file mode 100644
index 634e869e40..0000000000
--- a/package/python-pybind/python-pybind.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# python-pybind
-#
-################################################################################
-
-PYTHON_PYBIND_VERSION = 2.5.0
-PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
-PYTHON_PYBIND_LICENSE = BSD-3-Clause
-PYTHON_PYBIND_LICENSE_FILES = LICENSE
-PYTHON_PYBIND_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
diff --git a/package/python-pybind/Config.in b/package/python-pybind11/Config.in
similarity index 53%
rename from package/python-pybind/Config.in
rename to package/python-pybind11/Config.in
index 604cb9ee67..714c37f13c 100644
--- a/package/python-pybind/Config.in
+++ b/package/python-pybind11/Config.in
@@ -1,7 +1,7 @@
-config BR2_PACKAGE_PYTHON_PYBIND
-	bool "python-pybind"
+config BR2_PACKAGE_PYTHON_PYBIND11
+	bool "python-pybind11"
 	help
-	  PyBind is a lightweight header-only library that exposes C++
+	  PyBind11 is a lightweight header-only library that exposes C++
 	  types in Python and vice versa, mainly to create Python
 	  bindings of existing C++ code.
 
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind11/python-pybind11.hash
similarity index 83%
rename from package/python-pybind/python-pybind.hash
rename to package/python-pybind11/python-pybind11.hash
index 751b0bdf6e..2cdcbee8b2 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind11/python-pybind11.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  97504db65640570f32d3fdf701c25a340c8643037c3b69aec469c10c93dc8504   python-pybind-2.5.0.tar.gz
+sha256  97504db65640570f32d3fdf701c25a340c8643037c3b69aec469c10c93dc8504   python-pybind11-2.5.0.tar.gz
 # License files, locally calculated
 sha256  9a37ea54aa3cf12c7f3292799f20822ffd4b9b7142b36a7a9997b28c39264dc9   LICENSE
diff --git a/package/python-pybind11/python-pybind11.mk b/package/python-pybind11/python-pybind11.mk
new file mode 100644
index 0000000000..c4fc578894
--- /dev/null
+++ b/package/python-pybind11/python-pybind11.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pybind11
+#
+################################################################################
+
+PYTHON_PYBIND11_VERSION = 2.5.0
+PYTHON_PYBIND11_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND11_VERSION))
+PYTHON_PYBIND11_LICENSE = BSD-3-Clause
+PYTHON_PYBIND11_LICENSE_FILES = LICENSE
+PYTHON_PYBIND11_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.20.1
