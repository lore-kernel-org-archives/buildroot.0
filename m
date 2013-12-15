From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 14:01:00 +0100
Subject: [Buildroot] [git commit] python-tornado: new package
Message-ID: <20131215130826.B02409C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d75b18128bc70bcc620624b26307bb72df14c3da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                        |    1 +
 package/python-tornado/Config.in         |    8 ++++++++
 package/python-tornado/python-tornado.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4d5ae7a..66b3591 100644
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
