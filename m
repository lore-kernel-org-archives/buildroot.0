From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:10:59 +0100
Subject: [Buildroot] [git commit] python-enum34: new package
Message-ID: <20141207221108.1ED10800BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a255774480901df61cb76812e8f715f952b1a22f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/python-enum34/Config.in          |   12 ++++++++++++
 package/python-enum34/python-enum34.hash |    3 +++
 package/python-enum34/python-enum34.mk   |   14 ++++++++++++++
 4 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 40eba6d..4f0c1ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -492,6 +492,7 @@ menu "external python modules"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dpkt/Config.in"
+	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-gobject/Config.in"
diff --git a/package/python-enum34/Config.in b/package/python-enum34/Config.in
new file mode 100644
index 0000000..2511a35
--- /dev/null
+++ b/package/python-enum34/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_ENUM34
+	bool "python-enum34"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python 3.4 Enum backported to 2.x.
+
+	  An enumeration is a set of symbolic names (members) bound to
+	  unique, constant values. Within an enumeration, the members
+	  can be compared by identity, and the enumeration itself can
+	  be iterated over.
+
+	  https://pypi.python.org/pypi/enum34
diff --git a/package/python-enum34/python-enum34.hash b/package/python-enum34/python-enum34.hash
new file mode 100644
index 0000000..dd6ce34
--- /dev/null
+++ b/package/python-enum34/python-enum34.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=ac80f432ac9373e7d162834b264034b6, sha256 locally computed
+md5	ac80f432ac9373e7d162834b264034b6  enum34-1.0.4.tar.gz
+sha256	d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447  enum34-1.0.4.tar.gz
diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
new file mode 100644
index 0000000..9d50e95
--- /dev/null
+++ b/package/python-enum34/python-enum34.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-enum34
+#
+################################################################################
+
+PYTHON_ENUM34_VERSION = 1.0.4
+PYTHON_ENUM34_SOURCE =enum34-$(PYTHON_ENUM34_VERSION).tar.gz
+PYTHON_ENUM34_SITE = http://pypi.python.org/packages/source/e/enum34
+PYTHON_ENUM34_SETUP_TYPE = distutils
+PYTHON_ENUM34_LICENSE = BSD-3c
+PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
+
+$(eval $(python-package))
