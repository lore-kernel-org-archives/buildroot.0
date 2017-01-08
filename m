From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Jan 2017 21:31:56 +0100
Subject: [Buildroot] [git commit] python-chardet: new package
Message-ID: <20170108203502.EFE8D80258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03a3a201a35bc23acaa65104bdb2d523aa053068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |  1 +
 package/python-chardet/Config.in           |  6 ++++++
 package/python-chardet/python-chardet.hash |  3 +++
 package/python-chardet/python-chardet.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f4e1b6e..b0ff11f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -653,6 +653,7 @@ menu "External python modules"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-characteristic/Config.in"
+	source "package/python-chardet/Config.in"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
diff --git a/package/python-chardet/Config.in b/package/python-chardet/Config.in
new file mode 100644
index 0000000..8f1cd60
--- /dev/null
+++ b/package/python-chardet/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CHARDET
+	bool "python-chardet"
+	help
+	  Universal encoding detector for Python 2 and 3.
+
+	  https://github.com/chardet/chardet
diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
new file mode 100644
index 0000000..aa4efeb
--- /dev/null
+++ b/package/python-chardet/python-chardet.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/chardet/json, sha256 locally computed
+md5	25274d664ccb5130adae08047416e1a8  chardet-2.3.0.tar.gz
+sha256	e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa  chardet-2.3.0.tar.gz
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
new file mode 100644
index 0000000..1962954
--- /dev/null
+++ b/package/python-chardet/python-chardet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-chardet
+#
+################################################################################
+
+PYTHON_CHARDET_VERSION = 2.3.0
+PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
+PYTHON_CHARDET_SITE = https://pypi.python.org/packages/7d/87/4e3a3f38b2f5c578ce44f8dc2aa053217de9f0b6d737739b0ddac38ed237
+PYTHON_CHARDET_SETUP_TYPE = setuptools
+PYTHON_CHARDET_LICENSE = LGPLv2.1+
+PYTHON_CHARDET_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
