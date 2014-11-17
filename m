From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 16:49:38 +0100
Subject: [Buildroot] [git commit branch/next] package: add python-markupsafe
Message-ID: <20141117160801.4CEB89D461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=771f8d4f1965ee7801fe0f71a21b49ca40b73c31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                |    1 +
 package/python-markupsafe/Config.in              |    7 +++++++
 package/python-markupsafe/python-markupsafe.hash |    3 +++
 package/python-markupsafe/python-markupsafe.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3e5ad39..92af942 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -500,6 +500,7 @@ menu "external python modules"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-mad/Config.in"
+	source "package/python-markupsafe/Config.in"
 	source "package/python-meld3/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-markupsafe/Config.in b/package/python-markupsafe/Config.in
new file mode 100644
index 0000000..48421e0
--- /dev/null
+++ b/package/python-markupsafe/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MARKUPSAFE
+	bool "python-markupsafe"
+	help
+	  MarkupSafe implements a XML/HTML/XHTML Markup safe string
+	  for Python.
+
+	  https://github.com/mitsuhiko/markupsafe
diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
new file mode 100644
index 0000000..448252b
--- /dev/null
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f5ab3deee4c37cd6a922fb81e730da6e, sha256 locally computed
+md5	f5ab3deee4c37cd6a922fb81e730da6e  MarkupSafe-0.23.tar.gz
+sha256	a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3  MarkupSafe-0.23.tar.gz
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
new file mode 100644
index 0000000..9c7eb14
--- /dev/null
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-markupsafe
+#
+################################################################################
+
+PYTHON_MARKUPSAFE_VERSION = 0.23
+PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
+PYTHON_MARKUPSAFE_SITE = http://pypi.python.org/packages/source/M/MarkupSafe
+PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
+PYTHON_MARKUPSAFE_LICENSE = BSD-3c
+PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
