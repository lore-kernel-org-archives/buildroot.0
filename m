From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 22:59:29 +0200
Subject: [Buildroot] [git commit branch/next] package/python-ansicolors: new
 package
Message-ID: <20200827205251.1E40E852EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03787685eac0efc0a0dd11b0bb1c3cf6d95eaabb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-ansicolors/Config.in              |  6 ++++++
 package/python-ansicolors/python-ansicolors.hash |  5 +++++
 package/python-ansicolors/python-ansicolors.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 81391e5666..c0c6de8d5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1596,6 +1596,7 @@ F:	package/lua-stdlib/
 F:	package/luaossl/
 F:	package/murata-cyw-fw/
 F:	package/netdata/
+F:	package/python-ansicolors/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/test_netdata.py
diff --git a/package/Config.in b/package/Config.in
index 1a886a3597..85a6f44910 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -872,6 +872,7 @@ menu "External python modules"
 	source "package/python-aiosignal/Config.in"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-ansicolors/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
 	source "package/python-arrow/Config.in"
diff --git a/package/python-ansicolors/Config.in b/package/python-ansicolors/Config.in
new file mode 100644
index 0000000000..78da50dfc2
--- /dev/null
+++ b/package/python-ansicolors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ANSICOLORS
+	bool "python-ansicolors"
+	help
+	  ANSI colors for Python.
+
+	  http://github.com/jonathaneunice/colors/
diff --git a/package/python-ansicolors/python-ansicolors.hash b/package/python-ansicolors/python-ansicolors.hash
new file mode 100644
index 0000000000..9fb51eb5d1
--- /dev/null
+++ b/package/python-ansicolors/python-ansicolors.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ansicolors/json
+md5  9ca7e2396ffa2e20af023c6b83ab7b14  ansicolors-1.1.8.zip
+sha256  99f94f5e3348a0bcd43c82e5fc4414013ccc19d70bd939ad71e0133ce9c372e0  ansicolors-1.1.8.zip
+# Locally computed sha256 checksums
+sha256  71a13496c621f01b454f9aa54fa608a712f58eb253e6dd2c91027fe78340c773  LICENSE
diff --git a/package/python-ansicolors/python-ansicolors.mk b/package/python-ansicolors/python-ansicolors.mk
new file mode 100644
index 0000000000..787ce8c40b
--- /dev/null
+++ b/package/python-ansicolors/python-ansicolors.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-ansicolors
+#
+################################################################################
+
+PYTHON_ANSICOLORS_VERSION = 1.1.8
+PYTHON_ANSICOLORS_SOURCE = ansicolors-$(PYTHON_ANSICOLORS_VERSION).zip
+PYTHON_ANSICOLORS_SITE = https://files.pythonhosted.org/packages/76/31/7faed52088732704523c259e24c26ce6f2f33fbeff2ff59274560c27628e
+PYTHON_ANSICOLORS_SETUP_TYPE = setuptools
+PYTHON_ANSICOLORS_LICENSE = ISC
+PYTHON_ANSICOLORS_LICENSE_FILES = LICENSE
+
+define PYTHON_ANSICOLORS_EXTRACT_CMDS
+	unzip $(PYTHON_ANSICOLORS_DL_DIR)/$(PYTHON_ANSICOLORS_SOURCE) -d $(@D)
+	mv $(@D)/ansicolors-$(PYTHON_ANSICOLORS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/ansicolors-$(PYTHON_ANSICOLORS_VERSION)
+endef
+
+$(eval $(python-package))
