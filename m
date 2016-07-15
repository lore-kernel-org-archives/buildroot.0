From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 14:48:49 +0200
Subject: [Buildroot] [git commit] python-prompt-toolkit: new package
Message-ID: <20160715125038.30C2B82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=114f48b1630dbe03cdab095b84f7975c73fa3bba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                        |  1 +
 package/python-prompt-toolkit/Config.in                  |  9 +++++++++
 package/python-prompt-toolkit/python-prompt-toolkit.hash |  3 +++
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 07e7887..32c3e1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -702,6 +702,7 @@ menu "External python modules"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-posix-ipc/Config.in"
+	source "package/python-prompt-toolkit/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-ptyprocess/Config.in"
diff --git a/package/python-prompt-toolkit/Config.in b/package/python-prompt-toolkit/Config.in
new file mode 100644
index 0000000..ccc9ebb
--- /dev/null
+++ b/package/python-prompt-toolkit/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
+	bool "python-prompt-toolkit"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
+	help
+	  Library for building powerful interactive command lines in
+	  Python.
+
+	  https://github.com/jonathanslenders/python-prompt-toolkit
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
new file mode 100644
index 0000000..f33e99a
--- /dev/null
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/prompt_toolkit/json, sha256 locally computed
+md5	6c4133d099603f496c761491043bf0ef  prompt_toolkit-1.0.3.tar.gz
+sha256	805e026f0cbad27467e93f9dd3e3777718d401a62788c1e84ca038e967ad8ba2  prompt_toolkit-1.0.3.tar.gz
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
new file mode 100644
index 0000000..634f20e
--- /dev/null
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-prompt-toolkit
+#
+################################################################################
+
+PYTHON_PROMPT_TOOLKIT_VERSION = 1.0.3
+PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
+PYTHON_PROMPT_TOOLKIT_SITE = https://pypi.python.org/packages/8d/de/412f23919929c01e6b55183e124623f705e4b91796d3d2dce2cb53d595ad
+PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
+PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3c
+PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
