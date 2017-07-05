From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  5 Jul 2017 15:47:41 +0200
Subject: [Buildroot] [PATCH 3/4] python-h2: new package
In-Reply-To: <20170705134742.9178-1-yegorslists@googlemail.com>
References: <20170705134742.9178-1-yegorslists@googlemail.com>
Message-ID: <20170705134742.9178-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                |  1 +
 package/python-h2/Config.in      |  8 ++++++++
 package/python-h2/python-h2.hash |  3 +++
 package/python-h2/python-h2.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-h2/Config.in
 create mode 100644 package/python-h2/python-h2.hash
 create mode 100644 package/python-h2/python-h2.mk

diff --git a/package/Config.in b/package/Config.in
index 5607f33114..b7ae9835a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -739,6 +739,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-h2/Config.in"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
diff --git a/package/python-h2/Config.in b/package/python-h2/Config.in
new file mode 100644
index 0000000000..dccee9b909
--- /dev/null
+++ b/package/python-h2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_H2
+	bool "python-h2"
+	select BR2_PACKAGE_PYTHON_HYPERFRAME # runtime
+	select BR2_PACKAGE_PYTHON_HPACK # runtime
+	help
+	  HTTP/2 State-Machine based protocol implementation.
+
+	  http://hyper.rtfd.org
diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
new file mode 100644
index 0000000000..e34f7beb90
--- /dev/null
+++ b/package/python-h2/python-h2.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/h2/json, sha256 locally computed
+md5	586686662928c2851eb0f1fe99bf279d  h2-3.0.1.tar.gz
+sha256	b2962f883fa392a23cbfcc4ad03c335bcc661be0cf9627657b589f0df2206e64  h2-3.0.1.tar.gz
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
new file mode 100644
index 0000000000..37f0156458
--- /dev/null
+++ b/package/python-h2/python-h2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-h2
+#
+################################################################################
+
+PYTHON_H2_VERSION = 3.0.1
+PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
+PYTHON_H2_SITE = https://pypi.python.org/packages/3c/86/aebb88df3c87255cfd0ffd338608fbfb34d1c850750a486e7f05b013e5a3
+PYTHON_H2_SETUP_TYPE = setuptools
+PYTHON_H2_LICENSE = MIT
+PYTHON_H2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
