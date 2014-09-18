From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 18 Sep 2014 12:00:52 +0200
Subject: [Buildroot] [PATCH v2 2/5] python-urwid: new package
In-Reply-To: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
References: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1411034455-19670-3-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Urwid is a console user interface library for Python.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-urwid/Config.in       |  7 +++++++
 package/python-urwid/python-urwid.mk | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-urwid/Config.in
 create mode 100644 package/python-urwid/python-urwid.mk

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
-- 
2.1.0
