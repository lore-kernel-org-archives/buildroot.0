From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:39:13 +0100
Subject: [Buildroot] [git commit] package/python3-markupsafe: add special
 host variant
Message-ID: <20210119213844.5DEAF82A55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa93ef1617aa38fb5ba333920923dcf95556d532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-markupsafe/python-markupsafe.mk     |  1 +
 package/python3-markupsafe/python3-markupsafe.hash |  1 +
 package/python3-markupsafe/python3-markupsafe.mk   | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index b527706091..f067d94f34 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-markupsafe/python3-markupsafe.mk
 PYTHON_MARKUPSAFE_VERSION = 1.1.1
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
 PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
diff --git a/package/python3-markupsafe/python3-markupsafe.hash b/package/python3-markupsafe/python3-markupsafe.hash
new file mode 120000
index 0000000000..947cfa12d7
--- /dev/null
+++ b/package/python3-markupsafe/python3-markupsafe.hash
@@ -0,0 +1 @@
+../python-markupsafe/python-markupsafe.hash
\ No newline at end of file
diff --git a/package/python3-markupsafe/python3-markupsafe.mk b/package/python3-markupsafe/python3-markupsafe.mk
new file mode 100644
index 0000000000..58f6e67b64
--- /dev/null
+++ b/package/python3-markupsafe/python3-markupsafe.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python3-markupsafe
+#
+################################################################################
+
+PYTHON3_MARKUPSAFE_VERSION = 1.1.1
+PYTHON3_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION).tar.gz
+PYTHON3_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
+PYTHON3_MARKUPSAFE_SETUP_TYPE = setuptools
+PYTHON3_MARKUPSAFE_LICENSE = BSD-3-Clause
+PYTHON3_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
+
+HOST_PYTHON3_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
