From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:56:57 +0200
Subject: [Buildroot] [git commit] python-typepy: new package
Message-ID: <20170719195253.CE20F81F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=398ed35ffac39cf6ed9f573d194676a980a3d8c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-typepy/Config.in          | 13 +++++++++++++
 package/python-typepy/python-typepy.hash |  3 +++
 package/python-typepy/python-typepy.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 28cb6f1..1775fc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -864,6 +864,7 @@ menu "External python modules"
 	source "package/python-sortedcontainers//Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-tempora/Config.in"
+	source "package/python-typepy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
diff --git a/package/python-typepy/Config.in b/package/python-typepy/Config.in
new file mode 100644
index 0000000..866a067
--- /dev/null
+++ b/package/python-typepy/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_TYPEPY
+	bool "python-typepy"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  A Python library for variable type checker/validator/converter at a
+	  run time.
+
+	  https://github.com/thombashi/typepy
diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
new file mode 100644
index 0000000..7700390
--- /dev/null
+++ b/package/python-typepy/python-typepy.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/typepy/json, sha256 locally computed
+md5	a8ab7edcf8f52bb091121e90d21dc113  typepy-0.0.14.tar.gz
+sha256	ef07125b464a6808b7ac052d7ee35873a4424a95dbc9d7db71a380d0135d9981  typepy-0.0.14.tar.gz
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
new file mode 100644
index 0000000..10270bb
--- /dev/null
+++ b/package/python-typepy/python-typepy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-typepy
+#
+################################################################################
+
+PYTHON_TYPEPY_VERSION = 0.0.14
+PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
+PYTHON_TYPEPY_SITE = https://pypi.python.org/packages/5c/1a/3836e06f2f476e785006bb0f9305160577586a8d4ae2a017fc778f580344
+PYTHON_TYPEPY_SETUP_TYPE = setuptools
+PYTHON_TYPEPY_LICENSE = MIT
+PYTHON_TYPEPY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
