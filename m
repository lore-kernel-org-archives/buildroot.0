From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 25 Apr 2017 12:14:22 -0700
Subject: [Buildroot] [PATCH 8/9]
	package/python-backports-shutil-get-terminal-size: New package
In-Reply-To: <20170425191423.13294-1-andrew.smirnov@gmail.com>
References: <20170425191423.13294-1-andrew.smirnov@gmail.com>
Message-ID: <20170425191423.13294-9-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'scandir'[1] package to buildroot. Needed by 'IPython', when
building against Python2.

[1] https://pypi.python.org/pypi/backports.shutil_get_terminal_size

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/Config.in                                           |  1 +
 package/python-backports-shutil-get-terminal-size/Config.in |  9 +++++++++
 .../python-backports-shutil-get-terminal-size.hash          |  2 ++
 .../python-backports-shutil-get-terminal-size.mk            | 13 +++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-backports-shutil-get-terminal-size/Config.in
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk

diff --git a/package/Config.in b/package/Config.in
index a749b78..87240ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -675,6 +675,7 @@ menu "External python modules"
 	source "package/python-autobahn/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backports-abc/Config.in"
+	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bottle/Config.in"
diff --git a/package/python-backports-shutil-get-terminal-size/Config.in b/package/python-backports-shutil-get-terminal-size/Config.in
new file mode 100644
index 0000000..24bf3b7
--- /dev/null
+++ b/package/python-backports-shutil-get-terminal-size/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE
+	bool "python-backports-shutil-get-terminal-size"
+	depends on BR2_PACKAGE_PYTHON
+	help
+
+	  A backport of the get_terminal_size function from Python
+	  3.3's shutil.
+
+	  https://pypi.python.org/pypi/backports.shutil_get_terminal_size
diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
new file mode 100644
index 0000000..0df0cf7
--- /dev/null
+++ b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 713e7a8228ae80341c70586d1cc0a8caa5207346927e23d09dcbcaf18eadec80 backports.shutil_get_terminal_size-1.0.0.tar.gz
diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
new file mode 100644
index 0000000..63cf363
--- /dev/null
+++ b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-backports-shutil-get-terminal-size
+#
+################################################################################
+
+PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_VERSION = 1.0.0
+PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SOURCE = backports.shutil_get_terminal_size-$(PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_VERSION).tar.gz
+PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SITE = https://pypi.python.org/packages/ec/9c/368086faa9c016efce5da3e0e13ba392c9db79e3ab740b763fe28620b18b
+PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SETUP_TYPE = setuptools
+PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_LICENSE = MIT
+
+$(eval $(python-package))
-- 
2.9.3
