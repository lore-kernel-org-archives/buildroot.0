From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:31:01 +0200
Subject: [Buildroot] [git commit] python-h2: new package
Message-ID: <20170731192747.B904880165@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bff2f76cd62b6cbe4a9d40bade2eb759b615ebfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/python-h2/Config.in      |  8 ++++++++
 package/python-h2/python-h2.hash |  3 +++
 package/python-h2/python-h2.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 87b61a8..d595e88 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -741,6 +741,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-h2/Config.in"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
diff --git a/package/python-h2/Config.in b/package/python-h2/Config.in
new file mode 100644
index 0000000..dccee9b
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
index 0000000..e34f7be
--- /dev/null
+++ b/package/python-h2/python-h2.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/h2/json, sha256 locally computed
+md5	586686662928c2851eb0f1fe99bf279d  h2-3.0.1.tar.gz
+sha256	b2962f883fa392a23cbfcc4ad03c335bcc661be0cf9627657b589f0df2206e64  h2-3.0.1.tar.gz
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
new file mode 100644
index 0000000..37f0156
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
