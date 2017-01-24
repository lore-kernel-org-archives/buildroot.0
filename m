From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:53:23 +1300
Subject: [Buildroot] [git commit] python-pathpy: new package
Message-ID: <20170124095724.CB36681ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93400cec61e73d06f1b518beca99fa58b9ce5265
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-pathpy/Config.in          |  8 ++++++++
 package/python-pathpy/python-pathpy.hash |  3 +++
 package/python-pathpy/python-pathpy.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 16d84fe..cc09fba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -731,6 +731,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-pexpect/Config.in"
diff --git a/package/python-pathpy/Config.in b/package/python-pathpy/Config.in
new file mode 100644
index 0000000..98c0512
--- /dev/null
+++ b/package/python-pathpy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PATHPY
+	bool "python-pathpy"
+	help
+	  path.py implements a path objects as first-class
+	  entities, allowing common operations on files to
+	  be invoked on those path objects directly.
+
+	  https://github.com/jaraco/path.py
diff --git a/package/python-pathpy/python-pathpy.hash b/package/python-pathpy/python-pathpy.hash
new file mode 100644
index 0000000..4824e2a
--- /dev/null
+++ b/package/python-pathpy/python-pathpy.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/path.py/json, sha256 locally computed
+md5	eb8469ad498d2e462bff8f3b2b5ea68d  path.py-10.0.tar.gz
+sha256	ba984a2b536158a8841dd33150fce16bcf04210e83f92da674cad0a8a8f61e00  path.py-10.0.tar.gz
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
new file mode 100644
index 0000000..5776586
--- /dev/null
+++ b/package/python-pathpy/python-pathpy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pathpy
+#
+################################################################################
+
+PYTHON_PATHPY_VERSION = 10.0
+PYTHON_PATHPY_SOURCE = path.py-$(PYTHON_PATHPY_VERSION).tar.gz
+PYTHON_PATHPY_SITE = https://pypi.python.org/packages/f3/4e/3bce93c0d9e20abc6ed3aa7866beb688e889828ca2666743df11d9a30050
+PYTHON_PATHPY_SETUP_TYPE = setuptools
+PYTHON_PATHPY_LICENSE = MIT
+PYTHON_PATHPY_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
