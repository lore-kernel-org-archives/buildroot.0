From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 17:06:54 +0100
Subject: [Buildroot] [git commit branch/next] python-webpy: add new package
Message-ID: <20141117160801.5F5EC9D461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6f0cfa51fc5b0480779885a00d67c1a36e77947
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Peter: drop redundant python|python3 dependency]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/python-webpy/Config.in       |    7 +++++++
 package/python-webpy/python-webpy.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 92af942..1d132af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -527,6 +527,7 @@ menu "external python modules"
 	source "package/python-tornado/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
+	source "package/python-webpy/Config.in"
 	source "package/python-werkzeug/Config.in"
 endmenu
 endif
diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
new file mode 100644
index 0000000..1e90892
--- /dev/null
+++ b/package/python-webpy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WEBPY
+	bool "python-webpy"
+	help
+	  web.py is a web framework for Python that is as simple as it is
+	  powerful.
+
+	  http://webpy.org/
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
new file mode 100644
index 0000000..ef5b6b3
--- /dev/null
+++ b/package/python-webpy/python-webpy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-webpy
+#
+################################################################################
+
+PYTHON_WEBPY_VERSION = 0.37
+PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_SETUP_TYPE = distutils
+PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
+PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt web/wsgiserver/LICENSE.txt
+
+$(eval $(python-package))
