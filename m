From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:00:09 +0200
Subject: [Buildroot] [git commit] package/python-pickleshare: New package
Message-ID: <20170615210006.2AB0A81D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1039f4bbbb673cacf8ef7e6d38da25d52bf422ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'pickleshare'[1] package to buildroot. Needed by IPython.

[1] https://pypi.python.org/pypi/pickleshare

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-pickleshare/Config.in               |  7 +++++++
 package/python-pickleshare/python-pickleshare.hash |  3 +++
 package/python-pickleshare/python-pickleshare.mk   | 14 ++++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a73917..8edfd5c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -84,6 +84,7 @@ N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
 F:	package/python-ipython-genutils/
 F:	package/python-pathlib2/
+F:	package/python-pickleshare/
 F:	package/python-scandir/
 F:	package/python-simplegeneric/
 F:	package/python-traitlets/
diff --git a/package/Config.in b/package/Config.in
index cf41b37..adea839 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -778,6 +778,7 @@ menu "External python modules"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-pexpect/Config.in"
+	source "package/python-pickleshare/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
diff --git a/package/python-pickleshare/Config.in b/package/python-pickleshare/Config.in
new file mode 100644
index 0000000..35a2663
--- /dev/null
+++ b/package/python-pickleshare/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PICKLESHARE
+	bool "python-pickleshare"
+	select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON # runtime
+	help
+	  Tiny 'shelve'-like database with concurrency support
+
+	  https://pypi.python.org/pypi/pickleshare
diff --git a/package/python-pickleshare/python-pickleshare.hash b/package/python-pickleshare/python-pickleshare.hash
new file mode 100644
index 0000000..6e3d408
--- /dev/null
+++ b/package/python-pickleshare/python-pickleshare.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/pickleshare/json, sha256 locally computed
+md5 6a9e5dd8dfc023031f6b7b3f824cab12 pickleshare-0.7.4.tar.gz
+sha256 84a9257227dfdd6fe1b4be1319096c20eb85ff1e82c7932f36efccfe1b09737b pickleshare-0.7.4.tar.gz
diff --git a/package/python-pickleshare/python-pickleshare.mk b/package/python-pickleshare/python-pickleshare.mk
new file mode 100644
index 0000000..b2a5e88
--- /dev/null
+++ b/package/python-pickleshare/python-pickleshare.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pickleshare
+#
+################################################################################
+
+PYTHON_PICKLESHARE_VERSION = 0.7.4
+PYTHON_PICKLESHARE_SOURCE = pickleshare-$(PYTHON_PICKLESHARE_VERSION).tar.gz
+PYTHON_PICKLESHARE_SITE = https://pypi.python.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525
+PYTHON_PICKLESHARE_LICENSE = MIT
+PYTHON_PICKLESHARE_LICENSE_FILE = LICENSE
+PYTHON_PICKLESHARE_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
