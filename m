From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sun, 21 Oct 2018 15:35:59 +0800
Subject: [Buildroot] [PATCH 1/1] python-async-timeout: new package
Message-ID: <1540107359-29051-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

asyncio-compatible timeout context manager.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                      |  1 +
 package/python-async-timeout/Config.in                 |  7 +++++++
 package/python-async-timeout/python-async-timeout.hash |  5 +++++
 package/python-async-timeout/python-async-timeout.mk   | 12 ++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-async-timeout/Config.in
 create mode 100644 package/python-async-timeout/python-async-timeout.hash
 create mode 100644 package/python-async-timeout/python-async-timeout.mk

diff --git a/package/Config.in b/package/Config.in
index 177861e..9b3bb68 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -799,6 +799,7 @@ menu "External python modules"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
 	source "package/python-asn1crypto/Config.in"
+	source "package/python-async-timeout/Config.in"
 	source "package/python-attrs/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-automat/Config.in"
diff --git a/package/python-async-timeout/Config.in b/package/python-async-timeout/Config.in
new file mode 100644
index 0000000..659a0fd
--- /dev/null
+++ b/package/python-async-timeout/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT
+	bool "python-async-timeout"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  asyncio-compatible timeout context manager.
+
+	  https://github.com/aio-libs/async-timeout
diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
new file mode 100644
index 0000000..f99e1da
--- /dev/null
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.python.org/pypi/async_timeout/json
+md5	305c4fa529f2485c403d0dbe14390175  async-timeout-3.0.1.tar.gz
+sha256	0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b25f4c5f  async-timeout-3.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256	b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
new file mode 100644
index 0000000..65574b6
--- /dev/null
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# python-async-timeout
+#
+################################################################################
+PYTHON_ASYNC_TIMEOUT_VERSION = 3.0.1
+PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/a1/78/aae1545aba6e87e23ecab8d212b58bb70e72164b67eb090b81bb17ad38e3
+PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
+PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.7.4
