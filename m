From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 10 Feb 2021 22:12:50 -0700
Subject: [Buildroot] [PATCH 1/3] package/python-semantic-version: new package
Message-ID: <20210211051252.966385-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-semantic-version.hash                   |  5 +++++
 .../python-semantic-version.mk                     | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-semantic-version/python-semantic-version.hash
 create mode 100644 package/python-semantic-version/python-semantic-version.mk

diff --git a/package/python-semantic-version/python-semantic-version.hash b/package/python-semantic-version/python-semantic-version.hash
new file mode 100644
index 0000000000..692905ec29
--- /dev/null
+++ b/package/python-semantic-version/python-semantic-version.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/semantic-version/json
+md5  76d7364def7ee487b6153d40b13de904  semantic_version-2.8.5.tar.gz
+sha256  d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54  semantic_version-2.8.5.tar.gz
+# Locally computed sha256 checksums
+sha256  a85e7ef2fbc670d26781ed6844cd31a7e8ada65d21328f75a0b02402faae37ea  LICENSE
diff --git a/package/python-semantic-version/python-semantic-version.mk b/package/python-semantic-version/python-semantic-version.mk
new file mode 100644
index 0000000000..2352690e26
--- /dev/null
+++ b/package/python-semantic-version/python-semantic-version.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-semantic-version
+#
+################################################################################
+
+PYTHON_SEMANTIC_VERSION_VERSION = 2.8.5
+PYTHON_SEMANTIC_VERSION_SOURCE = semantic_version-$(PYTHON_SEMANTIC_VERSION_VERSION).tar.gz
+PYTHON_SEMANTIC_VERSION_SITE = https://files.pythonhosted.org/packages/d4/52/3be868c7ed1f408cb822bc92ce17ffe4e97d11c42caafce0589f05844dd0
+PYTHON_SEMANTIC_VERSION_SETUP_TYPE = setuptools
+PYTHON_SEMANTIC_VERSION_LICENSE = BSD-2-Clause
+PYTHON_SEMANTIC_VERSION_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.25.1
