From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:17:53 +0100
Subject: [Buildroot] [git commit] package/python-frozenlist: new package
Message-ID: <20191214212006.A5BE28A5DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c241b8ba2dc17b04d42472807737f2b1c2993e37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A list-like structure which implements
collections.abc.MutableSequence.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-frozenlist/Config.in              |  8 ++++++++
 package/python-frozenlist/python-frozenlist.hash |  5 +++++
 package/python-frozenlist/python-frozenlist.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5702f80e6d..e9f1f4539d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1147,6 +1147,7 @@ F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
+F:	package/python-frozenlist/
 F:	package/python-janus/
 F:	package/python-logstash/
 F:	package/python-multidict/
diff --git a/package/Config.in b/package/Config.in
index b5fed9ea70..1d251ea26d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -923,6 +923,7 @@ menu "External python modules"
 	source "package/python-flask-login/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
 	source "package/python-flup/Config.in"
+	source "package/python-frozenlist/Config.in"
 	source "package/python-functools32/Config.in"
 	source "package/python-future/Config.in"
 	source "package/python-futures/Config.in"
diff --git a/package/python-frozenlist/Config.in b/package/python-frozenlist/Config.in
new file mode 100644
index 0000000000..67a58b40ca
--- /dev/null
+++ b/package/python-frozenlist/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_FROZENLIST
+	bool "python-frozenlist"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A list-like structure which implements
+	  collections.abc.MutableSequence.
+
+	  https://github.com/aio-libs/frozenlist
diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
new file mode 100644
index 0000000000..4a006586d2
--- /dev/null
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/frozenlist/json
+md5	7d493070a7fe12b6be753585c1995abe  frozenlist-1.0.0.tar.gz
+sha256	d1076a40cd1bef6edf148cc05aecce52a11c9bbd2a3d60ce37cc07e03c8dc6c7  frozenlist-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
new file mode 100644
index 0000000000..1d36b4df51
--- /dev/null
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-frozenlist
+#
+################################################################################
+
+PYTHON_FROZENLIST_VERSION = 1.0.0
+PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/85/32/12f1247bf4915b74a00264aa0033745ee871759daee47499641bd13aeee7
+PYTHON_FROZENLIST_SETUP_TYPE = setuptools
+PYTHON_FROZENLIST_LICENSE = Apache-2.0
+PYTHON_FROZENLIST_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
