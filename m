From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 16:27:11 +0200
Subject: [Buildroot] [git commit] package/python3-psutil: add a special host
 variant
Message-ID: <20200425093247.EC377805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20fe8d2234035a4a77f5767bf6451852f70fe3a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to build mongodb.

With this host variant there is no need to enforce host
python in the original package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psutil/python-psutil.mk     |  1 +
 package/python3-psutil/python3-psutil.hash |  1 +
 package/python3-psutil/python3-psutil.mk   | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 5f87e723cc..08bb2fd7bd 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-psutil/python3-psutil.mk
 PYTHON_PSUTIL_VERSION = 5.7.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
 PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/c4/b8/3512f0e93e0db23a71d82485ba256071ebef99b227351f0f5540f744af41
diff --git a/package/python3-psutil/python3-psutil.hash b/package/python3-psutil/python3-psutil.hash
new file mode 120000
index 0000000000..ff688fab28
--- /dev/null
+++ b/package/python3-psutil/python3-psutil.hash
@@ -0,0 +1 @@
+../python-psutil/python-psutil.hash
\ No newline at end of file
diff --git a/package/python3-psutil/python3-psutil.mk b/package/python3-psutil/python3-psutil.mk
new file mode 100644
index 0000000000..ddd4b6b7d3
--- /dev/null
+++ b/package/python3-psutil/python3-psutil.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python3-psutil
+#
+################################################################################
+
+# Please keep in sync with package/python-psutil/python-psutil.mk
+PYTHON3_PSUTIL_VERSION = 5.7.0
+PYTHON3_PSUTIL_SOURCE = psutil-$(PYTHON3_PSUTIL_VERSION).tar.gz
+PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/c4/b8/3512f0e93e0db23a71d82485ba256071ebef99b227351f0f5540f744af41
+PYTHON3_PSUTIL_SETUP_TYPE = setuptools
+PYTHON3_PSUTIL_LICENSE = BSD-3-Clause
+PYTHON3_PSUTIL_LICENSE_FILES = LICENSE
+HOST_PYTHON3_PSUTIL_DL_SUBDIR = python-psutil
+HOST_PYTHON3_PSUTIL_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
