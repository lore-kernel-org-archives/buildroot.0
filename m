From: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Date: Fri, 26 Feb 2021 10:09:34 -0600
Subject: [Buildroot] [PATCH 1/4] package/python-magic: Add new package
Message-ID: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new package for python-magic. This is needed as a runtime dependency
for Diffoscope.

Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
---
 package/Config.in.host                 |  1 +
 package/python-magic/Config.in.host    |  8 ++++++++
 package/python-magic/python-magic.hash |  2 ++
 package/python-magic/python-magic.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-magic/Config.in.host
 create mode 100644 package/python-magic/python-magic.hash
 create mode 100644 package/python-magic/python-magic.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index ba6a68c728..1b3812decf 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -66,6 +66,7 @@ menu "Host utilities"
 	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-magic/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-magic/Config.in.host b/package/python-magic/Config.in.host
new file mode 100644
index 0000000000..021c6b11ed
--- /dev/null
+++ b/package/python-magic/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_MAGIC
+	bool "host-python-magic"
+	depends on BR2_PACKAGE_HOST_PYTHON3
+	help
+	  A Python interface to the libmagic file type identification
+	  library.
+
+	  https://github.com/ahupp/python-magic
diff --git a/package/python-magic/python-magic.hash b/package/python-magic/python-magic.hash
new file mode 100644
index 0000000000..e6d722ec50
--- /dev/null
+++ b/package/python-magic/python-magic.hash
@@ -0,0 +1,2 @@
+# sha256 from https://pypi.org/pypi/python-magic/json
+sha256  ca884349f2c92ce830e3f498c5b7c7051fe2942c3ee4332f65213b8ebff15a62  python-magic-0.4.22.tar.gz
diff --git a/package/python-magic/python-magic.mk b/package/python-magic/python-magic.mk
new file mode 100644
index 0000000000..fb9e61d2e9
--- /dev/null
+++ b/package/python-magic/python-magic.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-magic
+#
+################################################################################
+
+PYTHON_MAGIC_VERSION = 0.4.22
+PYTHON_MAGIC_SITE = https://files.pythonhosted.org/packages/26/60/6d45e0e7043f5a7bf15238ca451256a78d3c5fe02cd372f0ed6d888a16d5
+PYTHON_MAGIC_SETUP_TYPE = setuptools
+PYTHON_MAGIC_LICENSE = MIT
+HOST_PYTHON_MAGIC_DL_SUBDIR = python-magic
+HOST_PYTHON_MAGIC_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.17.1
