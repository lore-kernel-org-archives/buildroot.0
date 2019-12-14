From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:27:53 +0100
Subject: [Buildroot] [git commit] package/python-aiozipkin: new package
Message-ID: <20191214212006.C2F648A5DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c60cbaa78b1797b1d57054fc9e5b3dce76b59d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Distributed tracing instrumentation for asyncio application
with zipkin.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-aiozipkin/Config.in             |  9 +++++++++
 package/python-aiozipkin/python-aiozipkin.hash |  5 +++++
 package/python-aiozipkin/python-aiozipkin.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c8ca32cf62..d9b4864b9f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1144,6 +1144,7 @@ F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
 F:	package/python-aiosignal/
+F:	package/python-aiozipkin/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
diff --git a/package/Config.in b/package/Config.in
index b961b74c33..f304a8fbd3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -839,6 +839,7 @@ menu "External python modules"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
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
