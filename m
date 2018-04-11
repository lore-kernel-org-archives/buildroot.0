From: Lionel Flandrin <lionel@svkt.org>
Date: Wed, 11 Apr 2018 18:37:12 +0200
Subject: [Buildroot] [PATCH 1/2] python-daemonize: new package
Message-ID: <20180411163713.13183-1-lionel@svkt.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Library to enable your code run as a daemon process on Unix-like
systems.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
---
 package/Config.in                              |  1 +
 package/python-daemonize/Config.in             |  8 ++++++++
 package/python-daemonize/python-daemonize.hash |  3 +++
 package/python-daemonize/python-daemonize.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-daemonize/Config.in
 create mode 100644 package/python-daemonize/python-daemonize.hash
 create mode 100644 package/python-daemonize/python-daemonize.mk

diff --git a/package/Config.in b/package/Config.in
index e48d0b4c64..4e0706d38a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -762,6 +762,7 @@ menu "External python modules"
 	source "package/python-cssselect/Config.in"
 	source "package/python-cssutils/Config.in"
 	source "package/python-daemon/Config.in"
+	source "package/python-daemonize/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
 	source "package/python-decorator/Config.in"
diff --git a/package/python-daemonize/Config.in b/package/python-daemonize/Config.in
new file mode 100644
index 0000000000..3fa5ed3688
--- /dev/null
+++ b/package/python-daemonize/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_DAEMONIZE
+       bool "python-daemonize"
+       select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+       help
+         Library to enable your code run as a daemon process on Unix-like
+         systems.
+
+         https://pypi.python.org/pypi/daemonize
diff --git a/package/python-daemonize/python-daemonize.hash b/package/python-daemonize/python-daemonize.hash
new file mode 100644
index 0000000000..d2111a3193
--- /dev/null
+++ b/package/python-daemonize/python-daemonize.hash
@@ -0,0 +1,3 @@
+# From https://pypi.python.org/pypi/daemonize/json
+md5    6759005b12dfeea0d4305f8536b4b0c2  daemonize-2.4.7.tar.gz
+sha256 c0194e861826be456c7c69985825ac7b79632d8ac7ad4cde8e12fee7971468c8  daemonize-2.4.7.tar.gz
diff --git a/package/python-daemonize/python-daemonize.mk b/package/python-daemonize/python-daemonize.mk
new file mode 100644
index 0000000000..bfcfe93378
--- /dev/null
+++ b/package/python-daemonize/python-daemonize.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-daemonize
+#
+################################################################################
+
+PYTHON_DAEMONIZE_VERSION = 2.4.7
+PYTHON_DAEMONIZE_SOURCE = daemonize-$(PYTHON_DAEMONIZE_VERSION).tar.gz
+PYTHON_DAEMONIZE_SITE = https://pypi.python.org/packages/84/15/923e3fe48239adf5d697c29e04a3f868d3e4ce8539aab29d6abe784db5be
+PYTHON_DAEMONIZE_SETUP_TYPE = setuptools
+PYTHON_DAEMONIZE_LICENSE = MIT
+PYTHON_DAEMONIZE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.16.3
