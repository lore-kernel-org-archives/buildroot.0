From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:27:06 +0100
Subject: [Buildroot] [PATCHv2 31/36] python-tornado: new package
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-32-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryan Barnett <ryanbarnett3@gmail.com>

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-tornado/Config.in         |  8 ++++++++
 package/python-tornado/python-tornado.mk | 13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-tornado/Config.in
 create mode 100644 package/python-tornado/python-tornado.mk

diff --git a/package/Config.in b/package/Config.in
index 3dd31e8..acfd125 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -409,6 +409,7 @@ source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-simplejson/Config.in"
 source "package/python-thrift/Config.in"
+source "package/python-tornado/Config.in"
 source "package/python-versiontools/Config.in"
 endmenu
 endif
diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
new file mode 100644
index 0000000..c127d0e
--- /dev/null
+++ b/package/python-tornado/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TORNADO
+	bool "python-tornado"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Tornado is a Python web framework and asynchronous networking
+	  library, originally developed at FriendFeed.
+
+	  http://www.tornadoweb.org
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
new file mode 100644
index 0000000..781ec03
--- /dev/null
+++ b/package/python-tornado/python-tornado.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-tornado
+#
+################################################################################
+
+PYTHON_TORNADO_VERSION = 3.1.1
+PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
+PYTHON_TORNADO_SITE = https://pypi.python.org/packages/source/t/tornado
+PYTHON_TORNADO_LICENSE = Apache-v2
+PYTHON_TORNADO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
1.8.1.2
