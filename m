From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 15 Jan 2020 09:09:24 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/python-aenum: new package
Message-ID: <20200115080926.6669-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - add followup patches fixing python-can package

 package/Config.in                      |  1 +
 package/python-aenum/Config.in         |  7 +++++++
 package/python-aenum/python-aenum.hash |  2 ++
 package/python-aenum/python-aenum.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-aenum/Config.in
 create mode 100644 package/python-aenum/python-aenum.hash
 create mode 100644 package/python-aenum/python-aenum.mk

diff --git a/package/Config.in b/package/Config.in
index 4c94914680..4c6e46b794 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -832,6 +832,7 @@ endif
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
+	source "package/python-aenum/Config.in"
 	source "package/python-aioblescan/Config.in"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aioconsole/Config.in"
diff --git a/package/python-aenum/Config.in b/package/python-aenum/Config.in
new file mode 100644
index 0000000000..be3dd0fb9c
--- /dev/null
+++ b/package/python-aenum/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AENUM
+	bool "python-aenum"
+	help
+	  Advanced Enumerations (compatible with Python's stdlib Enum),
+	  NamedTuples, and NamedConstants.
+
+	  https://pypi.org/project/aenum
diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
new file mode 100644
index 0000000000..14436343ba
--- /dev/null
+++ b/package/python-aenum/python-aenum.hash
@@ -0,0 +1,2 @@
+# sha256 from https://pypi.org/pypi/aenum/json
+sha256	a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8  aenum-2.2.3.tar.gz
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
new file mode 100644
index 0000000000..1d5322ef41
--- /dev/null
+++ b/package/python-aenum/python-aenum.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aenum
+#
+################################################################################
+
+PYTHON_AENUM_VERSION = 2.2.3
+PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/6f/6a/8ed729e0add885d7a559ebb06133029b1f8c4bd66cbf1bdee1ec969fb310
+PYTHON_AENUM_SETUP_TYPE = setuptools
+PYTHON_AENUM_LICENSE = BSD-3-Clause
+PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
+
+$(eval $(python-package))
-- 
2.17.0
