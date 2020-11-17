From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Nov 2020 23:34:33 +0100
Subject: [Buildroot] [PATCH/next v1 2/5] package/python3-markupsafe: add
 special host variant
In-Reply-To: <20201117223436.24036-1-ps.report@gmx.net>
References: <20201117223436.24036-1-ps.report@gmx.net>
Message-ID: <20201117223436.24036-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-markupsafe/python-markupsafe.mk   |  1 +
 .../python3-markupsafe/python3-markupsafe.hash   |  4 ++++
 package/python3-markupsafe/python3-markupsafe.mk | 16 ++++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/python3-markupsafe/python3-markupsafe.hash
 create mode 100644 package/python3-markupsafe/python3-markupsafe.mk

diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index b527706091..f067d94f34 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-markupsafe/python3-markupsafe.mk
 PYTHON_MARKUPSAFE_VERSION = 1.1.1
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
 PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
diff --git a/package/python3-markupsafe/python3-markupsafe.hash b/package/python3-markupsafe/python3-markupsafe.hash
new file mode 100644
index 0000000000..df07662a86
--- /dev/null
+++ b/package/python3-markupsafe/python3-markupsafe.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/markupsafe/json, sha256 locally computed
+md5	43fd756864fe42063068e092e220c57b  MarkupSafe-1.1.1.tar.gz
+sha256	29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b  MarkupSafe-1.1.1.tar.gz
+sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python3-markupsafe/python3-markupsafe.mk b/package/python3-markupsafe/python3-markupsafe.mk
new file mode 100644
index 0000000000..58f6e67b64
--- /dev/null
+++ b/package/python3-markupsafe/python3-markupsafe.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python3-markupsafe
+#
+################################################################################
+
+PYTHON3_MARKUPSAFE_VERSION = 1.1.1
+PYTHON3_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION).tar.gz
+PYTHON3_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
+PYTHON3_MARKUPSAFE_SETUP_TYPE = setuptools
+PYTHON3_MARKUPSAFE_LICENSE = BSD-3-Clause
+PYTHON3_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
+
+HOST_PYTHON3_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.29.2
