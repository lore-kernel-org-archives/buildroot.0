From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Mar 2020 11:49:07 +0100
Subject: [Buildroot] [PATCH 6/8] package/python3-pyyaml: add special host
 variant
In-Reply-To: <20200323104909.16765-1-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
Message-ID: <20200323104909.16765-6-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Needed to build mongodb.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python3-pyyaml/python3-pyyaml.hash |  1 +
 package/python3-pyyaml/python3-pyyaml.mk   | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 120000 package/python3-pyyaml/python3-pyyaml.hash
 create mode 100644 package/python3-pyyaml/python3-pyyaml.mk

diff --git a/package/python3-pyyaml/python3-pyyaml.hash b/package/python3-pyyaml/python3-pyyaml.hash
new file mode 120000
index 0000000000..afa4932ecb
--- /dev/null
+++ b/package/python3-pyyaml/python3-pyyaml.hash
@@ -0,0 +1 @@
+../python-pyyaml/python-pyyaml.hash
\ No newline at end of file
diff --git a/package/python3-pyyaml/python3-pyyaml.mk b/package/python3-pyyaml/python3-pyyaml.mk
new file mode 100644
index 0000000000..3026135fca
--- /dev/null
+++ b/package/python3-pyyaml/python3-pyyaml.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python3-pyyaml
+#
+################################################################################
+
+# Please keep in sync with
+# package/python-pyyaml/python-pyyaml.mk
+PYTHON3_PYYAML_VERSION = 5.3
+PYTHON3_PYYAML_SOURCE = PyYAML-$(PYTHON3_PYYAML_VERSION).tar.gz
+PYTHON3_PYYAML_SITE = https://files.pythonhosted.org/packages/3d/d9/ea9816aea31beeadccd03f1f8b625ecf8f645bd66744484d162d84803ce5
+PYTHON3_PYYAML_SETUP_TYPE = distutils
+PYTHON3_PYYAML_LICENSE = MIT
+PYTHON3_PYYAML_LICENSE_FILES = LICENSE
+PYTHON3_PYYAML_DEPENDENCIES = libyaml
+HOST_PYTHON3_PYYAML_DL_SUBDIR = python-pyyaml
+HOST_PYTHON3_PYYAML_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON3_PYYAML_DEPENDENCIES = host-libyaml
+
+$(eval $(host-python-package))
-- 
2.17.0
