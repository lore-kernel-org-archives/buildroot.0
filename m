From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 21:50:32 +0200
Subject: [Buildroot] [git commit] python-tempora: new package
Message-ID: <20170620200316.E5CF38016D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6ada8d5f88d97ed8ae8f55445fce28cf8a40ae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-tempora/Config.in           |  8 ++++++++
 package/python-tempora/python-tempora.hash |  3 +++
 package/python-tempora/python-tempora.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index db6c197..3d225ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -854,6 +854,7 @@ menu "External python modules"
 	source "package/python-socketio/Config.in"
 	source "package/python-sortedcontainers//Config.in"
 	source "package/python-spidev/Config.in"
+	source "package/python-tempora/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
diff --git a/package/python-tempora/Config.in b/package/python-tempora/Config.in
new file mode 100644
index 0000000..ab5c57f
--- /dev/null
+++ b/package/python-tempora/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TEMPORA
+	bool "python-tempora"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	help
+	  Objects and routines pertaining to date and time.
+
+	  https://github.com/jaraco/tempora
diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
new file mode 100644
index 0000000..a8367b9
--- /dev/null
+++ b/package/python-tempora/python-tempora.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/tempora/json, sha256 locally computed
+md5	cd0dd5c51c9645285ff505ec531cbcc8  tempora-1.7.tar.gz
+sha256	a264672b7f39198eb90b531490ade4e873f6e13839253636c3bd6a5549be1984  tempora-1.7.tar.gz
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
new file mode 100644
index 0000000..0bae36a
--- /dev/null
+++ b/package/python-tempora/python-tempora.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tempora
+#
+################################################################################
+
+PYTHON_TEMPORA_VERSION = 1.7
+PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
+PYTHON_TEMPORA_SITE = https://pypi.python.org/packages/db/2d/c838e9e553d774962a71b832b2c6390194904bfe49fd0d9d792ce8091e8a
+PYTHON_TEMPORA_LICENSE = MIT
+PYTHON_TEMPORA_SETUP_TYPE = setuptools
+PYTHON_TEMPORA_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
