From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon,  4 Mar 2019 07:44:20 +0800
Subject: [Buildroot] [PATCH 3/3] package/python-aiomonitor: new package
In-Reply-To: <20190303234420.1727-1-james.hilliard1@gmail.com>
References: <20190303234420.1727-1-james.hilliard1@gmail.com>
Message-ID: <20190303234420.1727-3-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

aiomonitor adds monitor and python REPL capabilities for
asyncio application.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-aiomonitor/Config.in              | 10 ++++++++++
 package/python-aiomonitor/python-aiomonitor.hash |  5 +++++
 package/python-aiomonitor/python-aiomonitor.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-aiomonitor/Config.in
 create mode 100644 package/python-aiomonitor/python-aiomonitor.hash
 create mode 100644 package/python-aiomonitor/python-aiomonitor.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f38d62a148..56e2914c8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1034,6 +1034,7 @@ F:	package/python-aiohttp-remotes/
 F:	package/python-aiohttp-security/
 F:	package/python-aiohttp-session/
 F:	package/python-aiohttp-sse/
+F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
 F:	package/python-async-timeout/
diff --git a/package/Config.in b/package/Config.in
index b27f8dd70b..26e90e3fad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -808,6 +808,7 @@ menu "External python modules"
 	source "package/python-aiohttp-security/Config.in"
 	source "package/python-aiohttp-session/Config.in"
 	source "package/python-aiohttp-sse/Config.in"
+	source "package/python-aiomonitor/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiojobs/Config.in"
 	source "package/python-alsaaudio/Config.in"
diff --git a/package/python-aiomonitor/Config.in b/package/python-aiomonitor/Config.in
new file mode 100644
index 0000000000..c76c952c82
--- /dev/null
+++ b/package/python-aiomonitor/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_AIOMONITOR
+	bool "python-aiomonitor"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_TERMINALTABLES # runtime
+	select BR2_PACKAGE_PYTHON_AIOCONSOLE # runtime
+	help
+	  aiomonitor adds monitor and python REPL capabilities for
+	  asyncio application.
+
+	  https://github.com/aio-libs/aiomonitor
diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
new file mode 100644
index 0000000000..ddcfd071e2
--- /dev/null
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiomonitor/json
+md5	0f58ac68497a59d104ecb6ba369df784  aiomonitor-0.4.3.tar.gz
+sha256	37cd279c26e2c80b4e6ed9d23476c84c0b75fc3794617fceb6f341437b9af5fe  aiomonitor-0.4.3.tar.gz
+# Locally computed sha256 checksums
+sha256	9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
new file mode 100644
index 0000000000..88f28a52dd
--- /dev/null
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiomonitor
+#
+################################################################################
+
+PYTHON_AIOMONITOR_VERSION = 0.4.3
+PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/11/27/2d25a3318e57181e04d2694768f0e1e621b64606d8424076790caa29e401
+PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
+PYTHON_AIOMONITOR_LICENSE = Apache-2.0
+PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1
