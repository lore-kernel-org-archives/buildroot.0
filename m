From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 21:56:48 +0100
Subject: [Buildroot] [git commit] python-enum: new package
Message-ID: <20141220205745.E8B6080579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=857cba81104693f6d0114107d22eaf8b88d236e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is an alternative to python-enum34 with a somewhat different API.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/python-enum/Config.in        |   12 ++++++++++++
 package/python-enum/python-enum.hash |    3 +++
 package/python-enum/python-enum.mk   |   14 ++++++++++++++
 4 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 81bb9e3..0ce890d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ menu "external python modules"
 	source "package/python-dialog/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-dpkt/Config.in"
+	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flup/Config.in"
diff --git a/package/python-enum/Config.in b/package/python-enum/Config.in
new file mode 100644
index 0000000..e26ae8b
--- /dev/null
+++ b/package/python-enum/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_ENUM
+	bool "python-enum"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Robust enumerated type support in Python
+
+	  An enumeration object is an immutable sequence object built
+	  from a sequence of strings. Each value is also available as
+	  an attribute. Such values are constant. Comparisons and
+	  enumeration are supported.
+
+	  https://pypi.python.org/pypi/enum
diff --git a/package/python-enum/python-enum.hash b/package/python-enum/python-enum.hash
new file mode 100644
index 0000000..c7c1924
--- /dev/null
+++ b/package/python-enum/python-enum.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=ce75c7c3c86741175a84456cc5bd531e, sha256 locally computed
+md5	ce75c7c3c86741175a84456cc5bd531e  enum-0.4.4.tar.gz
+sha256	9bdfacf543baf2350df7613eb37f598a802f346985ca0dc1548be6494140fdff  enum-0.4.4.tar.gz
diff --git a/package/python-enum/python-enum.mk b/package/python-enum/python-enum.mk
new file mode 100644
index 0000000..0131be3
--- /dev/null
+++ b/package/python-enum/python-enum.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-enum
+#
+################################################################################
+
+PYTHON_ENUM_VERSION = 0.4.4
+PYTHON_ENUM_SOURCE = enum-$(PYTHON_ENUM_VERSION).tar.gz
+PYTHON_ENUM_SITE = http://pypi.python.org/packages/source/e/enum
+PYTHON_ENUM_SETUP_TYPE = setuptools
+PYTHON_ENUM_LICENSE = GPLv2+ or Python software foundation license v2
+PYTHON_ENUM_LICENSE_FILES = LICENSE.GPL LICENSE.PSF
+
+$(eval $(python-package))
