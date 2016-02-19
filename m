From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 23:40:29 +0100
Subject: [Buildroot] [git commit branch/next] python-txaio: new package
Message-ID: <20160219224157.D724480583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=148d964e4dd66397b3bc14f5aca4321d6c409d35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/python-txaio/Config.in         |  7 +++++++
 package/python-txaio/python-txaio.hash |  3 +++
 package/python-txaio/python-txaio.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7a88d5b..2098141 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -724,6 +724,7 @@ menu "External python modules"
 	source "package/python-tornado/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
+	source "package/python-txaio/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
diff --git a/package/python-txaio/Config.in b/package/python-txaio/Config.in
new file mode 100644
index 0000000..9d42382
--- /dev/null
+++ b/package/python-txaio/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TXAIO
+	bool "python-txaio"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Compatibility API between asyncio/Twisted/Trollius.
+
+	  https://pypi.python.org/pypi/txaio
diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
new file mode 100644
index 0000000..5d9e6cf
--- /dev/null
+++ b/package/python-txaio/python-txaio.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c2a7e6ebfdf8987c3938e40e39a3c5e7, sha256 locally computed
+md5	c2a7e6ebfdf8987c3938e40e39a3c5e7  txaio-2.2.1.tar.gz
+sha256	6eee00c397d8193d15313dfc36da3eac8d64edf0b92fe3b67cd5a735ffc3074b  txaio-2.2.1.tar.gz
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
new file mode 100644
index 0000000..127bc62
--- /dev/null
+++ b/package/python-txaio/python-txaio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-txaio
+#
+################################################################################
+
+PYTHON_TXAIO_VERSION = 2.2.1
+PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
+PYTHON_TXAIO_SITE = http://pypi.python.org/packages/source/t/txaio
+PYTHON_TXAIO_LICENSE = MIT
+PYTHON_TXAIO_LICENSE_FILES = LICENSE
+PYTHON_TXAIO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
