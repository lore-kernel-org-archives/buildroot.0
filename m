From: Augusto Farina <farina@datacom.ind.br>
Date: Mon,  3 Aug 2015 17:36:59 -0300
Subject: [Buildroot] [PATCH 1/1] python-colorama: new package
Message-ID: <1438634219-22000-1-git-send-email-farina@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Colorama is a simple cross-platform colored terminal text in Python.

Tested on a PowerPC e500v2 board. Host build support is also added in
the package makefile, as python-jinja2, because we have third-party
software that requires it (e.g. ARM mbed build-system).

Signed-off-by: Augusto Farina <farina@datacom.ind.br>
---
 package/Config.in                            |  1 +
 package/python-colorama/Config.in            |  6 ++++++
 package/python-colorama/python-colorama.hash |  3 +++
 package/python-colorama/python-colorama.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-colorama/Config.in
 create mode 100644 package/python-colorama/python-colorama.hash
 create mode 100644 package/python-colorama/python-colorama.mk

diff --git a/package/Config.in b/package/Config.in
index 1e39c74..9f043ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -597,6 +597,7 @@ menu "external python modules"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-coherence/Config.in"
+	source "package/python-colorama/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-colorama/Config.in b/package/python-colorama/Config.in
new file mode 100644
index 0000000..50965ae
--- /dev/null
+++ b/package/python-colorama/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_COLORAMA
+	bool "python-colorama"
+	help
+	  Simple cross-platform colored terminal text in Python.
+
+	  http://pypi.python.org/pypi/colorama
diff --git a/package/python-colorama/python-colorama.hash b/package/python-colorama/python-colorama.hash
new file mode 100644
index 0000000..5d8598c
--- /dev/null
+++ b/package/python-colorama/python-colorama.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=a56b8dc55158a41ab3c89c4c8feb8824, sha256 locally computed
+md5	a56b8dc55158a41ab3c89c4c8feb8824  colorama-0.3.3.tar.gz
+sha256	eb21f2ba718fbf357afdfdf6f641ab393901c7ca8d9f37edd0bee4806ffa269c  colorama-0.3.3.tar.gz
diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
new file mode 100644
index 0000000..f9b0bae
--- /dev/null
+++ b/package/python-colorama/python-colorama.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-colorama
+#
+################################################################################
+
+PYTHON_COLORAMA_VERSION = 0.3.3
+PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
+PYTHON_COLORAMA_SITE = https://pypi.python.org/packages/source/c/colorama
+PYTHON_COLORAMA_SETUP_TYPE = setuptools
+PYTHON_COLORAMA_LICENSE = BSD-3c
+PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
