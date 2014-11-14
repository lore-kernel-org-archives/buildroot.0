From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 18:34:07 +0100
Subject: [Buildroot] [git commit branch/next] package: add
	python-itsdangerous
Message-ID: <20141114180459.278EAB24BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c3d11909048a42c702594e1354ee1d4603419b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/python-itsdangerous/Config.in              |    7 +++++++
 package/python-itsdangerous/python-itsdangerous.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4e89447..ba97db7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -493,6 +493,7 @@ menu "external python modules"
 	source "package/python-id3/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
+	source "package/python-itsdangerous/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
diff --git a/package/python-itsdangerous/Config.in b/package/python-itsdangerous/Config.in
new file mode 100644
index 0000000..6670af5
--- /dev/null
+++ b/package/python-itsdangerous/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ITSDANGEROUS
+	bool "python-itsdangerous"
+	help
+	  Itsdangerous contains various helpers to pass data to
+	  untrusted environments and to get it back safe and sound.
+
+	  http://pythonhosted.org/itsdangerous/
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
new file mode 100644
index 0000000..8b055d6
--- /dev/null
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-itsdangerous
+#
+################################################################################
+
+PYTHON_ITSDANGEROUS_VERSION = 0.24
+PYTHON_ITSDANGEROUS_SITE = $(call github,mitsuhiko,itsdangerous,$(PYTHON_ITSDANGEROUS_VERSION))
+PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
+PYTHON_ITSDANGEROUS_LICENSE = BSD-3c
+PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
