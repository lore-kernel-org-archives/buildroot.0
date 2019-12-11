From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Dec 2019 23:29:28 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiozipkin: new package
Message-ID: <20191211062928.107541-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Distributed tracing instrumentation for asyncio application
with zipkin.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-aiozipkin/Config.in             |  9 +++++++++
 package/python-aiozipkin/python-aiozipkin.hash |  5 +++++
 package/python-aiozipkin/python-aiozipkin.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-aiozipkin/Config.in
 create mode 100644 package/python-aiozipkin/python-aiozipkin.hash
 create mode 100644 package/python-aiozipkin/python-aiozipkin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 61bcd99d43..fc4719a810 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1139,6 +1139,7 @@ F:	package/python-aiohttp-sse/
 F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
+F:	package/python-aiozipkin/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
diff --git a/package/Config.in b/package/Config.in
index 307583d01f..384f9372a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -835,6 +835,7 @@ menu "External python modules"
 	source "package/python-aiomonitor/Config.in"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
+	source "package/python-aiozipkin/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
diff --git a/package/python-aiozipkin/Config.in b/package/python-aiozipkin/Config.in
new file mode 100644
index 0000000000..643fc9a4da
--- /dev/null
+++ b/package/python-aiozipkin/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_AIOZIPKIN
+	bool "python-aiozipkin"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	help
+	  Distributed tracing instrumentation for asyncio application
+	  with zipkin.
+
+	  https://github.com/aio-libs/aiozipkin
diff --git a/package/python-aiozipkin/python-aiozipkin.hash b/package/python-aiozipkin/python-aiozipkin.hash
new file mode 100644
index 0000000000..8034381751
--- /dev/null
+++ b/package/python-aiozipkin/python-aiozipkin.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiozipkin/json
+md5	01766aa607ae121d2cbb3ebf15a8cd0b  aiozipkin-0.6.0.tar.gz
+sha256	7270cdaff81f4a6ea70de48b3e4597629c3beef76740bfe6f7c9b58b45b67c73  aiozipkin-0.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256	9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
diff --git a/package/python-aiozipkin/python-aiozipkin.mk b/package/python-aiozipkin/python-aiozipkin.mk
new file mode 100644
index 0000000000..2f5b54be6c
--- /dev/null
+++ b/package/python-aiozipkin/python-aiozipkin.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiozipkin
+#
+################################################################################
+
+PYTHON_AIOZIPKIN_VERSION = 0.6.0
+PYTHON_AIOZIPKIN_SOURCE = aiozipkin-$(PYTHON_AIOZIPKIN_VERSION).tar.gz
+PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/8d/14/33c79497c3082dd93172f834e4f3d1d6d0eb9b957b6885c919ca73462ed6
+PYTHON_AIOZIPKIN_SETUP_TYPE = setuptools
+PYTHON_AIOZIPKIN_LICENSE = Apache-2.0
+PYTHON_AIOZIPKIN_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1
