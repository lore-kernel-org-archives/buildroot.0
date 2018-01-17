From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 23:37:56 +0100
Subject: [Buildroot] [git commit] python-see: new package
Message-ID: <20180117223943.1AFE6812D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71e1f38b855f11affd5e05500f1d025ff12bd476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/python-see/Config.in       |  6 ++++++
 package/python-see/python-see.hash |  4 ++++
 package/python-see/python-see.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b133c93..85bb985 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -897,6 +897,7 @@ menu "External python modules"
 	source "package/python-schedule/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
+	source "package/python-see/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
diff --git a/package/python-see/Config.in b/package/python-see/Config.in
new file mode 100644
index 0000000..f3049fd
--- /dev/null
+++ b/package/python-see/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SEE
+	bool "python-see"
+	help
+	  dir for humans.
+
+	  https://ljcooke.github.io/see/
diff --git a/package/python-see/python-see.hash b/package/python-see/python-see.hash
new file mode 100644
index 0000000..c48ee88
--- /dev/null
+++ b/package/python-see/python-see.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/see/json, sha256 locally computed
+md5	cb3bf4d314f73a8f7a2fd3d2d99aab54  see-1.4.1.tar.gz
+sha256	14f8f8a88a909a7d7dea81f0016e3fdfabd3b5d335992e102a382e1a71672bd1  see-1.4.1.tar.gz
+sha256  dccbd040a7deacee7f05e5e46a8eba6e786ac319f0cb94c36f92d789585911a6  LICENSE
diff --git a/package/python-see/python-see.mk b/package/python-see/python-see.mk
new file mode 100644
index 0000000..982962b
--- /dev/null
+++ b/package/python-see/python-see.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-see
+#
+################################################################################
+
+PYTHON_SEE_VERSION = 1.4.1
+PYTHON_SEE_SOURCE = see-$(PYTHON_SEE_VERSION).tar.gz
+PYTHON_SEE_SITE = https://pypi.python.org/packages/ff/fc/fcabb6a9bfe7c56798285839780cae67342256b823b97e94d862b0ba21d6
+PYTHON_SEE_SETUP_TYPE = setuptools
+PYTHON_SEE_LICENSE = BSD-3-Clause
+PYTHON_SEE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
