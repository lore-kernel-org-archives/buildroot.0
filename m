From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:03:27 +0200
Subject: [Buildroot] [git commit]
	package/python-backports-shutil-get-terminal-size: New package
Message-ID: <20170615210512.4CACD817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7b2f8cc8783025e33f4ef1269964ef59335d819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'python-backports-shutil-get-terminal-size'[1] package to
buildroot. Needed by IPython when building against Python2.

[1] https://pypi.python.org/pypi/backports.shutil_get_terminal_size

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 .../python-backports-shutil-get-terminal-size/Config.in    |  8 ++++++++
 .../python-backports-shutil-get-terminal-size.hash         |  3 +++
 .../python-backports-shutil-get-terminal-size.mk           | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8edfd5c..6ade852 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -81,6 +81,7 @@ F:	package/p7zip/
 F:	package/wine/
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
+F:	package/python-backports-shutil-get-terminal-size/
 F:	package/python-decorator/
 F:	package/python-ipython-genutils/
 F:	package/python-pathlib2/
diff --git a/package/Config.in b/package/Config.in
index adea839..c997e2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,6 +682,7 @@ menu "External python modules"
 	source "package/python-autobahn/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backports-abc/Config.in"
+	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
diff --git a/package/python-backports-shutil-get-terminal-size/Config.in b/package/python-backports-shutil-get-terminal-size/Config.in
new file mode 100644
index 0000000..392e05a
--- /dev/null
+++ b/package/python-backports-shutil-get-terminal-size/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE
+	bool "python-backports-shutil-get-terminal-size"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  A backport of the get_terminal_size function from Python
+	  3.3's shutil.
+
+	  https://pypi.python.org/pypi/backports.shutil_get_terminal_size
diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
new file mode 100644
index 0000000..c1b65e5
--- /dev/null
+++ b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/backports.shutil_get_terminal_size/json, sha256 locally computed
+md5 03267762480bd86b50580dc19dff3c66 backports.shutil_get_terminal_size-1.0.0.tar.gz
+sha256 713e7a8228ae80341c70586d1cc0a8caa5207346927e23d09dcbcaf18eadec80 backports.shutil_get_terminal_size-1.0.0.tar.gz
diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
new file mode 100644
index 0000000..68ac9a0
--- /dev/null
+++ b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
@@ -0,0 +1,14 @@
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
+PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_LICENSE_FILE = LICENSE
+
+$(eval $(python-package))
