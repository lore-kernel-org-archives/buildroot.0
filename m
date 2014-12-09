From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:17:00 +0100
Subject: [Buildroot] [git commit] python-docopt: new package
Message-ID: <20141209181749.44FE9800DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=765b7e1995fac384d26de269e33ad48697ed747a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Remove dependency on python || python3, as we did for all other
    python modules that work with both Python 2 and Python 3.
  - Rewrap help text.
  - Add <pkg>_LICENSE_FILES value.]

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/python-docopt/Config.in        |   11 +++++++++++
 package/python-docopt/python-docopt.mk |   13 +++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

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
index 0000000..a3a482f
--- /dev/null
+++ b/package/python-docopt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_DOCOPT
+	bool "python-docopt"
+	help
+	  docopt helps you create most beautiful command-line
+	  interfaces easily.  The option parser is generated based on
+	  the beautiful help message that you write yourself. This way
+	  you don't need to write this stupid repeatable parser-code,
+	  and instead can write only the help message-- the way you
+	  want it.
+
+	  https://github.com/docopt/docopt
diff --git a/package/python-docopt/python-docopt.mk b/package/python-docopt/python-docopt.mk
new file mode 100644
index 0000000..f87d2f8
--- /dev/null
+++ b/package/python-docopt/python-docopt.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-docopt
+#
+################################################################################
+
+PYTHON_DOCOPT_VERSION = 0.6.2
+PYTHON_DOCOPT_SITE = $(call github,docopt,docopt,$(PYTHON_DOCOPT_VERSION))
+PYTHON_DOCOPT_LICENSE = MIT
+PYTHON_DOCOPT_LICENSE_FILES = LICENSE-MIT
+PYTHON_DOCOPT_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
