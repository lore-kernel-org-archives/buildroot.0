From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Dec 2019 19:02:52 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-debugtoolbar: new
 package
Message-ID: <20191211020252.41788-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

debugtoolbar for aiohttp.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-aiohttp-debugtoolbar/Config.in      |  9 +++++++++
 .../python-aiohttp-debugtoolbar.hash               |  5 +++++
 .../python-aiohttp-debugtoolbar.mk                 | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-aiohttp-debugtoolbar/Config.in
 create mode 100644 package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
 create mode 100644 package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 61bcd99d43..303893bc85 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1131,6 +1131,7 @@ F:	package/python-aioconsole/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-cors/
+F:	package/python-aiohttp-debugtoolbar/
 F:	package/python-aiohttp-jinja2/
 F:	package/python-aiohttp-remotes/
 F:	package/python-aiohttp-security/
diff --git a/package/Config.in b/package/Config.in
index 307583d01f..e550fd938d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -826,6 +826,7 @@ menu "External python modules"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
 	source "package/python-aiohttp-cors/Config.in"
+	source "package/python-aiohttp-debugtoolbar/Config.in"
 	source "package/python-aiohttp-jinja2/Config.in"
 	source "package/python-aiohttp-remotes/Config.in"
 	source "package/python-aiohttp-security/Config.in"
diff --git a/package/python-aiohttp-debugtoolbar/Config.in b/package/python-aiohttp-debugtoolbar/Config.in
new file mode 100644
index 0000000000..b22d2cf946
--- /dev/null
+++ b/package/python-aiohttp-debugtoolbar/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP_DEBUGTOOLBAR
+	bool "python-aiohttp-debugtoolbar"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_AIOHTTP_JINJA2 # runtime
+	help
+	  debugtoolbar for aiohttp.
+
+	  https://github.com/aio-libs/aiohttp_debugtoolbar
diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
new file mode 100644
index 0000000000..655c46da3c
--- /dev/null
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohttp_debugtoolbar/json
+md5	26b26163f3fbeb16ac67197902330942  aiohttp-debugtoolbar-0.5.0.tar.gz
+sha256	697c9cfac4017d532e26a8c05f14c1a43b3b147f53460daacb0ed144401df441  aiohttp-debugtoolbar-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256	94d638be2cb4f186cc62bb567455837757547c15f1b350863aaf05a38843b542  LICENSE
diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
new file mode 100644
index 0000000000..27eadd2173
--- /dev/null
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiohttp-debugtoolbar
+#
+################################################################################
+
+PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION = 0.5.0
+PYTHON_AIOHTTP_DEBUGTOOLBAR_SOURCE = aiohttp-debugtoolbar-$(PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION).tar.gz
+PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = https://files.pythonhosted.org/packages/08/b1/b629499450a84e68b53d000e6150ae4dace68ae589c5ac36b6541777c8d3
+PYTHON_AIOHTTP_DEBUGTOOLBAR_SETUP_TYPE = setuptools
+PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE = Apache-2.0
+PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1
