From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:15:49 +0200
Subject: [Buildroot] [git commit] python-argh: new package
Message-ID: <20160601161311.DC392802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb5e7916445dd25fd2f70b650c10f942e52d871e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: add <pkg>_LICENSE_FILES, pointing to README.rst.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-argh/Config.in        |  6 ++++++
 package/python-argh/python-argh.hash |  4 ++++
 package/python-argh/python-argh.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 359298b..3bee6f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -631,6 +631,7 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-argh/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
diff --git a/package/python-argh/Config.in b/package/python-argh/Config.in
new file mode 100644
index 0000000..5da6625
--- /dev/null
+++ b/package/python-argh/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ARGH
+	bool "python-argh"
+	help
+	  An unobtrusive argparse wrapper with natural syntax.
+
+	  http://github.com/neithere/argh/
diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
new file mode 100644
index 0000000..9e2e068
--- /dev/null
+++ b/package/python-argh/python-argh.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/argh/json
+md5	5a97ce2ae74bbe3b63194906213f1184  argh-0.26.1.tar.gz
+# sha256 calculated by scanpypi
+sha256	06a7442cb9130fb8806fe336000fcf20edf1f2f8ad205e7b62cec118505510db  argh-0.26.1.tar.gz
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
new file mode 100644
index 0000000..4b09e68
--- /dev/null
+++ b/package/python-argh/python-argh.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-argh
+#
+################################################################################
+
+PYTHON_ARGH_VERSION = 0.26.1
+PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
+PYTHON_ARGH_SITE = https://pypi.python.org/packages/14/7f/794a7f4a48cba505a4b4c714f81fed844a3a5f7340b171f448711439b09e
+PYTHON_ARGH_SETUP_TYPE = setuptools
+PYTHON_ARGH_LICENSE = LGPLv3+
+PYTHON_ARGH_LICENSE_FILES = README.rst
+
+$(eval $(python-package))
