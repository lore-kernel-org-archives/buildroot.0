From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:33 +0100
Subject: [Buildroot] [PATCH 14/22] package/python-shutilwhich: new package.
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-15-git-send-email-mc5686@mclink.it>
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
 package/python-shutilwhich/python-shutilwhich.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-shutilwhich/Config.in
 create mode 100644 package/python-shutilwhich/python-shutilwhich.hash
 create mode 100644 package/python-shutilwhich/python-shutilwhich.mk

diff --git a/package/Config.in b/package/Config.in
index 8eac814..ffdba3b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -710,6 +710,7 @@ menu "External python modules"
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
index 0000000..a985b37
--- /dev/null
+++ b/package/python-shutilwhich/python-shutilwhich.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	915947c5cdae7afd748ac715ee547adb  shutilwhich-1.1.0.tar.gz
+sha256	db1f39c6461e42f630fa617bb8c79090f7711c9ca493e615e43d0610ecb64dc6  shutilwhich-1.1.0.tar.gz
diff --git a/package/python-shutilwhich/python-shutilwhich.mk b/package/python-shutilwhich/python-shutilwhich.mk
new file mode 100644
index 0000000..ac141c2
--- /dev/null
+++ b/package/python-shutilwhich/python-shutilwhich.mk
@@ -0,0 +1,15 @@
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
+#PYTHON_SHUTILWHICH_LICENSE_FILES = LICENSE
+PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
+#PYTHON_SHUTILWHICH_DEPENDENCIES = 
+
+$(eval $(python-package))
-- 
2.1.4
