From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Dec 2019 23:18:34 -0700
Subject: [Buildroot] [PATCH 2/2] package/python-aiosignal: new package
In-Reply-To: <20191211061834.95150-1-james.hilliard1@gmail.com>
References: <20191211061834.95150-1-james.hilliard1@gmail.com>
Message-ID: <20191211061834.95150-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aiosignal: a list of registered asynchronous callbacks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-aiosignal/Config.in             |  8 ++++++++
 package/python-aiosignal/python-aiosignal.hash |  5 +++++
 package/python-aiosignal/python-aiosignal.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-aiosignal/Config.in
 create mode 100644 package/python-aiosignal/python-aiosignal.hash
 create mode 100644 package/python-aiosignal/python-aiosignal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cac20a25b0..ca1ec89bd5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1139,6 +1139,7 @@ F:	package/python-aiohttp-sse/
 F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
+F:	package/python-aiosignal/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
diff --git a/package/Config.in b/package/Config.in
index b43bf04101..37d440a57e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -835,6 +835,7 @@ menu "External python modules"
 	source "package/python-aiomonitor/Config.in"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
+	source "package/python-aiosignal/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
diff --git a/package/python-aiosignal/Config.in b/package/python-aiosignal/Config.in
new file mode 100644
index 0000000000..6b7753defd
--- /dev/null
+++ b/package/python-aiosignal/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOSIGNAL
+	bool "python-aiosignal"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_FROZENLIST # runtime
+	help
+	  aiosignal: a list of registered asynchronous callbacks.
+
+	  https://github.com/aio-libs/aiosignal
diff --git a/package/python-aiosignal/python-aiosignal.hash b/package/python-aiosignal/python-aiosignal.hash
new file mode 100644
index 0000000000..17c69c8144
--- /dev/null
+++ b/package/python-aiosignal/python-aiosignal.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiosignal/json
+md5	0831ab9e46799842ed84529dbaa86196  aiosignal-1.0.0.tar.gz
+sha256	7cd33cbe05bc2d83e77f80d688b4717e424d15eecf6d65384e173b2873e62f13  aiosignal-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
new file mode 100644
index 0000000000..14b4264620
--- /dev/null
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiosignal
+#
+################################################################################
+
+PYTHON_AIOSIGNAL_VERSION = 1.0.0
+PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
+PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ca/b7/5ae01ed039ea51cc8280d87b8a1269ba2f1343d7466c1e50c618558352e5
+PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
+PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
+PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.20.1
