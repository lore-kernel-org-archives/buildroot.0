From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Apr 2019 11:19:28 +0200
Subject: [Buildroot] [PATCH 1/5] package/python-backcall: new package
Message-ID: <20190419091932.4922-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Specifications for callback functions passed in to an API.

https://github.com/takluyver/backcall

No license source files are provided from current version, however
upstream added one:
https://github.com/takluyver/backcall/blob/master/LICENSE

python-backcall is a runtime dependency of python-inotify 7.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-backcall/Config.in            |  6 ++++++
 package/python-backcall/python-backcall.hash |  3 +++
 package/python-backcall/python-backcall.mk   | 14 ++++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/python-backcall/Config.in
 create mode 100644 package/python-backcall/python-backcall.hash
 create mode 100644 package/python-backcall/python-backcall.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 69f51d6ff0..e49ee6d036 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -833,6 +833,7 @@ F:	package/ncmpc/
 F:	package/oniguruma/
 F:	package/oprofile/
 F:	package/pcmanfm/
+F:	package/python-backcall/
 F:	package/rygel/
 F:	package/safeclib/
 F:	package/suricata/
diff --git a/package/Config.in b/package/Config.in
index 7d839e2523..99f01a0de5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -828,6 +828,7 @@ menu "External python modules"
 	source "package/python-autobahn/Config.in"
 	source "package/python-automat/Config.in"
 	source "package/python-babel/Config.in"
+	source "package/python-backcall/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-backports-ssl-match-hostname/Config.in"
diff --git a/package/python-backcall/Config.in b/package/python-backcall/Config.in
new file mode 100644
index 0000000000..7b4345cab7
--- /dev/null
+++ b/package/python-backcall/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BACKCALL
+	bool "python-backcall"
+	help
+	  Specifications for callback functions passed in to an API.
+
+	  https://github.com/takluyver/backcall
diff --git a/package/python-backcall/python-backcall.hash b/package/python-backcall/python-backcall.hash
new file mode 100644
index 0000000000..2eccbdef5d
--- /dev/null
+++ b/package/python-backcall/python-backcall.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/backcall/json
+md5	87ce0c7839808e6a3427d57df6a792e7  backcall-0.1.0.tar.gz
+sha256	38ecd85be2c1e78f77fd91700c76e14667dc21e2713b63876c0eb901196e01e4  backcall-0.1.0.tar.gz
diff --git a/package/python-backcall/python-backcall.mk b/package/python-backcall/python-backcall.mk
new file mode 100644
index 0000000000..3f95ea3d24
--- /dev/null
+++ b/package/python-backcall/python-backcall.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-backcall
+#
+################################################################################
+
+PYTHON_BACKCALL_VERSION = 0.1.0
+PYTHON_BACKCALL_SOURCE = backcall-$(PYTHON_BACKCALL_VERSION).tar.gz
+PYTHON_BACKCALL_SITE = https://files.pythonhosted.org/packages/84/71/c8ca4f5bb1e08401b916c68003acf0a0655df935d74d93bf3f3364b310e0
+PYTHON_BACKCALL_SETUP_TYPE = distutils
+# From https://github.com/takluyver/backcall/blob/master/LICENSE
+PYTHON_BACKCALL_LICENSE = BSD-3-Clause
+
+$(eval $(python-package))
-- 
2.20.1
