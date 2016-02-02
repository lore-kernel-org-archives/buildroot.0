From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 17:54:08 +0100
Subject: [Buildroot] [git commit] python-click: new package
Message-ID: <20160202165454.CD00680AE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45c903065dff389e1885f976d758465fbdcb3e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

[Thomas:
 - rewrap Config.in help text, lines were slightly too long
 - remove excessive empty line at end of Config.in
 - specify BSD-3c as the license, since BSD is not specific enough.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/python-click/Config.in         |  7 +++++++
 package/python-click/python-click.hash |  3 +++
 package/python-click/python-click.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a491d85..da49c1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -627,6 +627,7 @@ menu "External python modules"
 	source "package/python-cffi/Config.in"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cherrypy/Config.in"
+	source "package/python-click/Config.in"
 	source "package/python-coherence/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
diff --git a/package/python-click/Config.in b/package/python-click/Config.in
new file mode 100644
index 0000000..c026998
--- /dev/null
+++ b/package/python-click/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_CLICK
+	bool "python-click"
+	help
+	  A simple wrapper around optparse for powerful command line
+	  utilities.
+
+	  https://pypi.python.org/pypi/click
diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
new file mode 100644
index 0000000..72aab0a
--- /dev/null
+++ b/package/python-click/python-click.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=83252a8095397b1f5f710fdd58b484d9, sha256 locally computed.
+md5	83252a8095397b1f5f710fdd58b484d9  click-6.2.tar.gz
+sha256	fba0ff70f5ebb4cebbf64c40a8fbc222fb7cf825237241e548354dabe3da6a82  click-6.2.tar.gz
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
new file mode 100644
index 0000000..19ae187
--- /dev/null
+++ b/package/python-click/python-click.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-click
+#
+################################################################################
+
+PYTHON_CLICK_VERSION = 6.2
+PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
+PYTHON_CLICK_SITE = http://pypi.python.org/packages/source/c/click
+PYTHON_CLICK_LICENSE = BSD-3c
+PYTHON_CLICK_LICENSE_FILES = LICENSE
+PYTHON_CLICK_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
