From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 19:30:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-py: security bump to version
 1.10.0
In-Reply-To: <20210405173027.4159626-1-fontaine.fabrice@gmail.com>
References: <20210405173027.4159626-1-fontaine.fabrice@gmail.com>
Message-ID: <20210405173027.4159626-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-29651: A denial of service via regular expression in the
py.path.svnwc component of py (aka python-py) through 1.9.0 could be
used by attackers to cause a compute-time denial of service attack by
supplying malicious input to the blame functionality.

Add py/_vendored_packages/iniconfig-1.1.1.dist-info/LICENSE (MIT) which
has been added with
https://github.com/pytest-dev/py/commit/94cf44fd41d957eb50773d3e4fb54e931836779e

https://github.com/pytest-dev/py/blob/1.10.0/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-py/python-py.hash | 5 +++--
 package/python-py/python-py.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-py/python-py.hash b/package/python-py/python-py.hash
index 98e16fd97b..2d9928f376 100644
--- a/package/python-py/python-py.hash
+++ b/package/python-py/python-py.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/py/json
-md5  b80db4e61eef724f49feb4d20b649e62  py-1.9.0.tar.gz
-sha256  9ca6883ce56b4e8da7e79ac18787889fa5206c79dcc67fb065376cd2fe03f342  py-1.9.0.tar.gz
+md5  5f108bfe00d5468cbdb8071051f86a55  py-1.10.0.tar.gz
+sha256  21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f817e7a809035269e1bd3  py-1.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
+sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  py/_vendored_packages/iniconfig-1.1.1.dist-info/LICENSE
diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
index 2e9d18ab1a..d8cb6fa544 100644
--- a/package/python-py/python-py.mk
+++ b/package/python-py/python-py.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PY_VERSION = 1.9.0
+PYTHON_PY_VERSION = 1.10.0
 PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
-PYTHON_PY_SITE = https://files.pythonhosted.org/packages/97/a6/ab9183fe08f69a53d06ac0ee8432bc0ffbb3989c575cc69b73a0229a9a99
+PYTHON_PY_SITE = https://files.pythonhosted.org/packages/0d/8c/50e9f3999419bb7d9639c37e83fa9cdcf0f601a9d407162d6c37ad60be71
 PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_PY_SETUP_TYPE = setuptools
 PYTHON_PY_LICENSE = MIT
-PYTHON_PY_LICENSE_FILES = LICENSE
+PYTHON_PY_LICENSE_FILES = LICENSE py/_vendored_packages/iniconfig-1.1.1.dist-info/LICENSE
 PYTHON_PY_CPE_ID_VENDOR = pytest
 PYTHON_PY_CPE_ID_PRODUCT = py
 
-- 
2.30.2
