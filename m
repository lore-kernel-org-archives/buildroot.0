From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:39:48 +0100
Subject: [Buildroot] [git commit] package/python3-jinja2: add special host
 variant
Message-ID: <20210119213844.6899380845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3cbde64647142bdef5857fc94da2576a1e98d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jinja2/python-jinja2.mk     |  1 +
 package/python3-jinja2/python3-jinja2.hash |  1 +
 package/python3-jinja2/python3-jinja2.mk   | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 5f6492915c..51b484d03e 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-jinja2/python3-jinja2.mk
 PYTHON_JINJA2_VERSION = 2.11.2
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
 PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c
diff --git a/package/python3-jinja2/python3-jinja2.hash b/package/python3-jinja2/python3-jinja2.hash
new file mode 120000
index 0000000000..543e981aa0
--- /dev/null
+++ b/package/python3-jinja2/python3-jinja2.hash
@@ -0,0 +1 @@
+../python-jinja2/python-jinja2.hash
\ No newline at end of file
diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
new file mode 100644
index 0000000000..cc8b1ff86f
--- /dev/null
+++ b/package/python3-jinja2/python3-jinja2.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python3-jinja2
+#
+################################################################################
+
+PYTHON3_JINJA2_VERSION = 2.11.2
+PYTHON3_JINJA2_SOURCE = Jinja2-$(PYTHON3_JINJA2_VERSION).tar.gz
+PYTHON3_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c
+PYTHON3_JINJA2_SETUP_TYPE = setuptools
+PYTHON3_JINJA2_LICENSE = BSD-3-Clause
+PYTHON3_JINJA2_LICENSE_FILES = LICENSE.rst
+
+HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
+# In host build, setup.py tries to download markupsafe if it is not installed
+HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python3-markupsafe
+
+$(eval $(host-python-package))
