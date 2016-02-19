From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 22:27:46 +0100
Subject: [Buildroot] [git commit] python-shutilwhich: new package
Message-ID: <20160302202753.2F456807F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96a7a3cb7688ff67f02d45f0002c638ee5faadb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: fix license, it's not MIT, but PSF.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/python-shutilwhich/Config.in               |  7 +++++++
 package/python-shutilwhich/python-shutilwhich.hash |  3 +++
 package/python-shutilwhich/python-shutilwhich.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 32bf4dd..ce71f3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -710,6 +710,7 @@ menu "External python modules"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
+	source "package/python-shutilwhich/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
diff --git a/package/python-shutilwhich/Config.in b/package/python-shutilwhich/Config.in
new file mode 100644
index 0000000..abdc8d7
--- /dev/null
+++ b/package/python-shutilwhich/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SHUTILWHICH
+	bool "python-shutilwhich"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  shutil.which for those not using Python 3.3 yet.
+
+	  https://pypi.python.org/pypi/shutilwhich/
diff --git a/package/python-shutilwhich/python-shutilwhich.hash b/package/python-shutilwhich/python-shutilwhich.hash
new file mode 100644
index 0000000..b1a2c78
--- /dev/null
+++ b/package/python-shutilwhich/python-shutilwhich.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=915947c5cdae7afd748ac715ee547adb, sha256 locally computed.
+md5	915947c5cdae7afd748ac715ee547adb  shutilwhich-1.1.0.tar.gz
+sha256	db1f39c6461e42f630fa617bb8c79090f7711c9ca493e615e43d0610ecb64dc6  shutilwhich-1.1.0.tar.gz
diff --git a/package/python-shutilwhich/python-shutilwhich.mk b/package/python-shutilwhich/python-shutilwhich.mk
new file mode 100644
index 0000000..0497e1b
--- /dev/null
+++ b/package/python-shutilwhich/python-shutilwhich.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-shutilwhich
+#
+################################################################################
+
+PYTHON_SHUTILWHICH_VERSION = 1.1.0
+PYTHON_SHUTILWHICH_SOURCE = shutilwhich-$(PYTHON_SHUTILWHICH_VERSION).tar.gz
+PYTHON_SHUTILWHICH_SITE = http://pypi.python.org/packages/source/s/shutilwhich
+PYTHON_SHUTILWHICH_LICENSE = Python Software Foundation License
+PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
