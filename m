From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  6 Mar 2021 10:54:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/python{3}-pyyaml: switch to
 setuptools
Message-ID: <20210306085432.129560-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 5.4.0 pyyaml uses setuptools (see
https://github.com/yaml/pyyaml/blob/master/CHANGES)

Fixes:
  - http://autobuild.buildroot.net/results/bc36ae51a1e4d70c5fd2a3eb4b458aba4220f2dc

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyyaml/python-pyyaml.mk   | 2 +-
 package/python3-pyyaml/python3-pyyaml.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 87c0fe4e81..c9013de8ec 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -8,7 +8,7 @@
 PYTHON_PYYAML_VERSION = 5.4.1
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
 PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d
-PYTHON_PYYAML_SETUP_TYPE = distutils
+PYTHON_PYYAML_SETUP_TYPE = setuptools
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_CPE_ID_VENDOR = pyyaml
diff --git a/package/python3-pyyaml/python3-pyyaml.mk b/package/python3-pyyaml/python3-pyyaml.mk
index 079408e63f..f758341502 100644
--- a/package/python3-pyyaml/python3-pyyaml.mk
+++ b/package/python3-pyyaml/python3-pyyaml.mk
@@ -8,7 +8,7 @@
 PYTHON3_PYYAML_VERSION = 5.4.1
 PYTHON3_PYYAML_SOURCE = PyYAML-$(PYTHON3_PYYAML_VERSION).tar.gz
 PYTHON3_PYYAML_SITE = https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d
-PYTHON3_PYYAML_SETUP_TYPE = distutils
+PYTHON3_PYYAML_SETUP_TYPE = setuptools
 PYTHON3_PYYAML_LICENSE = MIT
 PYTHON3_PYYAML_LICENSE_FILES = LICENSE
 PYTHON3_PYYAML_CPE_ID_VENDOR = pyyaml
-- 
2.27.0
