From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 23:57:34 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp-jinja2: new package
Message-ID: <20181208225511.78D7D85434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b78edb1a20889a64f323e42b6c854c843865c979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Jinja2 template renderer for aiohttp.web

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-aiohttp-jinja2/Config.in                  | 10 ++++++++++
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash |  5 +++++
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a6600c48c2..b92301e52c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -994,6 +994,7 @@ F:	configs/pine64_sopine_defconfig
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
+F:	package/python-aiohttp-jinja2/
 F:	package/python-aiohttp-security/
 F:	package/python-aiohttp-session/
 F:	package/python-aiohttp-sse/
diff --git a/package/Config.in b/package/Config.in
index fee4f8f250..ef870a051a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -800,6 +800,7 @@ menu "External python modules"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
+	source "package/python-aiohttp-jinja2/Config.in"
 	source "package/python-aiohttp-security/Config.in"
 	source "package/python-aiohttp-session/Config.in"
 	source "package/python-aiohttp-sse/Config.in"
diff --git a/package/python-aiohttp-jinja2/Config.in b/package/python-aiohttp-jinja2/Config.in
new file mode 100644
index 0000000000..dd4bb0d23b
--- /dev/null
+++ b/package/python-aiohttp-jinja2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP_JINJA2
+	bool "python-aiohttp-jinja2"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	help
+	  Jinja2 template renderer for aiohttp.web (http server for
+	  asyncio).
+
+	  https://github.com/aio-libs/aiohttp_jinja2/
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
new file mode 100644
index 0000000000..390b0e4ed7
--- /dev/null
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
+md5	de5e02056d1b48dc2fa4fc0c1a8b0e08  aiohttp-jinja2-1.1.0.tar.gz
+sha256	aef9b6595f962182ad00c990095fb51d731c280e1d183e2b28cf0bdb5a942d0c  aiohttp-jinja2-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256	2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
new file mode 100644
index 0000000000..3b5359a06a
--- /dev/null
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiohttp-jinja2
+#
+################################################################################
+
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.1.0
+PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/76/9d/68fa1e9ec3bafba572772eb385023de54096663bd6e302a24d7344c6a711
+PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
+PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
+PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
