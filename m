From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 09:36:44 +0200
Subject: [Buildroot] [git commit] package/python-termcolor: new package
Message-ID: <20190728074027.620E983D20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17533a0b38d35a6960a94e596387b60aeeba4033
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ANSII Color formatting for output in terminal.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                              |  1 +
 package/python-termcolor/Config.in             |  6 ++++++
 package/python-termcolor/python-termcolor.hash |  5 +++++
 package/python-termcolor/python-termcolor.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 90dddfd346..9b2cc7522d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1075,6 +1075,7 @@ menu "External python modules"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
+	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
 	source "package/python-thrift/Config.in"
diff --git a/package/python-termcolor/Config.in b/package/python-termcolor/Config.in
new file mode 100644
index 0000000000..e89da9b965
--- /dev/null
+++ b/package/python-termcolor/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TERMCOLOR
+	bool "python-termcolor"
+	help
+	  ANSII Color formatting for output in terminal.
+
+	  http://pypi.python.org/pypi/termcolor
diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
new file mode 100644
index 0000000000..7cccc3ec97
--- /dev/null
+++ b/package/python-termcolor/python-termcolor.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/termcolor/json
+md5	043e89644f8909d462fbbfa511c768df  termcolor-1.1.0.tar.gz
+sha256	1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b  termcolor-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256	497b3272b67b94a7aa58fa3748d21b62b29ccb783b1cda816f594e3932590bbf  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
new file mode 100644
index 0000000000..ccdff4c0d7
--- /dev/null
+++ b/package/python-termcolor/python-termcolor.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-termcolor
+#
+################################################################################
+
+PYTHON_TERMCOLOR_VERSION = 1.1.0
+PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981
+PYTHON_TERMCOLOR_SETUP_TYPE = distutils
+PYTHON_TERMCOLOR_LICENSE = MIT
+PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
+
+$(eval $(python-package))
