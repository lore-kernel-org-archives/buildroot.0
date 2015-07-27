From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 00:09:21 +0200
Subject: [Buildroot] [git commit branch/next] python-pyyaml: new package
Message-ID: <20150808105644.B61647FD83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f098adb66cf744b8e3700990f5ee9857483e010f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - use 'select' rather than 'depends on' for the yaml library
    dependency
  - add hash file.
  - add upstream URL in Config.in help text
  - rework commit title.]

Signed-off-by: Geoffrey Ragot <geoffrey.ragot@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/python-pyyaml/Config.in          |    7 +++++++
 package/python-pyyaml/python-pyyaml.hash |    4 ++++
 package/python-pyyaml/python-pyyaml.mk   |   15 +++++++++++++++
 4 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 840d593..1e39c74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -652,6 +652,7 @@ menu "external python modules"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
 	source "package/python-pyxml/Config.in"
+	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
diff --git a/package/python-pyyaml/Config.in b/package/python-pyyaml/Config.in
new file mode 100644
index 0000000..45e818b
--- /dev/null
+++ b/package/python-pyyaml/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYYAML
+	bool "python-pyyaml"
+	select BR2_PACKAGE_LIBYAML
+	help
+	  The PyYAML package contains binding to the libyaml API.
+
+	  http://pyyaml.org/
diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
new file mode 100644
index 0000000..a6d9a77
--- /dev/null
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/pypi?:action=show_md5&digest=f50e08ef0fe55178479d3a618efe21db
+md5 f50e08ef0fe55178479d3a618efe21db PyYAML-3.11.tar.gz
+# Locally computed
+sha256 c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8 PyYAML-3.11.tar.gz
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
new file mode 100644
index 0000000..ef10dac
--- /dev/null
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyyaml
+#
+################################################################################
+
+PYTHON_PYYAML_VERSION = 3.11
+PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
+PYTHON_PYYAML_SITE = https://pypi.python.org/packages/source/P/PyYAML/
+PYTHON_PYYAML_SETUP_TYPE = distutils
+PYTHON_PYYAML_LICENSE = Python software foundation license v2
+PYTHON_PYYAML_LICENSE_FILES = LICENSE
+PYTHON_PYYAML_DEPENDENCIES = libyaml
+
+$(eval $(python-package))
