From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Mar 2020 11:49:08 +0100
Subject: [Buildroot] [PATCH 7/8] package/python3-psutil: add a special host
 variant
In-Reply-To: <20200323104909.16765-1-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
Message-ID: <20200323104909.16765-7-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Needed to build mongodb.

With this host variant there is no need to enforce host
python in the original package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-psutil/python-psutil.mk     |  3 ---
 package/python3-psutil/python3-psutil.hash |  1 +
 package/python3-psutil/python3-psutil.mk   | 18 ++++++++++++++++++
 3 files changed, 19 insertions(+), 3 deletions(-)
 create mode 120000 package/python3-psutil/python3-psutil.hash
 create mode 100644 package/python3-psutil/python3-psutil.mk

diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index cfb015cfe6..b050547624 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -11,8 +11,5 @@ PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
 
-# Needed to build mongodb
-HOST_PYTHON_PSUTIL_NEEDS_HOST_PYTHON = python3
-
 $(eval $(python-package))
 $(eval $(host-python-package))
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
index 0000000000..9ca0f46681
--- /dev/null
+++ b/package/python3-psutil/python3-psutil.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python3-psutil
+#
+################################################################################
+
+# Please keep in sync with
+# package/python-mako/python-psutil.mk
+PYTHON3_PSUTIL_VERSION = 5.6.7
+PYTHON3_PSUTIL_SOURCE = psutil-$(PYTHON3_PSUTIL_VERSION).tar.gz
+PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/73/93/4f8213fbe66fc20cb904f35e6e04e20b47b85bee39845cc66a0bcf5ccdcb
+PYTHON3_PSUTIL_SETUP_TYPE = setuptools
+PYTHON3_PSUTIL_LICENSE = BSD-3-Clause
+PYTHON3_PSUTIL_LICENSE_FILES = LICENSE
+HOST_PYTHON3_PSUTIL_DL_SUBDIR = python-psutil
+HOST_PYTHON3_PSUTIL_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.17.0
