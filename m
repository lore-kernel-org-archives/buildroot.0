From: Hartley Sweeten <HartleyS@visionengravers.com>
Date: Sun, 25 Jan 2015 23:58:59 +0000
Subject: [Buildroot] [PATCH] python-twisted: new package
In-Reply-To: <1422229650-30254-1-git-send-email-yegorslists@googlemail.com>
References: <1422229650-30254-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <2cltn05w3wuju846tsxscn3y.1422230327985@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  V


Sent from my Verizon Wireless 4G LTE smartphone


-------- Original message --------
From: Yegor Yefremov <yegorslists@googlemail.com>
Date:01/25/2015 4:47 PM (GMT-07:00)
To: buildroot at buildroot.org
Subject: [Buildroot] [PATCH] python-twisted: new package

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-twisted/Config.in           |  8 ++++++++
 package/python-twisted/python-twisted.hash |  2 ++
 package/python-twisted/python-twisted.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-twisted/Config.in
 create mode 100644 package/python-twisted/python-twisted.hash
 create mode 100644 package/python-twisted/python-twisted.mk

diff --git a/package/Config.in b/package/Config.in
index 127ced3..51d4c15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -548,6 +548,7 @@ menu "external python modules"
         source "package/python-simplejson/Config.in"
         source "package/python-thrift/Config.in"
         source "package/python-tornado/Config.in"
+       source "package/python-twisted/Config.in"
         source "package/python-urwid/Config.in"
         source "package/python-versiontools/Config.in"
         source "package/python-webpy/Config.in"
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
new file mode 100644
index 0000000..b302101
--- /dev/null
+++ b/package/python-twisted/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TWISTED
+       bool "python-twisted"
+       depends on BR2_PACKAGE_PYTHON
+       select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
+       help
+         Twisted is an event-driven networking engine written in Python.
+
+         https://twistedmatrix.com/trac/
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
new file mode 100644
index 0000000..937cab3
--- /dev/null
+++ b/package/python-twisted/python-twisted.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  038096be8723b678e2ead323b14d0d3e2db161e0c7ce3c98fdd18ca5869acb71  Twisted-14.0.2.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
new file mode 100644
index 0000000..792bb05
--- /dev/null
+++ b/package/python-twisted/python-twisted.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-twisted
+#
+################################################################################
+
+PYTHON_TWISTED_VERSION = 14.0.2
+PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/source/T/Twisted/
+PYTHON_TWISTED_SETUP_TYPE = setuptools
+PYTHON_TWISTED_LICENSE = MIT
+PYTHON_TWISTED_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
--
2.1.0

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150125/f9ba703c/attachment-0001.html>
