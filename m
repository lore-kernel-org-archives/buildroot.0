From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 08:38:34 +0100
Subject: [Buildroot] [git commit] package: add python-functools32
Message-ID: <20180310074850.027FC800EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=146b8d31ea9d96212eb2e6458b3bc69b5a391e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-functools32/Config.in               |  8 ++++++++
 package/python-functools32/python-functools32.hash |  4 ++++
 package/python-functools32/python-functools32.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7809b5182b..d0c3894ecc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1392,6 +1392,7 @@ F:	package/python-dockerpty/
 F:	package/python-docker-pycreds/
 F:	package/python-enum/
 F:	package/python-enum34/
+F:	package/python-functools32/
 F:	package/python-ipaddr/
 F:	package/python-pam/
 F:	package/python-psutil/
diff --git a/package/Config.in b/package/Config.in
index b7e0da6dd4..6fd61a0dea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -785,6 +785,7 @@ menu "External python modules"
 	source "package/python-flask-login/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
 	source "package/python-flup/Config.in"
+	source "package/python-functools32/Config.in"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gunicorn/Config.in"
diff --git a/package/python-functools32/Config.in b/package/python-functools32/Config.in
new file mode 100644
index 0000000000..cc12557edc
--- /dev/null
+++ b/package/python-functools32/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_FUNCTOOLS32
+	bool "python-functools32"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Backport of the functools module from Python 3.2.3 for use on 2.7
+	  and PyPy.
+
+	  https://github.com/MiCHiLU/python-functools32
diff --git a/package/python-functools32/python-functools32.hash b/package/python-functools32/python-functools32.hash
new file mode 100644
index 0000000000..606de81774
--- /dev/null
+++ b/package/python-functools32/python-functools32.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/functools32/json, sha256 locally computed
+md5	09f24ffd9af9f6cd0f63cb9f4e23d4b2  functools32-3.2.3-2.tar.gz
+sha256	f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d  functools32-3.2.3-2.tar.gz
+sha256	3f9ea6b89abe1556b72aff67b987d64c8272564815cd6a2832e6c4f6abdfe3b1  LICENSE
diff --git a/package/python-functools32/python-functools32.mk b/package/python-functools32/python-functools32.mk
new file mode 100644
index 0000000000..8a88bb2a7f
--- /dev/null
+++ b/package/python-functools32/python-functools32.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-functools32
+#
+################################################################################
+
+PYTHON_FUNCTOOLS32_VERSION = 3.2.3-2
+PYTHON_FUNCTOOLS32_SOURCE = functools32-$(PYTHON_FUNCTOOLS32_VERSION).tar.gz
+PYTHON_FUNCTOOLS32_SITE = https://pypi.python.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db
+PYTHON_FUNCTOOLS32_SETUP_TYPE = distutils
+PYTHON_FUNCTOOLS32_LICENSE = Python-2.0
+PYTHON_FUNCTOOLS32_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
