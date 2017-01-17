From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 17 Jan 2017 11:17:20 +0100
Subject: [Buildroot] [PATCH 3/8] python-setuptools-scm: new package
In-Reply-To: <20170117101725.19629-1-yegorslists@googlemail.com>
References: <20170117101725.19629-1-yegorslists@googlemail.com>
Message-ID: <20170117101725.19629-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This package is only needed at build stage, so make it a host
package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash |  3 +++
 package/python-setuptools-scm/python-setuptools-scm.mk   | 14 ++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/python-setuptools-scm/python-setuptools-scm.hash
 create mode 100644 package/python-setuptools-scm/python-setuptools-scm.mk

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
new file mode 100644
index 000000000..734fc5a9d
--- /dev/null
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/setuptools_scm/json, sha256 locally computed
+md5	b6916c78ed6253d6602444fad4279c5b  setuptools_scm-1.15.0.tar.gz
+sha256	daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f  setuptools_scm-1.15.0.tar.gz
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
new file mode 100644
index 000000000..993fbb978
--- /dev/null
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-setuptools-scm
+#
+################################################################################
+
+PYTHON_SETUPTOOLS_SCM_VERSION = 1.15.0
+PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SCM_SITE = https://pypi.python.org/packages/80/b7/31b6ae5fcb188e37f7e31abe75f9be90490a5456a72860fa6e643f8a3cbc
+PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
+PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
+PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
-- 
2.11.0
