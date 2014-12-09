From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Tue,  9 Dec 2014 11:28:13 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-docopt: new package
Message-ID: <1418120893-27306-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
Through means of the evil copy&paste, in last version of this patch,
python-docopt.mk was called python-bottle.mk.


 package/Config.in                      |  1 +
 package/python-docopt/Config.in        | 11 +++++++++++
 package/python-docopt/python-docopt.mk | 12 ++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/python-docopt/Config.in
 create mode 100644 package/python-docopt/python-docopt.mk

diff --git a/package/Config.in b/package/Config.in
index 600a68d..dd3a46e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -492,6 +492,7 @@ menu "external python modules"
 	source "package/python-crc16/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
+	source "package/python-docopt/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-docopt/Config.in b/package/python-docopt/Config.in
new file mode 100644
index 0000000..bb7d0de
--- /dev/null
+++ b/package/python-docopt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_DOCOPT
+	bool "python-docopt"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	help
+	  docopt helps you create most beautiful command-line interfaces easily.
+	  The option parser is generated based on the beautiful help message
+	  that you write yourself. This way you don't need to write this stupid
+	  repeatable parser-code, and instead can write only the help message--
+	  the way you want it.
+
+	  https://github.com/docopt/docopt
diff --git a/package/python-docopt/python-docopt.mk b/package/python-docopt/python-docopt.mk
new file mode 100644
index 0000000..092358a
--- /dev/null
+++ b/package/python-docopt/python-docopt.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# python-docopt
+#
+################################################################################
+
+PYTHON_DOCOPT_VERSION = 0.6.2
+PYTHON_DOCOPT_SITE = $(call github,docopt,docopt,$(PYTHON_DOCOPT_VERSION))
+PYTHON_DOCOPT_LICENSE = MIT
+PYTHON_DOCOPT_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.3
