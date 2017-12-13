From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 13 Dec 2017 10:04:23 +0100
Subject: [Buildroot] [PATCH 3/4] python-secretstorage: new package
In-Reply-To: <20171213090424.11172-1-yegorslists@googlemail.com>
References: <20171213090424.11172-1-yegorslists@googlemail.com>
Message-ID: <20171213090424.11172-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                      |  1 +
 package/python-secretstorage/Config.in                 | 11 +++++++++++
 package/python-secretstorage/python-secretstorage.hash |  4 ++++
 package/python-secretstorage/python-secretstorage.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-secretstorage/Config.in
 create mode 100644 package/python-secretstorage/python-secretstorage.hash
 create mode 100644 package/python-secretstorage/python-secretstorage.mk

diff --git a/package/Config.in b/package/Config.in
index 0e9a420452..b04a20590a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -891,6 +891,7 @@ menu "External python modules"
 	source "package/python-scapy3k/Config.in"
 	source "package/python-schedule/Config.in"
 	source "package/python-sdnotify/Config.in"
+	source "package/python-secretstorage/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
diff --git a/package/python-secretstorage/Config.in b/package/python-secretstorage/Config.in
new file mode 100644
index 0000000000..87aaf6a728
--- /dev/null
+++ b/package/python-secretstorage/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SECRETSTORAGE
+	bool "python-secretstorage"
+	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	help
+	  Python bindings to FreeDesktop.org Secret Service API.
+
+	  https://github.com/mitya57/secretstorage
+
+comment "python-secretstorage needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-secretstorage/python-secretstorage.hash b/package/python-secretstorage/python-secretstorage.hash
new file mode 100644
index 0000000000..b45fb5719a
--- /dev/null
+++ b/package/python-secretstorage/python-secretstorage.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/secretstorage/json, sha256 locally computed
+md5	3b9465831b069e2622973afb7deb7bc2  SecretStorage-2.3.1.tar.gz
+sha256	3af65c87765323e6f64c83575b05393f9e003431959c9395d1791d51497f29b6  SecretStorage-2.3.1.tar.gz
+sha256  1debb9ff5d6759fd23cdb40e3ba34b1fa68dd0b19672b6d154599fb0ab704c57  LICENSE
diff --git a/package/python-secretstorage/python-secretstorage.mk b/package/python-secretstorage/python-secretstorage.mk
new file mode 100644
index 0000000000..b9776d6644
--- /dev/null
+++ b/package/python-secretstorage/python-secretstorage.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-secretstorage
+#
+################################################################################
+
+PYTHON_SECRETSTORAGE_VERSION = 2.3.1
+PYTHON_SECRETSTORAGE_SOURCE = SecretStorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
+PYTHON_SECRETSTORAGE_SITE = https://pypi.python.org/packages/a5/a5/0830cfe34a4cfd0d1c3c8b614ede1edb2aaf999091ac8548dd19cb352e79
+PYTHON_SECRETSTORAGE_SETUP_TYPE = setuptools
+PYTHON_SECRETSTORAGE_LICENSE = BSD-3-Clause
+PYTHON_SECRETSTORAGE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
