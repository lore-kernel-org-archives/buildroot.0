From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:08:20 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp-mako: new package
Message-ID: <20191214212006.7B9408A5DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53deade5d9efa31dc2668b70c9d85dba6cc05050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mako template renderer for aiohttp.web (http server for
asyncio).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  1 +
 package/Config.in                                    |  1 +
 package/python-aiohttp-mako/Config.in                | 10 ++++++++++
 package/python-aiohttp-mako/python-aiohttp-mako.hash |  5 +++++
 package/python-aiohttp-mako/python-aiohttp-mako.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ee84a6d987..d2e9d9e1c6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1134,6 +1134,7 @@ F:	package/python-aiohttp/
 F:	package/python-aiohttp-cors/
 F:	package/python-aiohttp-debugtoolbar/
 F:	package/python-aiohttp-jinja2/
+F:	package/python-aiohttp-mako/
 F:	package/python-aiohttp-remotes/
 F:	package/python-aiohttp-security/
 F:	package/python-aiohttp-session/
diff --git a/package/Config.in b/package/Config.in
index 635d8d50b2..bcd7f68466 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -828,6 +828,7 @@ menu "External python modules"
 	source "package/python-aiohttp-cors/Config.in"
 	source "package/python-aiohttp-debugtoolbar/Config.in"
 	source "package/python-aiohttp-jinja2/Config.in"
+	source "package/python-aiohttp-mako/Config.in"
 	source "package/python-aiohttp-remotes/Config.in"
 	source "package/python-aiohttp-security/Config.in"
 	source "package/python-aiohttp-session/Config.in"
diff --git a/package/python-aiohttp-mako/Config.in b/package/python-aiohttp-mako/Config.in
new file mode 100644
index 0000000000..8c5df6a481
--- /dev/null
+++ b/package/python-aiohttp-mako/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP_MAKO
+	bool "python-aiohttp-mako"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_MAKO # runtime
+	help
+	  mako template renderer for aiohttp.web (http server for
+	  asyncio).
+
+	  https://github.com/aio-libs/aiohttp-mako/
diff --git a/package/python-aiohttp-mako/python-aiohttp-mako.hash b/package/python-aiohttp-mako/python-aiohttp-mako.hash
new file mode 100644
index 0000000000..169027e1df
--- /dev/null
+++ b/package/python-aiohttp-mako/python-aiohttp-mako.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohttp-mako/json
+md5	c0f2da2851d0b6e819b5c882f700bb11  aiohttp-mako-0.4.0.tar.gz
+sha256	f10bdee54589b6567e8a0339db582276fdaaa198764541d2f9741f1d3836312c  aiohttp-mako-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	b81fea0e0d4cda42faf00466cabe7b9e2a0cc3a0ffbf20ae3773c18e077c7c52  LICENSE
diff --git a/package/python-aiohttp-mako/python-aiohttp-mako.mk b/package/python-aiohttp-mako/python-aiohttp-mako.mk
new file mode 100644
index 0000000000..4ff5f89038
--- /dev/null
+++ b/package/python-aiohttp-mako/python-aiohttp-mako.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiohttp-mako
+#
+################################################################################
+
+PYTHON_AIOHTTP_MAKO_VERSION = 0.4.0
+PYTHON_AIOHTTP_MAKO_SOURCE = aiohttp-mako-$(PYTHON_AIOHTTP_MAKO_VERSION).tar.gz
+PYTHON_AIOHTTP_MAKO_SITE = https://files.pythonhosted.org/packages/f9/8e/d7c0ea2c74e8102a94021e150b622d274fdef22ebd1f0c9a546b21458931
+PYTHON_AIOHTTP_MAKO_SETUP_TYPE = setuptools
+PYTHON_AIOHTTP_MAKO_LICENSE = Apache-2.0
+PYTHON_AIOHTTP_MAKO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
