From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:48:32 +0200
Subject: [Buildroot] [git commit] package/python-scandir: New package
Message-ID: <20170615204905.44CAD81DDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=722d63be865fd78f1e0e3c0c200ea85de7a48ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'scandir'[1] package to buildroot. Needed by 'pathlib2'.

[1] https://pypi.python.org/pypi/scandir

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-scandir/Config.in           |  6 ++++++
 package/python-scandir/python-scandir.hash |  3 +++
 package/python-scandir/python-scandir.mk   | 14 ++++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 282952b..9d5f51b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -83,6 +83,7 @@ F:	package/wine/
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
 F:	package/python-ipython-genutils/
+F:	package/python-scandir/
 F:	package/python-simplegeneric/
 F:	package/python-traitlets/
 
diff --git a/package/Config.in b/package/Config.in
index 0967de1..14315d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -829,6 +829,7 @@ menu "External python modules"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
+	source "package/python-scandir/Config.in"
 	source "package/python-scapy3k/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-serial/Config.in"
diff --git a/package/python-scandir/Config.in b/package/python-scandir/Config.in
new file mode 100644
index 0000000..497f962
--- /dev/null
+++ b/package/python-scandir/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SCANDIR
+	bool "python-scandir"
+	help
+	  scandir, a better directory iterator and faster os.walk()
+
+	  https://pypi.python.org/pypi/scandir
diff --git a/package/python-scandir/python-scandir.hash b/package/python-scandir/python-scandir.hash
new file mode 100644
index 0000000..aecd9a5
--- /dev/null
+++ b/package/python-scandir/python-scandir.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/scandir/json, sha256 locally computed
+md5 a2713043de681bba6b084be42e7a8a44 scandir-1.5.tar.gz
+sha256 c2612d1a487d80fb4701b4a91ca1b8f8a695b1ae820570815e85e8c8b23f1283 scandir-1.5.tar.gz
diff --git a/package/python-scandir/python-scandir.mk b/package/python-scandir/python-scandir.mk
new file mode 100644
index 0000000..2ff8ea2
--- /dev/null
+++ b/package/python-scandir/python-scandir.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-scandir
+#
+################################################################################
+
+PYTHON_SCANDIR_VERSION = 1.5
+PYTHON_SCANDIR_SOURCE = scandir-$(PYTHON_SCANDIR_VERSION).tar.gz
+PYTHON_SCANDIR_SITE = https://pypi.python.org/packages/bd/f4/3143e0289faf0883228017dbc6387a66d0b468df646645e29e1eb89ea10e
+PYTHON_SCANDIR_LICENSE = BSD-3-Clause
+PYTHON_SCANDIR_LICENSE_FILE = LICENSE.txt
+PYTHON_SCANDIR_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
