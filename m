From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu,  1 Feb 2018 16:21:58 -0600
Subject: [Buildroot] [PATCH] python-virtualenv: new package
Message-ID: <1517523718-30586-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A tool for creating a isolated python env.

Within Buildroot, the basic problem being addressed is
one of dependencies and versions, and indirectly permissions.
A great example are the Django and AMQP protocol packages.
An applications depending on these are usually locked into a specific
version.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                                |  1 +
 package/python-virtualenv/Config.in              |  6 ++++++
 package/python-virtualenv/python-virtualenv.hash |  4 ++++
 package/python-virtualenv/python-virtualenv.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-virtualenv/Config.in
 create mode 100644 package/python-virtualenv/python-virtualenv.hash
 create mode 100644 package/python-virtualenv/python-virtualenv.mk

diff --git a/package/Config.in b/package/Config.in
index 9a6b199..214c986 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -936,6 +936,7 @@ menu "External python modules"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
+	source "package/python-virtualenv/Config.in"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
 	source "package/python-web2py/Config.in"
diff --git a/package/python-virtualenv/Config.in b/package/python-virtualenv/Config.in
new file mode 100644
index 0000000..e0b3d8a
--- /dev/null
+++ b/package/python-virtualenv/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_VIRTUALENV
+	bool "python-virtualenv"
+	help
+	  Virtual Python Environment builder.
+
+	  https://virtualenv.pypa.io/
diff --git a/package/python-virtualenv/python-virtualenv.hash b/package/python-virtualenv/python-virtualenv.hash
new file mode 100644
index 0000000..54ba07a
--- /dev/null
+++ b/package/python-virtualenv/python-virtualenv.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/virtualenv/json, sha256 locally computed
+md5	44e19f4134906fe2d75124427dc9b716  virtualenv-15.1.0.tar.gz
+sha256	02f8102c2436bb03b3ee6dede1919d1dac8a427541652e5ec95171ec8adbc93a  virtualenv-15.1.0.tar.gz
+sha256	c2b40423a77ae2ecf014a447ecd3310e594b594a11e42c12c69b9d0e9ebe2e33  LICENSE.txt
diff --git a/package/python-virtualenv/python-virtualenv.mk b/package/python-virtualenv/python-virtualenv.mk
new file mode 100644
index 0000000..58ac3e6
--- /dev/null
+++ b/package/python-virtualenv/python-virtualenv.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-virtualenv
+#
+################################################################################
+
+PYTHON_VIRTUALENV_VERSION = 15.1.0
+PYTHON_VIRTUALENV_SOURCE = virtualenv-$(PYTHON_VIRTUALENV_VERSION).tar.gz
+PYTHON_VIRTUALENV_SITE = https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8
+PYTHON_VIRTUALENV_SETUP_TYPE = setuptools
+PYTHON_VIRTUALENV_LICENSE = MIT
+PYTHON_VIRTUALENV_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
1.9.1
