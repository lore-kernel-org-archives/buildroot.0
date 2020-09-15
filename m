From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2020 21:54:44 +0200
Subject: [Buildroot] [git commit] package/python-jmespath: new package.
Message-ID: <20200915202421.D9DF1825F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8abe87184a8552d88f780f3b87b9f1e1ca10c727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JMESPath is a query language for JSON.

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # roc-rk3399-pc
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-jmespath/Config.in            |  6 ++++++
 package/python-jmespath/python-jmespath.hash |  5 +++++
 package/python-jmespath/python-jmespath.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f86501b5c7..3615a5b063 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2211,6 +2211,7 @@ F:	package/bitwise/
 
 N:	Rapha??l M??lotte <raphael.melotte@essensium.com>
 F:	package/jbig2dec/
+F:	package/python-jmespath/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
diff --git a/package/Config.in b/package/Config.in
index 1cf36fa28a..103d21f22e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1012,6 +1012,7 @@ menu "External python modules"
 	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jedi/Config.in"
 	source "package/python-jinja2/Config.in"
+	source "package/python-jmespath/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-jmespath/Config.in b/package/python-jmespath/Config.in
new file mode 100644
index 0000000000..7bcd8f6a19
--- /dev/null
+++ b/package/python-jmespath/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_JMESPATH
+	bool "python-jmespath"
+	help
+	  JMESPath is a query language for JSON.
+
+	  https://github.com/jmespath/jmespath.py
diff --git a/package/python-jmespath/python-jmespath.hash b/package/python-jmespath/python-jmespath.hash
new file mode 100644
index 0000000000..4d1ccb5bbb
--- /dev/null
+++ b/package/python-jmespath/python-jmespath.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jmespath/json
+md5  5c3380a84c565d7438e4766fd4b7a775  jmespath-0.9.4.tar.gz
+sha256  bde2aef6f44302dfb30320115b17d030798de8c4110e28d5cf6cf91a7a31074c  jmespath-0.9.4.tar.gz
+# Locally computed sha256 checksums
+sha256  66b313cce80ed0623fc7db3f24863a0c80fd83eb341a46b57864158ae74faa56  LICENSE.txt
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
new file mode 100644
index 0000000000..4afd06fd48
--- /dev/null
+++ b/package/python-jmespath/python-jmespath.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jmespath
+#
+################################################################################
+
+PYTHON_JMESPATH_VERSION = 0.9.4
+PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
+PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/2c/30/f0162d3d83e398c7a3b70c91eef61d409dea205fb4dc2b47d335f429de32
+PYTHON_JMESPATH_SETUP_TYPE = setuptools
+PYTHON_JMESPATH_LICENSE = MIT
+PYTHON_JMESPATH_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
