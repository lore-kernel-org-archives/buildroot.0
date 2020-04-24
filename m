From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 16:25:47 +0200
Subject: [Buildroot] [git commit] package/python3-pyyaml: add special host
 variant
Message-ID: <20200425093247.E34ED805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e4e15578262d7db4981a01e05be68e25b70d50a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to build mongodb.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyyaml/python-pyyaml.mk     |  1 +
 package/python3-pyyaml/python3-pyyaml.hash |  1 +
 package/python3-pyyaml/python3-pyyaml.mk   | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 78506390a4..7bbae309c6 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync package/python3-pyyaml/python3-pyyaml.mk
 PYTHON_PYYAML_VERSION = 5.3.1
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
 PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c
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
index 0000000000..c0dcebf4fc
--- /dev/null
+++ b/package/python3-pyyaml/python3-pyyaml.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python3-pyyaml
+#
+################################################################################
+
+# Please keep in sync with package/python-pyyaml/python-pyyaml.mk
+PYTHON3_PYYAML_VERSION = 5.3.1
+PYTHON3_PYYAML_SOURCE = PyYAML-$(PYTHON3_PYYAML_VERSION).tar.gz
+PYTHON3_PYYAML_SITE = https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c
+PYTHON3_PYYAML_SETUP_TYPE = distutils
+PYTHON3_PYYAML_LICENSE = MIT
+PYTHON3_PYYAML_LICENSE_FILES = LICENSE
+HOST_PYTHON3_PYYAML_DL_SUBDIR = python-pyyaml
+HOST_PYTHON3_PYYAML_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON3_PYYAML_DEPENDENCIES = host-libyaml
+
+$(eval $(host-python-package))
