From: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Date: Fri, 26 Feb 2021 10:09:35 -0600
Subject: [Buildroot] [PATCH 2/4] package/python-libarchive-c: Add as new
 package
In-Reply-To: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
References: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
Message-ID: <20210226160937.16082-2-conrad.ratschan@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new host python package for python-libarchive-c. This is needed as a
runtime dependency for Diffoscope.

Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
---
 package/Config.in.host                            |  1 +
 package/python-libarchive-c/Config.in.host        |  8 ++++++++
 .../python-libarchive-c/python-libarchive-c.hash  |  2 ++
 .../python-libarchive-c/python-libarchive-c.mk    | 15 +++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-libarchive-c/Config.in.host
 create mode 100644 package/python-libarchive-c/python-libarchive-c.hash
 create mode 100644 package/python-libarchive-c/python-libarchive-c.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 1b3812decf..4edfb9cfa4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -65,6 +65,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
+	source "package/python-libarchive-c/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-magic/Config.in.host"
 	source "package/python-six/Config.in.host"
diff --git a/package/python-libarchive-c/Config.in.host b/package/python-libarchive-c/Config.in.host
new file mode 100644
index 0000000000..cd0c09af9d
--- /dev/null
+++ b/package/python-libarchive-c/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_LIBARCHIVE_C
+	bool "host-python-libarchive-c"
+	depends on BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_LIBARCHIVE
+	help
+	  A Python interface to libarchive
+
+	  https://github.com/Changaco/python-libarchive-c
diff --git a/package/python-libarchive-c/python-libarchive-c.hash b/package/python-libarchive-c/python-libarchive-c.hash
new file mode 100644
index 0000000000..adde6a8462
--- /dev/null
+++ b/package/python-libarchive-c/python-libarchive-c.hash
@@ -0,0 +1,2 @@
+# sha256 from https://pypi.org/pypi/diffoscope/json
+sha256  9919344cec203f5db6596a29b5bc26b07ba9662925a05e24980b84709232ef60  libarchive-c-2.9.tar.gz
diff --git a/package/python-libarchive-c/python-libarchive-c.mk b/package/python-libarchive-c/python-libarchive-c.mk
new file mode 100644
index 0000000000..b67e0a6796
--- /dev/null
+++ b/package/python-libarchive-c/python-libarchive-c.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-libarchive
+#
+################################################################################
+
+PYTHON_LIBARCHIVE_C_VERSION = 2.9
+PYTHON_LIBARCHIVE_C_SOURCE = libarchive-c-$(PYTHON_LIBARCHIVE_C_VERSION).tar.gz
+PYTHON_LIBARCHIVE_C_SITE = https://files.pythonhosted.org/packages/63/fe/9e6c78db381934e28c7ec3d30d4f209fe24442d17f1bd8c56d13ae185cf6
+PYTHON_LIBARCHIVE_C_SETUP_TYPE = setuptools
+PYTHON_LIBARCHIVE_C_LICENSE = CC0-1.0
+HOST_PYTHON_LIBARCHIVE_C_DL_SUBDIR = python-libarchive-c
+HOST_PYTHON_LIBARCHIVE_C_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.17.1
