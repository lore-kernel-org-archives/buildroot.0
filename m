From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 11 Jan 2018 10:25:19 +0100
Subject: [Buildroot] [PATCH 4/5] python-see: new package
In-Reply-To: <20180111092520.28438-1-yegorslists@googlemail.com>
References: <20180111092520.28438-1-yegorslists@googlemail.com>
Message-ID: <20180111092520.28438-4-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                  |  1 +
 package/python-see/Config.in       |  6 ++++++
 package/python-see/python-see.hash |  4 ++++
 package/python-see/python-see.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-see/Config.in
 create mode 100644 package/python-see/python-see.hash
 create mode 100644 package/python-see/python-see.mk

diff --git a/package/Config.in b/package/Config.in
index 01f4095be5..9dabd5030f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -896,6 +896,7 @@ menu "External python modules"
 	source "package/python-schedule/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
+	source "package/python-see/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
diff --git a/package/python-see/Config.in b/package/python-see/Config.in
new file mode 100644
index 0000000000..f3049fd8e7
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
index 0000000000..c48ee88b8b
--- /dev/null
+++ b/package/python-see/python-see.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/see/json, sha256 locally computed
+md5	cb3bf4d314f73a8f7a2fd3d2d99aab54  see-1.4.1.tar.gz
+sha256	14f8f8a88a909a7d7dea81f0016e3fdfabd3b5d335992e102a382e1a71672bd1  see-1.4.1.tar.gz
+sha256  dccbd040a7deacee7f05e5e46a8eba6e786ac319f0cb94c36f92d789585911a6  LICENSE
diff --git a/package/python-see/python-see.mk b/package/python-see/python-see.mk
new file mode 100644
index 0000000000..982962beb3
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
-- 
2.11.0
