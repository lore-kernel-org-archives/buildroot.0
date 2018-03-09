From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:16:57 +0100
Subject: [Buildroot] [PATCH 06/10] package: add python-texttable
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-7-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Module for creating simple ASCII tables.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-texttable/Config.in             |  6 ++++++
 package/python-texttable/python-texttable.hash |  4 ++++
 package/python-texttable/python-texttable.mk   | 14 ++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/python-texttable/Config.in
 create mode 100644 package/python-texttable/python-texttable.hash
 create mode 100644 package/python-texttable/python-texttable.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ced3af7169..10dab1d2e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1393,6 +1393,7 @@ F:	package/python-enum34/
 F:	package/python-ipaddr/
 F:	package/python-pam/
 F:	package/python-psutil/
+F:	package/python-texttable/
 F:	package/python-websocket-client/
 F:	package/triggerhappy/
 
diff --git a/package/Config.in b/package/Config.in
index 1043338a7e..6068ef573e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -932,6 +932,7 @@ menu "External python modules"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
+	source "package/python-texttable/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
diff --git a/package/python-texttable/Config.in b/package/python-texttable/Config.in
new file mode 100644
index 0000000000..1c8dde8d3f
--- /dev/null
+++ b/package/python-texttable/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TEXTTABLE
+	bool "python-texttable"
+	help
+	  module for creating simple ASCII tables.
+
+	  https://github.com/foutaise/texttable/
diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
new file mode 100644
index 0000000000..448d6b7dd1
--- /dev/null
+++ b/package/python-texttable/python-texttable.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/texttable/json, sha256 locally computed
+md5	a712b5a5464d51c5fc43c64d9d2cd0de  texttable-0.9.1.tar.gz
+sha256	119041773ff03596b56392532f9315cb3a3116e404fd6f36e76a7dc088d95c79  texttable-0.9.1.tar.gz
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
new file mode 100644
index 0000000000..96fe6cf882
--- /dev/null
+++ b/package/python-texttable/python-texttable.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-texttable
+#
+################################################################################
+
+PYTHON_TEXTTABLE_VERSION = 0.9.1
+PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
+PYTHON_TEXTTABLE_SITE = https://pypi.python.org/packages/02/e1/2565e6b842de7945af0555167d33acfc8a615584ef7abd30d1eae00a4d80
+PYTHON_TEXTTABLE_SETUP_TYPE = distutils
+PYTHON_TEXTTABLE_LICENSE = LGPL-3.0+
+PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
