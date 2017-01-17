From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 17 Jan 2017 11:17:21 +0100
Subject: [Buildroot] [PATCH 4/8] python-pathpy: new package
In-Reply-To: <20170117101725.19629-1-yegorslists@googlemail.com>
References: <20170117101725.19629-1-yegorslists@googlemail.com>
Message-ID: <20170117101725.19629-4-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-pathpy/Config.in          |  8 ++++++++
 package/python-pathpy/python-pathpy.hash |  3 +++
 package/python-pathpy/python-pathpy.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-pathpy/Config.in
 create mode 100644 package/python-pathpy/python-pathpy.hash
 create mode 100644 package/python-pathpy/python-pathpy.mk

diff --git a/package/Config.in b/package/Config.in
index 0d2701215..0f148af64 100644
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
index 000000000..98c05126b
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
index 000000000..4824e2a3c
--- /dev/null
+++ b/package/python-pathpy/python-pathpy.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/path.py/json, sha256 locally computed
+md5	eb8469ad498d2e462bff8f3b2b5ea68d  path.py-10.0.tar.gz
+sha256	ba984a2b536158a8841dd33150fce16bcf04210e83f92da674cad0a8a8f61e00  path.py-10.0.tar.gz
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
new file mode 100644
index 000000000..577658602
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
-- 
2.11.0
