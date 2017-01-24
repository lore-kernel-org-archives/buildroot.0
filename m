From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:49:17 +1300
Subject: [Buildroot] [git commit] python-setuptools-scm: new package
Message-ID: <20170124095724.C017F81ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3022787c73e7474e4ebb2647a561bea2d2bc45b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is only needed at build stage, so make it a host
package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash |  3 +++
 package/python-setuptools-scm/python-setuptools-scm.mk   | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
new file mode 100644
index 0000000..734fc5a
--- /dev/null
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/setuptools_scm/json, sha256 locally computed
+md5	b6916c78ed6253d6602444fad4279c5b  setuptools_scm-1.15.0.tar.gz
+sha256	daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f  setuptools_scm-1.15.0.tar.gz
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
new file mode 100644
index 0000000..993fbb9
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
