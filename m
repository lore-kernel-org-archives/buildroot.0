From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:43:24 +0200
Subject: [Buildroot] [git commit] python-urwid: new package
Message-ID: <20140921174754.10E279D6E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1b1c2f0246267c89e66626a97369dbb73743fe4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Urwid is a console user interface library for Python.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/python-urwid/Config.in       |    7 +++++++
 package/python-urwid/python-urwid.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 73ba86a..17930ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,6 +508,7 @@ menu "external python modules"
 	source "package/python-simplejson/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
 endmenu
 endif
diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
new file mode 100644
index 0000000..92f7d53
--- /dev/null
+++ b/package/python-urwid/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_URWID
+	bool "python-urwid"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	help
+	  Urwid is a console user interface library for Python
+
+	  http://urwid.org/
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
new file mode 100644
index 0000000..4f1be46
--- /dev/null
+++ b/package/python-urwid/python-urwid.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-urwid
+#
+################################################################################
+
+PYTHON_URWID_VERSION = 1.2.1
+PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
+PYTHON_URWID_SITE = https://pypi.python.org/packages/source/u/urwid
+PYTHON_URWID_LICENSE = LGPLv2.1+
+PYTHON_URWID_LICENSE_FILES = COPYING
+PYTHON_URWID_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
