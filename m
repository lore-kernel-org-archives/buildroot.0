From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Dec 2018 00:12:23 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp-remotes: new package
Message-ID: <20181208230859.508CE883A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23310a5b654007d52d1f7cbd8c360f25d8d9dbc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Control remote side information.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-aiohttp-remotes/Config.in                   |  8 ++++++++
 package/python-aiohttp-remotes/python-aiohttp-remotes.hash |  5 +++++
 package/python-aiohttp-remotes/python-aiohttp-remotes.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b92301e52c..fe239c1cf4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -995,6 +995,7 @@ N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-jinja2/
+F:	package/python-aiohttp-remotes/
 F:	package/python-aiohttp-security/
 F:	package/python-aiohttp-session/
 F:	package/python-aiohttp-sse/
diff --git a/package/Config.in b/package/Config.in
index ef870a051a..26bbaf1f10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -801,6 +801,7 @@ menu "External python modules"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
 	source "package/python-aiohttp-jinja2/Config.in"
+	source "package/python-aiohttp-remotes/Config.in"
 	source "package/python-aiohttp-security/Config.in"
 	source "package/python-aiohttp-session/Config.in"
 	source "package/python-aiohttp-sse/Config.in"
diff --git a/package/python-aiohttp-remotes/Config.in b/package/python-aiohttp-remotes/Config.in
new file mode 100644
index 0000000000..e44696ba1e
--- /dev/null
+++ b/package/python-aiohttp-remotes/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP_REMOTES
+	bool "python-aiohttp-remotes"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	help
+	  Control remote side information.
+
+	  https://github.com/aio-libs/aiohttp-remotes
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
new file mode 100644
index 0000000000..069cdeda1f
--- /dev/null
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohttp-remotes/json
+md5	70213413433ece4e2110ae90a070d279  aiohttp_remotes-0.1.2.tar.gz
+sha256	43c3f7e1c5ba27f29fb4dbde5d43b900b5b5fc7e37bf7e35e6eaedabaec4a3fc  aiohttp_remotes-0.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256	5240758b8a5c34a46c166294eaae7dc7034ec45c727fce889c9abf7ef5afc158  LICENSE
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
new file mode 100644
index 0000000000..5b38ae9112
--- /dev/null
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiohttp-remotes
+#
+################################################################################
+
+PYTHON_AIOHTTP_REMOTES_VERSION = 0.1.2
+PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
+PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/cd/2f/93e9198a01485f588d12e19c87cd277542dc28d8b31dc8e1c09fa1c75548
+PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = distutils
+PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
+PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
