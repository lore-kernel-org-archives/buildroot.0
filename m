From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Mar 2021 21:17:21 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/python{3}-pyyaml:
 switch to setuptools
Message-ID: <20210314201236.28F0A87C90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6b3f0d1b0e7d30663da132cb01020213e9f5902
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Since version 5.4.0 pyyaml uses setuptools (see
https://github.com/yaml/pyyaml/blob/master/CHANGES)

Fixes:
  - http://autobuild.buildroot.net/results/bc36ae51a1e4d70c5fd2a3eb4b458aba4220f2dc

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d64a905d9f8ec61eb4390f7b0317f070c6869ed5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyyaml/python-pyyaml.mk   | 2 +-
 package/python3-pyyaml/python3-pyyaml.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index b5798d44a2..8279adbcca 100644
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
 PYTHON_PYYAML_DEPENDENCIES = libyaml
diff --git a/package/python3-pyyaml/python3-pyyaml.mk b/package/python3-pyyaml/python3-pyyaml.mk
index b7d1c42c00..ec9c153391 100644
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
 HOST_PYTHON3_PYYAML_DL_SUBDIR = python-pyyaml
