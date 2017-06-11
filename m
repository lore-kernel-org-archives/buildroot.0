From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:55:47 +0200
Subject: [Buildroot] [git commit] package/python-ipython-genutils: New
	package
Message-ID: <20170611130221.D757F80AD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26d7dcb8ad53fdf40f243a3797025e1682ef4b20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'ipython_genutils'[1] package to Buildroot. Needed by 'traitlets'.

[1] https://pypi.python.org/pypi/ipython_genutils

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: take into account comments made by Yegor:
 - fix alphabetic ordering in the DEVELOPERS file
 - fix comment in hash file
 - add license file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-ipython-genutils/Config.in                  |  6 ++++++
 .../python-ipython-genutils/python-ipython-genutils.hash   |  3 +++
 package/python-ipython-genutils/python-ipython-genutils.mk | 14 ++++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e86f7b3..583624d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -82,6 +82,7 @@ F:	package/wine/
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
+F:	package/python-ipython-genutils/
 F:	package/python-simplegeneric/
 
 N:	Andy Kennedy <andy.kennedy@adtran.com>
diff --git a/package/Config.in b/package/Config.in
index e00b162..e866562 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -740,6 +740,7 @@ menu "External python modules"
 	source "package/python-ipaddress/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
+	source "package/python-ipython-genutils/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-ipython-genutils/Config.in b/package/python-ipython-genutils/Config.in
new file mode 100644
index 0000000..d49442e
--- /dev/null
+++ b/package/python-ipython-genutils/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_IPYTHON_GENUTILS
+	bool "python-ipython-genutils"
+	help
+	  IPython vestigial utilities
+
+	  https://pypi.python.org/pypi/ipython_genutils
diff --git a/package/python-ipython-genutils/python-ipython-genutils.hash b/package/python-ipython-genutils/python-ipython-genutils.hash
new file mode 100644
index 0000000..6fa2bc5
--- /dev/null
+++ b/package/python-ipython-genutils/python-ipython-genutils.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/ipython_genutils/json, sha256 locally computed
+md5 5a4f9781f78466da0ea1a648f3e1f79f ipython_genutils-0.2.0.tar.gz
+sha256 eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8 ipython_genutils-0.2.0.tar.gz
diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
new file mode 100644
index 0000000..4e8cc28
--- /dev/null
+++ b/package/python-ipython-genutils/python-ipython-genutils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ipython-genutils
+#
+################################################################################
+
+PYTHON_IPYTHON_GENUTILS_VERSION = 0.2.0
+PYTHON_IPYTHON_GENUTILS_SOURCE = ipython_genutils-$(PYTHON_IPYTHON_GENUTILS_VERSION).tar.gz
+PYTHON_IPYTHON_GENUTILS_SITE = https://pypi.python.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
+PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
+PYTHON_IPYTHON_GENUTILS_LICENSE_FILES = COPYING.md
+PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
