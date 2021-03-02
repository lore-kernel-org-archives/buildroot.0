From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 18:25:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-pyyaml: security bump to
 version 5.4.1
In-Reply-To: <20210302172523.373997-1-fontaine.fabrice@gmail.com>
References: <20210302172523.373997-1-fontaine.fabrice@gmail.com>
Message-ID: <20210302172523.373997-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-14343: A vulnerability was discovered in the PyYAML library
in versions before 5.4, where it is susceptible to arbitrary code
execution when it processes untrusted YAML files through the full_load
method or with the FullLoader loader. Applications that use the library
to process untrusted input may be vulnerable to this flaw. This flaw
allows an attacker to execute arbitrary code on the system by abusing
the python/object/new constructor. This flaw is due to an incomplete fix
for CVE-2020-1747.

Update hash of LICENSE file (update in year:
https://github.com/yaml/pyyaml/commit/58d0cb7ee09954c67fabfbd714c5673b03e7a9e1)

https://github.com/yaml/pyyaml/blob/5.4.1/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyyaml/python-pyyaml.hash | 6 +++---
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 package/python3-pyyaml/python3-pyyaml.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index 90e1f2199e..82b2f4f880 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyYAML/json
-md5  d3590b85917362e837298e733321962b  PyYAML-5.3.1.tar.gz
-sha256  b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d  PyYAML-5.3.1.tar.gz
+md5  46e25294c7efec23d4072ed6a7777f46  PyYAML-5.4.1.tar.gz
+sha256  607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e  PyYAML-5.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  c40112449f254b9753045925248313e9270efa36d226b22d82d4cc6c43c57f29  LICENSE
+sha256  8d3928f9dc4490fd635707cb88eb26bd764102a7282954307d3e5167a577e8a4  LICENSE
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index c2d0435275..87c0fe4e81 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync package/python3-pyyaml/python3-pyyaml.mk
-PYTHON_PYYAML_VERSION = 5.3.1
+PYTHON_PYYAML_VERSION = 5.4.1
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d
 PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
diff --git a/package/python3-pyyaml/python3-pyyaml.mk b/package/python3-pyyaml/python3-pyyaml.mk
index 1b467645aa..079408e63f 100644
--- a/package/python3-pyyaml/python3-pyyaml.mk
+++ b/package/python3-pyyaml/python3-pyyaml.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pyyaml/python-pyyaml.mk
-PYTHON3_PYYAML_VERSION = 5.3.1
+PYTHON3_PYYAML_VERSION = 5.4.1
 PYTHON3_PYYAML_SOURCE = PyYAML-$(PYTHON3_PYYAML_VERSION).tar.gz
-PYTHON3_PYYAML_SITE = https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c
+PYTHON3_PYYAML_SITE = https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d
 PYTHON3_PYYAML_SETUP_TYPE = distutils
 PYTHON3_PYYAML_LICENSE = MIT
 PYTHON3_PYYAML_LICENSE_FILES = LICENSE
-- 
2.30.0
