From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 27 Feb 2021 11:45:03 +0100
Subject: [Buildroot] [PATCH RESEND] package/python-pyext: new package
Message-ID: <20210227104503.14434-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Python-pyext is a set of scripts to enhance python.
This includes features such as function overloading
and the "switch" statement.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---

No license file is currently delivered with the package sources.
You can see on "pypi.org" that it is under MIT license though.
I asked confirmation to the author though, here's a copy
of that email:

Hello,

I just pushed a contribution to "Buildroot",
a tool to generate embedded linux image easily,
to have your package available in the general interface.

I saw on "pypi.org" that your package is under MIT license,
that is what I declared in Buildroot. However,
since no license file is provided, the license verification is turned off.

* Can you confirm your package is under MIT license?
* Do you plan on delivering a license file in the next release

Thank you

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-pyext/Config.in         |  8 ++++++++
 package/python-pyext/python-pyext.hash |  2 ++
 package/python-pyext/python-pyext.mk   | 17 +++++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-pyext/Config.in
 create mode 100644 package/python-pyext/python-pyext.hash
 create mode 100644 package/python-pyext/python-pyext.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b019fe04d5..17fc951805 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1057,6 +1057,7 @@ N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
+F:	package/pyext/
 F:	package/python-pybind/
 F:	package/reaver/
 
diff --git a/package/Config.in b/package/Config.in
index 5304ab141c..bc72708d1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1117,6 +1117,7 @@ menu "External python modules"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
 	source "package/python-pyelftools/Config.in"
+	source "package/python-pyext/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
diff --git a/package/python-pyext/Config.in b/package/python-pyext/Config.in
new file mode 100644
index 0000000000..4290d3899a
--- /dev/null
+++ b/package/python-pyext/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYEXT
+	bool "python-pyext"
+	help
+	  python-pyext is a set of extensions to enhance python.
+	  This includes features such as function overloading,
+	  the 'switch' statement, python2 safe tuple unpacking.
+
+	  https://pypi.org/project/pyext/
diff --git a/package/python-pyext/python-pyext.hash b/package/python-pyext/python-pyext.hash
new file mode 100644
index 0000000000..55ecee1317
--- /dev/null
+++ b/package/python-pyext/python-pyext.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e618a635be4e8c4a84b443cc27186601ad052efe35f01839815f2a2cf3947cdf  pyext-0.7.tar.gz
diff --git a/package/python-pyext/python-pyext.mk b/package/python-pyext/python-pyext.mk
new file mode 100644
index 0000000000..cc01cc9ac7
--- /dev/null
+++ b/package/python-pyext/python-pyext.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pyext
+#
+################################################################################
+
+PYTHON_PYEXT_VERSION = 0.7
+PYTHON_PYEXT_SOURCE = pyext-$(PYTHON_PYEXT_VERSION).tar.gz
+PYTHON_PYEXT_SITE = https://files.pythonhosted.org/packages/b0/be/9b6005ac644aaef022527ce49617263379e49dbdbd433d1d3dd66d71f570
+
+# A license file is not delivered with pyext, however,
+# pypi.org clearly says this package is under MIT license.
+# I asked confirmation to package authors
+PYTHON_PYEXT_LICENSE = Unknown (clarification has been asked to authors)
+PYTHON_PYEXT_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.20.1
