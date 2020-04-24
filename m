From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 14:57:00 +0200
Subject: [Buildroot] [git commit] package/python3-regex: add special package
 variant for the host build
Message-ID: <20200425093247.C38F9805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=709f21fb4f83477c364b5dfcf9d7959a0b0a2523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to build mongodb.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-regex/python-regex.mk     |  1 +
 package/python3-regex/python3-regex.hash |  1 +
 package/python3-regex/python3-regex.mk   | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index aea967c9ed..8a527c8ee7 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-regex/python3-regex.mk
 PYTHON_REGEX_VERSION = 2020.2.20
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
 PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/e8/76/8ac7f467617b9cfbafcef3c76df6f22b15de654a62bea719792b00a83195
diff --git a/package/python3-regex/python3-regex.hash b/package/python3-regex/python3-regex.hash
new file mode 120000
index 0000000000..274f4dc277
--- /dev/null
+++ b/package/python3-regex/python3-regex.hash
@@ -0,0 +1 @@
+../python-regex/python-regex.hash
\ No newline at end of file
diff --git a/package/python3-regex/python3-regex.mk b/package/python3-regex/python3-regex.mk
new file mode 100644
index 0000000000..f75fb76ace
--- /dev/null
+++ b/package/python3-regex/python3-regex.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python3-regex
+#
+################################################################################
+
+# Please keep in sync with package/python-regex/python-regex.mk
+PYTHON3_REGEX_VERSION = 2020.2.20
+PYTHON3_REGEX_SOURCE = regex-$(PYTHON3_REGEX_VERSION).tar.gz
+PYTHON3_REGEX_SITE = https://files.pythonhosted.org/packages/e8/76/8ac7f467617b9cfbafcef3c76df6f22b15de654a62bea719792b00a83195
+PYTHON3_REGEX_SETUP_TYPE = setuptools
+PYTHON3_REGEX_LICENSE = CNRI-Python
+HOST_PYTHON3_REGEX_DL_SUBDIR = python-regex
+HOST_PYTHON3_REGEX_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
