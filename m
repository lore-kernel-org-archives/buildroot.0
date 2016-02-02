From: Mauro Condarelli <mc5686@mclink.it>
Date: Tue,  2 Feb 2016 01:44:53 +0100
Subject: [Buildroot] [PATCH 13/19] python-shutilwhich: new package
In-Reply-To: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454373899-22481-14-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                                  |  1 +
 package/python-shutilwhich/Config.in               |  8 ++++++++
 package/python-shutilwhich/python-shutilwhich.hash |  3 +++
 package/python-shutilwhich/python-shutilwhich.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-shutilwhich/Config.in
 create mode 100644 package/python-shutilwhich/python-shutilwhich.hash
 create mode 100644 package/python-shutilwhich/python-shutilwhich.mk

diff --git a/package/Config.in b/package/Config.in
index 8b3304c..0d91863 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -711,6 +711,7 @@ menu "External python modules"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setuptools/Config.in"
+	source "package/python-shutilwhich/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
diff --git a/package/python-shutilwhich/Config.in b/package/python-shutilwhich/Config.in
new file mode 100644
index 0000000..d610cfe
--- /dev/null
+++ b/package/python-shutilwhich/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SHUTILWHICH
+	bool "python-shutilwhich"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  shutil.which for those not using Python 3.3 yet.
+
+	  https://pypi.python.org/pypi/shutilwhich/
+
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
index 0000000..b2e06d5
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
+PYTHON_SHUTILWHICH_LICENSE = MIT
+PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.4
